package com.transport.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * (Train)实体类
 *
 * @author yym
 * @since 2021-05-03 14:13:28
 */
public class Train implements Serializable {
    private static final long serialVersionUID = -49189910067853415L;

    private Integer id;

    private String trainNumber;
    /**
     * 1：平车，2：敞车，3：棚车，4：罐车，5：漏斗车，6：保温车，7：冷藏车
     */
    private TrainType type;

    private String site;

    private Integer carriageNum;

    private Double bearing;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd",timezone="GMT+8")
    private Date createdTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTrainNumber() {
        return trainNumber;
    }

    public void setTrainNumber(String trainNumber) {
        this.trainNumber = trainNumber;
    }


    public TrainType getType() {
        return type;
    }

    public void setType(TrainType type) {
        this.type = type;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public Integer getCarriageNum() {
        return carriageNum;
    }

    public void setCarriageNum(Integer carriageNum) {
        this.carriageNum = carriageNum;
    }

    public Double getBearing() {
        return bearing;
    }

    public void setBearing(Double bearing) {
        this.bearing = bearing;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    @Override
    public String toString() {
        final StringBuffer sb = new StringBuffer("Train{");
        sb.append("id=").append(id);
        sb.append(", trainNumber='").append(trainNumber).append('\'');
        sb.append(", type=").append(type);
        sb.append(", site='").append(site).append('\'');
        sb.append(", carriageNum=").append(carriageNum);
        sb.append(", bearing=").append(bearing);
        sb.append(", createdTime=").append(createdTime);
        sb.append('}');
        return sb.toString();
    }
}
