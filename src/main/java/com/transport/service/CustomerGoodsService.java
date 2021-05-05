package com.transport.service;

import com.transport.entity.CustomerGoods;

import java.util.List;

/**
 * (CustomerGoods)表服务接口
 *
 * @author yym
 * @since 2021-05-04 01:15:48
 */
public interface CustomerGoodsService {

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    CustomerGoods queryById(Integer id);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    List<CustomerGoods> queryAllByLimit(int offset, int limit);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param customerGoods 实例对象
     * @return 对象列表
     */
    List<CustomerGoods> queryAll(CustomerGoods customerGoods);

    /**
     * 新增数据
     *
     * @param customerGoods 实例对象
     * @return 实例对象
     */
    CustomerGoods insert(CustomerGoods customerGoods);

    /**
     * 修改数据
     *
     * @param customerGoods 实例对象
     * @return 实例对象
     */
    CustomerGoods update(CustomerGoods customerGoods);

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    boolean deleteById(Integer id);

    /**
     * 通过条件查询数据条数
     *
     * @param customerGoods 实例对象
     * @return 数据条数
     */
    Integer count(CustomerGoods customerGoods);

    /**
     * 通过条件删除数据
     * @param customerGoods 实例对象
     * @return
     */
    boolean deleteAll(CustomerGoods customerGoods);
}
