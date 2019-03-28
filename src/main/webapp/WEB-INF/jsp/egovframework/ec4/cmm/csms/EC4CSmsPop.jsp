<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jwork" uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp"%>
<%
 /**
  * @Class Name : EC4CSmsMng.java
  * @Description : EC4CSmsMng POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2019.01.17    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2019.01.17
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SMS전송</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- bootstrap daterangepicker -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/skins/_all-skins.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">


    <!-- jfile -->    
    <link href="<c:url value="/resource/jfile/swfupload/css/custom.css" />" rel="stylesheet" type="text/css" />



    <!-- jQuery 3 -->
    <script src="/resource/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/resource/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- bootstrap datepicker -->
    <script src="/resource/adminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- bootstrap daterangepicker -->
    <script src="/resource/adminLTE/bower_components/moment/moment.js"></script>
    <script src="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- DataTables -->
    <script src="/resource/adminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/resource/adminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="/resource/adminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="/resource/adminLTE/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="/resource/adminLTE/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resource/adminLTE/dist/js/demo.js"></script>

    <!-- ################ 사용자 정의 ################################ -->
    <link rel="stylesheet" type="text/css" href="/css/egovframework/ec4/cmm/ec4common.css">

	<!-- ec4 common -->
	<script src="/js/egovframework/ec4/cmm/ec4common.js"></script>


    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">

    
    <!-- jfile -->    
    <script type="text/javascript" src="<c:url value="/resource/jfile/json.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/jwork/jwork.fileUpload.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/jwork/jwork.fileDownload.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/swfupload/swfupload/swfupload.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/swfupload/js/swfupload.queue.js" />"></script>
    


<script type="text/javaScript" language="javascript" defer="defer">
var listCstmrTable;
$(document).ready(function(){
    $(".sidebar-menu").tree();
	//searchInfo();
	
	//Date picker
    $(".datepicker").datepicker({
      autoclose: true,
      format: "yyyy-mm-dd"
    })
            
	//숫자만입력
    $("#frm input[name=receiver]").keyup(function(){
		chkStr(this,"no");
	});
	//숫자만입력
    $("#frm input[name=sender]").keyup(function(){
		chkStr(this,"no");
	});

	var frm = document.frm;

	frm.sms.checked = true;
	frm.msgTypeH.value = 'SMS';
	frm.msgComment.value = frm.smsMsg.value;
	
	$("#fileView").hide();
	


});







	function send1(){
		if(fileUploadObj1.startUpload()){
			return true;
		}else{
			return false;
		}
	}
    function uploadCompleted1(){
        fileUploadObj1.refresh();
        //alert(fileUploadObj1.getFileId());
        frm = document.frm;
        frm.fileId.value = fileUploadObj1.getFileId();
        doMmsSend();
    }	
    
    
    
    
    
    
    
    
    

	/*********   메세지 Length   **********/
	function fn_MessageLength(){
		var frm = document.frm;
		frm.byte1.value = chkByteLength(frm.msgComment.value);
	}
	
	/* 080문구 추가여부 */
	function fn_chk_080() {
	 	var frm = document.frm; 
		if ( frm.chk_box_080.checked== true ) {
			frm.SMS_080_ADD.value = "Y";
			alert("무료수신거부 문구 20byte는 보내시는 문자메시지 뒤에 자동추가 됩니다.");
		} else {
			alert("<정보통신망법 관련 문자 발송 시 주의 사항>\n\n광고성 정보 전송 시, 본 표기 의무사항을 지키지 않을 경우, \n해당 법적 책임은 정보 발송자에 있음을 숙지바랍니다.");
			frm.SMS_080_ADD.value = "N";
		}
		//fn_MessageLength();
	}	
	
	/* (광고)문구 추가여부 */
	function fn_chk_add() {
	 	var frm = document.frm; 
		if ( frm.chk_box_add.checked== true ) {
			frm.SMS_ADD_ADD.value = "Y";
			alert("(광고) 문구 7byte는 보내시는 문자메시지 앞에 자동추가 됩니다.");
		} else {
			alert("<정보통신망법 관련 문자 발송 시 주의 사항>\n\n광고성 정보 전송 시, 본 표기 의무사항을 지키지 않을 경우, \n해당 법적 책임은 정보 발송자에 있음을 숙지바랍니다.");
			frm.SMS_ADD_ADD.value = "N";
		}
		//fn_MessageLength();
	}

	// 글자수 체크 (byte 체크)
	function chkByteLength(contents) {
		var space=0,Latin=0;
		for(i=0;i<contents.length;i++)   {
			Latin = escape(contents.charAt(i)).length;
			if(Latin == 6) space++;
			space++;
		}
		return space;
	}

	function msgClear(){
		var frm = document.frm;
		frm.msgComment.value = "";
		fn_MessageLength();
	}

	/*********   MSG TYPE 선택  **********/
	function changeMsgType(msgType) {
		var frm = document.frm;
		//var pImgObj		= document.all.phoneImg;

		var topColor	= document.getElementById('topColor');
		var obj8_0 		= document.getElementById('img8_0');
		var obj8 		= document.getElementById('img8');
		var obj9 		= document.getElementById('img9');
		var obj10 		= document.getElementById('img10');
		var obj11 		= document.getElementById('img11');
		var obj12 		= document.getElementById('img12');
		//var obj18 		= document.getElementById('img18');
		//var obj20 		= document.getElementById('img20');
		//var obj23 		= document.getElementById('img23');

		if (msgType == 'SMS') {
			$("#fileView").hide();   
			frm.lms.checked = false;
			frm.mms.checked = false;
			frm.msgTypeH.value = 'SMS';
			topColor.bgColor= "#EFF5FC";

// 			document.all.img1.src 				= "/images/egovframework/ec4/call/sms/hp001.gif";
// 			document.all.img2.src 				= "/images/egovframework/ec4/call/sms/hp_left.gif";
// 			//document.all.img3.src 				= "/images/egovframework/ec4/call/sms/btn_custwrite.gif";
// 			document.all.img4.src 				= "/images/egovframework/ec4/call/sms/btn_rewright.gif";
// 			document.all.img5.src 				= "/images/egovframework/ec4/call/sms/hp_right.gif";
// 			document.all.img6.src				= "/images/egovframework/ec4/call/sms/hp_left01.gif";
// 			document.all.img7.src				= "/images/egovframework/ec4/call/sms/hp_right01.gif";
// 			//obj8.background						= "/images/egovframework/ec4/call/sms/bg_sender.gif";
// 			//$("#img8").("background","/images/egovframework/ec4/call/sms/bg_sender.gif")	;	
// 			$("#img8").css("background","url('/images/egovframework/ec4/call/sms/bg_sender.gif')")	;
// 			$("#img9").css("background","url('/images/egovframework/ec4/call/sms/bg_reser.gif')")	;
// 			$("#img10").css("background","url('/images/egovframework/ec4/call/sms/bg_resertime.gif')")	;
// 			$("#img11").css("background","url('/images/egovframework/ec4/call/sms/bg_nbsp.gif')")	;
// 			$("#img12").css("background","url('/images/egovframework/ec4/call/sms/hp_bottom.gif')")	;
			
// // 			obj9.background						= "/images/egovframework/ec4/call/sms/bg_reser.gif";
// // 			obj10.background					= "/images/egovframework/ec4/call/sms/bg_resertime.gif";
// // 			obj11.background					= "/images/egovframework/ec4/call/sms/bg_nbsp.gif";
// 			document.all.img22.src			= "/images/egovframework/ec4/call/sms/btn_savemassage.gif";
// // 			obj12.background					= "/images/egovframework/ec4/call/sms/hp_bottom.gif";
// 			document.all.img13.src			= "/images/egovframework/ec4/call/sms/btn_nowsend.gif";
// 			document.all.img14.src			= "/images/egovframework/ec4/call/sms/btn_resersend.gif";

			frm.msgComment.value = frm.smsMsg.value;
			fn_MessageLength();

		} else if (msgType == 'LMS') {
			$("#fileView").hide();   
			frm.sms.checked = false;
			frm.mms.checked = false;
			frm.msgTypeH.value = 'LMS';
			topColor.bgColor= "#DAE5EB";

// 			document.all.img1.src 				= "/images/egovframework/ec4/call/sms/hp001_pink.gif";
// 			document.all.img2.src 				= "/images/egovframework/ec4/call/sms/hp_left_pink.gif";
// 			//document.all.img3.src 				= "/images/egovframework/ec4/call/sms/btn_custwrite_pink.gif";
// 			document.all.img4.src 				= "/images/egovframework/ec4/call/sms/btn_rewright_pink.gif";
// 			document.all.img5.src 				= "/images/egovframework/ec4/call/sms/hp_right_pink.gif";
// 			document.all.img6.src				= "/images/egovframework/ec4/call/sms/hp_left01_pink.gif";
// 			document.all.img7.src				= "/images/egovframework/ec4/call/sms/hp_right01_pink.gif";
// 			$("#img8").css("background","url('/images/egovframework/ec4/call/sms/bg_sender_pink.gif')");	
// 			$("#img9").css("background","url('/images/egovframework/ec4/call/sms/bg_reser_pink.gif')")	;
// 			$("#img10").css("background","url('/images/egovframework/ec4/call/sms/bg_resertime_pink.gif')")	;
// 			$("#img11").css("background","url('/images/egovframework/ec4/call/sms/bg_nbsp_pink.gif')")	;
// 			$("#img12").css("background","url('/images/egovframework/ec4/call/sms/hp_bottom_pink.gif')")	;
// // 			obj10.background					= "/images/egovframework/ec4/call/sms/bg_resertime_pink.gif";
// // 			obj11.background					= "/images/egovframework/ec4/call/sms/bg_nbsp_pink.gif";
// 			document.all.img22.src			= "/images/egovframework/ec4/call/sms/btn_savemassage_pink.gif";
// // 			obj12.background					= "/images/egovframework/ec4/call/sms/hp_bottom_pink.gif";
// 			document.all.img13.src			= "/images/egovframework/ec4/call/sms/btn_nowsend_pink.gif";
// 			document.all.img14.src			= "/images/egovframework/ec4/call/sms/btn_resersend_pink.gif";
			frm.msgComment.value = frm.lmsMsg.value;
			fn_MessageLength();
		} else {
			$("#fileView").show();   
			frm.sms.checked = false;
			frm.lms.checked = false;
			frm.msgTypeH.value = 'MMS';
			topColor.bgColor= "#DAE5EB";

// 			document.all.img1.src 				= "/images/egovframework/ec4/call/sms/hp001_green.gif";
// 			document.all.img2.src 				= "/images/egovframework/ec4/call/sms/hp_left_green.gif";
// 			//document.all.img3.src 				= "/images/egovframework/ec4/call/sms/btn_custwrite_green.gif";
// 			document.all.img4.src 				= "/images/egovframework/ec4/call/sms/btn_rewright_green.gif";
// 			document.all.img5.src 				= "/images/egovframework/ec4/call/sms/hp_right_green.gif";
// 			document.all.img6.src				= "/images/egovframework/ec4/call/sms/hp_left01_green.gif";
// 			document.all.img7.src				= "/images/egovframework/ec4/call/sms/hp_right01_green.gif";
// 			$("#img8").css("background","url('/images/egovframework/ec4/call/sms/bg_sender_green.gif')");	
// 			$("#img9").css("background","url('/images/egovframework/ec4/call/sms/bg_reser_green.gif')")	;
// 			$("#img10").css("background","url('/images/egovframework/ec4/call/sms/bg_resertime_green.gif')")	;
// 			$("#img11").css("background","url('/images/egovframework/ec4/call/sms/bg_nbsp_green.gif')")	;
// 			$("#img12").css("background","url('/images/egovframework/ec4/call/sms/hp_bottom_green.gif')")	;
// // 			obj10.background					= "/images/egovframework/ec4/call/sms/bg_resertime_green.gif";
// // 			obj11.background					= "/images/egovframework/ec4/call/sms/bg_nbsp_green.gif";
// 			document.all.img22.src			= "/images/egovframework/ec4/call/sms/btn_savemassage_green.gif";
// // 			obj12.background					= "/images/egovframework/ec4/call/sms/hp_bottom_green.gif";
// 			document.all.img13.src			= "/images/egovframework/ec4/call/sms/btn_nowsend_green.gif";
// 			document.all.img14.src			= "/images/egovframework/ec4/call/sms/btn_resersend_green.gif";

			frm.msgComment.value = frm.mmsMsg.value;
			fn_MessageLength();
		}
	}

	function fn_del_file(fileGubn) {
		var fileData = document.getElementById(fileGubn);
	
		if (confirm("첨부 사진을 삭제 하시겠습니까?")) {
			jQuery(fileData).val('');
		}		
	}


	/************************************
	* 문자발송. I : 즉시 , R :예약 , A: 기념일
	*************************************/
	function doSmsSend(sendMode){
		var frm = document.frm;
		var msgType	= frm.msgTypeH.value;

		frm.msgType.value = frm.msgTypeH.value;

		var today		= new Date();
		var year		= today.getFullYear();
		var month		= today.getMonth()+ 1;
		var day			= today.getDate();
		var hour		= today.getHours();
		var minute		= today.getMinutes();
		var maxMsgLengthSMS = "" ;
		var maxMsgLengthMMS = "" ;
		
		if (frm.SMS_080_ADD.value == "Y" && frm.SMS_ADD_ADD.value == "Y") {
			maxMsgLengthSMS = 153;
			maxMsgLengthMMS = 1953;
		} else if (frm.SMS_080_ADD.value == "Y" && frm.SMS_ADD_ADD.value == "N") {
			maxMsgLengthSMS = 160;
			maxMsgLengthMMS = 1960;
		} else if (frm.SMS_080_ADD.value == "N" && frm.SMS_ADD_ADD.value == "Y") {
			maxMsgLengthSMS = 173;
			maxMsgLengthMMS = 1973;
		} else if (frm.SMS_080_ADD.value == "N" && frm.SMS_ADD_ADD.value == "N") {
			maxMsgLengthSMS = 180;
			maxMsgLengthMMS = 2000;
		}

		

		if (month < 10)		month		= "0"+ month;
		if (day < 10)		day			= "0"+ day;
		if (hour < 10)		hour		= "0"+ hour;
		if (minute < 10)	minute		= "0"+ minute;

		var fullToday = year+""+month+""+day+""+hour+""+minute+"00";

		fn_MessageLength(); // 자리수 체크

		if(!confirm("메세지를 전송하시겠습니까?")){
			return;
		}

		if (frm.msgComment.value == "") {
			alert("전송할 메시지를 입력 하십시오.");
			frm.msgComment.focus();
			return;
		/*
		} else if (!smsCheck( frm.msgComment )) {
			//alert("금지어가 있습니다 ");
			frm.msgComment.focus();
			return;
		*/
		} else if (frm.sender.value == "") {
			alert("발신 번호를 입력 하십시오.");
			frm.sender.focus();
			return;
		} else if (sendMode == "R" && isDate(frm.sendDate.value ) == false) {
			alert("예약일시가 유효 하지 않습니다.");
			frm.sendDate.focus();
			return;
		} else if (sendMode == "R" && frm.sendDate.value == "") {
			alert("예약일시를 입력 하십시오.");
			frm.sendDate.focus();
			return;
		} else if (sendMode == "R" && $("#frm select[name=sendHour] option:selected").val() == "") {
			alert("예약시간를 입력 하십시오.");
			frm.sendHour.focus();
			return;
		} else if (sendMode == "R" && $("#frm select[name=sendMinute] option:selected").val() == "") {
			alert("예약시간를 입력 하십시오.");
			frm.sendMinute.focus();
			return;
		} else if (sendMode == "R" && fullToday >= (frm.sendDate.value.replace(/-/gi,'')+$("#frm select[name=sendHour] option:selected").val()+$("#frm select[name=sendMinute] option:selected").val()+"00")) {
			alert("예약일시는 금일보다 이후 여야 합니다.");
			frm.sendDate.focus();
			return;
		} else if (sendMode == "R" && $("#frm select[name=sendHour] option:selected").val() == "20") {
			if ($("#frm select[name=sendMinute] option:selected").val() != "00") {
				alert("20시이후 예약전송은 금지되어 있습니다.");
				$("#frm select[name=sendMinute] option:selected").val() = "00";
				frm.sendMinute.focus();
				return;
			}
		}/* else if (frm.refuseYn.checked == false) {
			alert("수신거부 추가란에 체크해주시기 바랍니다.");
	    	return;
		}*/
		
		//SMS 전송
		if (msgType == "SMS") {
			if (frm.SMS_080_ADD.value == "Y" && frm.SMS_ADD_ADD.value == "Y" && frm.byte1.value > 63) {
				if ( confirm("메시지의 길이(내용:"+ frm.byte1.value + "byte + 수신거부문구 20byte + [광고] 문구 7byte)가 90byte가 넘어 2건으로 나눠서 전송됩니다. 계속하시겠습니까?") == false )	{
					return;
				}
			} else if (frm.SMS_080_ADD.value == "Y" && frm.SMS_ADD_ADD.value == "N" &&frm.byte1.value > 70) {
				if ( confirm("메시지의 길이(내용:"+ frm.byte1.value + "byte + 수신거부문구 20byte)가 90byte가 넘어 2건으로 나눠서 전송됩니다. 계속하시겠습니까?") == false )	{
					return;
				}
			} else if (frm.SMS_080_ADD.value == "N" && frm.SMS_ADD_ADD.value == "Y" &&frm.byte1.value > 83) {
				if ( confirm("메시지의 길이(내용:"+ frm.byte1.value + "byte + [광고] 문구 7byte)가 90byte가 넘어 2건으로 나눠서 전송됩니다. 계속하시겠습니까?") == false )	{
					return;
				}
			} else if (frm.SMS_080_ADD.value == "N" && frm.SMS_ADD_ADD.value == "N" &&frm.byte1.value > 90) {
				if ( confirm("메시지의 길이(내용:"+ frm.byte1.value + "byte )가 90byte가 넘어 2건으로 나눠서 전송됩니다. 계속하시겠습니까?") == false )	{
					return;
				}
			}

			if(frm.byte1.value > maxMsgLengthSMS ){
				alert("SMS 전송할 메시지의 길이는 "+maxMsgLengthSMS+"Byte 입니다.");
				frm.msgComment.focus();
				return;
			}
			



		} else {  // LMS, MMS 전송
			if (frm.byte1.value > maxMsgLengthMMS) {
				alert("LMS, MMS 전송할 메시지의 길이는 "+maxMsgLengthMMS+"Byte 입니다.");
				frm.msgComment.focus();
				return;
			}
			
			if (msgType == "MMS") {
				frm.cmt.value 		= "MMS (1)건 전송";
				frm.point.value = 120;
			} else {
				frm.cmt.value 		= "LMS (1)건 전송";			
				frm.point.value = 36;				
			}
			

			//MMS 파일전송
			if (msgType == "MMS") {
				
				/* if (frm.PIC1.value=="" &&frm.PIC2.value=="" && frm.PIC3.value =="") {
					alert("MMS로 전송할 JPG 파일을 선택해주세요.");
					return;
				} else {
					if (frm.PIC1.value!="") {
						var file_check = "";
						var file_loc = "";
						
						file_check = getNameFromPath(eval("frm.PIC1.value"));
						file_loc = file_check.lastIndexOf(".");
						file_check = file_check.substring(file_loc+1);
						
						if (file_check != "jpg" && file_check != "JPG" && file_check != "jpeg" && file_check != "JPEG" ) {
							alert("첨부파일 확장자를 확인해주세요.\n(jpg,jpeg) 파일만 등록 가능합니다. ");
							frm.PIC1.focus();
							return;
						}
					}
					if (frm.PIC2.value!="") {
						var file_check = "";
						var file_loc = "";
						
						file_check = getNameFromPath(eval("frm.PIC2.value"));
						file_loc = file_check.lastIndexOf(".");
						file_check = file_check.substring(file_loc+1);
						
						if (file_check != "jpg" && file_check != "JPG" && file_check != "jpeg" && file_check != "JPEG" ) {
							alert("첨부파일 확장자를 확인해주세요.\n(jpg,jpeg) 파일만 등록 가능합니다. ");
							frm.PIC2.focus();
							return;
						}
					}
					if (frm.PIC3.value!="") {
						var file_check = "";
						var file_loc = "";
						
						file_check = getNameFromPath(eval("frm.PIC3.value"));
						file_loc = file_check.lastIndexOf(".");
						file_check = file_check.substring(file_loc+1);
						
						if (file_check != "jpg" && file_check != "JPG" && file_check != "jpeg" && file_check != "JPEG" ) {
							alert("첨부파일 확장자를 확인해주세요.\n(jpg,jpeg) 파일만 등록 가능합니다. ");
							frm.PIC3.focus();
							return;
						}
					}
					frm.picH1.value = frm.PIC1.value;
					frm.picH2.value = frm.PIC2.value;
					frm.picH3.value = frm.PIC3.value;
				} */
			}
		}

		//document.getElementById('LoadingLayer').style.display = "block";

		
		if(msgType == "SMS" || msgType == "LMS"){
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/cmm/csms/EC4RegiSendSms.do'/>",
                "data": $("#frm").serialize(),
                "success": function(result) {

                    if(result.isSuccess){
                        alert(result.message);
                        location.reload();
                    } else {
                        var errorMsg = "";
                        if(result.message){
                            for(var i = 0 ; i < result.message.length ; i++){
                                errorMsg = errorMsg + result.message[i]
                            }
                        }else{
                            for(var i = 0 ; i < result.errorMessages.length ; i++){
                                errorMsg = errorMsg + result.errorMessages[i] + "\n"
                            }
                        }
                        alert(errorMsg);
                    }
                    return;
                }
                ,error: function(xhr, status, error){
                	
                    alert("ERROR : " +
                                 "\n Status Code : " + xhr.status +
                                 "\n Status Text : " + xhr.statusText +
                                 "\n Error Message : \n " + xhr.responseJSON.errorMessage
                    );
                    return;
                }
            });
            
		}else if(msgType == "MMS"){
			send1();
		}
	}
	function doMmsSend(){
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/cmm/csms/EC4RegiSendSms.do'/>",
            "data": $("#frm").serialize(),
            "success": function(result) {

                if(result.isSuccess){
                    alert(result.message);
                    location.reload();
                } else {
                    var errorMsg = "";
                    if(result.message){
                        for(var i = 0 ; i < result.message.length ; i++){
                            errorMsg = errorMsg + result.message[i]
                        }
                    }else{
                        for(var i = 0 ; i < result.errorMessages.length ; i++){
                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                        }
                    }
                    alert(errorMsg);
                }
                return;
            }
            ,error: function(xhr, status, error){
            	
                alert("ERROR : " +
                             "\n Status Code : " + xhr.status +
                             "\n Status Text : " + xhr.statusText +
                             "\n Error Message : \n " + xhr.responseJSON.errorMessage
                );
                return;
            }
        });
	}

	
	

	
	function getNameFromPath(strFilepath) {

		var objRE = new RegExp(/([^\/\\]+)$/);

		var strName = objRE.exec(strFilepath);

		if (strName == null) {
		    return "";
		}

		else {
		     return strName[0];
		}
	}

	function doSaveSmsMsg() {
		var frm = document.frm;

		if (frm.msgComment.value == "") {
			alert("저장할 메시지를 입력 하십시오.");
			return;
		}

		if (chkByteLength(frm.msgComment.value) > 999) {
			alert("저장할 수 있는 메시지의 길이는 999Byte 입니다.");
			return;
		}


		
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/cmm/csms/EC4RegiSmsEmoticon.do'/>",
            "data": $("#frm").serialize(),
            "success": function(result) {

                if(result.isSuccess){
                    alert(result.message);
                    location.reload();
                } else {
                    var errorMsg = "";
                    if(result.message){
                        for(var i = 0 ; i < result.message.length ; i++){
                            errorMsg = errorMsg + result.message[i]
                        }
                    }else{
                        for(var i = 0 ; i < result.errorMessages.length ; i++){
                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                        }
                    }
                    alert(errorMsg);
                }
                return;
            }
            ,error: function(xhr, status, error){
            	
                alert("ERROR : " +
                             "\n Status Code : " + xhr.status +
                             "\n Status Text : " + xhr.statusText +
                             "\n Error Message : \n " + xhr.responseJSON.errorMessage
                );
                return;
            }
        });
	}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">


    
    
    



	    <!-- ############################# 메인화면 ######################  -->
        	<div class="modal-body">
            




