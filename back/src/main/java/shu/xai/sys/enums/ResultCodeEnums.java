package shu.xai.sys.enums;

public enum ResultCodeEnums {
    UNKNOWN_ERROR(-1,"系统异常，请联系管理员或重试"),
    SESSION_OVERDUR(0,"用户未登录或登录超时,请重新登录"),
    SUCCESS(1,"执行成功"),
    NO_USER(2,"用户不存在或停用中"),
    ERR_PASSWORD(3,"密码错误"),
    ERR_STYLE(4,"认证号或密码格式错误"),
    UPDATE_ERROR(5,"未更新成功"),
    USER_EXIST(6,"认证号已被占用"),
    MENU_EXIST(7,"目录号已存在"),
    OP_EXIST(8,"操作url已存在"),
    FILE_NULL(9, "上传文件不能为空"),
    DOWNLOAD_ERROR(10, "excel下载失败，请检查是否完成PDF转文本及其他错误"),
    METAINFO_ERROR(11, "元信息获取失败"),
    REFERENCE_ERROR(12, "参考文献获取失败"),
    DISPLAY_ERROR(13, "文献句子获取失败");
    ;

    private Integer code;
    private String msg;

    ResultCodeEnums(Integer code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public Integer getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
