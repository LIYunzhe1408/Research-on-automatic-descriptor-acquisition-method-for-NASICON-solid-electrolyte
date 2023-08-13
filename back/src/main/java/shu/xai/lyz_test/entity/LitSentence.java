package shu.xai.lyz_test.entity;



import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class LitSentence {
    @TableId(type = IdType.AUTO)
    private Integer sentenceId;
    private String sentenceContent;
    private String doi;
}
