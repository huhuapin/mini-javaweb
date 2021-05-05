package com.transport.controller;

import com.transport.entity.Customer;
import com.transport.service.CustomerService;
import com.transport.util.tag.PageModel;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.*;

/**
 * (Customer)表控制层
 *
 * @author yym
 * @since 2021-05-02 18:21:25
 */
@Controller
@RequestMapping("customer")
public class CustomerController {
    /**
     * 服务对象
     */
    @Resource
    private CustomerService customerService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Customer selectOne(Integer id, Model mode) {
        return this.customerService.queryById(id);
    }

    /**
     * 按分页查询全部客户信息
     * @param model
     * @param pageIndex 当前页码
     * @return
     */
    @GetMapping("")
    public String customer(Model model,Integer pageIndex) {
        PageModel pageModel = new PageModel();
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        //获取全部数据条数
        int count = customerService.count(new Customer());
        pageModel.setRecordCount(count);
        //查询指定行数的客户信息
        List<Customer> customers = customerService.queryAllByLimit(pageModel.getFirstLimitParam(),pageModel.getPageSize());
        model.addAttribute("customers",customers);
        model.addAttribute("pageModel",pageModel);
        return "customer/customer";
    }

    /**
     * 搜索客户信息
     * @param model
     * @param pageIndex 页码
     * @param customer 所查询的客户参数
     * @return
     */
    @GetMapping("search")
    public String search(Model model,Integer pageIndex,Customer customer){
        PageModel pageModel = new PageModel();
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<Customer> customers = customerService.queryAll(customer);
        pageModel.setRecordCount(customers.size());
        model.addAttribute("customers",customers.subList(pageModel.getFirstLimitParam(), Math.min(pageModel.getPageSize() + pageModel.getFirstLimitParam(), customers.size())));
        model.addAttribute("pageModel",pageModel);
        return "customer/customer";
    }

    /**
     * 添加客户界面
     * @param model
     * @return
     */
    @GetMapping("add")
    public String addCustomer(Model model) {
        return "customer/addCustomer";
    }

    /**
     *  储存新增的客户信息
     * @param customer 客户信息
     * @param model
     * @return
     */
    @PostMapping("add")
    public String storeCustomer(Customer customer,Model model) {
        customer.setAge(new Date().getYear()-customer.getBirthday().getYear());
        customerService.insert(customer);
        String message = "添加成功";
        model.addAttribute("message",message);
        return "customer/addCustomer";
    }

    /**
     * 更新客户页面
     * @param id 客户id
     * @param model
     * @return
     */
    @GetMapping("update")
    public String detail(Integer id,Model model) {
        //根据id查询出当前客户信息并显示到前端
        Customer customer = customerService.queryById(id);
        model.addAttribute("customer",customer);
        return "customer/updateCustomer";
    }

    /**
     * 更新客户信息
     * @param customer 客户信息
     * @param model
     * @return
     */
    @PostMapping("update")
    public String update(Customer customer,Model model) {
        //计算客户的年龄
        customer.setAge(new Date().getYear()-customer.getBirthday().getYear());
        customerService.update(customer);
        String message = "修改成功";
        model.addAttribute("message",message);
        model.addAttribute("customer",customer);
        return "customer/updateCustomer";
    }

    /**
     * 批量删除客户
     * @param ids 客户id字符串
     * @param model
     * @return
     */
    @GetMapping("delete")
    public String delete(String ids,Model model) {
        //通过分割字符串解析所要删除的客户id，进行批量删除
        String[] s = ids.split(",");
        for (int i = 0; i < s.length; i++) {
            customerService.deleteById(Integer.parseInt(s[i]));
        }
        return "redirect:/customer";
    }

}