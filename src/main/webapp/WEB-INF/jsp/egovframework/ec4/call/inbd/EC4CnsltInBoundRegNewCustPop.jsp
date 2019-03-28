<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%
 /**
  * @Class Name : EC4CnsltInBoundMngController.java
  * @Description : EC4CnsltInBoundRegPop POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.05.28    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.05.28
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
    <title>상담내용저장</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/select2/dist/css/select2.min.css">
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

    <!-- jQuery 3 -->
    <script src="/resource/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/resource/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="/resource/adminLTE/bower_components/select2/dist/js/select2.full.min.js"></script>
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

    <script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
    <validator:javascript formName="popUpMngVO" staticJavascript="false" xhtml="true" cdata="false"/>

    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">
    


<script type="text/javaScript" language="javascript" defer="defer">
var gtListCnsltTypeTable;
var gtListExistCstmrOwnerCarTable;
$(document).ready(function(){
	$(".sidebar-menu").tree();
	searchInfo();
	
	window.resizeTo(1200, 800);
	
	//고객관계는 기본적으로 본인 선택되도록 설정
	$("#popUpMngVO select[name=cstmrRel]").val("01").attr("selected", "selected");

	

	//숫자만입력
    $("#popUpMngVO input[name=callerHpno]").keyup(function(){
		chkStr(this,"no");
	});
    
	//기존고객찾기
	$(document).on("click","#existCustSearch",function() {
		fn_existCustPop();
    });
	//기존고객찾기
    /* $("#popUpMngVO input[name=callerHpno]").keyup(function(key){
        if(key.keyCode == 13){
        	fn_existCustPop();
    	}
	}); */
	

    // 인바운드상담내용 등록
    $("#btnCnsltInsert").click(function(){

        frm = document.popUpMngVO;

        /* if(!validatePopUpMngVO(frm)){
            return;
        } */

        /* $('#listCnsltTypeTable').DataTable().rows().iterator('row', function(context, index){
            var node = $(this.row(index).node()).data(); 
            console.log("00000000000000 ["+this.row(index).data().codeId+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv2+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv3+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv4+"]");
        }); */
        if(nvl($("#callerNm").val(),"") == ""){
        	alert("통화자명을 입력하세요.");
        	return;
        }
        if(nvl($("#callerHpno").val(),"") == ""){
        	alert("고객 핸드폰번호를 입력하세요.");
        	return;
        }
        
        $("#vocCnsltTitle").val($("#popUpMngVO input[name=cnsltTitle]").val());
        $("#vocRecptDscr").val($("#popUpMngVO textarea[name=recptDscr]").val());
        $("#vocRecpterOpinion").val($("#popUpMngVO textarea[name=recpterOpinion]").val());
        $("#cnsltBussplcKnd").val($("select[name=vocKnd] option:selected").val());
        $("#cnsltBussplcCd1").val($("select[name=bussplcCd1] option:selected").val());
        $("#cnsltBussplcCd2").val($("select[name=bussplcCd2] option:selected").val());
        $("#cnsltBussplcCd3").val($("select[name=bussplcCd3] option:selected").val());
        $("#cnsltBussplcCd4").val($("select[name=bussplcCd4] option:selected").val());
        
        
        
        var rowData = $('#listCnsltTypeTable').DataTable().rows().data(); 
        if(rowData.length < 1){
            //alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
            alert("상담유형을 선택하세요.");
            return;
        }
        
        
        //고객소유차량 선택
        var rowOwnerData = $("#listExistCstmrOwnerCarTable").DataTable().rows(".selected").data();
        if(rowOwnerData[0]){
        	if($("#popUpMngVO input[name=vhcleNo]").val() != rowOwnerData[0].vhcleNo){
        		$("#popUpMngVO input[name=custVin]").val("");
        		$("#popUpMngVO input[name=cstmrEsntlId]").val("");
        		$("#popUpMngVO input[name=cstmrVhcleSeq]").val("");
        	}
        }
		$("#popUpMngVO input[name=custVhcleNo]").val($("#popUpMngVO input[name=vhcleNo]").val());
        
        if( "" != nvl($("select[name=vhclMdl] option:selected").val(),"") ){
        	$("#cnsltDscr").val($("select[name=vhclMdl] option:selected").text() +"/"+$("#cnsltDscr").val() );
    	}
        
        
        
        var params = {};
		var formData = $("#popUpMngVO").serializeArray();
        

        if(rowData.length < 1){
            //alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
            alert("상담유형을 선택하세요.");
            return;
        }else{
            for(var i=0 ; i<rowData.length ; i++){
            	//param 만 넘길경우
                params['listCnsltTypeTable['+i+'].codeId'] = rowData[i].codeId;
                params['listCnsltTypeTable['+i+'].codeIdLv2'] = rowData[i].codeIdLv2;
                params['listCnsltTypeTable['+i+'].codeIdLv3'] = rowData[i].codeIdLv3;
                params['listCnsltTypeTable['+i+'].codeIdLv4'] = rowData[i].codeIdLv4;

                //form 과 param을 함께 넘길경우
                formData.push({name:"listCnsltTypeTable["+i+"].codeId", value:rowData[i].codeId});
                formData.push({name:"listCnsltTypeTable["+i+"].codeIdLv2", value:rowData[i].codeIdLv2});
                formData.push({name:"listCnsltTypeTable["+i+"].codeIdLv3", value:rowData[i].codeIdLv3});
                formData.push({name:"listCnsltTypeTable["+i+"].codeIdLv4", value:rowData[i].codeIdLv4});
            }
        }


        
		//console.log(formData);
		//console.log(params);


        // 저장
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/inbd/insertCnsltInBoundReg.do'/>",
            "data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            //"data": $("#popUpMngVO").serialize(),  //form 만 넘길경우
            "success": function(result) {

                if(result.isSuccess){

                    alert(result.message);
                    self.close();
                    //$("div.modal").modal('hide');
                } else {

                    var errorMsg = "";

                    if(null != result.errorMessages && "" != result.errorMessages){
                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                            alert(errorMsg);
                        }
                    }else{
                        errorMsg = result.errorMessages
                        alert("저장실패(오류메세지는 운영팀에 확인)");
                    }
                    
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
        
    });
	
	

	//고객관계 본인 선택 시 통화자,핸드폰을 고객정보로 변경한다
	//190114 본인이라고 선택으로변경했더니 핸드폰번호 변경할수가 없어서 주석처리한다.  Controller JAVA에서 본인 핸드폰번호 변경되도록 set 처리했다
	/* var txtCallerNm="${popUpMngVO.cstmrNm}";
	var txtCallerHpno="${popUpMngVO.hpno}";
    $("select[name=cstmrRel]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if("01" == $("select[name=cstmrRel] option:selected").val()){
			$("#popUpMngVO input[name=callerNm]").val($("#popUpMngVO input[name=cstmrNm]").val());
			$("#popUpMngVO input[name=callerHpno]").val($("#popUpMngVO input[name=hpno]").val());
		}else{
			$("#popUpMngVO input[name=callerNm]").val(txtCallerNm);
			$("#popUpMngVO input[name=callerHpno]").val(txtCallerHpno);
		}
    }); */
	

	//이메일도메인
    $("select[name=selectEmailDomain]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if(this.value == '' || this.value == null || this.value == 'undefined'){
			$("#emailDomain").prop("readOnly",false);
			$("#emailDomain").val("");
		}else{
			$("#emailDomain").prop("readOnly",true);
			$("#emailDomain").val($("select[name=selectEmailDomain] option:selected").val());
		}
    });
	

	//상담구분
    $("select[name=cnsltKnd]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if(this.value == '03'){
			$("#claimDiv").show();
		}else{
			$("#claimDiv").hide();
		}
    });
	
	
	
	$(document).on("change","#rcptKnd",function() {
		$.ajax({
			type: "POST",
			dataType:"json",
			async: false,
			url: "/nims/mileagemng/mileagemng/searchListBaseSalesMaster.json",
			data: $("#frm").serialize(),
			success:function(data) {
				if(data.ok){
					$.each(data, function(index){
	                    $('#rcptKnd').append('<option value='+data.cnsltCtId+'>' + data.cnsltCtNm + '</option>');
	                });    
				}else AXUtil.alert(data.message);
				
			},
			error:function(request, status) {
				alert("리스트 조회중 오류가 발생하였습니다.");
				return false;
			}
		});
	});
	

	//브랜드
    $("select[name=vmcd]").change(function(){
    	$("select[name=vhclMdl]").val(null).trigger('change');
    	$("select[name=vhclDetlMdl]").val(null).trigger('change');
    });
	//차종
    $("select[name=vhctCd]").change(function(){
    	$("select[name=vhclMdl]").val(null).trigger('change');
    	$("select[name=vhclDetlMdl]").val(null).trigger('change');
    });
	
	//고객차량 모델
    $(".selectCustVhclMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=vhctCd] option:selected").val(),/* 차종 */
   		            "cnsltSeCode": $("select[name=vmcd] option:selected").val(),/* 제조사 */
   		            "codeId": $("select[name=custVhclMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//차량 모델
    $(".selectVhclMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=vhctCd] option:selected").val(),/* 차종 */
   		            "cnsltSeCode": $("select[name=vmcd] option:selected").val(),/* 제조사 */
   		            "codeId": $("select[name=vhclMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    $(".selectVhclMdl").on("change", function (e) {
    	$("select[name=vhclDetlMdl]").val(null).trigger('change');
    });
	//차량 세부모델
    $(".selectDetlMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclDetlMdlComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=vhclMdl] option:selected").val(), /* 모델 */
   		            "cnsltSeCode": $("select[name=vmcd] option:selected").val(), /* 제조사 */
   		            "codeId": $("select[name=vhclDetlMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 세부모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	
	
	//CMS구분
    $("select[name=vocKnd]").change(function(){
    	$("select[name=recptKnd]").val(null).trigger('change');
    	$("select[name=cnsltCategory]").val(null).trigger('change');
    	$("select[name=recptRoot]").val(null).trigger('change');
    	$("select[name=cstmrProtectKnd]").val(null).trigger('change');
    	$("select[name=cstmrDemand]").val(null).trigger('change');
    	$("select[name=cmplSittnCd]").val(null).trigger('change');
    	$("select[name=accidentYnCd]").val(null).trigger('change');
    	$("select[name=processSttus]").val(null).trigger('change');

    	$("select[name=bussplcCd2]").val(null).trigger('change');
    	$("select[name=bussplcCd3]").val(null).trigger('change');
    	$("select[name=bussplcCd4]").val(null).trigger('change');
    });
    
    //접속구분
    $(".selectRcpt").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCRCPTKND",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=recptKnd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//상담카테고리
    $(".selectCategy").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCCTGY",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cnsltCategory] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//접속경로
    $(".selectRoot").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCROOT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=recptRoot] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//소보원
    $(".selectCstGurd").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCCPTT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cstmrProtectKnd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//고객요구
    $(".selectReq").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCDMND",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cstmrDemand] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//불만코드
	
	//불만상황
    $(".selectCmpl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCSITT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cmplSittnCd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//상해여부코드
    $(".selectAccu").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCADNT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=accidentYnCd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//처리상태
    $(".selectProcess").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCSTUS",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=processSttus] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//사업소1
    $(".selectBpc1").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   		            "upCodeId": "null",
   		            "codeId": $("select[name=bussplcCd1] option:selected").val(),
   		            "lvlCode": "1"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//사업소2
    $(".selectBpc2").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   		            "upCodeId": $("select[name=bussplcCd1] option:selected").val(),
   		            "codeId": $("select[name=bussplcCd2] option:selected").val(),
   		            "lvlCode": "2"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//사업소3
    $(".selectBpc3").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   		         	"upCodeId": $("select[name=bussplcCd2] option:selected").val(),
   		            "codeId": $("select[name=bussplcCd3] option:selected").val(),
   		            "lvlCode": "3"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    $(".selectBpc3").on("change", function (e) {
    	$("select[name=bussplcCd4]").val(null).trigger('change');
    });
	
	//사업소4
    $(".selectBpc4").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		    	
   		    	var upCodeId;
   		    	var codeId;
   		    	var code;
   		    	if("SCMS" == $("select[name=vocKnd] option:selected").val()){
   		    		upCodeId = $("select[name=bussplcCd3] option:selected").val();
   		    		codeId = $("select[name=bussplcCd4] option:selected").val();
   		    		
   		    	}else if("CCMS" == $("select[name=vocKnd] option:selected").val()){
   		    		upCodeId = $("select[name=bussplcCd2] option:selected").val();
   		    		codeId = $("select[name=bussplcCd3] option:selected").val();
   		    		code = $("select[name=bussplcCd4] option:selected").val();
   		    	}
   		        return {
   	   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   	   		            "upCodeId": upCodeId,
   	   		            "codeId": codeId,
   	   		         	"code": code,
   	   		            "lvlCode": "4"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	


	
	

	$(document).on("click","#cnsltTypePopTEST",function() {
		
		/* $.ajax({
		    url:"http://152.149.66.194:8180/CustomerIssue/CounselType.jsp",
		    dataType:'jsonp',    
		    data:{resultCode:'S', resultMsg:'OK'},  
		    jsonpCallback:"returnCall",  
		    success:function(s){
		      console.log('Success', s);
		    },
		    error:function(e) {
		      console.log('Error', e);
		    }

		}); 
		return;
		alert("sdfsdfsdfsdfsdsdf"); */
		
		
		var e = document.createElement('script');
        /* e.setAttribute('src', 'http://152.149.66.194:8180/CustomerIssue/CounselType.jsp');
        e.setAttribute('class', 'svg-crowbar');
        document.body.appendChild(e); */

        e.src = "http://152.149.66.194:8180/CustomerIssue/CounselType.jsp"; //외부참조가 가능하므로...
        //document.getElementsByTagName("body")[0].appendChild(e);
        document.body.appendChild(e);
        
        
        //var ele = document.getElementsByTagName("head")[0].appendChild(e);
        //document.createTextNode(ele.replace('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">', ""))
        
        
		
		window.open("http://152.149.66.194:8180/CustomerIssue/CounselType.jsp","cnsltTypePop","width=900,height=550,top=10,left=10,scrollbars=no,location=no");
		
        /* window.addEventListener('confirm', function (e) {
        	console.log('message', e.data);
        	console.log('origin', e.origin);
        	console.log('source', e.source);
        }); */

		
    });	
	
	
	
	
	
	$(document).on("click","#cnsltTypePop",function() {
        var popupParams = {};
        
        $("#searchCnsltTyCn").val($("#cnsltTyCn").val());
        $("#searchCnsltTyCnCode").val($("#cnsltTyCnCode").val());

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/inbd/cnsltInBoundTypePop.do'/>";

        popupParams.width = "1000";
        popupParams.height = "900";
        popupParams.title = "popupSelectCnsltType";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });	
	
	
	
	
	//불만코드 팝업
	$(document).on("click","#cmplCdPop",function() {
        var popupParams = {};

        var callbackClass = "callback";
        var selectStyle = "single";
        var url;
        
        //SCMS
        url = "<c:url value='/ec4/call/cmpl/cmplCdScmsPop.do'/>";
        //CCMS
        //url = "<c:url value='/ec4/call/cmpl/cmplCdCcmsPop.do'/>";
        

        popupParams.width = "800";
        popupParams.height = "700";
        popupParams.title = "popupSelectCmplCd";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });	

	$('#popupModal').on('hide.bs.modal', function (e) {
		  parent.location.reload();
	});
});










