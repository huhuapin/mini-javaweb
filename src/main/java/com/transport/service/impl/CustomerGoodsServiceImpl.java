package com.transport.service.impl;

import com.transport.entity.CustomerGoods;
import com.transport.dao.CustomerGoodsDao;
import com.transport.service.CustomerGoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (CustomerGoods)表服务实现类
 *
 * @author yym
 * @since 2021-05-04 01:15:48
 */
@Service("customerGoodsService")
public class CustomerGoodsServiceImpl implements CustomerGoodsService {
    @Resource
    private CustomerGoodsDao customerGoodsDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public CustomerGoods queryById(Integer id) {
        return this.customerGoodsDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<CustomerGoods> queryAllByLimit(int offset, int limit) {
        return this.customerGoodsDao.queryAllByLimit(offset, limit);
    }

    /**
     * 通过实体作为筛选条件查询
     *
     * @param customerGoods 实例对象
     * @return 对象列表
     */
    @Override
    public List<CustomerGoods> queryAll(CustomerGoods customerGoods) {
        return this.customerGoodsDao.queryAll(customerGoods);
    }

    /**
     * 新增数据
     *
     * @param customerGoods 实例对象
     * @return 实例对象
     */
    @Override
    public CustomerGoods insert(CustomerGoods customerGoods) {
        this.customerGoodsDao.insert(customerGoods);
        return customerGoods;
    }

    /**
     * 修改数据
     *
     * @param customerGoods 实例对象
     * @return 实例对象
     */
    @Override
    public CustomerGoods update(CustomerGoods customerGoods) {
        this.customerGoodsDao.update(customerGoods);
        return this.queryById(customerGoods.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.customerGoodsDao.deleteById(id) > 0;
    }

    /**
     * 通过条件查询数据条数
     *
     * @param customerGoods 实例对象
     * @return 数据条数
     */
    public Integer count(CustomerGoods customerGoods) {
        return this.customerGoodsDao.count(customerGoods);
    }

    /**
     * 通过条件删除数据
     * @param customerGoods 实例对象
     * @return
     */
    public boolean deleteAll(CustomerGoods customerGoods){return  this.customerGoodsDao.deleteAll(customerGoods);}
}
