package com.zcw.model;

public class ResultVO {

    private int code;
    private Object data;
    private String msg;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public ResultVO() {
    }

    public ResultVO(int code, Object data, String msg) {
        this.code = code;
        this.data = data;
        this.msg = msg;
    }
    public static ResultVO error(String msg) {
        return new ResultVO(1,null,msg);
    }
    public ResultVO success(Object data, String msg) {
        return new ResultVO(0,data,msg);
    }
    public static ResultVO success() {
        return new ResultVO(0,null,"操作成功！");
    }
}
