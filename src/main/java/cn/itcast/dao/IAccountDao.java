package cn.itcast.dao;

import cn.itcast.domain.Account;
import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 帐户dao接口
 */
@Repository
public interface IAccountDao {

    // 查询所有账户
    @Select("select * from account")
    public List<Account> findAll();

    // 保存帐户信息
    @Insert("insert into account (name,money) values (#{name},#{money})")
    public void saveAccount(Account account);

    //登录
    @Select("select * from user where username=#{username} and password=#{password}")
    public  List<User> selectUsernameByPassword(User user);

//    //添加
    @Insert("insert into account (date) values (#to_date{(date,'%Y-%M-%D')})")
    public void insertAccount(Account account);

}
