package com.transport.entity;

import java.io.Serializable;
import java.util.List;

/**
 * (Goods)实体类
 *
 * @author yym
 * @since 2021-05-03 16:35:56
 */
public class Goods implements Serializable {
    private static final long serialVersionUID = -88825051215822768L;

    private Integer id;

    private String name;

    private String type;

    private String image;

    private List<Customer> customers;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public List<Customer> getCustomers() {
        return customers;
    }

    public void setCustomers(List<Customer> customers) {
        this.customers = customers;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Goods{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", type='").append(type).append('\'');
        sb.append(", image='").append(image).append('\'');
        sb.append(", customers=").append(customers);
        sb.append('}');
        return sb.toString();
    }
}
