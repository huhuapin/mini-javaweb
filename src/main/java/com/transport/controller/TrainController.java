package com.transport.controller;

import com.transport.entity.Customer;
import com.transport.entity.Train;
import com.transport.entity.TrainType;
import com.transport.service.TrainService;
import com.transport.service.TrainTypeService;
import com.transport.util.tag.PageModel;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * (Train)表控制层
 *
 * @author yym
 * @since 2021-05-03 13:21:51
 */
@Controller
@RequestMapping("train")
public class TrainController {
    /**
     * 服务对象
     */
    @Resource
    private TrainService trainService;
    @Resource
    private TrainTypeService trainTypeService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public Train selectOne(Integer id, Model mode) {
        return this.trainService.queryById(id);
    }

    /**
     * 按分页查询全部车辆信息
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
        int count = trainService.count(new Train());
        pageModel.setRecordCount(count);
        //按分页获取车辆
        List<Train> trains = trainService.queryAllByLimit(pageModel.getFirstLimitParam(),pageModel.getPageSize());
        //储存全部车辆类型，方便前端查询选择
        List<TrainType> trainTypes = trainTypeService.queryAll(new TrainType());
        model.addAttribute("types",trainTypes);
        model.addAttribute("trains",trains);
        model.addAttribute("pageModel",pageModel);
        return "train/train";
    }

    /**
     * 搜索
     * @param model
     * @param type_id 车辆号
     * @param pageIndex 页码
     * @param train 车辆信息
     * @return
     */
    @GetMapping("search")
    public String search(Model model,Integer type_id,Integer pageIndex,Train train){
        PageModel pageModel = new PageModel();
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        //id不为0，说明是按照类型查询
        if (type_id !=0) {
            TrainType trainType = new TrainType();
            trainType.setId(type_id);
            train.setType(trainType);
        }
        List<Train> trains = trainService.queryAll(train);
        pageModel.setRecordCount(trains.size());

        //储存全部车辆类型，方便前端查询选择
        List<TrainType> trainTypes = trainTypeService.queryAll(new TrainType());
        model.addAttribute("types",trainTypes);
        //截取当前页数据，若当前页数据无法填满整个页面，则取到最后一条数据
        model.addAttribute("trains",trains.subList(pageModel.getFirstLimitParam(), Math.min(pageModel.getPageSize() + pageModel.getFirstLimitParam(), trains.size())));
        model.addAttribute("pageModel",pageModel);
        return "train/train";
    }

    /**
     * 添加车辆界面
     * @param model
     * @return
     */
    @GetMapping("add")
    public String addTrain(Model model) {
        List<TrainType> trainTypes = trainTypeService.queryAll(new TrainType());
        model.addAttribute("types",trainTypes);
        return "train/addTrain";
    }

    /**
     *  储存新增的车辆信息
     * @param train 车辆信息
     * @param model
     * @return
     */
    @PostMapping("add")
    public String storeTrain(Integer type_id,Train train,Model model) {
        TrainType trainType = new TrainType();
        trainType.setId(type_id);
        train.setType(trainType);
        trainService.insert(train);
        String message = "添加成功";
        model.addAttribute("message",message);
        return "redirect:/train";
    }

    /**
     * 更新车辆
     * @param id 车辆id
     * @param model
     * @return
     */
    @GetMapping("update")
    public String detail(Integer id,Model model) {
        Train train = trainService.queryById(id);
        List<TrainType> trainTypes = trainTypeService.queryAll(new TrainType());
        model.addAttribute("types",trainTypes);
        model.addAttribute("train",train);
        return "train/updateTrain";
    }

    /**
     * 更新车辆信息
     * @param train 车辆信息
     * @param model
     * @return
     */
    @PostMapping("update")
    public String update(Integer type_id,Train train, Model model) {
        TrainType trainType = new TrainType();
        trainType.setId(type_id);
        train.setType(trainType);

        trainService.update(train);
        String message = "修改成功";
        model.addAttribute("message",message);
        model.addAttribute("train",train);
        return "train/updateTrain";
    }

    /**
     * 批量删除车辆
     * @param ids 车辆id字符串
     * @param model
     * @return
     */
    @GetMapping("delete")
    public String delete(String ids,Model model) {
        String[] s = ids.split(",");
        for (int i = 0; i < s.length; i++) {
            trainService.deleteById(Integer.parseInt(s[i]));
        }
        return "redirect:/train";
    }

}
