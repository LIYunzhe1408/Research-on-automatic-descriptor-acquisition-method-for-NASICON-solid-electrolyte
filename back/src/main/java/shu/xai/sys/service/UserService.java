package shu.xai.sys.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * Created by yuziyi on 2021/6/20.
 */
public interface UserService {
    //开发人员系统操作
    JSONObject login(String loginNo, String password);
    JSONArray getMenuData(String loginNo,String roleId);
    JSONArray getMenuManageData();
    JSONArray getOPInfo();
    JSONObject getUserInfo(String loginNo);
    JSONObject changeUserInfo(String loginNo, String newUserInfo);
    JSONObject resetPassword(String loginNo, String newPassword);
    JSONArray getInstitutionInfo();
    JSONArray institutionManagers(String institutionId);
    JSONObject changeInstitutionDetail(String newInstitutionDetail,String institutionId);
    JSONObject changeInstitutionStatus(String institutionId,String activeStatus);
    JSONObject changeMenuStatus(String menuId,String menuActive);
    JSONObject addNewMenuMeb(String menuId,String name,String path,String fatherId);
    JSONObject addNewFMenuMeb(String menuId,String name,String path);
    JSONObject addNewInstitution(String institutionName,String institutionDetail);
    JSONObject addNewOP(String opURL,String opDescribe,String opType);
    JSONObject changeUserStatus(String loginNo,String activeStatus);
    JSONObject addNewManager(String loginNo,String userName,String institutionId,String institutionStatus);
    String[] getInstitutionMenu(String institutionId);
    JSONObject updateInstitutionMenu(String institutionId,String[] menuList);

    //机构管理员系统操作
    JSONArray getUserList(String institutionId);
    JSONObject addNewUser(String loginNo,String userName,String institutionId);
    JSONArray getInstitutionMenuData(String institutionId);
    String[] getUserMenu(String loginNo);
    JSONObject updateUserMenu(String loginNo,String[] menuList);


    //其他
    String getUserStatus(String loginNo);

    
}
