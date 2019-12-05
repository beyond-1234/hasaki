package com.hasaki.service.impl;

import com.hasaki.dao.TabMapper;
import com.hasaki.domain.Tab;
import com.hasaki.service.TabService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ITabService implements TabService {

    @Autowired
    public TabMapper tabDao;

    @Override
    public List<Tab> getAllTabs() {
        return tabDao.getAllTabs();
    }

    @Override
    public Tab getByTabNameEn(String tabName) {
        return tabDao.getByTabNameEn(tabName);
    }

    @Override
    public Tab getByTabId(int id) {
        return tabDao.getByTabId(id);
    }

    @Override
    public List<Tab> getAllTabsWithNum() { return tabDao.getAllTabsWithNum(); }

}
