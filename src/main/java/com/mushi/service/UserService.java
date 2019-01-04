package com.mushi.service;

import com.mushi.pojo.User;

public interface UserService {
    public User findUser(String usercode, String password);
}
