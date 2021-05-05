package com.transport.service.impl;

import com.transport.entity.TrainType;
import com.transport.dao.TrainTypeDao;
import com.transport.service.TrainTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TrainType)表服务实现类
 *
 * @author yym
 * @since 2021-05-03 14:16:55
 */
@Service("trainTypeService")
public class TrainTypeServiceImpl implements TrainTypeService {
    @Resource
    private TrainTypeDao trainTypeDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public TrainType queryById(Integer id) {
        return this.trainTypeDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<TrainType> queryAllByLimit(int offset, int limit) {
        return this.trainTypeDao.queryAllByLimit(offset, limit);
    }

    /**
     * 通过实体作为筛选条件查询
     *
     * @param trainType 实例对象
     * @return 对象列表
     */
    @Override
    public List<TrainType> queryAll(TrainType trainType) {
        return this.trainTypeDao.queryAll(trainType);
    }

    /**
     * 新增数据
     *
     * @param trainType 实例对象
     * @return 实例对象
     */
    @Override
    public TrainType insert(TrainType trainType) {
        this.trainTypeDao.insert(trainType);
        return trainType;
    }

    /**
     * 修改数据
     *
     * @param trainType 实例对象
     * @return 实例对象
     */
    @Override
    public TrainType update(TrainType trainType) {
        this.trainTypeDao.update(trainType);
        return this.queryById(trainType.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.trainTypeDao.deleteById(id) > 0;
    }

    /**
     * 通过条件查询数据条数
     *
     * @param trainType 实例对象
     * @return 数据条数
     */
    public Integer count(TrainType trainType) {
        return this.trainTypeDao.count(trainType);
    }
}
