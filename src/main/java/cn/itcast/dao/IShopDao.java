package cn.itcast.dao;

import cn.itcast.domain.Shop;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @author WangLingzhi
 * @create 2020-03-24-23:26
 * @discription
 **/
@Mapper
@Repository
@Transactional
public interface IShopDao extends BaseMapper<Shop> {
    List<Shop> selectSearch(String search);
    void updateBan(@Param("id") String id);
    void updatePass(@Param("id") String id);
    int updateOpen(@Param(value = "id")List<String> id3);
    int updateLock(@Param(value = "id")List<String> id3);
}
