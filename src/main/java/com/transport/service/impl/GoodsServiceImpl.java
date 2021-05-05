package com.transport.service.impl;

import com.transport.entity.Goods;
import com.transport.dao.GoodsDao;
import com.transport.service.GoodsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Goods)表服务实现类
 *
 * @author yym
 * @since 2021-05-03 16:35:58
 */
@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {
    @Resource
    private GoodsDao goodsDao;

    /**
     * 通过ID查询单条数据
     *
     * @param id 主键
     * @return 实例对象
     */
    @Override
    public Goods queryById(Integer id) {
        return this.goodsDao.queryById(id);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit  查询条数
     * @return 对象列表
     */
    @Override
    public List<Goods> queryAllByLimit(int offset, int limit) {
        return this.goodsDao.queryAllByLimit(offset, limit);
    }

    /**
     * 通过实体作为筛选条件查询
     *
     * @param goods 实例对象
     * @return 对象列表
     */
    @Override
    public List<Goods> queryAll(Goods goods) {
        return this.goodsDao.queryAll(goods);
    }

    /**
     * 新增数据
     *
     * @param goods 实例对象
     * @return 主键
     */
    @Override
    public Goods insert(Goods goods) {
        this.goodsDao.insert(goods);
        return goods;
    }

    /**
     * 修改数据
     *
     * @param goods 实例对象
     * @return 实例对象
     */
    @Override
    public Goods update(Goods goods) {
        this.goodsDao.update(goods);
        return this.queryById(goods.getId());
    }

    /**
     * 通过主键删除数据
     *
     * @param id 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer id) {
        return this.goodsDao.deleteById(id) > 0;
    }

    /**
     * 通过条件查询数据条数
     *
     * @param goods 实例对象
     * @return 数据条数
     */
    public Integer count(Goods goods) {
        return this.goodsDao.count(goods);
    }
}
