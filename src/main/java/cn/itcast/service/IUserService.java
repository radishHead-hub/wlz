package cn.itcast.service;

import cn.itcast.domain.User;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;


import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-19-10:58
 * @discription
 **/
public interface IUserService{
    //登录
    User login(User user);
    void register(User user);
    /*
        查询商家列表（分页）
     */
    IPage<User> findAll(Page<User> p);
    IPage<User> page(Page<User> p);
    /*
        根据id查询商家的详情
     */
    User findByIds(String id);

    void updateUser(User user);

    String deleteById(String id);
    /*
        根据用户名和手机号搜索
     */
    User findSearch(String search);
    /*
        批量开启
     */
    int openUserById(List<String> id);
    /*
        批量锁定
     */
    int lockUserById(List<String> id);
    /*
    校验用户名唯一性
     */
    User findUsername(String username);

    User findPhone(String phone);
}
