<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="jwork" uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp"%>
<%
 /**
  * @Class Name : EC4CnsltInBoundMng.java
  * @Description : EC4CstmrFileAttachMobilePop POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2019.02.27    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2019.02.27
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
    <title>SMS고객파일첨부</title>
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
	
	history.replaceState({},null,location.pathname);

	var frm = document.frm;


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
				</td>
			</tr>
		</table>
	</td>
</tr>

	




</table>
<!---------------------------------------- 본문 내용 종료 ---------------------------------------->

</form>




            
        	</div>
      <!-- /.row -->





</body>
</html>
