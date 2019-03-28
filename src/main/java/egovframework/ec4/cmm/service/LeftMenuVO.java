package egovframework.ec4.cmm.service;

import java.io.Serializable;
import java.util.ArrayList;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public class LeftMenuVO implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private ArrayList<EgovMap> leftMenus;

    private String menuNo = "";


    public ArrayList<EgovMap> getLeftMenus() {

        return leftMenus;
    }


    public void setLeftMenus(ArrayList<EgovMap> leftMenus) {

        this.leftMenus = leftMenus;
    }


    public String getMenuNo() {

        return menuNo;
    }


    public void setMenuNo(String menuNo) {

        this.menuNo = menuNo;
    }

}
