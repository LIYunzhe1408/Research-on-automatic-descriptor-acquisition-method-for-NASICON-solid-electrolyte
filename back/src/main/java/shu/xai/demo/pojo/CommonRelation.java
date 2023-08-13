package shu.xai.demo.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.neo4j.ogm.annotation.*;

import java.util.Date;

@RelationshipEntity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommonRelation {
    @Id
    @GeneratedValue
    private Long id;
    private Date createTime;
    private String remark;

    @StartNode
    private CommonNode nodeFrom;

    @EndNode
    private CommonNode nodeTo;

    public CommonRelation(CommonNode nodeFrom,CommonNode nodeTo,String remark){
        this.nodeFrom=nodeFrom;
        this.nodeTo=nodeTo;
        this.remark=remark;
    }
}