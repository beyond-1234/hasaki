package com.hasaki.service;

import com.hasaki.domain.LoginLog;

public interface LoginLogService {
    /**
     * 插入一条登录日志
     */
    boolean addLog(LoginLog log);
}
