package cn.itcast.controller;

import cn.itcast.domain.Shop;
import cn.itcast.domain.User;
import cn.itcast.service.IShopService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * @author WangLingzhi
 * @create 2020-03-24-15:54
 * @discription
 **/
@Controller
@RequestMapping("/shop")
public class ShopController {
    @Autowired
    IShopService shopService;

    /**
     * 跳转到添加店铺jsp
     * @return
     */
    @RequestMapping("/addJsp")
    public String addJsp(){
        return "shop/add";
    }

    @RequestMapping("/add")
    public void add(Shop shop, HttpServletResponse response, MultipartFile file) throws IOException {
        System.out.println("表现层：店铺插入...");
        // 调用service的方法
        /**
         * 上传图片
         */
        String filePath = "D:\\Users\\WangLingzhi\\wlz\\src\\main\\webapp\\upload";//定义图片上传后的路径
        System.out.println(filePath);
        String newFileName = fileOperate(file,filePath);
        System.out.println("图片："+newFileName);
        shop.setShopImg(newFileName);
        shop.setShopStatus("未审核");
        shop.setStatus(0);
        int i = shopService.add(shop);
        System.out.println(i);
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
            System.out.println("*****插入成功****");
            out.print("<script language=\"javascript\">alert('插入成功！');window.location.href='/shop/findAll?page=1&size=3'</script>");
    }

    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name="page")int page, @RequestParam(name="size")int size ){
        ModelAndView mv = new ModelAndView();
        System.out.println("表现层：分页查询所有店铺...");
        // 调用service的方法
        Page<Shop> p =new Page<>(page,size);//current：1 ，size：3
        IPage<Shop> pageInfo= shopService.findAll(p);
        System.out.println("total:"+pageInfo.getTotal());
        System.out.println("pages:"+pageInfo.getPages());
        Integer pages=Integer.parseInt(String.valueOf(pageInfo.getPages()));
        mv.addObject("pages",pages);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("shop/list");
        return mv;
    }

    /**
     * 封装文件图片的方法
     * @param file
     * @param filePath
     * @return
     */
    private String fileOperate(MultipartFile file,String filePath) {
        String originalFileName = file.getOriginalFilename();//获取原始图片的扩展名
        System.out.println("图片原始名称："+originalFileName);
        String newFileName = UUID.randomUUID()+originalFileName;  //新的文件名称
        System.out.println("新的文件名称："+newFileName);
        File targetFile = new File(filePath,newFileName); //创建新文件
        try {
            file.transferTo(targetFile); //把本地文件上传到文件位置 , transferTo()是springmvc封装的方法，用于图片上传时，把内存中图片写入磁盘
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return newFileName;
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
        Shop shop=shopService.findByIds(id);
        System.out.println(shop.getBoss_name());
        model.addAttribute("shop",shop);
        return "shop/info";
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
        Shop shop=shopService.findByIds(id);
        //System.out.println(user.getShops().size());
        model.addAttribute("shop",shop);
        return "shop/updateInfo";
    }

    /**
     *
     * @param shop
     * @param response
     * @throws IOException
     * 更新商家详情
     */
    @RequestMapping("/update")
    public void update(Shop shop,HttpServletRequest request, HttpServletResponse response, MultipartFile file) throws IOException {
        System.out.println("表现层：店铺更新...");
        // 调用service的方法
        /**
         * 上传图片
         */
        String filePath = request.getSession().getServletContext().getRealPath("upload");//定义图片上传后的路径
        System.out.println(filePath);
        String newFileName = fileOperate(file,filePath);
        System.out.println("图片："+newFileName);
        shop.setShopImg(newFileName);
        shopService.updateUser(shop);
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        System.out.println("*****更新成功****");
        out.print("<script language=\"javascript\">alert('更新成功！');window.location.href='/shop/findAll?page=1&size=3'</script>");


//        response.sendRedirect(request.getContextPath()+"/user/findAll?page=1&size=3");
    }

    @RequestMapping("/deleteById")
    public void deleteById(@RequestParam(name="id")String id,HttpServletResponse response)throws IOException{
        System.out.println("表现层：查询单个账户...");
        // 调用service的方法
        String re=shopService.deleteById(id);
        //System.out.println(user.getShops().size());
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        if(re.equalsIgnoreCase("true")){

            System.out.println("*****删除成功****");
            out.print("<script language=\"javascript\">alert('删除成功！');window.location.href='/shop/findAll?page=1&size=3'</script>");
        }
        else {
            out.print("<script language=\"javascript\">alert('删除失败！');window.location.href='/shop/findAll?page=1&size=3'</script>");
        }

    }

    /**
     * 搜索引擎  原本想用ajax的，后来换用form表单
     * @param search
     * @return
     */
    @RequestMapping("/ajaxSearch")
    public String ajaxSearch(@RequestParam(name="search")String search,Model model){
        System.out.println("表现层：jsonSearch......");
        System.out.println("传的值:" + search);
        List<Shop> shop = shopService.findSearch(search);
        if(shop.size()!=0){
            model.addAttribute("shops",shop);
            System.out.println("搜索的记录条数"+shop.size());
            return "shop/search";
        }else{

            System.out.println("*****搜索失败****");
            return "shop/error";
        }

    }

    /**
     * 驳回店铺申请
     * @param id
     * @param response
     * @throws IOException
     */
    @RequestMapping("/ban")
    public void ban(@RequestParam(name="id")String id,HttpServletResponse response) throws IOException{
        shopService.banShop(id);
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        System.out.println("*****驳回更新****");
        out.print("<script language=\"javascript\">alert('驳回成功！');window.location.href='/shop/findAll?page=1&size=3'</script>");
    }
    /**
     * 驳回店铺申请
     * @param id
     * @param response
     * @throws IOException
     */
    @RequestMapping("/pass")
    public void pass(@RequestParam(name="id")String id,HttpServletResponse response) throws IOException{
        shopService.passShop(id);
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        System.out.println("*****通过更新****");
        out.print("<script language=\"javascript\">alert('审核已通过！');window.location.href='/shop/findAll?page=1&size=3'</script>");
    }

    /**
     * 开启
     * @param id
     * @param response
     * @throws IOException
     */
    @RequestMapping("/openShopById")
    public void openShopById(@RequestParam(name="id") String id, HttpServletResponse response)throws IOException{
        String[] id1=id.split(",");
        List<String> id3 = new ArrayList<>(Arrays.asList(id1));
        System.out.println("开启");
        int i = shopService.openShopById(id3);
        System.out.println(i);
        //如果开启成功

        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        out.print("<script language=\"javascript\">alert('开启成功！');window.location.href='/shop/findAll?page=1&size=3'</script>");
//      return "redirect:findAll?page=1&size=3";
    }
    /**
     * 锁定
     * @param id
     * @param response
     */
    @RequestMapping("/lockShopById")
    public void lockShopById(@RequestParam(name="id") String id, HttpServletResponse response)throws IOException{
        String[] id1=id.split(",");
        List<String> id3 = new ArrayList<>(Arrays.asList(id1));
        System.out.println("锁定");
        int i = shopService.lockShopById(id3);
        System.out.println(i);
        //如果锁定成功
        response.setContentType("text/html;charset=utf-8");
        //弹窗提示
        PrintWriter out = response.getWriter();
        out.print("<script language=\"javascript\">alert('锁定成功！');window.location.href='/shop/findAll?page=1&size=3'</script>");
//      return "redirect:findAll?page=1&size=3";
    }

}
