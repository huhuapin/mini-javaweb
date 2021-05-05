package com.transport.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * (User)实体类
 *
 * @author yym
 * @since 2021-05-01 23:30:23
 */
public class User implements Serializable {
    private static final long serialVersionUID = -81240439623679690L;

    private Integer id;

    private String username; //用户名

    private String password; //密码

    private String name;  //姓名

    private Date lastLogin;  //上次登录时间


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

}