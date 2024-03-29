package com.hasaki.service.impl;

import com.hasaki.dao.TopicMapper;
import com.hasaki.domain.Topic;
import com.hasaki.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ITopicService implements TopicService {

    @Autowired
    public TopicMapper topicDao;

    //获取全部主题
    @Override
    public List<Topic> getAllTopics() {
        return topicDao.getAllTopics();
    }

    @Override
    public List<Topic> listTopicsAndUsers() {
        return topicDao.listTopicsAndUsers();
    }

    @Override
    public List<Topic> listMostCommentsTopics() {
        return topicDao.listMostCommentsTopics();
    }

    @Override
    public List<Topic> listTopicsAndUsersOfTab(Integer tabId) {
        return topicDao.listTopicsAndUsersOfTab(tabId);
    }

    //根据id查询主题
    @Override
    public Topic selectById(Integer id) {
        Topic topic = topicDao.selectById(id);
        return topic;
    }

    @Override
    public boolean addTopic(Topic topic) {
        return topicDao.insert(topic) > 0;
    }

    @Override
    public boolean clickAddOne(Integer id) {
        return topicDao.clickAddOne(id) > 0;
    }

    @Override
    public int getTopicsNum() {
        return topicDao.getTopicsNum();
    }

    @Override
    public boolean deleteByUserId(int id) {
        return topicDao.deleteByUserId(id) >= 0;
    }

    @Override
    public boolean deleteByPrimaryKey(int id) {
        return topicDao.deleteByPrimaryKey(id) > 0;
    }
}
