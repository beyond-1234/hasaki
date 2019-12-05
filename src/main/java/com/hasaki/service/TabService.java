package com.hasaki.service;

import com.hasaki.domain.Tab;

import java.util.List;

public interface TabService {
    List<Tab> getAllTabs();

    Tab getByTabNameEn(String tabName);

    Tab getByTabId(int id);

    List<Tab> getAllTabsWithNum();

}
