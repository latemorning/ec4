package egovframework.ec4.cmm.csms.service;

import java.util.List;

import egovframework.ec4.cmm.service.EC4DefaultVO;

/**
 * 상담원에 대한 Vo 클래스를 정의한다.
 * @author 최재중
 * @since 2018.04.26
 * @version 1.0
 * @see
 *
 * <pre>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2018.04.26  최재중          최초 생성
 *
 * </pre>
 */

public class CSmsMngVO extends EC4DefaultVO {

	private static final long serialVersionUID = 1L;

	List <CSmsMngVO> csmsMngList;

	private String cstmrCd;                        /* 콜고객코드 */
	private String cstmrNm;                        /* 콜고객명 */
	private String registDe;
	private String register;
	private String updtDe;
	private String updusr;
	
    private String msgKey;                         /*  */
    private String subject;                        /*  */
    private String phone;                          /*  */
    private String callback;                       /*  */
    private String status;                         /*  */
    private String reqDate;                        /*  */
    private String msg;                            /*  */
    private String fileCnt;                        /*  */
    private String fileCntReal;                    /*  */
    private String filePath1;                      /*  */
    private String filePath1Siz;                   /*  */
    private String filePath2;                      /*  */
    private String filePath2Siz;                   /*  */
    private String filePath3;                      /*  */
    private String filePath3Siz;                   /*  */
    private String filePath4;                      /*  */
    private String filePath4Siz;                   /*  */
    private String filePath5;                      /*  */
    private String filePath5Siz;                   /*  */
    private String expireTime;                     /*  */
    private String rsltDate;                       /*  */
    private String reportDate;                     /*  */
    private String readDate;                       /*  */
    private String terminatedDate;                 /*  */
    private String rslt;                           /*  */
    private String type;                           /*  */
    private String telcoinfo;                      /*  */
    private String routeId;                        /*  */
    private String id;                             /*  */
    private String post;                           /*  */
    private String etc1;                           /*  */
    private String etc2;                           /*  */
    private String etc3;                           /*  */
    private String etc4;                           /*  */
    private String multiSeq;                       /*  */

	
	private String seq;                            /*  */
	private String tranId;                         /*  */
	private String regTime;                        /*  */
	private String receiver;                       /*  */
	private String remark;                         /*  */
	private String ssiSeq;                         /* 순번 */
	private String custType;                       /* 고객유형 */
	private String custCode;                       /* 고객코드 */
	private String emoticon;                       /* 이모티콘 */
	private String regCd;                          /* 등록자 */
	private String modCd;                          /* 수정자 */
	private String modDt;                          /* 수정일자 */
	private String delYn;                          /* 삭제여부 */
	private String eType;                          /* 유형 */
	private String smsJobNo;                       /* SMS JOB번호 */
	private String dealerCd;                       /* 딜러코드 */
	private String saleManCd;                      /* 판매사원코드 */
	private String smsMessage;                     /* SMS 메세지 */
	private String retTelNo;                       /* 전화번호 */
	private String reqCnt;                         /* 요청수 */
	private String regCnt;                         /* 등록수 */
	private String compCnt;                        /* 법인수 */
	private String resvDt;                         /* 예약일자 */
	private String regiDt;                         /* 등록일자 */
	private String stat;                           /* 상태코드(00, 10 20 30, 90) */
	private String msgType;                        /* 메세지유형(SMS, MMS) */
	private String trnsType;                       /* 전송유형(A I,R) */
	private String pointSeq;                       /* CMS 포인트KEY */
	private String viewYn;                         /*   */
	
	
	private String mmsMsgKey;                      /* MMS 메시지 키 (MMS 실패 시 대체된 SMS 일 경우 정보가 기록됨) */
	private String appGb;                          /* 시스템 구분 예 ) CMS, DMS, 등등 */
	private String custSeq;                        /* 고객코드 */
	private String jobStatus;                      /* 발송전 사용 , T:임시작업 등등 */
	private String annyversary;                    /* 기념일10- 03 */
	private String custName;                       /* 고객명 */
	private String shetGubn;                       /* 작명구분 */
	private String shetY;                          /* 작명년도 */
	private String shetSeq;                        /* 작명번호 */
	private String shetPage;                       /* 작명상세번호 */
	private String vinNo;                          /* 차대번호 */
	private String vehiNo01;                       /* 차량번호 앞자리 */
	private String vehiNo02;                       /* 차량번호 뒷자리 */
	private String sendType;                       /* 전송유형 */
	private String annyversaryGb;                  /* 기념일구분 , B생일, M결혼기념일,C차량검사, I보험만기 */
	private String refundTime;                     /* 회송시간(YYYYMMDDHH24MISS) */
	private String refundPointSeq;                 /* 회송 POINT SEQ */
	private String msgSeq;                         /* 메세지seq */
	private String fileSeq;                        /* File Seq */
	private String filePath;                       /* 파일저장경로 */
	private String shetMaker;                      /* 작명메이커 */
	private String smsCustSeq;                     /* SMS고객번호 */
	private String userId;                         /* 사용자ID */
	private String sendHour;					   /* 발송시간 */
	private String sendMinute;					   /* 발송분 */
	private String SMS_080_ADD;
	private String SMS_ADD_ADD;
	private String rejectReceiveNo;
	private String reserveTime;
	private String msgComment;
	private String custNm;
	private String hpno;
	private String appGubn;
	private String orgSmsCnt;
	private String totalSmsCnt;
	private String sender;
	
