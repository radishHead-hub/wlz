package cn.itcast.service;

import cn.itcast.domain.Shop;
import cn.itcast.domain.User;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-24-23:24
 * @discription
 **/
public interface IShopService{
    int add(Shop shop);
    IPage<Shop> findAll(Page<Shop> p);

    Shop findByIds(String id);

    int updateUser(Shop shop);

    String deleteById(String id);

    List<Shop> findSearch(String search);

    void banShop(String id);

    void passShop(String id);

    int openShopById(List<String> id3);

    int lockShopById(List<String> id3);
//    List<Shop> findByBossId(String id);
}
