package shu.xai.sys.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import shu.xai.sys.constant.Constants;
import shu.xai.sys.enums.RoleCodeEnums;
import shu.xai.sys.service.LogService;
import shu.xai.sys.utils.CoreUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * Created by yuziyi on 2021/6/19.
 */
@Service("LogService")
@Transactional
public class LogServiceImpl implements LogService {

    @Resource(name = "jdbcTemplateXAI")
    private JdbcTemplate jdbcTemplateXAI;


    @Override
    public void logInsert(String loginNo, String requestURI) {

        requestURI=requestURI.replace(Constants.CONTEXT_PATH,"");
        jdbcTemplateXAI.update("INSERT INTO sys_log_info(op_time,op_login_no,op_user,op_instatution_id,op_url,op_type,op_describe)\n" +
                "SELECT ?,t1.login_no,t1.user_name,t1.user_institution_id,t2.op_url,t2.op_type,t2.op_describe \n" +
                "FROM sys_user_info t1,sys_op_info t2\n" +
                "WHERE t1.login_no=? and t2.op_url=?", CoreUtils.getDateTime(),loginNo,requestURI);
    }

    @Override
    public JSONObject getOpLogInfo(String loginNo,String roleId,int offset,int limit) {
        JSONObject result=new JSONObject();
        //根据roleid等级看不同级别日志,普通用户根据loginNo看日志

        int total=0;
        List<Map<String,Object>> searchResult;
        if(roleId.equals(RoleCodeEnums.KAIFA.getCode())||roleId.equals(RoleCodeEnums.IN_MAMAGE.getCode())){
            total=jdbcTemplateXAI.queryForObject("SELECT COUNT(1) as a from sys_log_info t1 WHERE t1.op_instatution_id=(\n" +
                    "SELECT t2.user_institution_id from sys_user_info t2 where t2.login_no=?)",new Object[]{loginNo},int.class);
            searchResult=jdbcTemplateXAI.queryForList("SELECT t1.op_time,t1.op_login_no,t1.op_user,t1.op_type,t1.op_describe from sys_log_info t1 WHERE t1.op_instatution_id=(\n" +
                    "SELECT t2.user_institution_id from sys_user_info t2 where t2.login_no=?) LIMIT ?,?",loginNo,offset,limit);
        }else {
            total=jdbcTemplateXAI.queryForObject("SELECT COUNT(1) as a from sys_log_info t1 WHERE t1.op_login_no=?",new Object[]{loginNo},int.class);
            searchResult=jdbcTemplateXAI.queryForList("SELECT t1.op_time,t1.op_login_no,t1.op_user,t1.op_type,t1.op_describe from sys_log_info t1 WHERE t1.op_login_no=? LIMIT ?,?",loginNo,offset,limit);
        }
        JSONArray arr=new JSONArray();
        for(int i=0;i<searchResult.size();i++){
            JSONObject tmp=new JSONObject();
            tmp.put("opTime",searchResult.get(i).get("op_time"));
            tmp.put("opLoginNo",searchResult.get(i).get("op_login_no"));
            tmp.put("opUser",searchResult.get(i).get("op_user"));
            tmp.put("opType",searchResult.get(i).get("op_type"));
            tmp.put("opDescribe",searchResult.get(i).get("op_describe"));
            arr.add(tmp);
        }
        result.put("total",total);
        result.put("opLogtableData",arr);
        return result;
    }
}
