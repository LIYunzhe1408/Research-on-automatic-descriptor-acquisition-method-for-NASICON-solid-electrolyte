package shu.xai.demo.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import shu.xai.demo.controller.DemoController;
import shu.xai.demo.pojo.CommonNode;
import shu.xai.demo.pojo.CommonRelation;
import shu.xai.demo.repo.CommonNodeRepository;
import shu.xai.demo.repo.CommonRelationRepository;
import shu.xai.demo.service.NodeService;

import java.util.List;


@Service("NodeService")
public class NodeServiceImpl implements NodeService {
    private final static Logger logger = LoggerFactory.getLogger(DemoController.class);
    @Autowired
    private CommonRelationRepository commonRelationRepository;
    @Autowired
    private CommonNodeRepository commonNodeRepository;

    @Override
    public void deleteNodeById(Long id) {
        commonNodeRepository.deleteById(id);
    }

    @Override
    public void deleteNodeByName(String name) {
        commonNodeRepository.deleteByName(name);
    }

    @Override
    public void delete() {
        commonNodeRepository.deleteAll();
    }

    @Override
    public void addNode(String name, String nameTo,String remark) {
        CommonNode commonNode=new CommonNode();
        commonNode.setName(name);
        commonNodeRepository.save(commonNode);

        CommonNode commonNodeTo=commonNodeRepository.findByName(nameTo);
        if(commonNodeTo !=null){
            CommonRelation customerRelation=new CommonRelation(commonNode,commonNodeTo,remark);
            commonRelationRepository.save(customerRelation);
        }
        //此处应该返回提示信息
    }

    /**
     * 根据ID修改节点的值
     * @param id
     * @param name
     * @param age
     */
    @Override
    public void updateNode(Long id,String name, Integer age) {
        CommonNode customerNode=commonNodeRepository.findNodeById(id);
        customerNode.setName(name);
        commonNodeRepository.save(customerNode);
    }

    @Override
    public Iterable<CommonNode> queryNodes() {
        return commonNodeRepository.findAll();
    }

    @Override
    public CommonNode findByName(String name) {
        return commonNodeRepository.findByName(name);
    }

    @Override
    public List<CommonNode> queryNodes(String name) {
        logger.info(name);
        return commonNodeRepository.findRelationByCommonNode(name);
    }
}
