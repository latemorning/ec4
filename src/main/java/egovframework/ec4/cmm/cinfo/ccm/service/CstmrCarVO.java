package egovframework.ec4.cmm.cinfo.ccm.service;

/**
 * 고객차량정보
 *
 * @author harry
 * @since 2018.07.23
 */
public class CstmrCarVO extends CstmrCarDefaultVO {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String vin = "";
    private String vinFront = "";
    private String vinRear = "";
    private String carnbr = "";
    private String vhcleDetailModelId = "";
    private String vhctyCode = "";
    private String vhctyCodeNm = "";
    private String colorCode = "";
    private String colorCodeNm = "";
    private String drvdstnc = "";       // 주행거리

    // 취득/상실
    private String cstmrEsntlId = "";   // 고객 고유ID
    private String vhcleEsntlId = "";   // 차량 고유ID
    private String acqdt = "";          // 취득일
    private String acqspc = "";         // 취득가격
    private String acqstx = "";         // 취득세
    private String acqsTyCode = "";     // 취득 유형 코드

    private String frftrdt = "";        // 상실일
    private String frftrTyCode = "";    // 상실 유형 코드


    public String getVin() {

        return vin;
    }


    public void setVin(String vin) {

        this.vin = vin;
    }


    public String getVinFront() {

        return vinFront;
    }


    public void setVinFront(String vinFront) {

        this.vinFront = vinFront;
    }


    public String getVinRear() {

        return vinRear;
    }


    public void setVinRear(String vinRear) {

        this.vinRear = vinRear;
    }


    public String getCarnbr() {

        return carnbr;
    }


    public void setCarnbr(String carnbr) {

        this.carnbr = carnbr;
    }


    public String getVhcleDetailModelId() {

        return vhcleDetailModelId;
    }


    public void setVhcleDetailModelId(String vhcleDetailModelId) {

        this.vhcleDetailModelId = vhcleDetailModelId;
    }


    public String getVhctyCode() {

        return vhctyCode;
    }


    public void setVhctyCode(String vhctyCode) {

        this.vhctyCode = vhctyCode;
    }


    public String getVhctyCodeNm() {

        return vhctyCodeNm;
    }


    public void setVhctyCodeNm(String vhctyCodeNm) {

        this.vhctyCodeNm = vhctyCodeNm;
    }


    public String getColorCode() {

        return colorCode;
    }


    public void setColorCode(String colorCode) {

        this.colorCode = colorCode;
    }


    public String getColorCodeNm() {

        return colorCodeNm;
    }


    public void setColorCodeNm(String colorCodeNm) {

        this.colorCodeNm = colorCodeNm;
    }


    public String getDrvdstnc() {

        return drvdstnc;
    }


    public void setDrvdstnc(String drvdstnc) {

        this.drvdstnc = drvdstnc;
    }


    public String getCstmrEsntlId() {

        return cstmrEsntlId;
    }


    public void setCstmrEsntlId(String cstmrEsntlId) {

        this.cstmrEsntlId = cstmrEsntlId;
    }


    public String getVhcleEsntlId() {

        return vhcleEsntlId;
    }


    public void setVhcleEsntlId(String vhcleEsntlId) {

        this.vhcleEsntlId = vhcleEsntlId;
    }


    public String getAcqdt() {

        return acqdt;
    }


    public void setAcqdt(String acqdt) {

        this.acqdt = acqdt;
    }


    public String getAcqspc() {

        return acqspc;
    }


    public void setAcqspc(String acqspc) {

        this.acqspc = acqspc;
    }


    public String getAcqstx() {

        return acqstx;
    }


    public void setAcqstx(String acqstx) {

        this.acqstx = acqstx;
    }


    public String getAcqsTyCode() {

        return acqsTyCode;
    }


    public void setAcqsTyCode(String acqsTyCode) {

        this.acqsTyCode = acqsTyCode;
    }


    public String getFrftrdt() {

        return frftrdt;
    }


    public void setFrftrdt(String frftrdt) {

        this.frftrdt = frftrdt;
    }


    public String getFrftrTyCode() {

        return frftrTyCode;
    }


    public void setFrftrTyCode(String frftrTyCode) {

        this.frftrTyCode = frftrTyCode;
    }


    /**
     * EgovMap에서 VO셋팅
     *
     * @param egovMap
     */
//    public void setValuesFromEgovMap(EgovMap egovMap) {
//
//        this.vin = (String)egovMap.get("vin");
//        this.vinFront = (String)egovMap.get("vinFront");
//        this.vinRear = (String)egovMap.get("vinRear");
//        this.carnbr = (String)egovMap.get("carnbr");
//        this.vhcleDetailModelId = (String)egovMap.get("vhcleDetailModelId");
//        this.vhctyCode = (String)egovMap.get("vhctyCode");
//        this.colorCode = (String)egovMap.get("colorCode");
//        this.drvdstnc = (String)egovMap.get("drvdstnc");
//
//        // 취득/상실
//        this.cstmrEsntlId = (String)egovMap.get("cstmrEsntlId");   // 고객 고유ID
//        this.vhcleEsntlId = (String)egovMap.get("vhcleEsntlId");   // 차량 고유ID
//        this.acqdt = (String)egovMap.get("acqdt");          // 취득일
//        this.acqspc = (String)egovMap.get("acqspc");         // 취득가격
//        this.acqstx = (String)egovMap.get("acqstx");         // 취득세
//        this.acqsTyCode = (String)egovMap.get("acqsTyCode");     // 취득 유형 코드
//
//        this.frftrdt = (String)egovMap.get("frftrdt");        // 상실일
//        this.frftrTyCode = (String)egovMap.get("frftrTyCode");    // 상실 유형 코드
//    }

}