<form style="margin:0px" id= "frm" name="frm" method="post" enctype="multipart/form-data" action="/syscom/comm/comm/uploadFile.json?fileGubn=file">
<input name="fileId" type="hidden" value="" />
<input name="smsMsg" type="hidden" value="${SmsMap.smsMsg}">
<input name="lmsMsg" type="hidden" value="${SmsMap.lmsMsg}">
<input name="mmsMsg" type="hidden" value="${SmsMap.mmsMsg}">
<input name="smsGubn" type="hidden" value="${SmsMap.smsGubn}">
<input name="msgType" type="hidden" id="msgType" type="hidden" >
<input name="msgTypeH" type="hidden" >
<input name="point" type="hidden">
<input name="refKey" type="hidden">
<input name="cmt" type="hidden">
<input name="sendType" type="hidden">
<input name="sendMode" type="hidden">
<input name="mode" type="hidden">
<input name="picH1" type="hidden"> 
<input name="picH2" type="hidden"> 
<input name="picH3" type="hidden">  
<input name='arrNo' type='hidden' value="3" >

<!---------------------------------------- 본문 내용 시작 ---------------------------------------->
<table style="width:100%;border-width:0;padding:0;">
	<tr>
		<td id="topColor" style="width:599;text-align:center;vertical-align:top;background-color:#eff5fc;" >
		<table width="99%" height="520" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="242" align="center" valign="top">
					<table  width="242" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td align="center">
								<!-- SMS, LMS 선택 -->								
								<input type="radio" value="SMS" id="sms" name="sms" cssClass="no_border" onclick="changeMsgType('SMS');" />
								<font size="3" color="blue" face="휴먼엑스포">SMS</font>&nbsp;&nbsp;
								<input type="radio" value="LMS" id="lms" name="lms" cssClass="no_border" onclick="changeMsgType('LMS');" />
								<font size="3" color="red" face="휴먼엑스포">LMS</font>	&nbsp;&nbsp;					
								<input type="radio" value="MMS" id="mms" name="mms" cssClass="no_border" onclick="changeMsgType('MMS');" />
								<font size="3" color="green" face="휴먼엑스포">MMS</font>
							</td>
						</tr>
						<tr>
							<td background="/images/egovframework/ec4/call/sms/hp001.gif" width="242" height="90"></td>
						</tr>
						<tr>
							<td height="194">
								<table width="240" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" height="194" background="/images/egovframework/ec4/call/sms/hp_left.gif"></td>
									<td id="hp_center" width="174px" valign="bottom" background="/images/egovframework/ec4/call/sms/hp_center.gif">
										<table width="170px" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="168" align="center">
												<!-- Message 내용 -->
												<textarea id="msgComment" name="msgComment" Style="width:145px;background:none; height:160px; margin-left:0px;padding:5px 5px 5px 5px;border:0px;font-family:돋움체,dotum;font-size:14px;ime-mode:active;" onfocus="fn_MessageLength();" onkeyup="fn_MessageLength();"  onselect="fn_MessageLength();" onclick="fn_MessageLength();" >
												</textarea>
											</td>
										</tr>
										</table>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<!-- <td height="26" align="left"><a href="#" onclick="fnTextFill('[*01*]')"><img name="img3"  src="/images/egovframework/ec4/call/sms/btn_custwrite.gif" height="26" border="0" /></a></td>
											<td height="26" align="left"><input type="checkbox" name="refuseYn" class="no_border" onClick="refuseAdd();"/> 수신거부추가</td>-->
											<td height="26" align="right"><a href="#" onclick="msgClear();"><img name="img4"  src="/images/egovframework/ec4/call/sms/btn_rewright.gif" width="70" height="26" border="0" /></a></td>
										</tr>
										</table>
									</td>
									<td width="34" height="194" background="/images/egovframework/ec4/call/sms/hp_right.gif"></td>
								</tr>
								</table>
							</td>
						</tr>
						<tr height="31">
							<td >
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="34" height="31" background="/images/egovframework/ec4/call/sms/hp_left01.gif" ></td>
									<td background="/images/egovframework/ec4/call/sms/hp_center01.gif" >
										Byte:&nbsp;<input name='byte1' id='byte1' style="width:26px;background:none;border:0px; font:11px 돋움,dotum; text-align:left; COLOR:RED;" readonly value="0" />
									</td>
									<td width="36" height="31"  background="/images/egovframework/ec4/call/sms/hp_right01.gif"></td>
								</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td id="img8_0" height="23" style="background-image: url('/images/egovframework/ec4/call/sms/bg_receiver.gif');">
								<input id="receiver" name="receiver" type="text" maxlength="13" size="6" value="${SmsMap.hpNo}" Style="ime-mode:disabled; width:100px;margin-left:90px;" class="no-border" />
							</td>
						</tr>
						<tr>
							<%-- <td id="img8" height="23" background="/images/egovframework/ec4/call/sms/bg_sender.gif"> --%>
							<td id="img8" height="23" style="background-image: url('/images/egovframework/ec4/call/sms/bg_sender.gif');">
								<input id="sender" name="sender" type="text" maxlength="13" size="6" value="${SmsMap.hpNo}" Style="ime-mode:disabled; width:100px;margin-left:90px;" class="no-border" />
							</td>
						</tr>
						<tr>
