package cn.itcast.service.impl;

import cn.itcast.dao.IUserDao;
import cn.itcast.domain.User;
import cn.itcast.service.IUserService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-19-10:58
 * @discription
 **/
@Service("userService")
public class UserServiceImpl implements IUserService {
    @Autowired
    IUserDao userDao;

    /**
     * 注册商家账户
     * @param user
     */
    @Override
    public void register(User user) {
        Date date = new Date();//获得系统时间.
        SimpleDateFormat sdf =   new SimpleDateFormat( " yyyy-MM-dd HH:mm:ss " );
        String nowTime = sdf.format(date);
        try {
            Date time = sdf.parse(nowTime);
            user.setRegTime(time);
            userDao.insertUser(user);

        } catch (ParseException e) {
            e.printStackTrace();
        }
    }

    /**
     * 查询所有商家（分页）
     * @param p
     * @return
     */
    @Override
    public IPage<User> findAll(Page<User> p) {
        System.out.println("业务层：商户分页查询...");
        return userDao.selectPage(p,null);
    }

    @Override
    public IPage<User> page(Page<User> p) {
        return userDao.selectPage(p,null);
    }

    /**
     * 根据id查询商户详情
     * @param id
     * @return
     */
    @Override
    public User findByIds(String id) {
        System.out.println("业务层：单个商户查询...");
        return userDao.selectByIds(id);
    }

    /**
     * 进行商家详情更新
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userDao.updateByIds(user);
    }

    /**
     * 单个账户删除
     * @param id
     * @return
     */
    @Override
    public String deleteById(String id) {
        int i = userDao.deleteById(id);
        if (i!=0){
            return "true";
        }
        return "false";
    }

    /**
     *  根据用户名和手机号搜索
     * @param search
     * @return
     */
    @Override
    public User findSearch(String search) {
        System.out.println("业务层：搜索");
        return userDao.selectSearch(search);
    }

    @Override
    public int openUserById(List<String> id) {
        System.out.println("业务层：开启...");
        return userDao.updateUserByIds(id);
    }

    @Override
    public int lockUserById(List<String> id) {
        return userDao.updateLockUserByIds(id);
    }

    /**
     * 用户名唯一性校验
     * @param username
     * @return
     */
    @Override
    public User findUsername(String username) {
        return userDao.selectUsername(username);
    }

    /**
     * 手机号校验
     * @param phone
     * @return
     */
    @Override
    public User findPhone(String phone) {
        return userDao.selectPhone(phone);
    }

    /**
     * 登录
     * @param user
     * @return
     */
    @Override
    public User login(User user) {
        System.out.println("业务层：登录...");
        System.out.println(user.getUsername());
        //return accountDao.selectUsernameByPassword(user);
        return userDao.selectUsernameByPassword(user);
    }
    /**
     * 分页查询
     */

}
