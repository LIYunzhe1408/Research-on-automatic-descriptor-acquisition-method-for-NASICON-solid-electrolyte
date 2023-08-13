package shu.xai.demo.repo;

import org.springframework.data.neo4j.repository.Neo4jRepository;
import org.springframework.stereotype.Repository;
import shu.xai.demo.pojo.CommonRelation;
@Repository
public interface CommonRelationRepository extends Neo4jRepository<CommonRelation,Long> {

}