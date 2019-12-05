package com.hasaki.service.impl;

import com.hasaki.dao.LoginLogMapper;
import com.hasaki.domain.LoginLog;
import com.hasaki.service.LoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ILoginLogService implements LoginLogService{
    @Autowired
    public LoginLogMapper loginLogDao;

    @Override
    public boolean addLog(LoginLog log) {
        if (loginLogDao.insert(log) > 0) {
            return true;
        } else {
            return false;
        }
    }
}
