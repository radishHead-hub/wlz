package cn.itcast.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * @author WangLingzhi
 * @create 2020-03-24-23:20
 * @discription
 **/
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("shop")
public class Shop implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.UUID)
    private String id;
    private String shopName;
    private Long shopNo;
    private String shopAddress;
    private String shopType;
    private String shopPhone;
    private String shopInfo;
    private String shopImg;
    private String shopStatus;
    private Integer status;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date openTime;
    private String boss_id;
    private String boss_name;

}
