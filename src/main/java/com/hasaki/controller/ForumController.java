package com.hasaki.controller;

import com.hasaki.domain.Reply;
import com.hasaki.domain.Tab;
import com.hasaki.domain.Topic;
import com.hasaki.domain.User;
import com.hasaki.service.impl.IReplyService;
import com.hasaki.service.impl.ITabService;
import com.hasaki.service.impl.ITopicService;
import com.hasaki.service.impl.IUserService;
import net.sf.jsqlparser.statement.select.Top;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = {"/forum"})
public class ForumController {
    @Autowired
    public IUserService userService;

    @Autowired
    public ITopicService topicService;

    @Autowired
    public IReplyService replyService;

    @Autowired
    public ITabService tabService;


    @RequestMapping(value = {""})
    public ModelAndView index(HttpSession session) {
        ModelAndView indexPage = new ModelAndView("home");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();
        //获取用户信息
        Integer uid = (Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);
        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();
        //最活跃用户
        List<User> hotestUsers = userService.listHotestUsers();
        //最新用户
        List<User> newUsers = userService.listNewUsers();
        //最新回复
        List<Reply> newestReplies = replyService.newestReply();
        indexPage.addObject("userNum", userNum);
        indexPage.addObject("topicNum", topicNum);
        indexPage.addObject("topics", hotestTopics);
        indexPage.addObject("replies", newestReplies);
        indexPage.addObject("user", user);
        indexPage.addObject("now", "home");
        indexPage.addObject("hotUsers",hotestUsers);
        indexPage.addObject("newUsers",newUsers);
        return indexPage;
    }

    @RequestMapping(value = {"write"}, method = RequestMethod.GET)
    public ModelAndView write(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //判断session
        Integer uid = (Integer) session.getAttribute("userId");
        if (uid == null) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "403 Refused Request");
            error.addObject("msg", "未经授权的访问");
            error.addObject("solve", "请先登录");
            return error;
        }

        ModelAndView writePage = new ModelAndView("write");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();
        List<Tab> tabs = tabService.getAllTabs();
        //获取用户信息
//        Integer uid = (Integer) session.getAttribute("userId");
        User user = userService.getUserById(uid);

        writePage.addObject("tabs", tabs);
        writePage.addObject("userNum", userNum);
        writePage.addObject("topicNum", topicNum);
        writePage.addObject("user", user);
        return writePage;
    }

    @RequestMapping(value = {"write"}, method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
    public void writeTopic(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //判断session
        Integer uid = (Integer) session.getAttribute("userId");
        if (uid == null) {
            response.getWriter().write("提交错误，用户状态为未登录");
            response.getWriter().close();
            return;
        }
        User user = userService.getUserById(uid);
        if (user == null) {
            response.getWriter().write("提交错误，用户不存在");
        } else {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            System.out.println(content);
            int tag_id = Integer.parseInt(request.getParameter("tag_id"));
            int user_id = user.getId();
            //new a Topic class
            Topic topic = new Topic();
            topic.setTitle(title);
            topic.setContent(content);
            topic.setTabId((byte) tag_id);
            topic.setUserId(user_id);
            topic.setCreateTime(new Date());
            topic.setUpdateTime(new Date());
            if (topicService.addTopic(topic)) {
                response.getWriter().write("发布帖子成功～");
            } else {
                response.getWriter().write("发布失败～");
            }
            response.getWriter().close();
        }
    }

    @RequestMapping(value = {"tags"})
    public ModelAndView tags(HttpSession session) {
        ModelAndView tagsPage = new ModelAndView("tags");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();

        //最活跃用户
        List<User> hotestUsers = userService.listHotestUsers();
        //最新用户
        List<User> newUsers = userService.listNewUsers();

        List<Tab> tabs = tabService.getAllTabsWithNum();

        tagsPage.addObject("userNum", userNum);
        tagsPage.addObject("topicNum", topicNum);
        tagsPage.addObject("tabs", tabs);
        tagsPage.addObject("now", "forum");
        tagsPage.addObject("hotUsers",hotestUsers);
        tagsPage.addObject("newUsers",newUsers);
        return tagsPage;
    }

    @RequestMapping("/tab/{en_name}")
    public ModelAndView toTabPage(@PathVariable("en_name")String en_name, HttpSession session){
        Tab tab = tabService.getByTabNameEn(en_name);
        if (tab == null) {
            ModelAndView error = new ModelAndView("error/error");
            error.addObject("title", "404 Not Found");
            error.addObject("msg", "没有找到此分类");
            error.addObject("solve", "请联系管理员");
            return error;
        }
        Integer tabId = tab.getId();

        ModelAndView indexPage = new ModelAndView("cate");
        //全部主题
        List<Topic> topics = topicService.listTopicsAndUsersOfTab(tabId);

        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();

        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        indexPage.addObject("topics", topics);
        indexPage.addObject("topicsNum", topicsNum);
        indexPage.addObject("usersNum", usersNum);
        indexPage.addObject("tab", tab);
        indexPage.addObject("hotestTopics", hotestTopics);
        return  indexPage;
    }

    @RequestMapping("/t/{id}")
    public ModelAndView toTopic(@PathVariable("id")Integer id, HttpSession session){
        ModelAndView topicPage = new ModelAndView("detail");
        //获取统计信息
        int topicsNum = topicService.getTopicsNum();
        int usersNum = userService.getUserCount();
        Topic topic = topicService.selectById(id);
        Tab tab = tabService.getByTabId(topic.getTabId());

        //获取回复
        List<Reply> replies = replyService.getRepliesOfTopic(topic.getId());


        //最热主题
        List<Topic> hotestTopics = topicService.listMostCommentsTopics();

        topicPage.addObject("topicsNum", topicsNum);
        topicPage.addObject("usersNum", usersNum);
        topicPage.addObject("hotestTopics", hotestTopics);
        topicPage.addObject("replies", replies);
        topicPage.addObject("topic", topic);
        topicPage.addObject("tab", tab);


        return  topicPage;
    }

    @RequestMapping(value = "/r/{id}", method = RequestMethod.POST)
    public void toReply(@PathVariable("id")Integer id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
        String content = request.getParameter("content");
        //判断session
        Integer uid = (Integer) session.getAttribute("userId");
        Topic topic = topicService.selectById(id);
        if (topic == null) {
            response.getWriter().write("提交错误，当前帖子不存在");
            response.getWriter().close();
            return;
        }
        if (uid == null) {
            response.getWriter().write("提交错误，用户状态为未登录");
            response.getWriter().close();
            return;
        }
        Reply reply = new Reply();
        reply.setTopicId(topic.getId());
        reply.setReplyUserId(uid);
        reply.setContent(content);
        reply.setCreateTime(new Date());
        reply.setUpdateTime(new Date());
        if (replyService.addReply(reply)) {
            userService.addCredit(1, uid);
            response.getWriter().write("回复成功，获得1点积分");
        }
        response.getWriter().close();
    }

}
