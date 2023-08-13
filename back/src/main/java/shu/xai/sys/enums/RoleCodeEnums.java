package shu.xai.sys.enums;

public enum RoleCodeEnums {
    KAIFA("1","开发人员"),
    IN_MAMAGE("2","机构管理员"),
    IN_MAMAGE_P("3","机构普通用户"),
    ;

    private String code;
    private String msg;

    RoleCodeEnums(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
