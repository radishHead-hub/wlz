package cn.itcast.domain;

import lombok.Data;

import java.io.Serializable;

/**
 * 帐户
 */
@Data
public class Account implements Serializable{

    private Integer id;
    private String name;
    private Double money;

}
