package shu.xai.demo.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * service层接口
 * Created by yuziyi on 2021/6/20.
 */
public interface DemoService{
    JSONObject addNewPatent(String titleE, String authorE, String l_abstractE, String keywordsE,String publish_date,String reference_type,String research_institute,
                                    String volume,String issue,String doi,String start_page, String end_page, String PDFName);
    String getPDFName(String titleE);
    JSONArray metainfo(String a);

    String getLastEntityID();
    String getLastSentenceID();
    JSONObject insertLitSentence(String sentence_id, String sentence);
    JSONObject insertEntityLibrary(String entity_id, String predicate,String doi, String sentence_id, String entity_content, String sentence_content);
    String getDOI(String topic);
    JSONArray getDOIandSentence(String sentence);
    JSONObject updateNERResult(String entity, String sentence_id, String entity_id, String predicate);

    JSONArray getStatics(String doi);
    /******************************/
    JSONObject updatePreProcessResult(String sentence_content, String sentence_id);
    JSONObject deletePreProcessResult(String sentence_id);
    /******************************/
    JSONArray getEntity(String doi);
    JSONObject insertRelationLibrary(String sentence_data, String entity1_id, String entity2_id, String relation);
    JSONObject updateRelationLibrary(String sentence_data, String relation);
    JSONObject updateREResult(String relation, String sentence);
    /******************************/

    JSONArray getPatentList();
    JSONArray getPatentNameList();
    JSONArray getSentencesTableList();
    JSONObject addNodeName(String node_name);
    JSONObject deleteNodeName(String node_name);
    JSONArray getNERResult(String doi);


    JSONArray getLitNameList(Integer isNER);
    JSONArray getREResult();
}