	private String sendDate;
	private String fileId;
	private String smsMsg;
	private String lmsMsg;
	private String mmsMsg;
	private String smsGubn;
	private String msgTypeH;
	private String point;
	private String refKey;
	private String cmt;
	private String sendMode;
	private String mode;
	private String picH1; 
	private String picH2; 
	private String picH3;  
	private String arrNo;
	private String chk_box_080;
	private String chk_box_add;
	private String maxSsiSeq;
    



	public String getMaxSsiSeq() {
		return maxSsiSeq;
	}

	public void setMaxSsiSeq(String maxSsiSeq) {
		this.maxSsiSeq = maxSsiSeq;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getFileId() {
		return fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getSmsMsg() {
		return smsMsg;
	}

	public void setSmsMsg(String smsMsg) {
		this.smsMsg = smsMsg;
	}

	public String getLmsMsg() {
		return lmsMsg;
	}

	public void setLmsMsg(String lmsMsg) {
		this.lmsMsg = lmsMsg;
	}

	public String getMmsMsg() {
		return mmsMsg;
	}

	public void setMmsMsg(String mmsMsg) {
		this.mmsMsg = mmsMsg;
	}

	public String getSmsGubn() {
		return smsGubn;
	}

	public void setSmsGubn(String smsGubn) {
		this.smsGubn = smsGubn;
	}

	public String getMsgTypeH() {
		return msgTypeH;
	}

	public void setMsgTypeH(String msgTypeH) {
		this.msgTypeH = msgTypeH;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getRefKey() {
		return refKey;
	}

	public void setRefKey(String refKey) {
		this.refKey = refKey;
	}

	public String getCmt() {
		return cmt;
	}

	public void setCmt(String cmt) {
		this.cmt = cmt;
	}

	public String getSendMode() {
		return sendMode;
	}

	public void setSendMode(String sendMode) {
		this.sendMode = sendMode;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public String getPicH1() {
		return picH1;
	}

	public void setPicH1(String picH1) {
		this.picH1 = picH1;
	}

	public String getPicH2() {
		return picH2;
	}

	public void setPicH2(String picH2) {
		this.picH2 = picH2;
	}

	public String getPicH3() {
		return picH3;
	}

	public void setPicH3(String picH3) {
		this.picH3 = picH3;
	}

	public String getArrNo() {
		return arrNo;
	}

	public void setArrNo(String arrNo) {
		this.arrNo = arrNo;
	}

	public String getChk_box_080() {
		return chk_box_080;
	}

	public void setChk_box_080(String chk_box_080) {
		this.chk_box_080 = chk_box_080;
	}

	public String getChk_box_add() {
		return chk_box_add;
	}

	public void setChk_box_add(String chk_box_add) {
		this.chk_box_add = chk_box_add;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getAppGubn() {
		return appGubn;
	}

	public void setAppGubn(String appGubn) {
		this.appGubn = appGubn;
	}

	public String getOrgSmsCnt() {
		return orgSmsCnt;
	}

	public void setOrgSmsCnt(String orgSmsCnt) {
		this.orgSmsCnt = orgSmsCnt;
	}

	public String getTotalSmsCnt() {
		return totalSmsCnt;
	}

	public void setTotalSmsCnt(String totalSmsCnt) {
		this.totalSmsCnt = totalSmsCnt;
	}

	public String getCustNm() {
		return custNm;
	}

	public void setCustNm(String custNm) {
		this.custNm = custNm;
	}

	public String getHpno() {
		return hpno;
	}

	public void setHpno(String hpno) {
		this.hpno = hpno;
	}

	public String getMsgComment() {
		return msgComment;
	}

	public void setMsgComment(String msgComment) {
		this.msgComment = msgComment;
	}

	public String getReserveTime() {
		return reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public String getSMS_080_ADD() {
		return SMS_080_ADD;
	}

	public void setSMS_080_ADD(String sMS_080_ADD) {
		SMS_080_ADD = sMS_080_ADD;
	}

	public String getSMS_ADD_ADD() {
		return SMS_ADD_ADD;
	}

	public void setSMS_ADD_ADD(String sMS_ADD_ADD) {
		SMS_ADD_ADD = sMS_ADD_ADD;
	}

	public String getRejectReceiveNo() {
		return rejectReceiveNo;
	}

	public void setRejectReceiveNo(String rejectReceiveNo) {
		this.rejectReceiveNo = rejectReceiveNo;
	}

	public String getSendHour() {
		return sendHour;
	}

	public void setSendHour(String sendHour) {
		this.sendHour = sendHour;
	}

	public String getSendMinute() {
		return sendMinute;
	}

	public void setSendMinute(String sendMinute) {
		this.sendMinute = sendMinute;
	}

	public List<CSmsMngVO> getCsmsMngList() {
		return csmsMngList;
	}

	public void setCsmsMngList(List<CSmsMngVO> csmsMngList) {
		this.csmsMngList = csmsMngList;
	}

	public String getMsgKey() {
		return msgKey;
	}

	public void setMsgKey(String msgKey) {
		this.msgKey = msgKey;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCallback() {
		return callback;
	}

	public void setCallback(String callback) {
		this.callback = callback;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReqDate() {
		return reqDate;
	}

	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getFileCnt() {
		return fileCnt;
	}

	public void setFileCnt(String fileCnt) {
		this.fileCnt = fileCnt;
	}

	public String getFileCntReal() {
		return fileCntReal;
	}

	public void setFileCntReal(String fileCntReal) {
		this.fileCntReal = fileCntReal;
	}

	public String getFilePath1() {
		return filePath1;
	}

	public void setFilePath1(String filePath1) {
		this.filePath1 = filePath1;
	}

	public String getFilePath1Siz() {
		return filePath1Siz;
	}

	public void setFilePath1Siz(String filePath1Siz) {
		this.filePath1Siz = filePath1Siz;
	}

	public String getFilePath2() {
		return filePath2;
	}

	public void setFilePath2(String filePath2) {
		this.filePath2 = filePath2;
	}

	public String getFilePath2Siz() {
		return filePath2Siz;
	}

	public void setFilePath2Siz(String filePath2Siz) {
		this.filePath2Siz = filePath2Siz;
	}

	public String getFilePath3() {
		return filePath3;
	}

	public void setFilePath3(String filePath3) {
		this.filePath3 = filePath3;
	}

	public String getFilePath3Siz() {
		return filePath3Siz;
	}

	public void setFilePath3Siz(String filePath3Siz) {
		this.filePath3Siz = filePath3Siz;
	}

	public String getFilePath4() {
		return filePath4;
	}

	public void setFilePath4(String filePath4) {
		this.filePath4 = filePath4;
	}

	public String getFilePath4Siz() {
		return filePath4Siz;
	}

	public void setFilePath4Siz(String filePath4Siz) {
		this.filePath4Siz = filePath4Siz;
	}

	public String getFilePath5() {
		return filePath5;
	}

	public void setFilePath5(String filePath5) {
		this.filePath5 = filePath5;
	}

	public String getFilePath5Siz() {
		return filePath5Siz;
	}

	public void setFilePath5Siz(String filePath5Siz) {
		this.filePath5Siz = filePath5Siz;
	}

	public String getExpireTime() {
		return expireTime;
	}

	public void setExpireTime(String expireTime) {
		this.expireTime = expireTime;
	}

	public String getRsltDate() {
		return rsltDate;
	}

	public void setRsltDate(String rsltDate) {
		this.rsltDate = rsltDate;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}

	public String getTerminatedDate() {
		return terminatedDate;
	}

	public void setTerminatedDate(String terminatedDate) {
		this.terminatedDate = terminatedDate;
	}

	public String getRslt() {
		return rslt;
	}

	public void setRslt(String rslt) {
		this.rslt = rslt;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTelcoinfo() {
		return telcoinfo;
	}

	public void setTelcoinfo(String telcoinfo) {
		this.telcoinfo = telcoinfo;
	}

	public String getRouteId() {
		return routeId;
	}

	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getEtc1() {
		return etc1;
	}

	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}

	public String getEtc2() {
		return etc2;
	}

	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}

	public String getEtc3() {
		return etc3;
	}

	public void setEtc3(String etc3) {
		this.etc3 = etc3;
	}

	public String getEtc4() {
		return etc4;
	}

	public void setEtc4(String etc4) {
		this.etc4 = etc4;
	}

	public String getMultiSeq() {
		return multiSeq;
	}

	public void setMultiSeq(String multiSeq) {
		this.multiSeq = multiSeq;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getTranId() {
		return tranId;
	}

	public void setTranId(String tranId) {
		this.tranId = tranId;
	}

	public String getRegTime() {
		return regTime;
	}

	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSsiSeq() {
		return ssiSeq;
	}

	public void setSsiSeq(String ssiSeq) {
		this.ssiSeq = ssiSeq;
	}

	public String getCustType() {
		return custType;
	}

	public void setCustType(String custType) {
		this.custType = custType;
	}

	public String getCustCode() {
		return custCode;
	}

	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}

	public String getEmoticon() {
		return emoticon;
	}

	public void setEmoticon(String emoticon) {
		this.emoticon = emoticon;
	}

	public String getRegCd() {
		return regCd;
	}

	public void setRegCd(String regCd) {
		this.regCd = regCd;
	}

	public String getModCd() {
		return modCd;
	}

	public void setModCd(String modCd) {
		this.modCd = modCd;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String geteType() {
		return eType;
	}

	public void seteType(String eType) {
		this.eType = eType;
	}

	public String getSmsJobNo() {
		return smsJobNo;
	}

	public void setSmsJobNo(String smsJobNo) {
		this.smsJobNo = smsJobNo;
	}

	public String getDealerCd() {
		return dealerCd;
	}

	public void setDealerCd(String dealerCd) {
		this.dealerCd = dealerCd;
	}

	public String getSaleManCd() {
		return saleManCd;
	}

	public void setSaleManCd(String saleManCd) {
		this.saleManCd = saleManCd;
	}

	public String getSmsMessage() {
		return smsMessage;
	}

	public void setSmsMessage(String smsMessage) {
		this.smsMessage = smsMessage;
	}

	public String getRetTelNo() {
		return retTelNo;
	}

	public void setRetTelNo(String retTelNo) {
		this.retTelNo = retTelNo;
	}

	public String getReqCnt() {
		return reqCnt;
	}

	public void setReqCnt(String reqCnt) {
		this.reqCnt = reqCnt;
	}

	public String getRegCnt() {
		return regCnt;
	}

	public void setRegCnt(String regCnt) {
		this.regCnt = regCnt;
	}

	public String getCompCnt() {
		return compCnt;
	}

	public void setCompCnt(String compCnt) {
		this.compCnt = compCnt;
	}

	public String getResvDt() {
		return resvDt;
	}

	public void setResvDt(String resvDt) {
		this.resvDt = resvDt;
	}

	public String getRegiDt() {
		return regiDt;
	}

	public void setRegiDt(String regiDt) {
		this.regiDt = regiDt;
	}

	public String getStat() {
		return stat;
	}

	public void setStat(String stat) {
		this.stat = stat;
	}

	public String getMsgType() {
		return msgType;
	}

	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}

	public String getTrnsType() {
		return trnsType;
	}

	public void setTrnsType(String trnsType) {
		this.trnsType = trnsType;
	}

	public String getPointSeq() {
		return pointSeq;
	}

	public void setPointSeq(String pointSeq) {
		this.pointSeq = pointSeq;
	}

	public String getViewYn() {
		return viewYn;
	}

	public void setViewYn(String viewYn) {
		this.viewYn = viewYn;
	}

	public String getMmsMsgKey() {
		return mmsMsgKey;
	}

	public void setMmsMsgKey(String mmsMsgKey) {
		this.mmsMsgKey = mmsMsgKey;
	}

	public String getAppGb() {
		return appGb;
	}

	public void setAppGb(String appGb) {
		this.appGb = appGb;
	}

	public String getCustSeq() {
		return custSeq;
	}

	public void setCustSeq(String custSeq) {
		this.custSeq = custSeq;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getAnnyversary() {
		return annyversary;
	}

	public void setAnnyversary(String annyversary) {
		this.annyversary = annyversary;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getShetGubn() {
		return shetGubn;
	}

	public void setShetGubn(String shetGubn) {
		this.shetGubn = shetGubn;
	}

	public String getShetY() {
		return shetY;
	}

	public void setShetY(String shetY) {
		this.shetY = shetY;
	}

	public String getShetSeq() {
		return shetSeq;
	}

	public void setShetSeq(String shetSeq) {
		this.shetSeq = shetSeq;
	}

	public String getShetPage() {
		return shetPage;
	}

	public void setShetPage(String shetPage) {
		this.shetPage = shetPage;
	}

	public String getVinNo() {
		return vinNo;
	}

	public void setVinNo(String vinNo) {
		this.vinNo = vinNo;
	}

	public String getVehiNo01() {
		return vehiNo01;
	}

	public void setVehiNo01(String vehiNo01) {
		this.vehiNo01 = vehiNo01;
	}

	public String getVehiNo02() {
		return vehiNo02;
	}

	public void setVehiNo02(String vehiNo02) {
		this.vehiNo02 = vehiNo02;
	}

	public String getSendType() {
		return sendType;
	}

	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public String getAnnyversaryGb() {
		return annyversaryGb;
	}

	public void setAnnyversaryGb(String annyversaryGb) {
		this.annyversaryGb = annyversaryGb;
	}

	public String getRefundTime() {
		return refundTime;
	}

	public void setRefundTime(String refundTime) {
		this.refundTime = refundTime;
	}

	public String getRefundPointSeq() {
		return refundPointSeq;
	}

	public void setRefundPointSeq(String refundPointSeq) {
		this.refundPointSeq = refundPointSeq;
	}

	public String getMsgSeq() {
		return msgSeq;
	}

	public void setMsgSeq(String msgSeq) {
		this.msgSeq = msgSeq;
	}

	public String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getShetMaker() {
		return shetMaker;
	}

	public void setShetMaker(String shetMaker) {
		this.shetMaker = shetMaker;
	}

	public String getSmsCustSeq() {
		return smsCustSeq;
	}

	public void setSmsCustSeq(String smsCustSeq) {
		this.smsCustSeq = smsCustSeq;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRegistDe() {
		return registDe;
	}

	public void setRegistDe(String registDe) {
		this.registDe = registDe;
	}

	public String getRegister() {
		return register;
	}

	public void setRegister(String register) {
		this.register = register;
	}

	public String getUpdtDe() {
		return updtDe;
	}

	public void setUpdtDe(String updtDe) {
		this.updtDe = updtDe;
	}

	public String getUpdusr() {
		return updusr;
	}

	public void setUpdusr(String updusr) {
		this.updusr = updusr;
	}

	public String getCstmrCd() {
		return cstmrCd;
	}

	public void setCstmrCd(String cstmrCd) {
		this.cstmrCd = cstmrCd;
	}

	public String getCstmrNm() {
		return cstmrNm;
	}

	public void setCstmrNm(String cstmrNm) {
		this.cstmrNm = cstmrNm;
	}



	/**
	 * csmsMngList attribute 를 리턴한다.
	 * @return List<CSmsMngVO>
	 */
	public List<CSmsMngVO> getCSmsMngList() {
		return csmsMngList;
	}

	/**
	 * ec4SalesLeadRegMngList attribute 값을 설정한다.
	 * @param csmsMngList List<CSmsMngVO>
	 */
	public void setCSmsMngList(List<CSmsMngVO> csmsMngList) {
		this.csmsMngList = csmsMngList;
	}



}