<%-- 							<td id="img9" height="25" background="/images/egovframework/ec4/call/sms/bg_reser.gif"> --%>
							<td id="img9" height="25" style="background-image: url('/images/egovframework/ec4/call/sms/bg_reser.gif');">
								<input type="text" id="sendDate" name="sendDate" class="datepicker" size="14" align="center" maxlength="10" Style="height:22px;width:100px;font-size:12px;font-family: 굴림;margin-left:90px;" onkeydown="false" />
							</td>
						</tr>
						<tr>
							<td id="img10" height="25" style="background-image: url('/images/egovframework/ec4/call/sms/bg_resertime.gif');">
								<%-- <input type="text" id="sendHour" name="sendHour" items="${listSendHour}" maxlength="2" size="3" multiple="false" Style="margin-left:90px;" onkeydown="onlyNumberInput2();"/>시
								<input type="text" id="sendMinute" name="sendMinute" items="${listSendMinute}" maxlength="2" size="3"  multiple="false" onkeydown="onlyNumberInput2();"/>분 --%>
                                <%-- <form:select path="sendHour" Style="width:50px;font-size:12px;font-family: 굴림;font-color:black;margin-left:90px;">
                                    <form:option value="">시간</form:option>
                                    <form:options items="${hourList}" itemValue="code" itemLabel="codeNm"/>
                                </form:select> --%>
                                <%-- <form:select path="sendMinute" Style="width:50px;font-size:12px;font-family: 굴림;text-color:black;">
                                    <form:option value="">분</form:option>
                                    <form:options items="${minuteList}" itemValue="code" itemLabel="codeNm"/>
                                </form:select> --%>
                                <select name="sendHour" id="sendHour" Style="width:50px;font-size:12px;font-family: 굴림;font-color:black;margin-left:90px;">
                                	<option value="">시간</option>
									<c:forEach var="hourCode" items="${hourList}">
										<option value="${hourCode.code}">${hourCode.codeNm}</option>
									</c:forEach>
                                </select>
                                <select name="sendMinute" id="sendMinute" Style="width:50px;font-size:12px;font-family: 굴림;text-color:black;">
                                	<option value="">분</option>
									<c:forEach var="minuteCode" items="${minuteList}">
										<option value="${minuteCode.code}">${minuteCode.codeNm}</option>
									</c:forEach>
                                </select>	
							</td>
						</tr>
						<tr>
							<td id="img11" align="center" style="background-image: url('/images/egovframework/ec4/call/sms/bg_nbsp.gif');" height="31">
								<a href="#" ONCLICK="doSaveSmsMsg()"><img name="img22" src="/images/egovframework/ec4/call/sms/btn_savemassage.gif" width="180" height="31" border="0"/></a>
							</td>
						</tr>
						<tr>
							<td id="img12" align="center" style="padding-bottom:40px; background-image: url('/images/egovframework/ec4/call/sms/hp_bottom.gif');" >
								<table width="180" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="91">
										<a href="#" onclick="doSmsSend('I')"><img name="img13" src="/images/egovframework/ec4/call/sms/btn_nowsend.gif" width="91" height="50" border="0" /></a>
									</td>
									<td width="89">
										<a href="#" onclick="doSmsSend('R')"><img name="img14" src="/images/egovframework/ec4/call/sms/btn_resersend.gif" width="89" height="50" border="0" /></a>
									</td>
								</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td align="center" height="10"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</td>