function rtnCnsltTypeList(items){
	var grid = $("#listCnsltTypeTable").DataTable();
	grid.destroy();
	$("#listCnsltTypeTable tbody").remove();
	//$("#listCnsltTypeTable > tbody tr").remove();
	//$("#listCnsltTypeTable > tbody tr").empty();
	
	$('#listCnsltTypeTable').DataTable().clear().destroy();
	gtListCnsltTypeTable = $("#listCnsltTypeTable").dataTable({
        "rowId": "code",
        "destroy": true,
        "data": items,
        "select": {
            "style": "single"
        },
        "deferRender": true,
        "width" : "100%",
        "scroller": true,
        "scrollX" : true,
        "scrollY" : "250px",
        "scrollHeadInnerX" : "100%",
        "scrollCollapse" : false,
        "info" : false,
        "searching" : false,
        "columnDefs": [ 
			        	//{
			        	//    "targets"String: 0,
			        	//    "data"String: "download_link"String,
			        	//    "render"String: function ( data, type, row, meta ) {
			        	//      return '<a href="'String+data+'">Download</a>'String;
			        	//    }
			        	//}
			        	//{
			        	//    "targets"String: 4,
			        	//    "data"String: "description"String,
			        	//    "render"String: function ( data, type, row, meta ) {
			        	//      return type === 'display'String && data.length > 40 ?
			        	//        '<span title="'String+data+'">'String+data.substr( 0, 38 )+'...</span>'String :
			        	//        data;
			        	//    }
			        	//}
		                {"visible": false, "targets": [0,1,2,3] , "width" : "1%"},
		                {"orderable": true, "targets": [4], "width" : "25%"},
		                {"orderable": true, "targets": [5], "width" : "25%"},
		                {"orderable": true, "targets": [6], "width" : "25%"},
		                {"orderable": true, "targets": [7], "width" : "25%"}
       	         	  ],    
	    "order": [ 5, 'asc' ],
	    "columns": [
	    				{"width" : "1%", "align" : "right"},
	    				{"width" : "1%", "align" : "right"},
	    				{"width" : "1%", "align" : "right"},
	    				{"width" : "1%", "align" : "right"},
	    				{"width" : "25%", "align" : "right"},
	    				{"width" : "25%", "align" : "right"},
	    				{"width" : "25%", "align" : "right"},
	    				{"width" : "25%", "align" : "right"}
	    			],
	    "language" : { "emptyTable": "데이터가 존재하지 않습니다." },
        "initComplete": function(settings, json) {
	     }
	});	
}
	function rtnCnsltTypeListData(items){
		//console.log(items);
		//$("#listCnsltTypeTable").DataTable().clear().draw();
		//$("#listCnsltTypeTable").empty();
		//$("#listCnsltTypeTable").DataTable().reset();
		//$("#table > tbody:last").append("<tr><td colspan=4>가입자가 없습니다.</td></tr>");

		$('#listCnsltTypeTable').DataTable().clear().destroy();
		
		
		gtListCnsltTypeTable = $("#listCnsltTypeTable").dataTable({
            "language": lang_kor,
            "destroy": true,
	        "data": items,
	        "deferRender": true,
            "select": {
                "style": "single"
            },
            "rowId": "code",
            //"scrollY": "369px",
            "scrollY": "250px",
            "pageLength": 10,
            "pagingType": "full_numbers",
            "bPaginate": true,
            "bLengthChange": true,
            "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
            //"responsive": true,
            "processing": true,
            "ordering": true,
            "searching": false,
            //"bServerSide": true,
            //"ajaxSource" : items,
            "columnDefs": [
                {"visible": false, "targets": [0,1,2,3]},
                {"orderable": false, "targets": [4]},
                {"orderable": false, "targets": [5]},
                {"orderable": false, "targets": [6]},
                {"orderable": false, "targets": [7]}
            ],
            "columns": [
				{"data":"codeId" , "defaultContent" : ""},
				{"data":"codeIdLv2" , "defaultContent" : ""},
				{"data":"codeIdLv3" , "defaultContent" : ""},
				{"data":"codeIdLv4" , "defaultContent" : ""},
				{"data":"codeNm" , "defaultContent" : ""},
				{"data":"codeNmLv2" , "defaultContent" : ""},
				{"data":"codeNmLv3" , "defaultContent" : ""},
				{"data":"codeNmLv4" , "defaultContent" : ""}
            ],
	        "initComplete": function(settings, json) {
	        	//console.log("1>>>>>>>>>>>>>"+settings);
	        	//console.log("2>>>>>>>>>>>>>"+json);
		     }
		});	
	}

	function searchInfo(){

        // 테이블
        gtListCnsltTypeTable = $('#listCnsltTypeTable').DataTable({
            "language": lang_kor,
            "select": {
                "style": "${cnsltTypeVO.selectStyle}"
            },
            "rowId": "code",
            //"scrollY": "369px",
            "scrollY": "250px",
            "pageLength": 10,
            "pagingType": "full_numbers",
            "bPaginate": true,
            "bLengthChange": true,
            "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
            "responsive": true,
            "processing": true,
            "ordering": true,
            "searching": false,
            "bServerSide": true,
            "sAjaxSource": "/ec4/call/inbd/selectInCallCnsltTypeList.do", //"/ec4/cmm/cinfo/cstmrIntgrMngList.do",
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "searchParntsCodeId", "value": "0"},
                        {"name": "searchCnsltSeCode", "value": "CNSE020"}
                );
            },
            "sServerMethod": "POST",
            "columnDefs": [
                {"visible": false, "targets": [0,1,2,3]},
                {"orderable": true, "targets": [4]},
                {"orderable": true, "targets": [5]},
                {"orderable": true, "targets": [6]},
                {"orderable": true, "targets": [7]}
            ],
            "columns": [
                {"data":"codeId" , "defaultContent" : ""},
                {"data":"codeIdLv2" , "defaultContent" : ""},
                {"data":"codeIdLv3" , "defaultContent" : ""},
                {"data":"codeIdLv4" , "defaultContent" : ""},
                {"data":"codeNm" , "defaultContent" : ""},
                {"data":"codeNmLv2" , "defaultContent" : ""},
                {"data":"codeNmLv3" , "defaultContent" : ""},
                {"data":"codeNmLv4" , "defaultContent" : ""}
            ],
	        "initComplete": function(settings, json) {
	        	//console.log(settings);
	        	//console.log(json);
		     }
        });
	}
	
	
	
	//기존고객찾기
	function fn_existCustPop(){

	    var params = {};
	    
	    params.popupNm = "popUpMngVO";
	    params.callerNm = $("#popUpMngVO input[name=callerNm]").val();
	    params.hpno = $("#popUpMngVO input[name=callerHpno]").val();
	    
        $("#existPopupModal div.modal-content").load("<c:url value='/ec4/cmm/cinfo/existCstmrSearchPop.do'/>", params, function(response, status, xhr) {

            if(status == "success"){

                $("#existPopupModal").modal({"backdrop": "static", "keyboard": false});
            }else if(status == "error"){

                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });



	    /* //$("#popupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
	    //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=callerHpno]").val());
	    //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
	    $("#popupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
	    $("#popupForm input[name=hpno]").val($("#callerHpno").val());
	    $("#popupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
	    
	    

	    var callbackClass = "callback";
	    var selectStyle = "single";
	    var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrPop.do'/>";

	    popupParams.width = "800";
	    popupParams.height = "700";
	    popupParams.title = "popupSelectSingle";
	    popupParams.form = document.popupForm;


	    popupParams.form.action = url;
	    popupParams.form.target = popupParams.title;
	    popupParams.form.selectStyle.value = selectStyle;
	    popupParams.form.callbackClass.value = callbackClass;

	    fn_open_popup(popupParams);	 */
	    
	    
	    /* return false;
		
		var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
	}



	function existCstmrSearch(rCstmrCd){
	    /* if(key.keyCode == 13 || $(this).hasClass("datepicker")){
	    	callCnsltHistTable.search(this.value).draw();
	    } */

	    //고객정보 load
	    /* var formData = $("#popUpMngVO").serializeArray();
	    //form 과 param을 함께 넘길경우
	    formData.push({name:"cstmrCd", value:$("input[name=searchCstmrCd]").val()});
	    //formData.push({name:"cnsltIncallNo", value:$("input[name=cnsltIncallNo]").val()});
	    formData.push({name:"cstmrNm", value:$("input[name=searchCstmrNm]").val()});
	    formData.push({name:"brthdy", value:$("input[name=searchBrthdy]").val()});
	    formData.push({name:"hpno", value:$("input[name=callerHpno]").val()});
	    formData.push({name:"emailAdres", value:$("input[name=searchEmailAdres]").val()}); */
	    
	    
	    rtnExistCstmrOwnerCarList(rCstmrCd);//고객소유차량리스트조회
	    
	    
		$.ajax({
			type: "POST",
			dataType:"json",
			async: false,
			url: "<c:url value='/ec4/call/inbd/loadCstmrLastInfo.do'/>",
			data:$("#popUpMngVO").serialize(),
			success:function(data) {
				if (data.ok) {

					//$("#popUpMngVO input[name=searchVin]").val(nvl(data.result.vin,"")); //차대번호
					//$("#popUpMngVO input[name=searchVhcleNo]").val(nvl(data.result.vehiNo01,"")+""+nvl(data.result.vehiNo02,"")); //차량번호
					if("" == nvl($("#popUpMngVO input[name=vin]").val(),"")){
						$("#popUpMngVO input[name=vin]").val(nvl(data.result.vin,"")); //차대번호
					}
					if("" == nvl($("#popUpMngVO input[name=vhcleNo]").val(),"")){
						//$("#popUpMngVO input[name=vhcleNo]").val(nvl(data.result.vehiNo01,"")+""+nvl(data.result.vehiNo02,"")); //차량번호
						$("#popUpMngVO input[name=vhcleNo]").val(nvl(data.result.custVhcleNo,"")); //차량번호
					}
					
					$("#popUpMngVO input[name=searchHomeZip]").val(nvl(data.result.houseZip,"")); //우편번호
					$("#popUpMngVO input[name=searchHomeAdres]").val(nvl(data.result.houseAdres,"")); //주소
					$("#popUpMngVO input[name=searchHomeAdresDetl]").val(nvl(data.result.houseAdresDetail,"")); //주소상세
					
					if( "" != nvl(data.result.callerNm,"") ){
						//$("#popUpMngVO input[name=callerNm]").val(nvl(data.result.callerNm,""));//전화오는 고객은 랜덤하기에 이전내역을 보여줄필요없다. 오히려 혼돈이 생긴다. (개명, 핸드폰변경)
					}
					if( "" != nvl(data.result.callerHpno,"") ){
						//$("#popUpMngVO input[name=callerHpno]").val(nvl(data.result.callerHpno,""));//전화오는 고객은 랜덤하기에 이전내역을 보여줄필요없다. 오히려 혼돈이 생긴다. (개명, 핸드폰변경)
					}
					if( "" != nvl(data.result.custVhclMdl,"") && "" == nvl($("#popUpMngVO select[name=custVhclMdl] option:selected").val(),"") ){
						$("#popUpMngVO select[name=custVhclMdl]").prepend("<option value='"+data.result.custVhclMdl+"' selected>"+data.result.custVhclMdlNm+"</option>");
					}
					if( "" != nvl(data.result.cstmrRel,"") ){
						$("#popUpMngVO select[name=cstmrRel]").prepend("<option value='"+data.result.cstmrRel+"' selected>"+data.result.cstmrRelNm+"</option>");
					}
					if( "" != nvl(data.result.callType,"") ){
						$("#popUpMngVO select[name=callType]").prepend("<option value='"+data.result.callType+"' selected>"+data.result.callTypeNm+"</option>");
					}
					if( "" != nvl(data.result.cnsltRslt,"") ){
						$("#popUpMngVO select[name=cnsltRslt]").prepend("<option value='"+data.result.cnsltRslt+"' selected>"+data.result.cnsltRsltNm+"</option>");
					}
					if( "" != nvl(data.result.cnsltKnd,"") ){
						$("#popUpMngVO select[name=cnsltKnd]").prepend("<option value='"+data.result.cnsltKnd+"' selected>"+data.result.cnsltKndNm+"</option>");
					}
					if( "" != nvl(data.result.cnsltCustKnd,"") ){
						$("#popUpMngVO select[name=cnsltCustKnd]").prepend("<option value='"+data.result.cnsltCustKnd+"' selected>"+data.result.cnsltCustKndNm+"</option>");
					}
					$("#popUpMngVO input[name=partNoReason]").val(nvl(data.result.partNoReason,""));
					
					
					
					

					
					
					

					//$('input[name="searchCustClass"]:radio[value="3"].prop('checked',true)'); //원하는 라디오박스값 체크
					//$('input[name="searchCustClass"]'.removeAttr('checked'));  //체크되어있는 모든 체크박스 해제
					//$('input[name="searchCustClass"]:checked').val(); //체크되어있는 라디오박스 값 추출
					//$('input[name="searchCustClass"]:checked').length; //체크되어있는 라디오박스 갯수 추출
				}
			},
			error:function(request, status) {
				alert("error["+request+"]");
			    return;
			}
		});
	}

	function rtnExistCstmrOwnerCarList(rCstmrCd){
		var grid = $("#listExistCstmrOwnerCarTable").DataTable();
		grid.destroy();
		$("#listExistCstmrOwnerCarTable tbody").remove();
		$('#listExistCstmrOwnerCarTable').DataTable().clear().destroy();
		gtListExistCstmrOwnerCarTable = $("#listExistCstmrOwnerCarTable").dataTable({
	        "language": lang_kor,
	        "select": {
	            "style": "single"
	        },
	        "order": [[ 8, "ASC" ]],
	        "rowId": "cstmrEsntlId",
	        "scrollY": "369px",
	        "pageLength": 10,
	        "pagingType": "full_numbers", //전체건수중 몇건 표시
	        "paginate": true, //페이지 표시
	        "lengthChange": false,// 10개씩보기, 50개씩보기, 100개씩보기
	        "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
	        "responsive": true,
	        "processing": true,
	        "ordering": true,
	        "searching": false,
	        "serverSide": true,
	        "sAjaxSource": "/ec4/cmm/cinfo/cstmrOwnerCarList.do",
	        "fnServerParams": function(aoData){
	            aoData.push(
	                    {"name": "searchCstmrCd",   "value": rCstmrCd},
	                    /* {"name": "searchCstmrNm",   "value": $("#searchCallCnsltForm input[name=searchCstmrNm]").val()},
	                    {"name": "searchHpno",         "value": $("#searchCallCnsltForm input[name=searchHpno]").val()},
	                    {"name": "searchEmailAdres","value": $("#searchCallCnsltForm input[name=searchEmailAdres]").val()} */
	                    {"name": "searchCstmrNm",   "value": $("#searchCstmrNm").val()},
	                    {"name": "searchHpno",         "value": $("#searchHpno").val()},
	                    {"name": "searchEmailAdres","value": $("#searchEmailAdres").val()}
	            );
	        },
	        "sServerMethod": "POST",
	        "columnDefs": [ 
				        	//{
				        	//    "targets"String: 0,
				        	//    "data"String: "download_link"String,
				        	//    "render"String: function ( data, type, row, meta ) {
				        	//      return '<a href="'String+data+'">Download</a>'String;
				        	//    }
				        	//}
				        	//{
				        	//    "targets"String: 4,
				        	//    "data"String: "description"String,
				        	//    "render"String: function ( data, type, row, meta ) {
				        	//      return type === 'display'String && data.length > 40 ?
				        	//        '<span title="'String+data+'">'String+data.substr( 0, 38 )+'...</span>'String :
				        	//        data;
				        	//    }
				        	//}
			                {"visible": false, "targets": [0,1,2,3] , "width" : "1%"},
			                {"orderable": true, "targets": [4], "width" : "10%"},
			                {"orderable": true, "targets": [5], "width" : "10%"},
			                {"orderable": true, "targets": [6], "width" : "10%"},
			                {"orderable": true, "targets": [7], "width" : "10%"},
			                {"orderable": true, "targets": [8], "width" : "10%"},
			                {"orderable": true, "targets": [9], "width" : "10%"},
			                {"orderable": true, "targets": [10], "width" : "10%"},
			                {"orderable": true, "targets": [11], "width" : "10%"}
	       	         	  ],    
		    //"order": [ 5, 'asc' ],
		    "columns": [
	            			{"data":"rn"},
				            {"data":"cstmrEsntlId" , "defaultContent" : ""},//ACQS번호
				            {"data":"cstmrVhcleSeq" , "defaultContent" : ""},//ACQS순번
				            {"data":"modelCd" , "defaultContent" : ""},//모델코드
				            {"data":"ifKndNm" , "defaultContent" : ""},//구분 정비/판매
				            {"data":"vhcleNo" , "defaultContent" : ""},//차량번호
				            {"data":"vin" , "defaultContent" : ""},//차대번호
				            {"data":"modelNm" , "defaultContent" : ""},//모델
				            {"data":"colorNm" , "defaultContent" : ""},//색상
				            {"data":"lastRcptDate" , "defaultContent" : ""},//최근방문일자
				            {"data":"lastCustNm" , "defaultContent" : ""},//최근정비소
				            {"data":"adviserNm" , "defaultContent" : ""}//담당어드바이저
		    			],
	        "initComplete": function(settings, json) {
		     }
		});	   
		
	    $('#listExistCstmrOwnerCarTable tbody').on('click', 'tr', function () {
	    	var idx = $(this).index();
	    	var rowData = $("#listExistCstmrOwnerCarTable").DataTable().rows(idx).data();
	    	//var rowData = $("#listExistCstmrOwnerCarTable").DataTable().rows(".selected").data();
	    	
	        if(rowData[0]){
				$("#popUpMngVO input[name=custVin]").val(rowData[0].vin);
				$("#popUpMngVO input[name=custVhcleNo]").val(rowData[0].vhcleNo);
				$("#popUpMngVO input[name=cstmrEsntlId]").val(rowData[0].cstmrEsntlId);
				$("#popUpMngVO input[name=cstmrVhcleSeq]").val(rowData[0].cstmrVhcleSeq);
				$("#popUpMngVO input[name=vhcleNo]").val(rowData[0].vhcleNo);
				if("" != nvl(rowData[0].modelNm,"")){
					$("#popUpMngVO select[name=custVhclMdl]").prepend("<option value='"+rowData[0].modelCd+"' selected>"+rowData[0].modelNm+"</option>");
				}else{
					$("#popUpMngVO select[name=custVhclMdl]").prepend("<option value='' selected>-- 모델 --</option>");
				}
	        }else{
	    		$("#popUpMngVO input[name=custVin]").val("");
	    		$("#popUpMngVO input[name=custVhcleNo]").val("");
	    		$("#popUpMngVO input[name=cstmrEsntlId]").val("");
	    		$("#popUpMngVO input[name=cstmrVhcleSeq]").val("");
	    		$("#popUpMngVO input[name=vhcleNo]").val("");
	    		$("#popUpMngVO select[name=custVhclMdl]").prepend("<option value='' selected>-- 모델 --</option>");
	        }
	    } );
	    
	    /* var rowDataExistCstmrOwner;
	    //$('#listExistCstmrOwnerCarTable').on("select", function (e, dt, type, indexes) {
	    //$('#listExistCstmrOwnerCarTable tbody').on("select", function (e, dt, type, indexes) {
	    gtListExistCstmrOwnerCarTable.on("select", function (e, dt, type, indexes) {
	    	console.log("xxxxxxxxxxxxxxxxxxxx");
	    	rowDataExistCstmrOwner = dt.rows(indexes).data();
	        var rowData = dt.rows(indexes).data();
			$("#popUpMngVO input[name=custVin]").val(rowData[0].vin);
			$("#popUpMngVO input[name=custVhcleNo]").val(rowData[0].vhcleNo);
			$("#popUpMngVO input[name=cstmrEsntlId]").val(rowData[0].cstmrEsntlId);
			$("#popUpMngVO input[name=cstmrVhcleSeq]").val(rowData[0].cstmrVhcleSeq);
			$("#popUpMngVO input[name=vhcleNo]").val(rowData[0].vhcleNo);
			$("#popUpMngVO select[name=custVhclMdl]").prepend("<option value='"+rowData[0].modelCd+"' selected>"+rowData[0].modelNm+"</option>");
	    }).on("deselect", function (e, dt, type, indexes) {
	    	console.log("ffffffffffffffffffffff");
			$("#popUpMngVO input[name=custVin]").val("");
			$("#popUpMngVO input[name=custVhcleNo]").val("");
			$("#popUpMngVO input[name=cstmrEsntlId]").val("");
			$("#popUpMngVO input[name=cstmrVhcleSeq]").val("");
			$("#popUpMngVO input[name=vhcleNo]").val("");
			$("#popUpMngVO select[name=custVhclMdl]").prepend("<option value='' selected>-- 모델 --</option>");
		}); */
	}
	
	
	
	
	
	

	
    /**
     * 주소 검색 화면 호출(Basic)
     */
    var JusoPop; 
    function fn_openUrlJusoSearchBasic() {
        JusoPop = window.open("/ec4/cmm/zip/rdnmadrSearchPopup.do", "pop_basic",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }
    function fn_setJuso(rtnData){
    	$("#searchHomeZip").val(rtnData.zipNo);
    	$("#searchHomeAdres").val(rtnData.roadAddrPart1);
    	$("#searchHomeAdresDetl").val(rtnData.roadAddrPart2);
    	JusoPop.close();
    }

</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">



<!-- Main content -->
    <section class="content">
    

    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border bg-info">
                    	<h3 class="box-title" id="inbdTitle">신규/변경고객 상담내용저장</h3>
                    </div>
                    <!-- /.box-header -->

                    <form:form commandName="popUpMngVO" name="popUpMngVO" method="post" cssClass="form-horizontal">
                    <double-submit:preventer/>
                    <div class="box-body">
                    <form class="form-horizontal" name="frm" id="frm">
                    <form:hidden path="vocCnsltTitle" value="${popUpMngVO.vocCnsltTitle}"/>
                    <form:hidden path="vocRecptDscr" value="${popUpMngVO.vocRecptDscr}"/>
                    <form:hidden path="vocRecpterOpinion" value="${popUpMngVO.vocRecpterOpinion}"/>
                    <form:hidden path="cnsltBussplcKnd" value="${popUpMngVO.cnsltBussplcKnd}"/>
                    <form:hidden path="cnsltBussplcCd1" value="${popUpMngVO.cnsltBussplcCd1}"/>
                    <form:hidden path="cnsltBussplcCd2" value="${popUpMngVO.cnsltBussplcCd2}"/>
                    <form:hidden path="cnsltBussplcCd3" value="${popUpMngVO.cnsltBussplcCd3}"/>
                    <form:hidden path="cnsltBussplcCd4" value="${popUpMngVO.cnsltBussplcCd4}"/>
                    <form:hidden path="cnsltUserId" value="${popUpMngVO.frstRegisterId}"/>
                    <form:hidden path="cstmrCd" value="${popUpMngVO.cstmrCd}"/>
                    <form:hidden path="cnsltIncallNo"/>
                    <form:hidden path="newCustMode"/>
                    <form:hidden path="vin"/>
                    <form:hidden path="custVin"/>
                    <form:hidden path="custVhcleNo"/>
                    <form:hidden path="cstmrEsntlId"/>
                    <form:hidden path="cstmrVhcleSeq"/>


                            <div class="form-group">
                                <label for="cstmrNm" class="col-sm-2 control-label">차량소유고객명</label>
                                <div class="col-sm-4">
	                                <input type="text" name="cstmrNm" class="form-control" id="cstmrNm" readonly/>
                                </div>
                                <label for="hpno" class="col-sm-2 control-label">고객핸드폰</label>
                                <div class="col-sm-4">
	                                <input type="text" name="hpno" class="form-control" id="hpno" readonly/>
                                </div>
						  	</div>
                    
                            <div class="form-group has-warning">
                                <label for="callerNm" class="col-sm-2 control-label">통화자명</label>
                                <div class="col-sm-4">
                                	<div class="input-group">
		                                <input type="text" name="callerNm" class="form-control" id="callerNm" value="${popUpMngVO.cstmrNm}"/>
	                                    <div class="input-group-btn">
	                                        <button type="button" id="existCustSearch" class="btn btn-info btn-flat">
	                                        <i class="fa fa-search">기존고객찾기</i></button>
	                                    </div>
                                	</div>
                                </div>
                                <label for="callerHpno" class="col-sm-2 control-label">핸드폰</label>
                                <div class="col-sm-4">
	                                <input type="text" name="callerHpno" class="form-control" id="callerHpno" value="${popUpMngVO.hpno}"/>
                                </div>
						  	</div>
						  	
                            <div class="form-group">
	                            <label for="custCarKnd" class="col-sm-2 control-label">고객차량</label>
                                <div class="col-sm-4 dstick" style="padding-bottom:0px">
                                   <div class="col-sm-12">
	                                    <div class="col-sm-12 dstick">
		                                    <form:select path="custVhclMdl" class="form-control input-sm selectCustVhclMdl">
		                                        <c:if test="${popUpMngVO.custVhclMdlNm != '' and popUpMngVO.custVhclMdlNm != null}">
		                                        	<option value="${popUpMngVO.custVhclMdl}">${popUpMngVO.custVhclMdlNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.custVhclMdlNm == '' or popUpMngVO.custVhclMdlNm == null}">
			                                        <form:option value="">-- 모델 --</form:option>
			                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="custVhclMdl" />
	                                    </div>
	                                    <%-- <div class="col-sm-6 dstick">
		                                    <form:select path="custVhclDetlMdl" class="form-control input-sm selectDetlMdl">
		                                        <c:if test="${popUpMngVO.custVhclDetlMdlNm != '' and popUpMngVO.custVhclDetlMdlNm != null}">
		                                        	<option value="${popUpMngVO.custVhclDetlMdl}">${popUpMngVO.custVhclDetlMdlNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.custVhclDetlMdlNm == '' or popUpMngVO.custVhclDetlMdlNm == null}">
			                                        <form:option value="">-- 세부모델 --</form:option>
			                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="custVhclDetlMdl" />
	                                    </div> --%>
                                   </div>
                             	</div>
                                <label for="vhcleNo" class="col-sm-2 control-label">차량번호</label>
                                <div class="col-sm-4">
	                                <input type="text" name="vhcleNo" class="form-control" id="vhcleNo" value="${popUpMngVO.vhcleNo}"/>
                                </div>
						  	</div>
						  	                    
                            <div class="form-group" id="existCstmrOwnerDiv" style="display:none;">
                            	<div class="col-sm-1">
                            	</div>
                            	<div class="col-sm-11">
						          <table id="listExistCstmrOwnerCarTable" name="listExistCstmrOwnerCarTable" class="table table-hover">
						            <thead>
						              <tr>
                                    	<th><spring:message code="cmm.seq"/></th>
						                <th>ACQS번호</th>
						                <th>ACQS순번</th>
						                <th>모델코드</th>
						                <th>구분</th>
						                <th>차량번호</th>
						                <th>차대번호</th>
						                <th>차량모델</th>
						                <th>색상</th>
						                <th>최근방문일자</th>
						                <th>최근방문정비소</th>
						                <th>담당어드바이저</th>
						              </tr>
						            </thead>
						            <tbody>
						          	</tbody>
						          </table>
                            	</div>
						  	</div>
						  	                    
                            <div class="form-group">
                                <label for="emailAdres" class="col-sm-2 control-label">이메일</label>
                                <div class="col-sm-10">
	                                <input type="text" name="emailAdres" class="form-control-nowd w200" id="emailAdres"/>
	                                <input type="text" name="emailDomain" class="form-control-nowd w150" id="emailDomain"/>
                                    <form:select path="selectEmailDomain" class="form-control-nowd w150 input-sm">
                                        <form:option value="">-- 직접입력 --</form:option>
                                        <form:options items="${selectEmailDomainList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                </div>
						  	</div>
                    
                            <div class="form-group">
                                <label for="searchHome" class="col-sm-2 control-label">주소</label>
                                <div class="col-sm-3">
                                	<div class="input-group">
		                                <input type="text" name="searchHomeZip" class="form-control" id="searchHomeZip" readOnly/>
	                                    <div class="input-group-btn">
	                                        <button type="button" id="homeAdres" class="btn btn-info btn-flat" onClick="javascript:fn_openUrlJusoSearchBasic()">
	                                        <i class="fa fa-search"></i></button>
	                                    </div>
                                	</div>
                                </div>
						  	</div>
                    
                            <div class="form-group">
                                <label for="searchBlank" class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
	                                <input type="text" name="searchHomeAdres" class="form-control" id="searchHomeAdres" readOnly/>
	                                <input type="text" name="searchHomeAdresDetl" class="form-control" id="searchHomeAdresDetl"/>
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="cstmrRel" class="col-sm-2 control-label">고객관계</label>
                                <div class="col-sm-4">
                                    <form:select path="cstmrRel" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cstmrRelList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control">
                                		<option>배우자</option>
                                		<option>형제</option>
                                		<option>부모</option>
                                	</select> -->
                                </div>
                                <label for="callType" class="col-sm-2 control-label">통화유형</label>
                                <div class="col-sm-4">
                                    <form:select path="callType" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${callTypeList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control">
                                		<option>유선통화</option>
                                		<option>WebVoc</option>
                                		<option>WebChat</option>
                                		<option>대화형검색</option>
                                	</select> -->
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="cnsltRslt" class="col-sm-2 control-label">상담결과</label>
                                <div class="col-sm-4">
                                    <form:select path="cnsltRslt" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltRsltList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control">
                                		<option>통화종료</option>
                                		<option>호전환</option>
                                		<option>상담사연결</option>
                                		<option>상담사답변</option>
                                		<option>협의답변</option>
                                		<option>담당자연결</option>
                                		<option>전화번호안내</option>
                                	</select> -->
                                </div>
                                <label for="cnsltKnd" class="col-sm-2 control-label">상담구분</label>
                                <div class="col-sm-4">
                                    <form:select path="cnsltKnd" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltKndList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control" id="cnsltKnd">
                                		<option value="N">일반접수</option>
                                		<option value="C">클레임접수</option>
                                		<option value="V">VOC</option>
                                	</select> -->
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="cnsltCustKnd" class="col-sm-2 control-label">고객구분</label>
                                <div class="col-sm-4">
                                    <form:select path="cnsltCustKnd" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltCustKndList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                </div>
                                <label for="partNoReason" class="col-sm-2 control-label">원인품번</label>
                                <div class="col-sm-4">
                                	<input type="text" name="partNoReason" class="form-control" id="partNoReason"/>
                                </div>
						  	</div>
		                    

                            <div class="form-group">
	                            <label for="cnsltCarKnd" class="col-sm-2 control-label">상담차종</label>
                                <div class="col-sm-4 dstick" style="padding-bottom:0px">
                                   <div class="col-sm-12">
	                                    <div class="col-sm-12 dstick">
		                                    <form:select path="vhclMdl" class="form-control input-sm selectVhclMdl">
		                                        <form:option value="">-- 모델 --</form:option>
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclMdl" />
	                                    </div>
	                                    <%-- <div class="col-sm-6 dstick">
		                                    <form:select path="vhclDetlMdl" class="form-control input-sm selectDetlMdl">
		                                        <form:option value="">-- 세부모델 --</form:option>
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclDetlMdl" />
	                                    </div> --%>
                                   </div>
                             	</div>
                                <label for="bndryTrgtCstmrYn" class="col-sm-2 control-label">체크항목</label>
                                <div class="col-sm-4 checkbox dstick">
							  		<label><input type="checkbox" name="bndryTrgtCstmrYn" id="bndryTrgtCstmrYn" value="Y"/>경계대상고객여부</label>
							  		<label><input type="checkbox" name="mgrCnfmReqFlag" id="mgrCnfmReqFlag" value="Y"/>매니저확인요청</label>
				  					<label><input type="checkbox" name="salesLeadFlag" id="salesLeadFlag" value="Y"/>Sales Lead</label>
				  					<label><input type="checkbox" name="smsFileAttachFlag" id="smsFileAttachFlag" value="Y"/>고객SMS첨부파일</label>
				  					<label><input type="checkbox" name="cstmrMktAgreeFlag" id="cstmrMktAgreeFlag" value="Y"/>마케팅활용동의</label>
                                </div>
                            </div>
						  	
						  	

						  	

                            <div class="form-group">
                                <label for="cnsltMemo" class="col-sm-2 control-label">상담사메모</label>
                                <div class="col-sm-10">
	                                <textarea name="cnsltMemo" class="form-control" rows="3" id="cnsltMemo" placeholder="Enter ..."></textarea>
                                </div>
						  	</div>
						  	
						  	
                            <div class="form-group">
	                                <label for="cnsltTyCn" class="col-sm-2 control-label">상담유형</label>
	                                <div class="col-sm-4">
                                        <div class="input-group">
                                        	<input type="text" name="cnsltTyCn" class="form-control" id="cnsltTyCn" readOnly/>
                                        	<input type="hidden" name="cnsltTyCnCode" class="form-control" id="cnsltTyCnCode" readOnly/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="cnsltTypePop" class="btn btn-info btn-flat">
	                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
	                                            <i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
	                                </div>
						  	</div>
						  	
						  	
		                    <div class="form-group">
		                    	<div class="col-sm-1"></div>
		                    	<div class="col-sm-11">
							          <table id="listCnsltTypeTable" name="listCnsltTypeTable" class="table table-hover">
							            <thead>
							              <tr>
							                <th>상담분류유형코드1</th>
							                <th>상담분류유형코드2</th>
							                <th>상담분류유형코드3</th>
							                <th>상담분류유형코드4</th>
							                <th>상담분류1</th>
							                <th>상담분류2</th>
							                <th>상담분류3</th>
							                <th>상담분류4</th>
							              </tr>
							            </thead>
							            <tbody>
							          	</tbody>
							          </table>
		                    	</div>
		                    </div>	
                            
                            
                            <div class="form-group">
                                <label for="cnsltDscr" class="col-sm-2 control-label">상담내용</label>
                                <div class="col-sm-10">
	                                <textarea name="cnsltDscr" class="form-control" rows="3" id="cnsltDscr" placeholder="Enter ..."></textarea>
                                </div>
						  	</div>
                            
                            
                            <div class="form-group" style="display:none;">
                                <label for="cnsltSttDscr" class="col-sm-2 control-label">문의내용<br>(STT내용)</label>
                                <div class="col-sm-10">
	                                <textarea name="cnsltSttDscr" class="form-control" rows="3" id="cnsltSttDscr" placeholder="Enter ..."></textarea>
                                </div>
						  	</div>
                            
                            
                            <div class="form-group" style="display:none;">
                                <label for="actDscr" class="col-sm-2 control-label">조치내용</label>
                                <div class="col-sm-10">
	                                <textarea name="actDscr" class="form-control" rows="3" id="actDscr" placeholder="Enter ..."></textarea>
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="vocKnd" class="col-sm-2 control-label">사업소구분</label>
                                <div class="col-sm-4">
                                       <form:select path="vocKnd" class="form-control input-sm">
                                           <form:option value="">-- 선택 --</form:option>
                                           <form:options items="${vocKndList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>		                                
                                	<!-- <select class="form-control" id="vocKnd" name="vocKnd">
                                		<option value="">선택</option>
                                		<option value="SCMS">SCMS</option>
                                		<option value="CCMS">CCMS</option>
                                	</select> -->
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="bussplc" class="col-sm-2 control-label">사업소</label>
                                <div class="col-sm-2">
                                       <%-- <form:select path="bussplcCd1" cssClass="form-control input-sm selectBpc1">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd1" /> --%>
                                       <select class="form-control" name="bussplcCd1" id="bussplcCd1">
                                       	<option value="N">네트워크</option>
                                       </select>
                                </div>
                                <div class="col-sm-2">
                                       <form:select path="bussplcCd2" cssClass="form-control input-sm selectBpc2">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd2" />
                                </div>
                                <div class="col-sm-3">
                                       <form:select path="bussplcCd3" cssClass="form-control input-sm selectBpc3">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd3" />
                                </div>
                                <div class="col-sm-3">
                                       <form:select path="bussplcCd4" cssClass="form-control input-sm selectBpc4">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd4" />
                                </div>
						  	</div>
						  	
						  	
						  	
						  							  	
						  	
						  	
						  	<div class="row" id="claimDiv" style="display:none;">
				                    <div class="box-header with-border bg-info">
				                    	<h3 class="box-title">불만접수</h3>
				                    </div>
		                            <div class="form-group" style="display:none;">
		                                <label for="recptKnd" class="col-sm-2 control-label">접수구분</label>
		                                <div class="col-sm-4">
	                                        <form:select path="recptKnd" cssClass="form-control input-sm selectRcpt">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="recptKnd" />
		                                </div>
		                                
		                                <label for="cnsltCategory" class="col-sm-2 control-label">상담카테고리</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cnsltCategory" cssClass="form-control input-sm selectCategy">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cnsltCategory" />
		                                </div>
								  	</div>
		                            <div class="form-group" style="display:none;">
		                                <label for="recptRoot" class="col-sm-2 control-label">접수경로</label>
		                                <div class="col-sm-4">
	                                        <form:select path="recptRoot" cssClass="form-control input-sm selectRoot">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="recptRoot" />
		                                </div>
		                                
		                                <label for="cstmrProtectKnd" class="col-sm-2 control-label">소보원구분</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cstmrProtectKnd" cssClass="form-control input-sm selectCstGurd">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cstmrProtectKnd" />
		                                </div>
								  	</div>
		                            <div class="form-group" style="display:none;">
		                                <label for="cstmrDemand" class="col-sm-2 control-label">고객요구</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cstmrDemand" cssClass="form-control input-sm selectReq">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cstmrDemand" />
		                                </div>
		                                
		                                <label for="cmplCdNm" class="col-sm-2 control-label">불만코드</label>
		                                <div class="col-sm-4">
	                                        <div class="input-group">
	                                        	<input type="text" name="cmplCdNm" class="form-control" id="cmplCdNm" readOnly/>
	                                        	<input type="hidden" name="cmplCd" class="form-control" id="cmplCd" readOnly/>
												<input type="hidden" name="cmplCd1No" id="cmplCd1No" readOnly/>
												<input type="hidden" name="cmplCd2No" id="cmplCd2No" readOnly/>
												<input type="hidden" name="cmplCd3No" id="cmplCd3No" readOnly/>
												<input type="hidden" name="cmplCd4No" id="cmplCd4No" readOnly/>
												<input type="hidden" name="cmplCdLvl" id="cmplCdLvl" readOnly/>
												<input type="hidden" name="cmplCd1Nm" id="cmplCd1Nm" readOnly/>
												<input type="hidden" name="cmplCd2Nm" id="cmplCd2Nm" readOnly/>
												<input type="hidden" name="cmplCd3Nm" id="cmplCd3Nm" readOnly/>
												<input type="hidden" name="cmplCd4Nm" id="cmplCd4Nm" readOnly/>
		                                        <div class="input-group-btn">
		                                            <button type="button" id="cmplCdPop" class="btn btn-info btn-flat">
		                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
		                                            <i class="fa fa-search"></i></button>
		                                        </div>
		                                    </div>
		                                </div>
								  	</div>
		                            <div class="form-group" style="display:none;">
		                                <label for="oneselfAppntKnd" class="col-sm-2 control-label">담당본인지정</label>
		                                <div class="col-sm-4">
			                                <input type="radio" name="oneselfAppntKnd" class="radio2" id="oneselfAppntKnd" value="Y" unchecked />본인
			                                <input type="radio" name="oneselfAppntKnd" class="radio2" id="oneselfAppntKnd" value="N" checked />미지정
		                                </div>
		                                
		                                <label for="cmplSittnCd" class="col-sm-2 control-label">불만상황</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cmplSittnCd" cssClass="form-control input-sm selectCmpl">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cmplSittnCd" />
		                                </div>
								  	</div>
		                            <div class="form-group" style="display:none;">
		                                <label for="accidentYnCd" class="col-sm-2 control-label">상해여부코드</label>
		                                <div class="col-sm-4">
	                                        <form:select path="accidentYnCd" cssClass="form-control input-sm selectAccu">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="accidentYnCd" />
		                                </div>
		                                
		                                <label for="processSttus" class="col-sm-2 control-label">처리상태</label>
		                                <div class="col-sm-4">
	                                        <form:select path="processSttus" cssClass="form-control input-sm selectProcess" disabled="true">
	                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="processSttus" />
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="cnsltTitle" class="col-sm-2 control-label">접수제목</label>
		                                <div class="col-sm-10">
			                                <input type="text" name="cnsltTitle" class="form-control" id="cnsltTitle"/>
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="recptDscr" class="col-sm-2 control-label">접수내용</label>
		                                <div class="col-sm-10">
			                                <textarea name="recptDscr" class="form-control" rows="3" id="recptDscr" placeholder="Enter ..."></textarea>
		                                </div>
								  	</div>
		                            <div class="form-group">
		                                <label for="recpterOpinion" class="col-sm-2 control-label">접수자의견</label>
		                                <div class="col-sm-10">
			                                <textarea name="recpterOpinion" class="form-control" rows="3" id="recpterOpinion" placeholder="Enter ..."></textarea>
		                                </div>
								  	</div>
						  	</div>
                        
				  		  <div align='right' class="form-group">
				  		  <button type="button" class="btn btn-default">마케팅활용동의거절</button>
				  		  <!-- <button type="button" class="btn btn-default">취소</button> -->
				  		  <button type="button" class="btn btn-sm btn-primary" id="btnCnsltInsert">상담저장</button>
				  		  <button type="button" class="btn btn-default">상담완료</button>
				  		  <button type="button" class="btn btn-default">긴급출동접수</button>
				  		  <button type="button" class="btn btn-default">정비예약</button>
				  		  <button type="button" class="btn btn-default">DB변경</button>
				  		  <button type="button" class="btn btn-default">의뢰요청</button>
				  		  <button type="button" class="btn btn-default">KMS연결</button>
				  		  <button type="button" class="btn btn-default">SMS발송</button>
				  		  <button type="button" class="btn btn-default">이메일발송</button>
				  		  </div>

                    </form>
                    </div>
                    <!-- /.box-body THE END -->
					</form:form>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
            
            </div>
        </div>


      
      
      
      
      
      
      
      
      	<div class="row">
        	<div class="col-md-12"> <!-- DIV 가로영역을 나누는 용도 -->
			
        	</div>
      </div>
      <!-- /.row -->








    </section>
    <!-- /.content -->


        <div class="modal modal-center fade" id="existPopupModal">
            <div class="modal-dialog modal-large modal-center">
                <div class="modal-content modal-large">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
<!-- /.modal -->
	    <form name="popupForm" method="post">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="popupNm"/>
	        <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
	        <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
	        <input type="hidden" name="searchCnsltTyCnCode" id="searchCnsltTyCnCode" value=""/>
	    </form>

</body>
</html>
