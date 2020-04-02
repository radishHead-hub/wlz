package cn.itcast.domain;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.EqualsAndHashCode;


import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-10-8:46
 * @discription 商户表
 **/
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("user")
public class User implements Serializable{
    private static final long serialVersionUID = 1L;
    @TableId(type = IdType.UUID)
    private String id;
    private String username;
    private String password;
    private Integer vip;
    private String phone;
    private String realName;
    private String email;
    private String address;
    private String role;
    private Integer status;
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    private Date regTime;
    //一对多关系映射
    @TableField(exist =false)//写个这个注解，加exist=false 即可让Ipage分页插件不去查询它
    private List<Shop> shops;
}
