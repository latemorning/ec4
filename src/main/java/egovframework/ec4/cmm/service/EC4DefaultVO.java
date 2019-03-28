package egovframework.ec4.cmm.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : EC4DefaultVO.java
 * @Description : EC4DefaultVO class
 * @author harry
 * @Modification Information
 *
 *               <pre>
 *
 *   수정일        수정자             수정내용
 *  ----------    --------    ---------------------------
 *  2018.04.30    harry       최초 생성
 *  2018.08.14    harry       system role info 추가
 * </pre>
 *
 * @author wizvil harry
 * @since 2018.04.30
 * @version 1.0
 * @see
 */
public class EC4DefaultVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private String iDisplayStart = ""; // datatable 시작 페이지
    private String iDisplayLength = ""; // datatable 한페이지에 보여줄 레코드
    private String sEcho = ""; // datatable draw 횟수(화면에서 받은 값을 그대로 넘겨줌)

    private String iSortCol_0 = ""; // datatable 단일 필드 정렬 - 정렬 할 필드 index
    private String sSortDir_0 = ""; // datatable 단일 필드 정렬 - [ASC, DESC]
    private String sortColNm = ""; // datatable 정렬할 필드명 controller 에서
                                  // iSortCol_0를 가지고 set

    private String searchUseAt = ""; // 공통 사용여부
    private String roleInfo = ""; // 로그인 사용자의 system role
    private String uniqId = ""; // 로그인 사용자의 고유ID

    // 팝업
    private String callbackClass = ""; // 팝업에서 부모창 호출하는 function 명
    private String selectStyle = ""; // ["single", "multi"] 기본값 "single" form에서
                                    // 설정

    // 파일
    private String fileId = ""; // jfile 파일 id

    // json 호출 관련
    private boolean isSuccess = false;
    private String message = "";


    public String getiDisplayStart() {

        return iDisplayStart;
    }


    public void setiDisplayStart(String iDisplayStart) {

        this.iDisplayStart = iDisplayStart;
    }


    public String getiDisplayLength() {

        return iDisplayLength;
    }


    public void setiDisplayLength(String iDisplayLength) {

        this.iDisplayLength = iDisplayLength;
    }


    public String getsEcho() {

        return sEcho;
    }


    public void setsEcho(String sEcho) {

        this.sEcho = sEcho;
    }


    public String getiSortCol_0() {

        return iSortCol_0;
    }


    public void setiSortCol_0(String iSortCol_0) {

        this.iSortCol_0 = iSortCol_0;
    }


    public String getsSortDir_0() {

        return sSortDir_0;
    }


    public void setsSortDir_0(String sSortDir_0) {

        this.sSortDir_0 = sSortDir_0;
    }


    public String getSortColNm() {

        return sortColNm;
    }


    public void setSortColNm(String sortColNm) {

        this.sortColNm = sortColNm;
    }


    public String getSearchUseAt() {

        return searchUseAt;
    }


    public void setSearchUseAt(String searchUseAt) {

        this.searchUseAt = searchUseAt;
    }


    public String getRoleInfo() {

        return roleInfo;
    }


    public void setRoleInfo(String roleInfo) {

        this.roleInfo = roleInfo;
    }


    public String getUniqId() {

        return uniqId;
    }


    public void setUniqId(String uniqId) {

        this.uniqId = uniqId;
    }


    public String getCallbackClass() {

        return callbackClass;
    }


    public void setCallbackClass(String callbackClass) {

        this.callbackClass = callbackClass;
    }


    public String getSelectStyle() {

        return selectStyle;
    }


    public void setSelectStyle(String selectStyle) {

        this.selectStyle = selectStyle;
    }


    public String getFileId() {

        return fileId;
    }


    public void setFileId(String fileId) {

        this.fileId = fileId;
    }


    public String toString() {

        return ToStringBuilder.reflectionToString(this);
    }


    public boolean isSuccess() {

        return isSuccess;
    }


    public void setSuccess(boolean isSuccess) {

        this.isSuccess = isSuccess;
    }


    public String getMessage() {

        return message;
    }


    public void setMessage(String message) {

        this.message = message;
    }

}
