package com.hasaki.service.impl;

import com.hasaki.dao.UserMapper;
import com.hasaki.domain.User;
import com.hasaki.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IUserService implements UserService {
    @Autowired
    public UserMapper userDao;

    //注册
    public boolean addUser(User user) {
        return userDao.addUser(user)>0;
    }

    //验证登陆0-用户不存在 1-密码错误 2-验证成功
    public int login(String username, String password) {
        //判断是否存在
        boolean existUsername = existUsername(username);
        if (existUsername) {
            User resUser = userDao.selectByUsername(username);
            if (resUser.getPassword().equals(password)) {
                return 2;
            }
            return 1;
        }
        return 0;
    }

    public boolean addCredit(Integer points, Integer id) {
        return userDao.addCredit(points, id)>0;
    }

    public boolean existUsername(String username) {
        return userDao.existUsername(username)==1;
    }

    public User getUserByUsername(String username) {
        User resUser = userDao.selectByUsername(username);
        return resUser;
    }

    public User getUserById(Integer id) {
        return userDao.selectByPrimaryKey(id);
    }

    public int getUserCount() {
        return userDao.getUserCount();
    }

    public boolean updateUser(User user) {
        return userDao.updateByPrimaryKeySelective(user)>0;
    }

    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public List<User> listHotestUsers() { return userDao.listHotestUsers(); }

    @Override
    public List<User> listNewUsers() { return userDao.listNewUsers(); }

    public boolean deleteByPrimaryKey(int id) {
        return userDao.deleteByPrimaryKey(id) > 0;
    }
}
