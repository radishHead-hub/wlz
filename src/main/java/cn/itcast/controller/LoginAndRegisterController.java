package cn.itcast.controller;

import cn.itcast.domain.User;
import cn.itcast.service.IUserService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author WangLingzhi
 * @create 2020-03-19-16:28
 * @discription
 **/
@Log4j
@Controller
@RequestMapping("/loginAndRegister")
@Transactional
public class LoginAndRegisterController{

    @Autowired
    IUserService userService;
    @RequestMapping("/register")
    public String register(User user){
        System.out.println("表现层：注册...");
        // 调用service的方法
        if((userService.findUsername(user.getUsername())==null)&&(userService.findPhone(user.getPhone())==null)){
            System.out.println(userService.findUsername(user.getUsername()));
            userService.register(user);
            return "login";
        }else {
            // 注册失败跳转到错误页面
            return "error";
        }
    }
    /**
     * login
     */
    @RequestMapping("/login")
    public String findAll(User user, HttpSession session,Model model){
        System.out.println("表现层：登录...");
        // 调用service的方法
        User u= userService.login(user);
        //保存在session中
        if(u!=null&&u.getStatus()==1){
            //获取登录时间
            SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");//设置日期格式
            String logintime = df.format(new Date());// new Date()为获取当前系统时间
            session.setAttribute("user_id",u.getId());
            session.setAttribute("username",u.getUsername());
            session.setAttribute("role",u.getRole());
            session.setAttribute("loginTime",logintime);
            return "main";
        }
        model.addAttribute("msg","登录错误,请重新登录");
        return "login";

    }

    /**
     * 分页
     */
//    @ResponseBody
//    @RequestMapping("/findAll")
//    public IPage<User> findAll(){
//        Page<User> p =new Page<>(1,3);//current：1 ，size：3
//        IPage<User> data= userService.page(p);
//        System.out.println(data.getTotal());
//        return data;
//    }

}
