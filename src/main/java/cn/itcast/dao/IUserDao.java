package cn.itcast.dao;

import cn.itcast.domain.User;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-10-9:10
 * @discription
 **/
@Mapper
@Repository
@Transactional
public interface IUserDao extends BaseMapper<User>{
    public User selectUsernameByPassword(User user);
    public void insertUser(User user);
    User selectByIds(String id);
    void updateByIds(User user);
    User selectSearch(String search);
    int updateUserByIds(@Param(value = "id") List<String> id);
    int updateLockUserByIds(@Param(value = "id") List<String> id);
    User selectUsername(String username);
    User selectPhone(String phone);
}
