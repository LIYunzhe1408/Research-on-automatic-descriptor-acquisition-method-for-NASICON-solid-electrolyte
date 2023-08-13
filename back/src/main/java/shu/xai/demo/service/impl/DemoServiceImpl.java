package shu.xai.demo.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import shu.xai.demo.service.DemoService;
import shu.xai.sys.enums.ResultCodeEnums;
import shu.xai.sys.utils.ResultUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * service层实现类 具体功能实现，包括数据库交互
 * Created by yuziyi on 2022/1/24.
 */
@Service("DemoService")
public class DemoServiceImpl implements DemoService {

    @Resource(name = "jdbcTemplateSuperAlloy")
    private JdbcTemplate jdbcTemplateSuperAlloy;

    @Resource(name = "jdbcTemplateXAI")
    private JdbcTemplate jdbcTemplateXAI;


    @Override
    public JSONObject addNewPatent( String titleE, String authorE, String l_abstractE, String keywordsE,String publish_date,String reference_type,String research_institute,
                                    String volume,String issue,String doi,String start_page, String end_page, String PDFName) {
        JSONObject result=new JSONObject();
        jdbcTemplateXAI.update("INSERT INTO lit_info(titleE,authorE,l_abstractE,keywordsE,publish_date," +
                        "reference_type,research_institute,volume,issue,doi,start_page,end_page, PDF_Name) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)",
                titleE,authorE,l_abstractE,keywordsE,publish_date,reference_type,research_institute,volume,issue,doi,start_page,end_page, PDFName);
//        int i= jdbcTemplateXAI.queryForObject("SELECT count(*) from title",Integer.class);
//        i+=1;
//        jdbcTemplateXAI.update("INSERT INTO title(id,title) VALUES(?,?)",i,titleE);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }

    public String getPDFName(String titleE){
        String result = jdbcTemplateXAI.queryForList("select PDF_name from lit_info where titleE = ?", titleE).toString();
        result = result.substring(6,result.length()-2);
        return result;
    }
    /**
     * 查询专利列表实现
     * @return result 返回专利数据的JSONArray
     */
    @Override
    public JSONArray getPatentList() {
        JSONArray result=new JSONArray();
        String a="";
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT titleE,authorE,l_abstractE,keywordsE,publish_date," +
                "reference_type,research_institute,volume,issue,doi,start_page,end_page from lit_info ");

        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("titleE",item.get("titleE"));
            re.put("authorE",item.get("authorE"));
            re.put("l_abstractE",item.get("l_abstractE"));
            re.put("keywordsE",item.get("keywordsE"));
            re.put("publish_date",item.get("publish_date"));
            re.put("reference_type",item.get("reference_type"));
            re.put("research_institute",item.get("research_institute"));
            re.put("volume",item.get("volume"));
            re.put("issue",item.get("issue"));
            re.put("doi",item.get("doi"));
            re.put("start_page",item.get("start_page"));
            re.put("end_page",item.get("end_page"));
            result.add(re);
        }
        return result;
    }

    public JSONArray metainfo(String a){
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT titleE,authorE,l_abstractE,keywordsE,publish_date," +
                "research_institute,volume,issue,doi,start_page,end_page from lit_info where doi=?",a);
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("titleE",item.get("titleE"));
            re.put("authorE",item.get("authorE"));
            re.put("l_abstractE",item.get("l_abstractE"));
            re.put("keywordsE",item.get("keywordsE"));
            re.put("publish_date",item.get("publish_date"));
            re.put("reference_type",item.get("reference_type"));
            re.put("research_institute",item.get("research_institute"));
            re.put("volume",item.get("volume"));
            re.put("issue",item.get("issue"));
            re.put("doi",item.get("doi"));
            re.put("start_page",item.get("start_page"));
            re.put("end_page",item.get("end_page"));
            result.add(re);
        }
        System.out.println(result);
        return result;
    }

    public String getLastEntityID(){
        String number = jdbcTemplateXAI.queryForList("select count(*) from entity_library").toString();
        if (number == "0"){
            return "0";
        } else {
            String result = jdbcTemplateXAI.queryForList("select max(entity_id) from entity_library").toString();
            return result.substring(17,result.length()-2);
        }
    }
    public String getLastSentenceID(){
        String number = jdbcTemplateXAI.queryForList("select count(*) from lit_sentence").toString();
        if (number == "0"){
            return "0";
        } else {
            String result = jdbcTemplateXAI.queryForList("select max(sentence_id) from lit_sentence").toString();
            return result.substring(17,result.length()-2);
        }
    }


    public JSONObject insertLitSentence(String sentence, String doi){
        JSONObject result=new JSONObject();
        jdbcTemplateXAI.update("INSERT INTO lit_sentence (sentence_content, doi) VALUES(?,?)",
                sentence, doi);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }
    public String getDOI(String topic){
        String result = jdbcTemplateXAI.queryForList("select doi from lit_info where titleE = ?", topic).toString();
        result = result.substring(6,result.length()-2);
        return result;
    }
    public JSONArray getDOIandSentence(String sentence){
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult = jdbcTemplateXAI.queryForList("select doi, sentence_id from lit_sentence where sentence_content = ?", sentence);

        for(Map item:searchResult){
            JSONObject re = new JSONObject();
            re.put("sentence_id", item.get("sentence_id"));
            re.put("doi", item.get("doi"));
            result.add(re);
        }
        return result;
    }

    public JSONObject insertEntityLibrary(String entity_id, String predicate,String doi, String sentence_id, String entity_content, String sentence_content){
        JSONObject result=new JSONObject();
        jdbcTemplateXAI.update("INSERT INTO entity_library(entity_id, predicate_content,doi, sentence_id, entity_content, sentence_content) VALUES(?,?,?,?,?,?)",
                entity_id, predicate,doi, sentence_id, entity_content, sentence_content);
        jdbcTemplateXAI.update("update lit_info set NERextracted = 1 where doi = ?", doi);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }
    public JSONObject updateNERResult(String entity, String sentence_id, String entity_id, String predicate) {
        JSONObject result = new JSONObject();
            jdbcTemplateXAI.update("UPDATE entity_library set entity_content= ?, predicate_content = ? where sentence_id = ? and entity_id = ?",entity, predicate,sentence_id, entity_id);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return result;
    }

    public JSONArray getNERResult(String doi) {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult = jdbcTemplateXAI.queryForList("select entity_content, sentence_content, x.doi, entity_id, sentence_id, titleE, predicate_content, authorE, keywordsE, l_abstractE from entity_library x, lit_info y where x.doi = y.doi and x.doi = ?", doi);
        for(Map item:searchResult){
            JSONObject re = new JSONObject();
            re.put("entity_content", item.get("entity_content"));
            re.put("sentence_content", item.get("sentence_content"));
            re.put("doi", item.get("doi"));
            re.put("entity_id", item.get("entity_id"));
            re.put("sentence_id", item.get("sentence_id"));
            re.put("topic", item.get("titleE"));
            re.put("predicate", item.get("predicate_content"));
            re.put("author", item.get("authorE"));
            re.put("keywords", item.get("keywordsE"));
            re.put("abstract", item.get("l_abstractE"));
            result.add(re);
        }
        return result;
    }
    public JSONArray getEntity(String doi)
    {
        JSONArray result = new JSONArray();
        List<Map<String,Object>> searchResult = jdbcTemplateXAI.queryForList("select  from entity_library where doi = ?", doi);
        for(Map item:searchResult){
            JSONObject re = new JSONObject();
            re.put("entity_content", item.get("entity_content"));
            re.put("sentence_content", item.get("sentence_content"));
            re.put("entity_id", item.get("entity_id"));
            result.add(re);
        }
        return result;
    }


    public JSONArray getStatics(String doi)
    {
        JSONArray result = new JSONArray();
        String sql = "select sum(case when predicate_content=\"Characterization\" then 1 else 0 end) as \"Characterization\"," +
                "sum(case when predicate_content=\"Condition\" then 1 else 0 end) as \"Condition\", " +
                "sum(case when predicate_content=\"Composition\" then 1 else 0 end) as \"Composition\", "+
                "sum(case when predicate_content=\"Structure\" then 1 else 0 end) as \"Structure\", "+
                "sum(case when predicate_content=\"Property\" then 1 else 0 end) as \"Property\", "+
                "sum(case when predicate_content=\"Feature\" then 1 else 0 end) as \"Feature\", "+
                "sum(case when predicate_content=\"Application\" then 1 else 0 end) as \"Application\", "+
                "sum(case when predicate_content=\"Processing\" then 1 else 0 end) as \"Processing\" "+
                "from entity_library ";
        List<Map<String,Object>> searchResult = jdbcTemplateXAI.queryForList(sql);


        for(Map item:searchResult){
            JSONObject re = new JSONObject();
            re.put("Characterization", item.get("Characterization"));
            re.put("Condition", item.get("Condition"));
            re.put("Composition", item.get("Composition"));
            re.put("Structure", item.get("Structure"));
            re.put("Property", item.get("Property"));
            re.put("Feature", item.get("Feature"));
            re.put("Application", item.get("Application"));
            re.put("Processing", item.get("Processing"));
            result.add(re);
        }

        System.out.println(result);
        return result;
    }


    public JSONArray getREResult() {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult = jdbcTemplateXAI.queryForList("select relation, sentence_data from relation_library");
        for(Map item:searchResult){
            JSONObject re = new JSONObject();
            re.put("relation", item.get("relation"));
            re.put("sentence", item.get("sentence_data"));
            result.add(re);
        }
        return result;
    }


    ////////////////////////////////////////////////////////////

    public JSONArray getLitNameList(Integer isNER){
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult = new ArrayList<Map<String,Object>>();
        if (isNER == 0)
        {
            searchResult=jdbcTemplateXAI.queryForList("SELECT t.titleE from lit_info t where t.NERextracted = 1");
        } else if (isNER == 1) {

            searchResult=jdbcTemplateXAI.queryForList("SELECT t.titleE from lit_info t where t.NERextracted = 0");
        } else {
            searchResult=jdbcTemplateXAI.queryForList("SELECT t.titleE from lit_info t");
        }
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("topic",item.get("titleE"));
            result.add(re);
        }
        return result;
    }

    public JSONObject insertRelationLibrary(String sentence_data, String entity1_id, String entity2_id, String relation){
        JSONObject result=new JSONObject();
        jdbcTemplateXAI.update("INSERT INTO relation_library(sentence_data, entity1_id, entity2_id, relation) values (?,?,?,?)",
                sentence_data, entity1_id, entity2_id, relation);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }
    public JSONObject updateRelationLibrary(String sentence_data, String relation){
        JSONObject result=new JSONObject();
        jdbcTemplateXAI.update("update relation_library set relation = ? where sentence_data = ?", relation, sentence_data);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }
    public JSONObject updateREResult(String relation, String sentence){
        JSONObject result=new JSONObject();
        jdbcTemplateXAI.update("update relation_library set relation = ? where sentence_data = ?", relation, sentence);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }

    public JSONArray getPatentNameList() {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateSuperAlloy.queryForList("SELECT t.title from data_patent t");
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("title",item.get("title"));
            result.add(re);
        }
        return result;
    }

    public JSONArray getSentencesTableList() {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateSuperAlloy.queryForList("SELECT t.sentence,t.entity_1,t.entity_2 from data_sentence t");
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("sentence",item.get("sentence"));
            re.put("entity_1",item.get("entity_1"));
            re.put("entity_2",item.get("entity_2"));
            result.add(re);
        }
        return result;
    }


    public JSONObject addNodeName(String node_name) {
        JSONObject result=new JSONObject();
        jdbcTemplateSuperAlloy.update("INSERT INTO data_node(name) VALUES(?)", node_name);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return result;
    }

    public JSONObject deleteNodeName(String node_name) {
        JSONObject result=new JSONObject();
        jdbcTemplateSuperAlloy.update("DELETE FROM data_node WHERE name = ?", node_name);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return result;
    }

    //fixme 这里应该将sentence_library的content也改了，但这里只改了entity_library的
    public JSONObject updatePreProcessResult(String sentence_content, String sentence_id){
        JSONObject result = new JSONObject();
        jdbcTemplateXAI.update("UPDATE entity_library set sentence_content= ? where sentence_id = ? ",sentence_content,sentence_id);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return result;
    }

    public JSONObject deletePreProcessResult(String sentence_id){
        JSONObject result = new JSONObject();
        jdbcTemplateXAI.update("delete from entity_library where sentence_id = ? ",sentence_id);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return result;
    }
}
