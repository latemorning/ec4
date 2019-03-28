package egovframework.ec4.cmm.cmfile.web;


import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.SessionVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;
import egovframework.com.cmm.util.EgovUserDetailsHelper;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.com.utl.sim.service.EgovFtpTool;
import egovframework.ec4.cmm.cmfile.service.EC4FileMngService;
import egovframework.ec4.cmm.service.DataTableWrapperVO;
import egovframework.ec4.cmm.service.ResponseWrapperVO;
import egovframework.ec4.cmm.web.EC4ComIndexController;
import egovframework.ec4.call.inbd.service.CnsltInBoundMngVO;
import egovframework.ec4.call.inbd.service.EC4CnsltInBoundMngService;
import egovframework.ec4.call.inbd.web.EC4CnsltInBoundMngController;
import egovframework.ec4.cmm.cmfile.service.FileMngVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import egovframework.rte.psl.dataaccess.util.UnderscoreUtil;

/**
 * 파일전송에 관한 controller 클래스를 정의한다.
 * @author 최재중
 * @since 2019.01.23
 * @version 1.0
 * @see
 *
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2019.01.23  최재중          최초 생성
 *
 * </pre>
 */


@Controller
@SessionAttributes(types=SessionVO.class)
public class EC4FileMngController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EC4FileMngController.class);

	private static final int BUFF_SIZE = 0;
    private String serverIp;
    private int serverPort;
    private String user;
    private String password;

	

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;

    @Resource(name = "fileMngService")
    private EC4FileMngService fileMngService;

    @Resource(name = "cnsltInBoundMngService")
    private EC4CnsltInBoundMngService cnsltInBoundMngService;

    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    @Autowired
	private DefaultBeanValidator beanValidator;

    @Resource(name = "EgovCmmUseService")
    private EgovCmmUseService cmmUseService;

    

    public void FtpClient(String serverIp, int serverPort, String user, String password) {
        this.serverIp = serverIp;
        this.serverPort = serverPort;
        this.user = user;
        this.password = password;
    }
    public boolean upload(File fileObj, String 저장파일명) throws SocketException, IOException, Exception {
        FileInputStream fis = null;
        FTPClient ftpClient = new FTPClient();
        
        try {
            ftpClient.connect(serverIp, serverPort);  //ftp 연결
            ftpClient.setControlEncoding("utf-8");    //ftp 인코딩설정
            int reply = ftpClient.getReplyCode();     //응답코드받기
            
            if (!FTPReply.isPositiveCompletion(reply)) {  //응답이 false 라면 연결 해제 exception 발생
                ftpClient.disconnect();
                throw new Exception(serverIp+" FTP 서버 연결 실패");
            }
            
            ftpClient.setSoTimeout(1000 * 10);   //timeout 설정
            ftpClient.login(user, password);     //ftp 로그인
            ftpClient.changeWorkingDirectory("C:/ec4File/scms/");
            ftpClient.setFileType(FTP.BINARY_FILE_TYPE); //파일타입설정
            ftpClient.enterLocalActiveMode();  //active 모드 설정
            
            fis = new FileInputStream(fileObj);
            return ftpClient.storeFile(저장파일명, fis); //파일 업로드
        } finally {
            if (ftpClient.isConnected()) {
                ftpClient.disconnect();
            }
            if (fis != null) {
                fis.close();
            }
        }
    }







    /**
	 * SCMS/CCMS 파일전송용 파일WRITE
	 * @param FileMngVO fileMngVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping("/ec4/cmm/cmfile/EC4CmsFileWrite.do")
    public @ResponseBody String EC4CmsFileWrite(@ModelAttribute("fileMngVO") FileMngVO fileMngVO,
    											@ModelAttribute("popUpMngVO") CnsltInBoundMngVO cnsltInBoundMngVO, 
    											BindingResult bindingResult, 
    											@RequestParam Map commandMap, 
    											ModelMap model) throws Exception {

        ResponseWrapperVO wrapperVO = new ResponseWrapperVO();
        Boolean isAuthenticated = EgovUserDetailsHelper.isAuthenticated();
        LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();

	    String today = EgovDateUtil.getToday();
        String toYy = today.substring(0,4);
        String toMm = today.substring(4,6);
        String toDt = today.substring(6,8);
        
        String toTime = "";
		String pattern = "HH:mm:ss.SSS";
		SimpleDateFormat sdfCurrent = new SimpleDateFormat(pattern, Locale.KOREA);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		toTime = sdfCurrent.format(ts.getTime());

        String hmsTime = "";
		String patternHms = "HHmmss";
		SimpleDateFormat sdfCurrentHms = new SimpleDateFormat(patternHms, Locale.KOREA);
		hmsTime = sdfCurrentHms.format(ts.getTime());
		
		


        
        //System.out.println("isAuthenticated["+isAuthenticated+"]");
        if (isAuthenticated) {
        	//System.out.println("EgovDoubleSubmitHelper.checkAndSaveToken()["+EgovDoubleSubmitHelper.checkAndSaveToken()+"]");
            //if (EgovDoubleSubmitHelper.checkAndSaveToken()) {


                beanValidator.validate(fileMngVO, bindingResult);

                // 폼오류
                //System.out.println("bindingResult.hasErrors()["+bindingResult.hasErrors()+"]");
                if (bindingResult.hasErrors()) {
                	
                }
                

				/*
            	// 1. FTP 파일 수신
            	String ip = request.getParameter("ip");
            	int port = Integer.parseInt(request.getParameter("port"));
            	String id = request.getParameter("id");
            	String pw = request.getParameter("pw");
            	int mode = Integer.parseInt(request.getParameter("mode"));
            	String remote = request.getParameter("remote");
            	String local = request.getParameter("local");
             
            	boolean result = false;
            	if (ip != null && ip.length() > 0
            		&& port != 0
            		&& id != null && id.length() > 0
            		&& pw != null && pw.length() > 0
            		&& mode != 0
            		&& remote != null && remote.length() > 0
            		&& local != null && local.length() > 0) {
            		result = EgovFtpTool.getFile(ip, port, id, pw, mode, remote, local);
            	}
             
            	// 2. FTP 파일 송신
            	String ip = request.getParameter("ip");
            	int port = Integer.parseInt(request.getParameter("port"));
            	String id = request.getParameter("id");
            	String pw = request.getParameter("pw");
            	int mode = Integer.parseInt(request.getParameter("mode"));
            	String local = request.getParameter("local");
            	String remote = request.getParameter("remote");
             
            	boolean result = false;
            	if (ip != null && ip.length() > 0
            		&& port != 0
            		&& id != null && id.length() > 0
            		&& pw != null && pw.length() > 0
            		&& mode != 0
            		&& remote != null && remote.length() > 0
            		&& local != null && local.length() > 0) {
            		result = EgovFtpTool.sendFile(ip, port, id, pw, mode, local, remote);
            	}				
				*/
                //InputStream stream = null;
                OutputStream bos = null;
                BufferedOutputStream bs = null;
                BufferedWriter fw = null;
                
            	//MultipartFile file = null;
                String stordFilePath = "C:"+File.separator+"ec4File"+File.separator+"scms"; // /home/wizvccms/batch/data/scms.txt
                String newName = "EC4SCMS_"+today+"_"+hmsTime;
                try {
	                    //stream = file.getInputStream();
	                    File cFile = new File(stordFilePath);
	
	                    if (!cFile.isDirectory())
	                    	cFile.mkdir();
	                    
	                    bs = new BufferedOutputStream(new FileOutputStream(stordFilePath + File.separator + newName));

	                    
	                    
	            		String writeTxt = "";
	            		cnsltInBoundMngVO.setiDisplayStart("0");
	            		cnsltInBoundMngVO.setiDisplayLength("1000");
	            		List<EgovMap> cmsReqList = cnsltInBoundMngService.selectCallCnsltInBoundList(cnsltInBoundMngVO);
	            		
	            		//System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@  for문 시작");
	            		/*for(int i=0; i<cmsReqList.size();i++){
	            			EgovMap emap = cmsReqList.get(i);
	            			writeTxt = emap.get("cstmrNm").toString();
	            			writeTxt += "/"+emap.get("hpno").toString();
	            			bs.write(writeTxt.getBytes());
	            			System.out.println(new SimpleDateFormat(pattern, Locale.KOREA).format(new Timestamp(System.currentTimeMillis()).getTime()));
	            		}*/

	            		//System.out.println("#################  while문 시작");
	            		Iterator<EgovMap> resultIterator = cmsReqList.iterator();
			            while (resultIterator.hasNext()) {
			            	EgovMap oderKeyMap = (EgovMap) resultIterator.next();
			            	
			            	
			            	//접수일
			            	writeTxt = StringUtils.defaultString((String)oderKeyMap.get("cnsltDt")).replaceAll("-", "");//2019-01-07   ex)201901021259	201901021742	201901030944	201901031002	201901031012
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("cnsltTime")).substring(0, 8).replaceAll(":", ""); //20:35:40.544
			            	
			            	//차대번호
			            	writeTxt += "|"+StringUtils.defaultString((String)oderKeyMap.get("custVin")); //ex)KLYDC487DKC210595	 	KLY2B51EDKC211292	KLAZA69LDKB103189
			            	
			            	//차량번호1
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("custVhcleNo")))) //ex)05버	 	임26	67너
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("custVhcleNo")).substring(0, 3);
			            	
			            	//차량번호2
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("custVhcleNo")))) //ex)4752	 	0859	6172
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("custVhcleNo")).substring(4);

			            	//Km
			            	writeTxt += "|"+"0"; //ex)0	100	 	30	0
			            	
			            	//연락처
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("callerHpno")))) //ex)01072342340	01056019416	01097024181	01044282511	01027906094
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("callerHpno"));

			            	//소유자(이름)
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("cstmrNm")))) //ex)김지혜	김옥분	권오룡	전인진	곽철
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("cstmrNm"));
			            	
			            	//소유자(고유번호)
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("cstmrCd")))) //ex)4DAE1D688CE64F9B45D67CE2C200D93E	C0F15185BDC346DD076D7D40CF9DE01A	 	3B47686AC014E57434232CDC677E0125	5DFC381E508B3B4A12B623028E8A7978
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("cstmrCd"));
			            	
			            	//소유자 우편번호1
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("houseZip"))))
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("houseZip")).substring(0,3);
			            	
			            	//소유자 우편번호2
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("houseZip"))))
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("houseZip")).substring(4);
			            	
			            	//소유자 주소 시,도
			            	writeTxt += "|"+"";
			            	//소유자 주소 구
			            	writeTxt += "|"+"";
			            	//소유자 주소 동
			            	writeTxt += "|"+"";
			            	//소유자 주소 번지
			            	writeTxt += "|"+"";
			            	//소유자 연락처1
			            	writeTxt += "|"+"";
			            	
			            	//소유자 연락처2(휴대전화)
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("hpno")))) //ex)01058835966	010-5601-9416	010-9702-4181	010-4428-2511	010-2790-6094
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("hpno"));
			            	
			            	//소유자 연락처3(사무실)
			            	writeTxt += "|"+"";
			            	
			            	//소유자 이메일주소
			            	writeTxt += "|";
			            	if(  !"".equals(StringUtils.defaultString((String)oderKeyMap.get("emailAdres")))  ){
			            		writeTxt += StringUtils.defaultString((String)oderKeyMap.get("emailAdres"))+"@"+StringUtils.defaultString((String)oderKeyMap.get("emailDomain"));
			            	}else{
			            		writeTxt += "";
			            	}
			            	
			            	//고객 이름
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("callerNm"))))
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("callerNm"));
			            	
			            	//고객 고유번호
			            	writeTxt += "|"+"";
			            	//고객 우편번호1
			            	writeTxt += "|"+"";
			            	//고객 우편번호2
			            	writeTxt += "|"+"";
			            	//고객 주소 시,도
			            	writeTxt += "|"+"";
			            	//고객 주소 구
			            	writeTxt += "|"+"";
			            	//고객 주소 동
			            	writeTxt += "|"+"";
			            	//고객 주소 번지
			            	writeTxt += "|"+"";
			            	//고객연락처1
			            	writeTxt += "|"+"";
			            	
			            	//고객 연락처2(휴대전화)
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("callerHpno")))) //ex)010-7234-2340	010-5601-9416	010-9702-4181	010-4428-2511	010-2790-6094
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("callerHpno"));

			            	//고객 연락처3(사무실)
			            	writeTxt += "|"+"";
			            	//고객 이메일주소
			            	writeTxt += "|"+"";
			            	//상태 
			            	writeTxt += "|"+"10"; //ex)10	10	10	10	10

			            	//접수자 ID
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("cnsltUserId")))) //ex)v1801104	v1801104	v1400358	v1801104	v1400358
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("cnsltUserId"));
			            	
			            	//CNST_GB
			            	writeTxt += "|"+"2"; //ex)2	2	2	2	2
			            	//RCPT_GB
			            	writeTxt += "|"+"S"; //ex)S	S	S	S	S    G:이첩테이블에 저장
			            	//CNST_YN
			            	writeTxt += "|"+"";
			            	//RCPT_ROUTE
			            	writeTxt += "|"+"C01"; //ex)C01	C02	C01	C01	C01
			            	//HQ
			            	writeTxt += "|"+"GM02"; //ex)GM01	GM03	GM02	GM03	GM02
			            	//STATION
			            	writeTxt += "|"+"";
			            	//SHOP_CODE
			            	writeTxt += "|"+"FW02"; //ex)DW11	RB12	IC11	QB11	FW02
			            	//REMARK1
			            	writeTxt += "|"+"";
			            	//REQ_CODE     
			            	writeTxt += "|"+"";
			            	//DEF_CODE     
			            	writeTxt += "|"+"CIA09"; //ex)CEA01	CEA09	CEA09	CIA09	CIA09
			            	//VEH_COND_CODE
			            	writeTxt += "|"+"";
			            	//SUBJECT2     
			            	writeTxt += "|"+"판매조건 불만.  보상 요구 (국내영업2담당-북일산대리점)"; //ex) *긴급* 미출고 차량 12월 판매조건 적용 불만. 1월 판매조건 적용 요청(국내영업1담당/영등포대리점)	차량사양 다름 불만, 차량환불요구(국내영업3담당/제주선진대리점)	계약차량 전시차여부 확인요청  (국내영업2담당-청주율량대리점)	*동시이첩* 냉각수 누수로 신차교환 및 피해보상 요구 (국내영업 3담당-연산대리점)	판매조건 불만.  보상 요구 (국내영업2담당-북일산대리점)

			            	//CONTENTS2    
			            	writeTxt += "|";
			            	if(!"".equals(StringUtils.defaultString((String)oderKeyMap.get("cnsltDscr")))) //ex) 더뉴말리부 / 국내영업1담당 / 영등포대리점 / 계약자 오빠^^계약자 오빠분 인입. 2017년 12월 3일 계약했다고 하심. 신차 완성 예정일 12월 29일 이였으나 아직 출고전 차량이라고 하심. 12월 28일에서 31일 사이 담당 카매니저에게 1월 2일 판매조건 확인 후 할부등 진행하겠다고 하였으나 12월과 1월 판매조건은 동일할 것이라며 결제 요청하여 카매니저 편의를 위해 할부 진행했다고 하심. 금일 홈페이지에서 1월 판매조건 확인 후 12월 생산 차량에 대한 유류비 40만원 할인 요청하였으나 이미 12월에 결제 완료되어 12월 판매조건으로 적용되어 판매조건 변경 및 할인 어렵다는 안내받았다며 불만 말씀하심. 홈페이지에도 분명히 "상기 혜택은 2019년 1월 출고 기준이며, 별도의 공지사항 없이 변경될 수 있습니다."라고 기재되어 있다며 억울함 호소하심. 사과 말씀드리고 판매조건 적용 기준은 매출 확정일 기준이고, 매출 확정일 확인은 차량 구입을 담당한 대리점에서 확인 가능함을 안내해드림. 고객은 매출 확정일을 알 수 없으며 홈페이지에 공지된 내용만 확인된다며 장시간 1월 판매조건 적용 요청하심. 취소를 하고 싶어도 담당 카매니저에게 취소 어렵다는 안내받았다며 재차 1월 판매조건 적용 요청하심. 이에 고객 설득 어려워 접수 하오니 고객 상담 부탁드립니다.^^	더뉴스파크 / KLYDC487DKC210595 / 100km / 차주^^차량 계약당시 담당CM이 제대로된 설명을 해주지 않아 본인이 원하는 사양이 아닌 차량으로 출고가 되었다 항의하심. 사과 말씀드리니 이전에 통화했던 이력 확인되느냐 하시어 보통 구매를 위해 대리점 방문을 하면 카달라그 및 가격표를 보여주면서 차량 설명을 해주지 않느냐 하심. 카달로그 및 차량사양 설명도 없이 계약진행이 되었다 불만을 토로하시며 본인은 당연히 기본사양이라고 하더라도 파워윈도우 및 뒷좌석 헤드레스트, 운전석 중앙도어잠금장치가 있는 것으로 알고 구매를 했는데 LS 베이직 사양으로 출고가 되었다 항의하심. 구매당시 기아차량의 악센트와 가격이 50만원 밖에 차이가 안나니 상담을 해보고 구매결정을 하려했다 하심. 계약서 작성을 한후에 카다로그도 보여주지 않아 다른 대리점을 방문하여 카다로그 확인을 했다 하심. 카달로그 내용 확인 중 본인차량 사양이 이상한것 같아 뒷좌석 헤드레스트 및 파워윈도우 파워핸들 유무를 문의를 했었다 하심. 파워윈도우는 없는 사양이라고만 안내를 받았는데 받아들이는 입장으로는 뒷좌석 헤드레스트 및 파워핸들은 있는 사양이라고 생각하지 않겠느냐 하심. 본인이 원하는 사양이 아니니 환불해달라고 요청을 했는데 고객님께서 차량 운전만 하는 용도로만 찾으셨지 않았느냐 응대를 했다 불만을 토로하심. 자동차가 원해 운전하는 용도이지 않느냐 하시며 벤츠나 bmw 차량도 운전하는 용도라고 항의를 하니 뒷좌석 헤드레스트 및 중앙도어 잠금장치는 외부에서 장착을 해주겠다고 안내를 받았다 하심. 본인이 뒷좌석 헤드레스트에 민감하다 하시며 지인이 사고를 당했는데 뒷좌석 헤드레스트가 없어 30년이 넘게 전신마비로 고통을 받는 것을 바로 옆에서 경험을 하다보니 신경이 쓰일 수 밖에 없다 불만을 토로하심. 외부에서 장착을 할것이였으면 악센트 차량 구매를 했을 것이라 하시며 계약당시 190만원 할인이 가능하다고 했으나 차량이 없어 160만원 밖에 안된다고 안내를 받았을 때도 짜증이 났지만 담당CM의 나이가 본인 자녀보다 어려 넘어갔으나 본인이 원하는 차량 사양이 아니다보니 너무 화가 난다 강성항의하심. 차량 환불 해달라 거듭 요구하시어 관계부서로 전달하겠다 양해구함. 이에 접수하오니 상담 부탁드립니다.^^	더뉴스파크 / 국내영업2담당-청주율량대리점 / 계약자 본인^^본인이 계약한 차량이 전시차인지 아닌지 확인 요청하심. 고객센터에서는 조회되는 사항이 아님을 안내함. 대리점에서 거짓말을 하여 믿지 못하겠다 하심. 본인이 직접 싸인하지 않은 계약서를 문자로 받았는데 전시차에 동그라미가 쳐 있어서 전시차를 원치 않는다하니, 전시한지 얼마 되지 않았다며 새차나 마찬가지라고 안내 받았다 하심. 그래도 전시차를 원치 않는다고 하니 리스트를 뽑아서 보여줬다 하심. 이벤트 380이 무슨 뜻이냐 하셔서 고객센터에서는 확인되지 않음을 양해부탁드림. 이벤트가 800번대면 전시차라고 했다 하심. 다른 차를 배정해줬다가 다시 전시차를 배정해줘서 전시차는 원치 않는다는데 왜 자꾸 전시차를 배정해주냐고 항의하니 중앙동대리점에 배정된 차량을 다시 주겠다고 했다 하심. 해당 차량도 전시차인지 아닌지 본인이 어떻게 알겠냐며 대리점이나 카매니저의 안내를 더이상 믿지 못하겠다 하심. 본인이 본사측으로 직접 확인할 수 있도록 해달라 하셔서 불편드린 점 사과드리고 유관부서로 내용 전달하여 협조요청 구해보겠다 안내함. 이에 접수하니 조치 부탁드립니다. ^^^	뉴라보 / 1G1F76E05J4121269 / 30km / 국내영업 3팀 / 연산대리점 / 차주^^인수받은지 2~3일 정도밖에 되지 않았다고 하시며 운행중 부동액이 누수되어 차량뒤에서 연기가 심하게 피어올랐다 하심. 급히 견인입고해 부산서비스센터로 입고되어있다고 하시며 공장에서 출고되기전 마무리를 잘하지 않아 피해를 입은거라고 주장하심. 아직 임시번호판 상태라고 하시며 카매니저는 수리를 하고 지켜보자는데 차량교환과 피해보상을 받아야되겠다고 하심. 상담사와 얘기해도 해결되는게 없으니 담당자와 통화나눌수 있게 하라고 하심. 오늘 안에 연락 달라고 하셔서 기재해서 전달하겠으나 문서상 전달로 당일연락 어려울수 있음을 안내해드림. 시간 오래소요될수 있는점 양해부탁드리고 최대한 빠르게 전달하겠음을 양해부탁드림. 이에 접수하오니 조치부탁드립니다.^^	더뉴말리부 / KLAZA69LDKB103189 / 국내영업2담당 / 북일산대리점 / 차주^^12월에 구매했는데 신차를 출고하고 불과 한 달 만에 40만원을 더 할인해주는 것이 말이 되냐며 항의하심. 사과 말씀 드리며 고객님께서 기분이 나쁘신 것은 이해가 가지만 판매조건 이라는게 원래 매달 달라지는 것이라고 말씀드림. 판매조건을 정하는 담당자와의 통화를 요청하심. 사과 말씀 드리며 판매조건은 한명의 담당자가 정하는 것이 아닌 회사 정책을 논의 후에 결정되는 사항으로 매달 1일 변경되어 기 출고 차량에 추가 적용되지 않음을 안내함. 조건은 변동 가능성이 지속 있음을 장시간 설명 드려도 상담사의 안내를 수긍하지 않으시며 본사의 안내를 받아야겠다 하심. 보상을 요청하셔서 판매조건 변동으로 인한 보상은 없음을 양해 구했으나 본사와 통화할 것이라며 지속 항의하셔서 접수 절차 안내함. 이에 접수하니 조치 부탁 드립니다. ^^
			            	writeTxt += StringUtils.defaultString((String)oderKeyMap.get("cnsltDscr"));
			            	
			            	//OPINION2     
			            	writeTxt += "|"+"";
			            	//INJURY_CODE  
			            	writeTxt += "|"+"A01"; //ex)A01	A01	A01	A01	A01
			            	//contractNo
			            	writeTxt += "|"+"";
			            	//ACCEPT_CD
			            	writeTxt += "|"+"C1757926"; //ex)C1757178	C1757761	C1757867	C1757903	C1757926


			            	bs.write(writeTxt.getBytes());
			            	//System.out.println(new SimpleDateFormat(pattern, Locale.KOREA).format(new Timestamp(System.currentTimeMillis()).getTime()));
			            }
	            		
	            		/* list의 모든 컬럼명,컬럼값을 일일이 지정없이 넣는다. 
				        List rtnList = new ArrayList();
				        try {
				 
				            Iterator resultIterator = requestList.iterator();
				            int i = 0;
				            while (resultIterator.hasNext()) {
				                ListOrderedMap oderKeyMap = (ListOrderedMap) resultIterator.next();
				                
				//                String idRd = String.valueOf(oderKeyMap.get("id"));
				//                int id = Integer.parseInt(idRd);
				//                log.debug("###    ListUtil 1for문 ### id    ==    " + id);
				                
				                EgovMap colMap = new EgovMap();
				                int j = 0;
				                Set key = oderKeyMap.keySet();
				                for (Iterator iterator = key.iterator(); iterator.hasNext();) {
				                    String keyName = (String) iterator.next();
				                    Object valueName = (Object) oderKeyMap.get(keyName);
				                    log.debug("###    ListUtil 2for문 ###" + "Row["+i+"]의 colMap["+j+"]    ###" + keyName + " = " + valueName);
				                    
				                    colMap.put(keyName, valueName);
				                    j++;
				                }
				                rtnList.add((EgovMap) colMap);
				                i++;
				            }
	            		 * 
	            		 * */


	            		
	            			            		
	            		
	            		/*fw = new BufferedWriter(new FileWriter(stordFilePath + File.separator + newName, true));
	                    // 파일안에 문자열 쓰기
	                    fw.write("오늘 날씨는 아주 좋습니다.");
	                    fw.flush();*/
	            		
	            		
	            		/*bos = new FileOutputStream(stordFilePath + File.separator + newName);
	                    int bytesRead = 0;
	                    byte[] buffer = new byte[BUFF_SIZE];
		                    while ((bytesRead = stream.read(buffer, 0, BUFF_SIZE)) != -1) {
	                    	  bos.write(buffer, 0, bytesRead);
	                    }*/
			            

		                wrapperVO.setSuccess(true);
		                wrapperVO.setMessage(egovMessageSource.getMessage("success.common.insert"));			            
			            
			            
	        	 } catch (FileNotFoundException fnfe) {
	        	     fnfe.printStackTrace();
	                 wrapperVO.setSuccess(false);
	                 wrapperVO.setMessage(fnfe.toString());
	        	 } catch (IOException ioe) {
	        	     ioe.printStackTrace();
	                 wrapperVO.setSuccess(false);
	                 wrapperVO.setMessage(ioe.toString());
	        	 } catch (Exception e) {
	        	     e.printStackTrace();
	                 wrapperVO.setSuccess(false);
	                 wrapperVO.setMessage(e.toString());
	        	 } finally {
	        		 if (fw != null){
	        			 try{
		        			 fw.close();  
	        			 }catch(Exception e){
	        				//Logger.getLogger(EgovFileMngUtil.class).debug("e: " + e.getMessage());
	        			 }
	        		 }
	        		 if (bs != null){
	        			 try{
	        				 bs.close(); //반드시 닫는다
	        			 }catch(Exception e){
	        				//Logger.getLogger(EgovFileMngUtil.class).debug("e: " + e.getMessage());
	        			 }
	        			 
	        		 }
	        	     if (bos != null) {
	                	  try {
	                	      bos.close();
	                	  } catch (Exception ignore) {
	                	      //Logger.getLogger(EgovFileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
	                	  }
	        	     }
	        	     /*if (stream != null) {
	                	  try {
	                	      stream.close();
	                	  } catch (Exception ignore) {
	                	      //Logger.getLogger(EgovFileMngUtil.class).debug("IGNORED: " + ignore.getMessage());
	                	  }
	        	     }*/
	        	 }
                 
                


                    	
               

            } else {

                wrapperVO.setSuccess(false);
                wrapperVO.setMessage(egovMessageSource.getMessage("fail.common.authenticated"));
            }
            
            return wrapperVO.toJson();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
