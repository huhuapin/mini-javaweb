package com.transport.controller;

import com.transport.entity.*;
import com.transport.service.CustomerGoodsService;
import com.transport.service.CustomerService;
import com.transport.service.GoodsService;
import com.transport.util.tag.PageModel;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;

/**
 * (Goods)表控制层
 *
 * @author yym
 * @since 2021-05-03 16:35:58
 */
@Controller
@RequestMapping("goods")
public class GoodsController {
    /**
     * 服务对象
     */
    @Resource
    private GoodsService goodsService;
    @Resource
    private CustomerService customerService;
    @Resource
    private CustomerGoodsService customerGoodsService;
    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Goods selectOne(Integer id) {
        return this.goodsService.queryById(id);
    }

    /**
     * 货物查询
     * @param pageIndex 页码
     * @param model
     * @return
     */
    @GetMapping("")
    public String goods(Integer pageIndex,Model model){
        PageModel pageModel = new PageModel();
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        //查询全部商品信息
        List<Goods> goods = goodsService.queryAll(new Goods());
        pageModel.setRecordCount(goods.size());
        model.addAttribute("pageModel",pageModel);
        //分页显示
        model.addAttribute("goods",goods.subList(pageModel.getFirstLimitParam(),Math.min(goods.size(),pageModel.getFirstLimitParam()+pageModel.getPageSize())));
        return "goods/goods";

    }

    /**
     * 模糊搜索
     * @param model
     * @param pageIndex 页码
     * @param goods 货物信息
     * @return
     */
    @GetMapping("search")
    public String search(Model model, Integer pageIndex, Goods goods){
        PageModel pageModel = new PageModel();
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<Goods> goodsLists = goodsService.queryAll(goods);
        pageModel.setRecordCount(goodsLists.size());

        model.addAttribute("goods",goodsLists.subList(pageModel.getFirstLimitParam(), Math.min(pageModel.getPageSize() + pageModel.getFirstLimitParam(), goodsLists.size())));
        model.addAttribute("pageModel",pageModel);
        return "goods/goods";
    }

    /**
     * 添加货物界面
     * @param model
     * @return
     */
    @GetMapping("add")
    public String addGoods(Model model) {
        List<Customer> customers  = customerService.queryAll(new Customer());
        model.addAttribute("customers",customers);
        return "goods/addGoods";
    }

    /**
     *  存储添加的商品
     * @param model
     * @param file 货物文件
     * @param goods  货物信息
     * @param customersId 所属用户id列表
     * @param request
     * @return
     */
    @PostMapping("add")
    public String storeGoods(Model model, MultipartFile file,Goods goods, Integer[] customersId,HttpServletRequest request) {
        String image = uploadFile(request,file);
        String message = null;
        if (image == null) {
            message = "图片上传失败";
            model.addAttribute("message",message);
            return "goods/addGoods";
        }else{
            goods.setImage(image);
        }
        //插入商品
        goods = goodsService.insert(goods);
        //关联商品和客户
        for (Integer id:customersId) {
            CustomerGoods customerGoods = new CustomerGoods();
            customerGoods.setGoodsId(goods.getId());
            customerGoods.setCustomerId(id);
            customerGoodsService.insert(customerGoods);
        }
        return "redirect:/goods";
    }

    /**
     * 更新商品页面
     * @param id
     * @param model
     * @return
     */
    @GetMapping("update")
    public String detail(Integer id,Model model) {
        Goods goods = goodsService.queryById(id);
        //获取客户信息
        List<Customer> customers  = customerService.queryAll(new Customer());

        //提取出货物所属的用户id列表，方便前端匹配
        List<Integer> ids = goods.getCustomers().stream().map(Customer::getId).collect(Collectors.toList());
        model.addAttribute("ids",ids);
        System.out.println(ids);
        model.addAttribute("customers",customers);
        model.addAttribute("goods",goods);
        return "goods/updateGoods";
    }

    /**
     * 保存更新的商品信息
     * @param model
     * @param file 图片文件
     * @param goods 商品信息
     * @param customersId 商品所属客户
     * @param request
     * @return
     */
    @PostMapping("update")
    public String update(Model model,MultipartFile file,Goods goods,Integer[] customersId,HttpServletRequest request) {
        List<Integer> customersIdList = new ArrayList<>(Arrays.asList(customersId));
        System.out.println(customersIdList);
        String image = uploadFile(request,file);
        Goods oldGoods = goodsService.queryById(goods.getId());
        if (image == null) {
            goods.setImage(oldGoods.getImage());
        }
        //遍历货物所属的旧客户
        for (Customer customer:oldGoods.getCustomers()) {
            //如果旧客户也在新客户中，则不再新建二者之间的关系
            if (customersIdList.contains(customer.getId())) {
                customersIdList.remove(customer.getId());
            }else {
            //若旧客户不在新客户中，则删除旧客户和货物之间的关系
                CustomerGoods customerGoods = new CustomerGoods();
                customerGoods.setCustomerId(customer.getId());
                customerGoods.setGoodsId(goods.getId());
                customerGoodsService.deleteAll(customerGoods);
            }
        }
        //遍历所有的新客户，添加货物与之对应的关系
        for (Integer customerId:customersIdList){
            CustomerGoods customerGoods = new CustomerGoods();
            customerGoods.setCustomerId(customerId);
            customerGoods.setGoodsId(goods.getId());
            customerGoodsService.insert(customerGoods);
        }
        goodsService.update(goods);
        return "redirect:/goods/update?id="+goods.getId();
    }

    /**
     * 批量删除
     * @param model
     * @param ids 要删除的id列表
     * @return
     */
    @GetMapping("delete")
    public String delete(Model model,String ids) {
        String[] s = ids.split(",");
        for (int i = 0; i < s.length; i++) {
            goodsService.deleteById(Integer.parseInt(s[i]));
            CustomerGoods customerGoods = new CustomerGoods();
            customerGoods.setGoodsId(Integer.parseInt(s[i]));
        }
        return "redirect:/goods";
    }

    //上传文件模块
    private String uploadFile(HttpServletRequest request,MultipartFile file){
        //获取要上传的目标文件夹绝对路径、webapp下
        ServletContext context = request.getSession().getServletContext();
        String realPath = context.getRealPath("/WEB-INF/resource/uploads/");
        File file0 = new File(realPath);
        if (!file0.exists()) {
            //文件夹不存在，新建文件夹
            file0.mkdir();
        }
        //重新定义文件名、避免名称重复
        String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 15) + file.getOriginalFilename();
        try {
            //上传文件至指定位置
            file.transferTo(new File(realPath + "/" + fileName));
            return "uploads/"+fileName;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

}
