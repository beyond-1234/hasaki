package com.hasaki.controller;

import com.hasaki.domain.LoginLog;
import com.hasaki.service.impl.ILoginLogService;
import eu.bitwalker.useragentutils.UserAgent;
import com.hasaki.domain.User;
import com.hasaki.service.impl.IReplyService;
import com.hasaki.service.impl.ITopicService;
import com.hasaki.service.impl.IUserService;
import com.hasaki.util.ProduceMd5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/")
public class MainController {
    @Autowired
    public IUserService userService;

    @Autowired
    public ITopicService topicService;

    @Autowired
    public IReplyService replyService;

    @Autowired
    public ILoginLogService loginLogService;

    public String getRemoteIP(HttpServletRequest request) {
        if (request.getHeader("x-forwarded-for") == null) {
            return request.getRemoteAddr();
        }
        return request.getHeader("x-forwarded-for");
    }

    @RequestMapping(value = {"register"}, method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView regPage = new ModelAndView("register");
        //统计信息
        int userNum = userService.getUserCount();
        int topicNum = topicService.getTopicsNum();

        regPage.addObject("userNum", userNum);
        regPage.addObject("topicNum", topicNum);

        return regPage;
    }

    @RequestMapping(value = {"register"}, method = RequestMethod.POST)
    public void registerCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");
        String phone_num = request.getParameter("phone_num");
        //验证密码是否相同
        if (!password.equals(confirm)) {
            response.getWriter().write("密码输入不一致");
            response.getWriter().close();
            return;
        }
        //查询用户是否已经存在
        if (this.userService.getUserByUsername(username) != null) {
            response.getWriter().write("用户已经存在");
            response.getWriter().close();
            return;
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(ProduceMd5.getMD5(password));
        user.setPhoneNum(phone_num);
        user.setEmail(email);
        user.setType((byte) 0);
        user.setCredit(0);
        user.setCreateTime(new Date());
        user.setUpdateTime(new Date());
        user.setAvatar("/img/avatar/avatar-default-" + new Random().nextInt(10)+1 + ".png");
        if (userService.addUser(user)) {
            response.getWriter().write("注册成功");
        } else {
            response.getWriter().write("注册失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public void loginCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int loginVerify = userService.login(username, ProduceMd5.getMD5(password));
        if (loginVerify == 2) {
            User user = userService.getUserByUsername(username);
            Integer userId = user.getId();
            String avatar = user.getAvatar();
            int role = user.getType();
            //用户信息写入session
            session.setAttribute("userId", userId);
            session.setAttribute("username", username);
            session.setAttribute("avatar", avatar);
            session.setAttribute("role", role);
            //获取登录信息
            String ip = getRemoteIP(request);
            UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
            //获取用户的浏览器名
            String userBrowser = userAgent.getBrowser().toString();
            //写入登录日志
            LoginLog log = new LoginLog();
            log.setDevice(userBrowser);
            log.setIp(ip);
            log.setUserId(userId);
            log.setLoginTime(new Date());
            boolean addLogStatus = loginLogService.addLog(log);
            if (addLogStatus) {
                response.getWriter().write("登录成功");
            } else {
                response.getWriter().write("登录失败");
            }
        } else if (loginVerify == 1) {
            response.getWriter().write("密码错误");
        } else {
            response.getWriter().write("用户不存在");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"logout"}, method = RequestMethod.GET)
    public String logout(HttpSession session, HttpServletRequest request) {
        session.removeAttribute("userId");
        session.removeAttribute("username");
        return "redirect:/";
    }

    @RequestMapping("*")
    public ModelAndView notFind() {
        ModelAndView error = new ModelAndView("error/error");
        error.addObject("title","404 Not Found");
        error.addObject("msg", "页面走失了");
        error.addObject("solve", "请检查URL是否正确");
        return error;
    }
}
