package egovframework.ec4.call.outbd.smt.stm.service;

import egovframework.ec4.cmm.service.EC4DefaultVO;

public class MsgTmplatDefaultVO extends EC4DefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String searchSmsTmplatSe = "";
    private String searchSmsTmplatSj = "";
    private String searchSndngCn = "";
    private String searchReplcCode = "";
    private String selectedReplcOnly = "";


    public String getSearchSmsTmplatSe() {

        return searchSmsTmplatSe;
    }


    public void setSearchSmsTmplatSe(String searchSmsTmplatSe) {

        this.searchSmsTmplatSe = searchSmsTmplatSe;
    }


    public String getSearchSmsTmplatSj() {

        return searchSmsTmplatSj;
    }


    public void setSearchSmsTmplatSj(String searchSmsTmplatSj) {

        this.searchSmsTmplatSj = searchSmsTmplatSj;
    }


    public String getSearchSndngCn() {

        return searchSndngCn;
    }


    public void setSearchSndngCn(String searchSndngCn) {

        this.searchSndngCn = searchSndngCn;
    }


    public String getSearchReplcCode() {

        return searchReplcCode;
    }


    public void setSearchReplcCode(String searchReplcCode) {

        this.searchReplcCode = searchReplcCode;
    }


    public String getSelectedReplcOnly() {

        return selectedReplcOnly;
    }


    public void setSelectedReplcOnly(String selectedReplcOnly) {

        this.selectedReplcOnly = selectedReplcOnly;
    }

}
