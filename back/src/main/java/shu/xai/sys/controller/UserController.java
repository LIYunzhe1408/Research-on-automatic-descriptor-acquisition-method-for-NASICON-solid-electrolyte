package shu.xai.sys.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import shu.xai.sys.constant.Constants;
import shu.xai.sys.enums.ResultCodeEnums;
import shu.xai.sys.service.LogService;
import shu.xai.sys.service.UserService;
import shu.xai.sys.utils.JSONUtil;
import shu.xai.sys.utils.ResultUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;


/**
 * Created by yuziyi on 2021/6/19.
 */
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private LogService logService;

    private final static Logger logger = LoggerFactory.getLogger(UserController.class);

    //开发用户基础操作

    @RequestMapping("/login")
    public String login(HttpServletRequest request,HttpServletResponse response){
//        request.getSession().setAttribute();
            //System.out.println(request.getRequestURI());

//        String urlDecoded = URLDecoder.decode(urlEncoded, encoding);
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String loginNo=params.getString("loginNo");
            String password=params.getString("password");
            JSONObject paramsResult=userService.login(loginNo, password);
            result= paramsResult.toString();
            if(paramsResult.get(Constants.RET_CODE).equals(ResultCodeEnums.SUCCESS.getCode())){
                if(request.getSession(false) != null) {
//                    System.out.println("每次登陆成功改变SessionID！");
                    request.changeSessionId(); //安全考量，每次登录成功改变 Session ID，原理：原来的session注销，拷贝其属性创建新的session对象
                }
                request.getSession().setAttribute("userLoginNo",loginNo);
                JSONObject userInfo=userService.getUserInfo(loginNo);
                request.getSession().setAttribute("roleId",userInfo.get("roleId"));
                request.getSession().setAttribute("institutionId",userInfo.get("institutionId"));
//                request.getSession().setAttribute("kkk",111);
            }
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }

        return result;
    }

    @RequestMapping("/signOut")
    public String signOut(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            String loginNo= String.valueOf(request.getSession().getAttribute("userLoginNo"));
            request.getSession(false).invalidate();
            logService.logInsert(loginNo, "/api/user/signOut");
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),"");
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }

        return result;
    }

    //获取用户可访问目录数据
    @RequestMapping("/getMenuData")
    public String getMenuData(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            String loginNo= String.valueOf(request.getSession().getAttribute("userLoginNo"));
            String roleId= String.valueOf(request.getSession().getAttribute("roleId"));

            JSONArray paramsResult=userService.getMenuData(loginNo,roleId);
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    //获取目录数据用于管理
    @RequestMapping("/getMenuManageData")
    public String getMenuManageData(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONArray paramsResult=userService.getMenuManageData();
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/getOPInfo")
    public String getOPInfo(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONArray paramsResult=userService.getOPInfo();
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/getUserInfo")
    public String getUserInfo(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            String loginNo= String.valueOf(request.getSession().getAttribute("userLoginNo"));
            JSONObject paramsResult=userService.getUserInfo(loginNo);
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/changeUserInfo")
    public String changeUserInfo(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String newUserInfo=params.getString("newUserInfo");
            newUserInfo= URLDecoder.decode(newUserInfo,Constants.ENCODING_DEF);
            String loginNo= String.valueOf(request.getSession().getAttribute("userLoginNo"));
            JSONObject paramsResult=userService.changeUserInfo(loginNo,newUserInfo);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/resetPassword")
    public String resetPassword(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String newPassword=params.getString("newPassword");
            String loginNo= String.valueOf(request.getSession().getAttribute("userLoginNo"));
            JSONObject paramsResult=userService.resetPassword(loginNo,newPassword);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/getInstitutionInfo")
    public String getInstitutionInfo(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONArray paramsResult=userService.getInstitutionInfo();
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    //获取x机构管理员列表
    @RequestMapping("/institutionManagers")
    public String institutionManagers(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String institutionId=params.getString("institutionId");
            JSONArray paramsResult=userService.institutionManagers(institutionId);
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/changeInstitutionDetail")
    public String changeInstitutionDetail(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String institutionId=params.getString("institutionId");
            String newInstitutionDetail=params.getString("newInstitutionDetail");
            newInstitutionDetail= URLDecoder.decode(newInstitutionDetail,Constants.ENCODING_DEF);
            JSONObject paramsResult=userService.changeInstitutionDetail(newInstitutionDetail,institutionId);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/changeInstitutionStatus")
    public String changeInstitutionStatus(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String institutionId=params.getString("institutionId");
            String activeStatus=params.getString("activeStatus");
            JSONObject paramsResult=userService.changeInstitutionStatus(institutionId,activeStatus);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/addNewInstitution")
    public String addNewInstitution(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String institutionName=params.getString("institutionName");
            String institutionDetail=params.getString("institutionDetail");
            institutionName= URLDecoder.decode(institutionName,Constants.ENCODING_DEF);
            institutionDetail= URLDecoder.decode(institutionDetail,Constants.ENCODING_DEF);
            JSONObject paramsResult=userService.addNewInstitution(institutionName,institutionDetail);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/addNewOP")
    public String addNewOP(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String opURL=params.getString("opURL");
            String opDescribe=params.getString("opDescribe");
            opURL= URLDecoder.decode(opURL,Constants.ENCODING_DEF);
            opDescribe= URLDecoder.decode(opDescribe,Constants.ENCODING_DEF);
            String opType=params.getString("opType");
            JSONObject paramsResult=userService.addNewOP(opURL,opDescribe,opType);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/addNewMenuMeb")
    public String addNewMenuMeb(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String menuId=params.getString("menuId");
            String name=params.getString("name");
            name= URLDecoder.decode(name,Constants.ENCODING_DEF);
            String path=params.getString("path");
            path= URLDecoder.decode(path,Constants.ENCODING_DEF);
            String fatherId=params.getString("fatherId");
            JSONObject paramsResult=userService.addNewMenuMeb(menuId,name,path,fatherId);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/addNewFMenuMeb")
    public String addNewFMenuMeb(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String menuId=params.getString("menuId");
            String name=params.getString("name");
            name= URLDecoder.decode(name,Constants.ENCODING_DEF);
            String path=params.getString("path");
            path= URLDecoder.decode(path,Constants.ENCODING_DEF);
            JSONObject paramsResult=userService.addNewFMenuMeb(menuId,name,path);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/changeMenuStatus")
    public String changeMenuStatus(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String menuId=params.getString("menuId");
            String menuActive=params.getString("menuActive");
            JSONObject paramsResult=userService.changeMenuStatus(menuId,menuActive);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }


    @RequestMapping("/changeUserStatus")
    public String changeUserStatus(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String loginNo=params.getString("loginNo");
            String activeStatus=params.getString("activeStatus");
            JSONObject paramsResult=userService.changeUserStatus(loginNo,activeStatus);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/addNewManager")
    public String addNewManager(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String loginNo=params.getString("loginNo");
            String userName=params.getString("userName");
            String institutionId=params.getString("institutionId");
            String institutionStatus=params.getString("institutionStatus");
            userName= URLDecoder.decode(userName,Constants.ENCODING_DEF);
            JSONObject paramsResult=userService.addNewManager(loginNo,userName,institutionId,institutionStatus);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/getOpLogInfo")
    public String getOpLogInfo(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            int offset=params.getInteger("offset");
            int limit=params.getInteger("limit");
            String loginNo= String.valueOf(request.getSession().getAttribute("userLoginNo"));
            String roleId= String.valueOf(request.getSession().getAttribute("roleId"));
            JSONObject paramsResult=logService.getOpLogInfo(loginNo,roleId,offset,limit);
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    //获取机构可访问目录数据
    @RequestMapping("/getInstitutionMenu")
    public String getInstitutionMenu(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String institutionId=params.getString("institutionId");

            JSONObject paramsResult=new JSONObject();
            JSONArray menuData=userService.getMenuManageData();
            paramsResult.put("menuData",menuData);
            String[] institutionMenu=userService.getInstitutionMenu(institutionId);
            paramsResult.put("institutionMenu",institutionMenu);

            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/updateInstitutionMenu")
    public String updateInstitutionMenu(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String institutionId=params.getString("institutionId");
            JSONArray newMenuList=params.getJSONArray("newMenuList");
            String[] menuList= newMenuList.toArray(new String[0]);
            JSONObject paramsResult=userService.updateInstitutionMenu(institutionId,menuList);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }


    //机构管理员用户基础操作
    //
    @RequestMapping("/getUserList")
    public String getUserList(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            String institutionId= String.valueOf(request.getSession().getAttribute("institutionId"));
            JSONArray paramsResult=userService.getUserList(institutionId);
            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/addNewUser")
    public String addNewUser(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String loginNo=params.getString("loginNo");
            String userName=params.getString("userName");
            String institutionId= String.valueOf(request.getSession().getAttribute("institutionId"));
            userName= URLDecoder.decode(userName,Constants.ENCODING_DEF);
            JSONObject paramsResult=userService.addNewUser(loginNo,userName,institutionId);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    //获取user可访问目录数据
    @RequestMapping("/getUserMenu")
    public String getUserMenu(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String loginNo=params.getString("loginNo");
            String institutionId= String.valueOf(request.getSession().getAttribute("institutionId"));


            JSONObject paramsResult=new JSONObject();
            JSONArray institutionMenu=userService.getInstitutionMenuData(institutionId);
            paramsResult.put("institutionMenu",institutionMenu);
            String[] userMenu=userService.getUserMenu(loginNo);
            paramsResult.put("userMenu",userMenu);

            result=ResultUtils.commonResult(ResultCodeEnums.SUCCESS.getCode(),ResultCodeEnums.SUCCESS.getMsg(),paramsResult.toJSONString());
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }

    @RequestMapping("/updateUserMenu")
    public String updateUserMenu(HttpServletRequest request,HttpServletResponse response){
        String result="";
        try{
            JSONObject params= JSONUtil.getRequestPayload(request);
            String loginNo=params.getString("loginNo");
            JSONArray newMenuList=params.getJSONArray("newMenuList");
            String[] menuList= newMenuList.toArray(new String[0]);
            JSONObject paramsResult=userService.updateUserMenu(loginNo,menuList);
            result=paramsResult.toString();
        }catch (Exception e){
            logger.error("error",e);
            result= ResultUtils.commonResult(ResultCodeEnums.UNKNOWN_ERROR.getCode(),ResultCodeEnums.UNKNOWN_ERROR.getMsg(),"");
        }
        return result;
    }


}
