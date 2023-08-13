package shu.xai.lyz_test.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import shu.xai.lyz_test.entity.LitSentence;;
import shu.xai.lyz_test.mapper.LitSentenceMapper;

import java.util.List;

@RestController
@CrossOrigin
public class LitSentenceController {

    @Autowired
    private LitSentenceMapper litSentenceMapper;

    @GetMapping("/literature/sentence")
    public List<LitSentence> getSentenceByPage() {
//        Page<LitSentence> page = new Page<>(0, 10);
//        IPage iPage = litSentenceMapper.selectPage(page, null);
        List<LitSentence> allSentences = litSentenceMapper.selectList(null);
        System.out.println(allSentences);
        return allSentences;
//        return iPage;
    }

}
