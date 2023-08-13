package shu.xai.sys.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import shu.xai.sys.enums.ResultCodeEnums;
import shu.xai.sys.enums.RoleCodeEnums;
import shu.xai.sys.enums.StatusCodeEnums;
import shu.xai.sys.service.UserService;
import shu.xai.sys.utils.CoreUtils;
import shu.xai.sys.utils.ResultUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by yuziyi on 2021/6/19.
 */
@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService{

    @Resource(name = "jdbcTemplateXAI")
    private JdbcTemplate jdbcTemplateXAI;

    //开发人员系统操作


    @Override
    public JSONObject login(String loginNo, String password) {
        JSONObject result=new JSONObject();
        //正则校验
        String regexLoginNo = "[0-9]{1,10}";
        String regexPassword = "[0-9a-zA-Z]{32}";
        if(!loginNo.matches(regexLoginNo)||!password.matches(regexPassword)){
            return ResultUtils.commonResultJSON(ResultCodeEnums.ERR_STYLE.getCode(),ResultCodeEnums.ERR_STYLE.getMsg());
        }
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("select t.password from sys_user_info t where t.login_no=? and t.user_active=?",
                loginNo, StatusCodeEnums.ACTIVE.getCode());
        if(searchResult.size()<1){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.NO_USER.getCode(),ResultCodeEnums.NO_USER.getMsg());
        }else{
            if(searchResult.get(0).get("password").equals(password)){
                result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
            }else{
                result= ResultUtils.commonResultJSON(ResultCodeEnums.ERR_PASSWORD.getCode(),ResultCodeEnums.ERR_PASSWORD.getMsg());

            }
        }
        return result;
    }

    @Override
    public JSONArray getMenuData(String loginNo,String roleId) {
        JSONArray result=new JSONArray();
        List<Map<String, Object>> searchResult;
        //菜单查询
        if(roleId.equals(RoleCodeEnums.KAIFA.getCode())||roleId.equals(RoleCodeEnums.IN_MAMAGE.getCode())) {
            //按角色菜单对照表
            searchResult = jdbcTemplateXAI.queryForList(
                    "select t1.menu_id,t1.menu_father_id,t1.menu_level,t1.menu_name,t1.menu_path from sys_menu_info t1 \n" +
                            "LEFT JOIN sys_role_menu t2 on t1.menu_id=t2.menu_id  \n" +
                            "LEFT JOIN sys_user_info t3 on t2.role_id=t3.role_id and t2.role_institution_id=t3.user_institution_id \n" +
                            "WHERE t3.login_no=? and t1.menu_active=?",
                    loginNo, StatusCodeEnums.ACTIVE.getCode());
        }else {
            //按用户菜单对照表 //todo 待优化 表顺序换下，不想改了,数据不多无所谓
            searchResult = jdbcTemplateXAI.queryForList(
                    "select t1.menu_id,t1.menu_father_id,t1.menu_level,t1.menu_name,t1.menu_path from sys_menu_info t1 \n" +
                            "LEFT JOIN sys_puser_menu t2 on t1.menu_id=t2.menu_id \n" +
                            "WHERE t2.login_no=? and t1.menu_active=?",
                    loginNo, StatusCodeEnums.ACTIVE.getCode());
        }
        //二级树结构生成
        result= CoreUtils.getMenuTree(searchResult);
        return result;
    }

    @Override
    public JSONArray getMenuManageData() {
        JSONArray result=new JSONArray();
        //菜单查询
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("select t1.menu_id,t1.menu_father_id,t1.menu_level,t1.menu_name,t1.menu_path,t1.menu_active from sys_menu_info t1");
        //二级树结构生成
        result= CoreUtils.getMenuTree(searchResult);
        return result;
    }

    @Override
    public JSONArray getOPInfo() {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.op_url,t.op_type,t.op_describe FROM sys_op_info t");
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("opURL",item.get("op_url"));
            re.put("opType",item.get("op_type"));
            re.put("opDescribe",item.get("op_describe"));
            result.add(re);
        }
        return result;
    }

    @Override
    public JSONObject getUserInfo(String loginNo) {
        JSONObject result=new JSONObject();
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("select t1.login_no,t1.user_name,t1.role_id,t2.role_name,t1.user_info,t1.user_institution_id,t3.institution_name from sys_user_info t1\n" +
                        "LEFT JOIN sys_role_info t2 on t1.role_id=t2.role_id\n" +
                        "LEFT JOIN sys_institution_info t3 on t3.institution_id=t1.user_institution_id\n" +
                        "where t1.login_no=?",
                loginNo);
        result.put("loginNo",searchResult.get(0).get("login_no"));
        result.put("userName",searchResult.get(0).get("user_name"));
        result.put("roleId",searchResult.get(0).get("role_id"));
        result.put("userInfo",searchResult.get(0).get("user_info"));
        result.put("role",searchResult.get(0).get("role_name"));
        result.put("institutionId",searchResult.get(0).get("user_institution_id"));
        result.put("institution",searchResult.get(0).get("institution_name"));
        return result;
    }

    @Override
    public JSONObject changeUserInfo(String loginNo, String newUserInfo) {
        JSONObject result=new JSONObject();
        int resultRow=jdbcTemplateXAI.update("UPDATE sys_user_info t set t.user_info=? where t.login_no=?",
                newUserInfo,loginNo);
        if(resultRow==1){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        }else{
            result= ResultUtils.commonResultJSON(ResultCodeEnums.UPDATE_ERROR.getCode(),ResultCodeEnums.UPDATE_ERROR.getMsg());
        }
        return  result;
    }

    public JSONObject resetPassword(String loginNo, String newPassword) {
        JSONObject result=new JSONObject();
        int resultRow=jdbcTemplateXAI.update("UPDATE sys_user_info t set t.password=? where t.login_no=?",
                newPassword,loginNo);
        if(resultRow==1){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        }else{
            result= ResultUtils.commonResultJSON(ResultCodeEnums.UPDATE_ERROR.getCode(),ResultCodeEnums.UPDATE_ERROR.getMsg());
        }
        return  result;
    }

    @Override
    public JSONArray getInstitutionInfo() {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.institution_id,t.institution_name,t.institution_detail,t.institution_active FROM sys_institution_info t");
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("institutionId",item.get("institution_id"));
            re.put("institutionName",item.get("institution_name"));
            re.put("institutionDetail",item.get("institution_detail"));
            re.put("inActive",item.get("institution_active"));
//            re.put("institutionActive",StatusCodeEnums.ACTIVE.getCode().equals(String.valueOf(item.get("institution_active")))?"已激活":"禁用");
            result.add(re);
        }
        return result;
    }

    @Override
    public JSONArray institutionManagers(String institutionId) {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.login_no,t.user_name,t.user_active FROM sys_user_info t WHERE t.role_id=? and t.user_institution_id=?",
                RoleCodeEnums.IN_MAMAGE.getCode(),institutionId);
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("loginNo",item.get("login_no"));
            re.put("userName",item.get("user_name"));
            re.put("userActive",item.get("user_active"));
