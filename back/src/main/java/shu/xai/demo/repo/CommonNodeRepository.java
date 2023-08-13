package shu.xai.demo.repo;

import org.springframework.data.neo4j.annotation.Query;
import org.springframework.stereotype.Repository;
import shu.xai.demo.pojo.CommonNode;
import org.springframework.data.neo4j.repository.Neo4jRepository;

import java.util.List;
@Repository
public interface CommonNodeRepository extends Neo4jRepository<CommonNode, Long> {
    CommonNode findByName(String name);
    CommonNode deleteByName(String name);
    /**
     * 根据节点名称查找关系
     * @param name
     * @return
     */
    @Query("MATCH c=(cf:CommonNode)-[r:CommonRelation]->(ct:CommonNode) WHERE ct.name=$name OR cf.name=$name RETURN cf")
    List<CommonNode> findRelationByCommonNode(String name);

    @Query("MATCH c=(cf:CommonNode) WHERE cf.id=$id RETURN cf")
    CommonNode findNodeById(Long id);
}