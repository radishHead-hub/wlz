package cn.itcast.service.impl;

import cn.itcast.dao.IShopDao;
import cn.itcast.domain.Shop;
import cn.itcast.service.IShopService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-24-23:25
 * @discription
 **/
@Service("shopService")
public class ShopServiceImpl implements IShopService{
    @Autowired
    IShopDao shopDao;

    /**
     * 添加店铺
     * @param shop
     * @return
     */
    @Override
    public int add(Shop shop) {
        int i=0;
        Date date = new Date();//获得系统时间.
        SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
        String nowTime = sdf.format(date);
        try {
            Date time =sdf.parse(nowTime);
            shop.setOpenTime(time);
            i= shopDao.insert(shop);
            return i;

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return i;
    }

    @Override
    public IPage<Shop> findAll(Page<Shop> p) {
        return shopDao.selectPage(p,null);
    }

    @Override
    public Shop findByIds(String id) {
        return shopDao.selectById(id);
    }

    @Override
    public int updateUser(Shop shop) {
        return shopDao.updateById(shop);
    }

    @Override
    public String deleteById(String id) {
        shopDao.deleteById(id);
        return "true";
    }

    @Override
    public List<Shop> findSearch(String search) {
        return shopDao.selectSearch(search);
    }

    @Override
    public void banShop(String id){
        try {
            shopDao.updateBan(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void passShop(String id) {
        shopDao.updatePass(id);
    }

    @Override
    public int openShopById(List<String> id3) {
        return shopDao.updateOpen(id3);
    }

    @Override
    public int lockShopById(List<String> id3) {
        return shopDao.updateLock(id3);
    }

}