//            re.put("IsActive",StatusCodeEnums.ACTIVE.getCode().equals(String.valueOf(item.get("user_active")))?"已激活":"停用");
            result.add(re);
        }
        return result;
    }

    @Override
    public JSONObject changeInstitutionDetail(String newInstitutionDetail,String institutionId) {
        JSONObject result=new JSONObject();
        int resultRow=jdbcTemplateXAI.update("UPDATE sys_institution_info t set t.institution_detail=? where t.institution_id=?",
                newInstitutionDetail,institutionId);
        if(resultRow==1){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        }else{
            result= ResultUtils.commonResultJSON(ResultCodeEnums.UPDATE_ERROR.getCode(),ResultCodeEnums.UPDATE_ERROR.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject addNewMenuMeb(String menuId,String name,String path,String fatherId) {
        JSONObject result=new JSONObject();
        //判重
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.menu_id FROM sys_menu_info t WHERE t.menu_id=?",menuId);
        if(searchResult.size()>0) {
            result = ResultUtils.commonResultJSON(ResultCodeEnums.MENU_EXIST.getCode(), ResultCodeEnums.MENU_EXIST.getMsg());
        }else {
            jdbcTemplateXAI.update("INSERT INTO sys_menu_info (menu_id,menu_level,menu_name,menu_father_id,menu_active,menu_path) VALUES(?,?,?,?,?,?)",
                    menuId, "2", name, fatherId, "1", path);
            //开发人员默认赋权
            jdbcTemplateXAI.update("INSERT INTO sys_role_menu (role_id,menu_id,role_institution_id) VALUES(?,?,?)",
                    "1", menuId, "0");
            result = ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject addNewFMenuMeb(String menuId,String name,String path) {
        JSONObject result=new JSONObject();
        //判重
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.menu_id FROM sys_menu_info t WHERE t.menu_id=?",menuId);
        if(searchResult.size()>0) {
            result = ResultUtils.commonResultJSON(ResultCodeEnums.MENU_EXIST.getCode(), ResultCodeEnums.MENU_EXIST.getMsg());
        }else {
            jdbcTemplateXAI.update("INSERT INTO sys_menu_info (menu_id,menu_level,menu_name,menu_father_id,menu_active,menu_path) VALUES(?,?,?,?,?,?)",
                    menuId, "1", name, "0", "1", path);
            //开发人员默认赋权
            jdbcTemplateXAI.update("INSERT INTO sys_role_menu (role_id,menu_id,role_institution_id) VALUES(?,?,?)",
                    "1", menuId, "0");
            result = ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject changeInstitutionStatus(String institutionId,String activeStatus) {
        JSONObject result=new JSONObject();
        String activeStatus1=activeStatus.equals(StatusCodeEnums.ACTIVE.getCode())?StatusCodeEnums.IN_ACTIVE.getCode():StatusCodeEnums.ACTIVE.getCode();
        int resultRow=jdbcTemplateXAI.update("UPDATE sys_institution_info t set t.institution_active=? where t.institution_id=?",
                activeStatus1,institutionId);
        if(resultRow==1){
            if(activeStatus.equals(StatusCodeEnums.ACTIVE.getCode())){
                jdbcTemplateXAI.update("UPDATE sys_user_info t set t.user_active=? where t.user_institution_id=?",StatusCodeEnums.IN_ACTIVE.getCode(),institutionId);
            }
            result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        }else{
            result= ResultUtils.commonResultJSON(ResultCodeEnums.UPDATE_ERROR.getCode(),ResultCodeEnums.UPDATE_ERROR.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject changeMenuStatus(String menuId,String menuActive) {
        JSONObject result=new JSONObject();
        String menuActive1=menuActive.equals(StatusCodeEnums.ACTIVE.getCode())?StatusCodeEnums.IN_ACTIVE.getCode():StatusCodeEnums.ACTIVE.getCode();
        int resultRow=jdbcTemplateXAI.update("UPDATE sys_menu_info t set t.menu_active=? where t.menu_id=?",
                menuActive1,menuId);
        if(resultRow==1){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        }else{
            result= ResultUtils.commonResultJSON(ResultCodeEnums.UPDATE_ERROR.getCode(),ResultCodeEnums.UPDATE_ERROR.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject addNewInstitution(String institutionName,String institutionDetail) {
        JSONObject result=new JSONObject();
        String institutionId=CoreUtils.getUUID();
        String institutionActive=StatusCodeEnums.ACTIVE.getCode();
        int resultRow=jdbcTemplateXAI.update("INSERT INTO sys_institution_info (institution_id,institution_name,institution_detail,institution_active) VALUES(?,?,?,?)",
                institutionId,institutionName,institutionDetail,institutionActive);

        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());

        return  result;
    }

    @Override
    public JSONObject addNewOP(String opURL,String opDescribe,String opType) {
        JSONObject result=new JSONObject();
        //判重
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.op_url FROM sys_op_info t WHERE t.op_url=?",opURL.trim());
        if(searchResult.size()>0){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.OP_EXIST.getCode(),ResultCodeEnums.OP_EXIST.getMsg());
        }else {
            jdbcTemplateXAI.update("INSERT INTO sys_op_info (op_url,op_type,op_describe) VALUES(?,?,?)",
                    opURL.trim(), opType, opDescribe);
            result = ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject changeUserStatus(String loginNo,String activeStatus) {
        JSONObject result=new JSONObject();
        String activeStatus1=activeStatus.equals(StatusCodeEnums.ACTIVE.getCode())?StatusCodeEnums.IN_ACTIVE.getCode():StatusCodeEnums.ACTIVE.getCode();
        int resultRow=jdbcTemplateXAI.update("UPDATE sys_user_info t set t.user_active=? where t.login_no=?",
                activeStatus1,loginNo);
        if(resultRow==1){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        }else{
            result= ResultUtils.commonResultJSON(ResultCodeEnums.UPDATE_ERROR.getCode(),ResultCodeEnums.UPDATE_ERROR.getMsg());
        }
        return  result;
    }

    @Override
    public JSONObject addNewManager(String loginNo,String userName,String institutionId,String institutionStatus) {
        JSONObject result=new JSONObject();
        String password= DigestUtils.md5DigestAsHex("123456".getBytes());
        String roleId= RoleCodeEnums.IN_MAMAGE.getCode();
        String userInfo= "";
        //判重
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.login_no FROM sys_user_info t WHERE t.login_no=?",loginNo);
        if(searchResult.size()>0){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.USER_EXIST.getCode(),ResultCodeEnums.USER_EXIST.getMsg());
        }else {
            jdbcTemplateXAI.update("INSERT INTO sys_user_info (login_no,user_name,password,role_id,user_info,user_institution_id,user_active) VALUES(?,?,?,?,?,?,?)",
                    loginNo, userName, password, roleId, userInfo, institutionId, institutionStatus);
            result = ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg());
        }
        return  result;
    }

    @Override
    public String[] getInstitutionMenu(String institutionId) {
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.menu_id from sys_role_menu t WHERE t.role_id=? and t.role_institution_id=?",RoleCodeEnums.IN_MAMAGE.getCode(),institutionId);
        String[] result=new String[searchResult.size()];
        for(int i=0;i<searchResult.size();i++){
            result[i]= String.valueOf(searchResult.get(i).get("menu_id"));
        }
        return result;
    }

    @Override
    public JSONObject updateInstitutionMenu(String institutionId, String[] menuList) {
        JSONObject result=new JSONObject();

        jdbcTemplateXAI.update("DELETE from sys_role_menu WHERE role_id=? and role_institution_id=?",RoleCodeEnums.IN_MAMAGE.getCode(),institutionId);
        List<Object[]> params=new ArrayList<>();
        for(String a:menuList){
            params.add(new Object[]{RoleCodeEnums.IN_MAMAGE.getCode(),a,institutionId});
        }
        jdbcTemplateXAI.batchUpdate("INSERT INTO sys_role_menu (role_id,menu_id,role_institution_id) VALUES(?,?,?)",params);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }

    //机构管理员系统操作
    //
    @Override
    public JSONArray getUserList(String institutionId) {
        JSONArray result=new JSONArray();
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.login_no,t.user_name,t.user_active FROM sys_user_info t WHERE t.role_id=? and t.user_institution_id=?",
                RoleCodeEnums.IN_MAMAGE_P.getCode(),institutionId);
        for(Map item:searchResult){
            JSONObject re=new JSONObject();
            re.put("loginNo",item.get("login_no"));
            re.put("userName",item.get("user_name"));
            re.put("userActive",item.get("user_active"));
            result.add(re);
        }
        return result;
    }

    @Override
    public JSONObject addNewUser(String loginNo,String userName,String institutionId) {
        JSONObject result=new JSONObject();
        String password= DigestUtils.md5DigestAsHex("123456".getBytes());
        String roleId= RoleCodeEnums.IN_MAMAGE_P.getCode();
        String userInfo= "";
        //判重
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.login_no FROM sys_user_info t WHERE t.login_no=?",loginNo);
        if(searchResult.size()>0){
            result= ResultUtils.commonResultJSON(ResultCodeEnums.USER_EXIST.getCode(),ResultCodeEnums.USER_EXIST.getMsg());
        }else {
            jdbcTemplateXAI.update("INSERT INTO sys_user_info (login_no,user_name,password,role_id,user_info,user_institution_id,user_active) VALUES(?,?,?,?,?,?,?)",
                    loginNo, userName, password, roleId, userInfo, institutionId, StatusCodeEnums.ACTIVE.getCode());
            result = ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(), ResultCodeEnums.SUCCESS.getMsg());
        }
        return  result;
    }

    @Override
    public JSONArray getInstitutionMenuData(String institutionId) {
        JSONArray result=new JSONArray();
        List<Map<String, Object>> searchResult= jdbcTemplateXAI.queryForList(
                    "select t1.menu_id,t1.menu_father_id,t1.menu_level,t1.menu_name,t1.menu_path from sys_menu_info t1 \n" +
                            "LEFT JOIN sys_role_menu t2 on t1.menu_id=t2.menu_id  \n" +
                            "WHERE t1.menu_active=? and t2.role_id=? and t2.role_institution_id=?",
                    StatusCodeEnums.ACTIVE.getCode(),RoleCodeEnums.IN_MAMAGE.getCode(),institutionId);

        //二级树结构生成
        result= CoreUtils.getMenuTree(searchResult);
        return result;
    }

    @Override
    public String[] getUserMenu(String loginNo) {
        List<Map<String,Object>> searchResult=jdbcTemplateXAI.queryForList("SELECT t.menu_id from sys_puser_menu t WHERE t.login_no=?",loginNo);
        String[] result=new String[searchResult.size()];
        for(int i=0;i<searchResult.size();i++){
            result[i]= String.valueOf(searchResult.get(i).get("menu_id"));
        }
        return result;
    }

    @Override
    public JSONObject updateUserMenu(String loginNo, String[] menuList) {
        JSONObject result=new JSONObject();

        jdbcTemplateXAI.update("DELETE from sys_puser_menu WHERE login_no=?",loginNo);
        List<Object[]> params=new ArrayList<>();
        for(String a:menuList){
            params.add(new Object[]{loginNo,a});
        }
        jdbcTemplateXAI.batchUpdate("INSERT INTO sys_puser_menu (login_no,menu_id) VALUES(?,?)",params);
        result= ResultUtils.commonResultJSON(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg());
        return  result;
    }


    //其他
    @Override
    public String getUserStatus(String loginNo){
        String status=jdbcTemplateXAI.queryForObject("select t.user_active from sys_user_info t WHERE t.login_no=?",new Object[]{loginNo},String.class);
        return status;
    }

}
