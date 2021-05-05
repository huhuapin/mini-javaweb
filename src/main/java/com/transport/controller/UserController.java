package com.transport.controller;

import com.transport.entity.User;
import com.transport.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * (User)表控制层
 *
 * @author yym
 * @since 2021-05-01 23:30:26
 */
@Controller
@RequestMapping("/")
public class UserController {
    /**
     * 服务对象
     */
    @Resource
    private UserService userService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public User selectOne(Integer id, Model mode) {
        return this.userService.queryById(id);
    }

    @GetMapping("")
    public String index(){
        return "loginForm";
    }

    /**
     * 动态页面跳转控制器
     * */
    @Controller
    public class FormController{

        @RequestMapping(value="/{formName}")
        public String loginForm(@PathVariable String formName){
            // 动态跳转页面
            return formName;
        }

    }

    @PostMapping("login")
    public String login(String username,String password,Model model,HttpSession session) {
        //通过用户名密码匹配用户
        User loginUser = userService.login(username,password);
//        User loginUser = userService.queryById(1);
        if (loginUser != null) {
            session.setAttribute("user",loginUser);
            session.setAttribute("lastLogin",loginUser.getLastLogin());
            loginUser.setLastLogin(new Date());
            userService.update(loginUser);
            return "redirect:index";
        }else {
            // 设置登录失败提示信息
            model.addAttribute("message", "登录名或密码错误!请重新输入");
            // 服务器内部跳转到登录页面
            return "loginForm";
        }

    }
    @GetMapping("index")
    public String index(Model model){
        return "main";
    }

    @GetMapping("updateInfo")
    public String showUpdateInfo(Model model) {
        return "user/showUpdateUser";
    }

    @PostMapping("updateInfo")
    public String updateInfo(Model model,String name,String old_password,String new_password,String password_confirmation,HttpSession session) {
        User user = (User)session.getAttribute("user");
        boolean flag = true;  //标志用户输入是否正确
        String message = null;
        //如果只修改用户名
        user.setName(name);
        if (old_password == null || old_password.equals("")) {
            userService.update(user);
            message = "修改成功";
            session.setAttribute("user",user);
            System.out.println(message);
            model.addAttribute("message",message);
            return "user/showUpdateUser";
        }
        //如果原密码不正确，报错
        if (!old_password.equals(user.getPassword())) {
            flag = false;
            message = "原密码不正确";
        }else if(!new_password.equals(password_confirmation)) {
            //如果确认密码两次输入不一致，报错
            flag = false;
            message = "两次输入不一致";
        }
        //如果输入正确，则修改密码
        if (flag) {
            message = "修改成功";
            user.setPassword(new_password);
            userService.update(user);

        }
        model.addAttribute("message",message);
        return "user/showUpdateUser";
    }

    @GetMapping("logout")
    public String logout(HttpSession session){
        session.removeAttribute("user");
        return "redirect:";
    }



}