package cn.itcast.controller;

import cn.itcast.domain.Account;
import cn.itcast.service.IAccountService;

import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.*;

/**
 * 帐户web
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private IAccountService accountService;

    @RequestMapping("/findAll")
    public String findAll(Model model){
        System.out.println("表现层：查询所有账户...");
        // 调用service的方法
        List<Account> list = accountService.findAll();
        model.addAttribute("list",list);
        return "list";
    }

    /**
     * json
     */

    @RequestMapping("/ajaxjson")
    @ResponseBody
    public List<Account> ajaxTest()
    {
        System.out.println("表现层：json...");
        List<Account> accounts = accountService.findAll();
        System.out.println(accounts.size());

        return accounts;
    }
    /**
     * 保存
     * @return
     */
    @RequestMapping("/save")
    public void save(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        accountService.saveAccount(account);
        response.sendRedirect(request.getContextPath()+"/account/findAll");
        return;
    }

//    @RequestMapping("/add")
//    public void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        String year=request.getParameter("year");
//        String month=request.getParameter("month");
//        String day=request.getParameter("day");
//        String str=year+"-"+month+"-"+day;
//        //字符串转换成Date类型的格式
//        Date date = new  Date() ;
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        try {
//            date = dateFormat.parse(str);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//        System.out.println("时间："+date);
//        Datetest datetest=new Datetest();
//        datetest.setDate(date);
//        accountService.addDatetest(datetest);
//        response.sendRedirect(request.getContextPath()+"/account/findAll");
//        return;
//    }


}

