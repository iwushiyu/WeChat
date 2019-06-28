package com.wechat.service;


public interface JSPAccountService {
    public boolean edit(String jspAccountName);
    public boolean delete(String jspAccountName);
    public String select();
}
