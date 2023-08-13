package shu.xai.sys.service;

import com.alibaba.fastjson.JSONObject;

/**
 * Created by yuziyi on 2021/6/20.
 */
public interface LogService {
    void logInsert(String loginNo,String requestURI);
    JSONObject getOpLogInfo(String loginNo,String roleId,int offset,int limit);

}
