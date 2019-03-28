package egovframework.ec4.cmm.service;

import java.io.Serializable;
import java.util.List;

import com.google.gson.Gson;

/**
 * @Class Name : DataTableWrapperVO.java
 * @Description : DataTable server-side 사용시 리턴 값
 * @author harry
 * @Modification Information
 *
 *               <pre>
 *
 *   수정일        수정자             수정내용
 *  ----------    --------    ---------------------------
 *  2018.04.28    harry       최초 생성
 *               </pre>
 *
 * @author wizvil harry
 * @since 2018.04.28
 * @version 1.0
 * @see
 */
public final class DataTableWrapperVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private List<?> aaData = null;
    private int iTotalRecords = 0;
    private int iTotalDisplayRecords = 0;
    private String sEcho = "";


    public List<?> getAaData() {

        return aaData;
    }


    public void setAaData(List<?> aaData) {

        this.aaData = aaData;
    }


    public int getiTotalRecords() {

        return iTotalRecords;
    }


    public void setiTotalRecords(int iTotalRecords) {

        this.iTotalRecords = iTotalRecords;
    }


    public int getiTotalDisplayRecords() {

        return iTotalDisplayRecords;
    }


    public void setiTotalDisplayRecords(int iTotalDisplayRecords) {

        this.iTotalDisplayRecords = iTotalDisplayRecords;
    }


    public String getsEcho() {

        return sEcho;
    }


    public void setsEcho(String sEcho) {

        this.sEcho = sEcho;
    }


    public String toJson() {

        Gson gson = new Gson();
        //json string으로 parsing
        return gson.toJson(this);
    }

}
