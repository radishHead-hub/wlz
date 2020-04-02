package cn.itcast.service;

import cn.itcast.domain.Account;
import cn.itcast.domain.User;
import java.util.List;

public interface IAccountService {

    // 查询所有账户
    public List<Account> findAll();

    // 保存帐户信息
    public void saveAccount(Account account);


//    public void addDatetest(Datetest datetest);

}
