package shu.xai.lyz_test.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import shu.xai.lyz_test.entity.LitAuthor;
import shu.xai.lyz_test.mapper.LitAuthorMapper;

import java.util.List;

@RestController
public class LitAuthorController {
    @Autowired
    private LitAuthorMapper litAuthorMapper;


    @GetMapping("/literature/author")
    public List<LitAuthor> getAuthor() {
        QueryWrapper<LitAuthor> queryWrapper = new QueryWrapper();
        queryWrapper.eq("name", "Ashish Vaswani");
        List<LitAuthor> authors = litAuthorMapper.selectList(queryWrapper);
        return authors;
    }


}
