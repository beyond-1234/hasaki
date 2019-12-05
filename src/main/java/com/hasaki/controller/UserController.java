package com.hasaki.controller;

import com.hasaki.domain.User;
import com.hasaki.service.impl.ILoginLogService;
import com.hasaki.service.impl.IReplyService;
import com.hasaki.service.impl.ITopicService;
import com.hasaki.service.impl.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Controller
@RequestMapping("/ucenter")
public class UserController {

    @Autowired
    public IUserService userService;

    @Autowired
    public ITopicService topicService;

    @Autowired
    public IReplyService replyService;

    @Autowired
    public ILoginLogService loginLogService;

    @RequestMapping(value = {"userinfo/{username}"}, method = RequestMethod.GET)
    public ModelAndView personalCenter(@PathVariable("username")String username, HttpSession session){
        boolean ifExistUser=userService.existUsername(username);
        int usersNum=userService.getUserCount();

        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);

        ModelAndView mv=new ModelAndView("user_info");
        if (ifExistUser){
            User resultUser=userService.getUserByUsername(username);
            mv.addObject("userInfo",resultUser);
            mv.addObject("usersNum",usersNum);
            mv.addObject("user",user);
            return mv;
        }else {
            String errorInfo=new String("会员未找到");
            mv.addObject("errorInfo",errorInfo);
            return mv;
        }
    }

    @RequestMapping(value = {"settings"}, method = RequestMethod.GET)
    public ModelAndView settings(HttpServletRequest request, HttpSession session){

        Integer uid=(Integer) session.getAttribute("userId");
        String username= (String) session.getAttribute("username");
        User resultUser=userService.getUserByUsername(username);
        User user=userService.getUserById(uid);

        ModelAndView mv=new ModelAndView("settings");
        mv.addObject("userInfo",resultUser);
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping(value = {"settings/avatar"}, method = RequestMethod.GET)
    public ModelAndView updateAvatar(HttpServletRequest request, HttpSession session){

        Integer uid=(Integer) session.getAttribute("userId");
        User user=userService.getUserById(uid);

        ModelAndView mv=new ModelAndView("update_avatar");
        mv.addObject("user",user);
        return mv;
    }

    @RequestMapping(value = {"settings/avatar/update"}, method = RequestMethod.POST)
    public ModelAndView updateAvatarDo(@RequestPart("avatar") MultipartFile avatarFile, HttpServletRequest request, HttpSession session){
        Integer uid=(Integer) session.getAttribute("userId");

        String fileName=avatarFile.getOriginalFilename();
        String suffix=fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
        Long date=new Date().getTime();
        String newFileName=date+"-"+uid+"."+suffix;
        String absolutePath=session.getServletContext().getRealPath("/static/img/avatar")+"/"+newFileName;
        String relativePath="/img/avatar"+"/"+newFileName;
        User newUser=new User();
        newUser.setAvatar(relativePath);
        newUser.setId(uid);
        File file=new File(absolutePath);

        if (!file.exists()){
            try {
                avatarFile.transferTo(file);
                userService.updateUser(newUser);
            }catch (Exception e){
                e.printStackTrace();
            }
        }

        User user=userService.getUserById(uid);
        session.setAttribute("avatar",relativePath);
        ModelAndView mv=new ModelAndView("update_avatar");
        mv.addObject("user",user);

        return mv;
    }

    @RequestMapping(value = {"settings/setPhone"}, method = RequestMethod.POST)
    public void setUserPhone(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int userid = (int) session.getAttribute("userId");
        String phone_num = request.getParameter("phone_num");

        User user = userService.getUserById(userid);
        user.setPhoneNum(phone_num);
        user.setUpdateTime(new Date());

        if (userService.updateUser(user)) {
            response.getWriter().write("修改成功");
        } else {
            response.getWriter().write("修改失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"settings/setEmail"}, method = RequestMethod.POST)
    public void setUserEmail(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int userid = (int) session.getAttribute("userId");
        String email = request.getParameter("email");

        User user = userService.getUserById(userid);
        user.setEmail(email);
        user.setUpdateTime(new Date());

        if (userService.updateUser(user)) {
            response.getWriter().write("修改成功");
        } else {
            response.getWriter().write("修改失败");
        }
        response.getWriter().close();
    }

    @RequestMapping(value = {"settings/setCredit"}, method = RequestMethod.POST)
    public void setUserCredit(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        int userid = (int) session.getAttribute("userId");
        Integer credit = Integer.valueOf(request.getParameter("credit"));

        User user = userService.getUserById(userid);

        user.setUpdateTime(new Date());

        if (userService.updateUser(user)) {
            response.getWriter().write("充值成功");
            userService.addCredit(credit,userid);
        } else {
            response.getWriter().write("充值失败");
        }
        response.getWriter().close();
    }
}