</tr>

	
	          
	        <tr>
	          	<input type="hidden" name="SMS_080_ADD" value="Y"/>
	          	<input type="hidden" name="SMS_ADD_ADD" value="Y"/>
	          	<td align="left"><input type="checkbox" class="no_border" name="chk_box_080" onclick="fn_chk_080();" checked="checked">
	          	무료수신거부 문구 추가
				<input type="checkbox" class="no_border" name="chk_box_add" onclick="fn_chk_add();" checked="checked">
	          	(광고) 문구 추가</td>
	        </tr>
			<tr id="fileView">  
				<td align="left">
                <fieldset> 
                    <jwork:fileuploader 
                        objectId="fileUploadObj1"  
                        uploadCompletedEvent="uploadCompleted1"
                        fileType="all"
                        maxFileSize="10000" 
                        maxFileCount="30" 
                        usePreview="false"
                        useSecurity="false"
                        uploadMode="db"
                    />
                    <!-- <div class="pull-right">
                        <button type="button" class="btn btn-sm btn-primary" onclick="send1()">전송</button>
                    </div> -->
                </fieldset>
		        	<!-- <table width="100%">
		        		
		        		<tr>
		        			<td>
		        				<input type="file" value="" name="PIC1"  style="width:180px;" class="files">	
		        			</td>
		        			<td>
		        				<span><input type="button" onclick="javascript:fn_del_file('PIC1');" value="삭제"></span>
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<input type="file" value="" name="PIC2" style="width:180px;" class="files">	
		        			</td>
		        			<td>
		        				<span><input type="button" onClick="fn_del_file('PIC2');" value="삭제"></span>        
		        			</td>
		        		</tr>
		        		<tr>
		        			<td>
		        				<input type="file" value="" name="PIC3" style="width:180px;" class="files">	
		        			</td>
		        			<td>
		        				<span><input type="button" onClick="fn_del_file('PIC3');" value="삭제"></span>      
		        			</td>
		        		</tr>
		        	</table>  -->
		      	</td> 
	          </tr>



</table>
<!---------------------------------------- 본문 내용 종료 ---------------------------------------->

</form>




            
        	</div>
      <!-- /.row -->





</body>
</html>
