package shu.xai.demo.service;

import shu.xai.demo.pojo.CommonNode;

import java.util.List;

public interface NodeService {
    void deleteNodeById(Long id);
    void deleteNodeByName(String name);
    void delete();
    void addNode(String name,String nameTo,String remark);
    void updateNode(Long id,String name,Integer age);
    Iterable<CommonNode>  queryNodes();
    CommonNode findByName(String name);
    List<CommonNode> queryNodes(String name);
}
