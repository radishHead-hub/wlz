package cn.itcast.controller;

import cn.itcast.domain.User;
import cn.itcast.service.IUserService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;


/**
 * @author WangLingzhi
 * @create 2020-03-24-15:53
 * @discription
 **/
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    IUserService userService;
    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name="page")int page,@RequestParam(name="size")int size ){
        ModelAndView mv = new ModelAndView();
        System.out.println("表现层：分页查询所有账户...");
        // 调用service的方法
        Page<User> p =new Page<>(page,size);//current：1 ，size：3
        IPage<User> pageInfo= userService.findAll(p);
        System.out.println("total:"+pageInfo.getTotal());
        System.out.println("pages:"+pageInfo.getPages());
        Integer pages=Integer.parseInt(String.valueOf(pageInfo.getPages()));
        mv.addObject("pages",pages);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("boss/list");
        return mv;
    }

    /**
     *
     * @param id
     * @param model
     * @return 查看详情
     */
    @RequestMapping("/findByIds")
    public String findByIds(@RequestParam(name="id")String id,Model model){
        System.out.println("表现层：查询单个账户...");
        // 调用service的方法
        User user=userService.findByIds(id);
        System.out.println(user.getShops().size());
        model.addAttribute("list",user);
        return "boss/info";
    }

    /**
     *
     * @param id
     * @param model
     * @return
     * 更新查看详情
     */
    @RequestMapping("/findById")
    public String findById(@RequestParam(name="id")String id,Model model){
        System.out.println("表现层：查询单个账户...");
        // 调用service的方法
        User user=userService.findByIds(id);
        //System.out.println(user.getShops().size());
        model.addAttribute("list",user);
        return "boss/updateInfo";
    }

    /**
     *
     * @param user
     * @param request
     * @param response
     * @throws IOException
     * 更新商家详情
     */
    @RequestMapping("/update")
    public void update(User user,HttpServletRequest request, HttpServletResponse response)throws IOException{
        System.out.println("表现层：查询单个账户返回到更新页面...");
        // 调用service的方法
        System.out.println(user.getId());
        user.setId(user.getId());
        userService.updateUser(user);
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        System.out.println("*****更新成功****");
        out.print("<script language=\"javascript\">alert('更新成功！');window.location.href='/user/findAll?page=1&size=3'</script>");


//        response.sendRedirect(request.getContextPath()+"/user/findAll?page=1&size=3");
    }

    @RequestMapping("/deleteById")
    public void deleteById(@RequestParam(name="id")String id,HttpServletRequest request, HttpServletResponse response)throws IOException{
        System.out.println("表现层：查询单个账户...");
        // 调用service的方法
        String re=userService.deleteById(id);
        //System.out.println(user.getShops().size());
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        if(re.equalsIgnoreCase("true")){

            System.out.println("*****删除成功****");
            out.print("<script language=\"javascript\">alert('删除成功！');window.location.href='/user/findAll?page=1&size=3'</script>");
        }
        else {
            out.print("<script language=\"javascript\">alert('删除失败！');window.location.href='/user/findAll?page=1&size=3'</script>");
        }

    }

    /**
     * 搜索引擎
     * @param search
     * @return
     */
    @RequestMapping("/ajaxSearch")
    public String ajaxSearch(@RequestParam(name="search")String search,Model model){
        System.out.println("表现层：jsonSearch......");
        System.out.println("传的值:" + search);
        User user = userService.findSearch(search);
        if(user!=null){
            model.addAttribute("users",user);
            System.out.println(user.getId());
            return "boss/search";
        }else{

            System.out.println("*****搜索失败****");
            return "boss/error";
        }

    }

    /**
     * 用户名唯一性校验
     * @param username
     * @return
     */
    @RequestMapping("/ajaxUsername")
    public @ResponseBody User ajaxUsername(@RequestBody String username) {
        System.out.println("表现层：jsonUsername......");
        System.out.println("传的值:" + username);
        if (username != null) {
            User user = userService.findUsername(username);
            if (user != null) {
                //说明账号存在
                return user;
            }
        }
        User user1= new User();
        //说明账号不存在
        return user1;
    }
    /**
     * 手机唯一性校验
     * @param phone
     * @return
     */
    @RequestMapping("/ajaxPhone")
    public @ResponseBody User ajaxPhone(@RequestBody String phone) {
        System.out.println("表现层：jsonPhone......");
        System.out.println("传的值:" + phone);
        if (phone != null) {
            User user = userService.findPhone(phone);
            if (user != null) {
                //说明手机号存在
                return user;
            }
        }
        User user1= new User();
        //说明手机号不存在
        return user1;
    }

    /**
     * 开启
     * @param id
     * @param response
     * @throws IOException
     */
    @RequestMapping("/openUserById")
    public void openUserById(@RequestParam(name="id") String id, HttpServletResponse response)throws IOException{
        String[] id1=id.split(",");
//        for(String id2:id1) {
//            System.out.println("***"+id2);
//        }
        List<String> id3 = new ArrayList<>(Arrays.asList(id1));
//        for(String idx:id3){
//            System.out.println("+++"+idx);
//        }
        System.out.println("开启");
        int i = userService.openUserById(id3);
        System.out.println(i);
        //如果开启成功

        response.setContentType("text/html;charset=utf-8");
            //弹窗提示
        PrintWriter out = response.getWriter();
        out.print("<script language=\"javascript\">alert('开启成功！');window.location.href='/user/findAll?page=1&size=3'</script>");
//      return "redirect:findAll?page=1&size=3";
    }
    /**
     * 锁定
     * @param id
     * @param response
     */
    @RequestMapping("/lockUserById")
    public void lockUserById(@RequestParam(name="id") String id, HttpServletResponse response)throws IOException{
        String[] id1=id.split(",");
        List<String> id3 = new ArrayList<>(Arrays.asList(id1));
        System.out.println("锁定");
        int i = userService.lockUserById(id3);
        System.out.println(i);
        //如果锁定成功
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        out.print("<script language=\"javascript\">alert('锁定成功！');window.location.href='/user/findAll?page=1&size=3'</script>");
//      return "redirect:findAll?page=1&size=3";
    }

    /**
     * 注销
     */
    @RequestMapping("/loginout")
    public String register(HttpSession session){
        System.out.println("表现层：注销...");
        // 调用service的方法
        session.invalidate();

        return "login";
    }
}
