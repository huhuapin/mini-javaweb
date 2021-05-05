package com.transport.entity;

import java.io.Serializable;

/**
 * (TrainType)实体类
 *
 * @author yym
 * @since 2021-05-03 14:16:55
 */
public class TrainType implements Serializable {
    private static final long serialVersionUID = 503197969367663624L;

    private Integer id;

    private String type;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("TrainType{");
        sb.append("id=").append(id);
        sb.append(", type='").append(type).append('\'');
        sb.append('}');
        return sb.toString();
    }
}
