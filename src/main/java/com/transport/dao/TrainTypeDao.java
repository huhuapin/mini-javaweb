package com.transport.dao;

import com.transport.entity.TrainType;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (TrainType)表数据库访问层
 *
 * @author yym
 * @since 2021-05-03 14:16:55
 */
public interface TrainTypeDao {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    TrainType queryById(Integer id);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<TrainType> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param trainType 实例对象
     * @return 对象列表
     */
    List<TrainType> queryAll(TrainType trainType);

    /**
     * 新增数据
     *
     * @param trainType 实例对象
     * @return 影响行数
     */
    int insert(TrainType trainType);

    /**
     * 修改数据
     *
     * @param trainType 实例对象
     * @return 影响行数
     */
    int update(TrainType trainType);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 影响行数
     */
    int deleteById(Integer id);

    /**
     * 通过条件查询数据条数
     *
     * @param trainType 实例对象
     * @return 数据条数
     */
    Integer count(TrainType trainType);

}
