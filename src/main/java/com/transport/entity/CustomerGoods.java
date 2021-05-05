package com.transport.entity;

import java.io.Serializable;

/**
 * (CustomerGoods)实体类
 *
 * @author yym
 * @since 2021-05-04 01:15:48
 */
public class CustomerGoods implements Serializable {
    private static final long serialVersionUID = 102566269415092455L;

    private Integer id;

    private Integer customerId;

    private Integer goodsId;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Integer customerId) {
        this.customerId = customerId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

}
