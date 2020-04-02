package cn.itcast.service.impl;

import cn.itcast.dao.IAccountDao;
import cn.itcast.dao.IUserDao;
import cn.itcast.domain.Account;
import cn.itcast.domain.User;
import cn.itcast.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements IAccountService {

    @Autowired
    IAccountDao accountDao;
    @Autowired
    IUserDao userDao;
//    @Autowired
//    IDatetestDao datetestDao;

    public List<Account> findAll() {
        System.out.println("业务层：查询所有账户...");

        return accountDao.findAll();
    }

    public void saveAccount(Account account) {
        System.out.println("业务层：保存帐户...");
        accountDao.saveAccount(account);
    }



//    @Override
//    public void addDatetest(Datetest datetest) {
//        datetestDao.addDatetest(datetest);
//    }
}
