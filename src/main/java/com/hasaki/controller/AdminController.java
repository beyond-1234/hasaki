package com.hasaki.controller;

import com.hasaki.domain.Reply;
import com.hasaki.domain.Tab;
import com.hasaki.domain.Topic;
import com.hasaki.domain.User;
import com.hasaki.service.impl.IReplyService;
import com.hasaki.service.impl.ITabService;
import com.hasaki.service.impl.ITopicService;
import com.hasaki.service.impl.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = {"/admin"})
public class AdminController {
    @Autowired
    public IUserService userService;

    @Autowired
    public ITopicService topicService;

    @Autowired
    public IReplyService replyService;

    @Autowired
    public ITabService tabService;

    @RequestMapping(value = {"userCenter"}, method = RequestMethod.GET)
    public ModelAndView write(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        //判断session
        Integer role = (Integer) session.getAttribute("role");
        if (role != 1) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "403 Refused Request");
            error.addObject("msg", "未经授权的访问");
            error.addObject("solve", "您不是管理员");
            return error;
        }
        ModelAndView userPage = new ModelAndView("admin/user");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();
        List<Tab> tabs = tabService.getAllTabs();
        List<User> users = userService.getAllUsers();

        userPage.addObject("tabs", tabs);
        userPage.addObject("userNum", userNum);
        userPage.addObject("topicNum", topicNum);
        userPage.addObject("users", users);

        return userPage;
    }

    @RequestMapping(value = {"user"}, method = RequestMethod.GET)
    public ModelAndView changeuser(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

        ModelAndView userPage = new ModelAndView("admin/changeuser");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();
        List<Tab> tabs = tabService.getAllTabs();
        List<User> users = userService.getAllUsers();

        userPage.addObject("tabs", tabs);
        userPage.addObject("userNum", userNum);
        userPage.addObject("topicNum", topicNum);
        userPage.addObject("users", users);

        return userPage;
    }

    @RequestMapping(value = {"user/delete"}, method = RequestMethod.POST)
    public void UserDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //判断session
        Integer role = (Integer) session.getAttribute("role");
        if (role != 1) {
            response.getWriter().write("身份验证失败");
            response.getWriter().close();
        }
        int uid = Integer.parseInt(request.getParameter("userId"));
        if (userService.deleteByPrimaryKey(uid) && topicService.deleteByUserId(uid) && replyService.deleteByReplyUserId(uid)) {
            response.getWriter().write("删除成功");
            response.getWriter().close();
        }
    }

    @RequestMapping(value = {"topic"}, method = RequestMethod.GET)
    public ModelAndView TopicList(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        //判断session
        Integer role = (Integer) session.getAttribute("role");
        if (role == null || role != 1) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "403 Refused Request");
            error.addObject("msg", "未经授权的访问");
            error.addObject("solve", "您不是管理员");
            return error;
        }
        ModelAndView topicPage = new ModelAndView("admin/topic");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();
        List<Topic> topics = topicService.listTopicsAndUsers();
        topicPage.addObject("topics", topics);
        topicPage.addObject("userNum", userNum);
        topicPage.addObject("topicNum", topicNum);

        return topicPage;
    }

    @RequestMapping(value = {"topic/delete"}, method = RequestMethod.POST)
    public void TopicDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //判断session
        Integer role = (Integer) session.getAttribute("role");
        if (role == null || role != 1) {
            response.getWriter().write("身份验证失败");
            response.getWriter().close();
        }
        int tid = Integer.parseInt(request.getParameter("topicId"));
        if (replyService.deleteByTopicId(tid) && topicService.deleteByPrimaryKey(tid)) {
            response.getWriter().write("删除成功");
            response.getWriter().close();
        }
    }

    @RequestMapping(value = {"reply"}, method = RequestMethod.GET)
    public ModelAndView ReplyList(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
        //判断session
        Integer role = (Integer) session.getAttribute("role");
        if (role == null || role != 1) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "403 Refused Request");
            error.addObject("msg", "未经授权的访问");
            error.addObject("solve", "您不是管理员");
            return error;
        }
        ModelAndView topicPage = new ModelAndView("admin/reply");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();
        List<Reply> replies = replyService.getAllReply();
        topicPage.addObject("replies", replies);
        topicPage.addObject("userNum", userNum);
        topicPage.addObject("topicNum", topicNum);

        return topicPage;
    }

    @RequestMapping(value = {"reply/delete"}, method = RequestMethod.POST)
    public void ReplyDelete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //判断session
        Integer role = (Integer) session.getAttribute("role");

        if (role == null || role != 1) {
            response.getWriter().write("身份验证失败");
            response.getWriter().close();
            return;
        }
        int rid = Integer.parseInt(request.getParameter("replyId"));
        if (replyService.deleteByPrimaryKey((long) rid)) {
            response.getWriter().write("删除成功");
            response.getWriter().close();
        }
    }

}
