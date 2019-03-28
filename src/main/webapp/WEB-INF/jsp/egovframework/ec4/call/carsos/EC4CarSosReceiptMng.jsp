<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CarSosReceiptMng.java
  * @Description : EC4CarSosReceiptMng List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.16    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.04.16
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
    <title>긴급출동 접수</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
    <!-- bootstrap daterangepicker -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
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
    <!-- bootstrap datepicker -->
    <script src="/resource/adminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- bootstrap daterangepicker -->
    <script src="/resource/adminLTE/bower_components/moment/moment.js"></script>
    <script src="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
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


    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">


<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){

    if('${message}'){

        alert('${message}');
    }

    $(".sidebar-menu").tree();
	
	
	$(document).on("click","#custPop",function() {
		fn_custPop();
    });
	$(document).on("click","#custCarPop",function() {
		fn_custCarPop();
    });
	$(document).on("click","#btnEmergencyCancel",function() {
		location.reload();
		//$('iframe').attr('src', $('iframe').attr('src'));

    });
	
	
	
	
    $("#carSosReceiptMngVO input[name=hpno]").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custPop();
    	}
	});
    $("#carSosReceiptMngVO input[name=vin]").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custCarPop();
    	}
	});
    $("#carSosReceiptMngVO input[name=vhcleNo]").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custCarPop();
    	}
	});
    

	$(document).on("click","#delCustNm",function() {
		$("#carSosReceiptMngVO input[name=cstmrCd]").val("");
		$("#carSosReceiptMngVO input[name=cstmrNm]").val("");
    });
	$(document).on("click","#delCustHp",function() {
		$("#carSosReceiptMngVO input[name=hpno]").val("");
    });
	$(document).on("click","#delCustEmail",function() {
		$("#carSosReceiptMngVO input[name=emailAdres]").val("");
    });
	$(document).on("click","#delVin",function() {
		$("#carSosReceiptMngVO input[name=vin]").val("");
    });
	$(document).on("click","#delCarNo",function() {
		$("#carSosReceiptMngVO input[name=vhcleNo]").val("");
    });
	
	

	
	//차량 모델
    $(".selectVhclMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=searchVhctCd] option:selected").val(),/* 차종 */
   		            "cnsltSeCode": $("select[name=searchVmcd] option:selected").val(),/* 제조사 */
   		            "codeId": $("select[name=searchVhclMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    $(".selectVhclMdl").on("change", function (e) {
    	$("select[name=searchVhclDetlMdl]").val(null).trigger('change');
    });
	//차량 세부모델
    $(".selectDetlMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclDetlMdlComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=searchVhclMdl] option:selected").val(), /* 모델 */
   		            "cnsltSeCode": $("select[name=searchVmcd] option:selected").val(), /* 제조사 */
   		            "codeId": $("select[name=searchVhclDetlMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 세부모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#carSosReceiptMngVO input[name=searchCstmrNm]").val() == ""){
			$("#carSosReceiptMngVO input[name=searchCstmrCd]").val("");
		}
	});
	


    // 긴급출동접수 등록
    $("#btnEmergencyInsUp").click(function(){

        frm = document.carSosReceiptMngVO;

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
        if(nvl($("#carSosReceiptMngVO input[name=reqCstmrNm]").val(),"") == ""){
        	alert("의뢰인명을 입력하세요.");
        	return;
        }
        if(nvl($("#carSosReceiptMngVO input[name=reqCstmrHpno]").val(),"") == ""){
        	alert("의뢰인연락처를 입력하세요.");
        	return;
        }
        
        
        
		//var formData = $("#carSosReceiptMngVO").serializeArray();
        


        
		//console.log(formData);
		//console.log(params);


        // 저장
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/carsos/insertCarSosReceiptReg.do'/>",
            //"data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            "data": $("#carSosReceiptMngVO").serialize(),  //form 만 넘길경우
            "success": function(result) {

                if(result.isSuccess){

                    alert(result.message);
                    location.reload();
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
	
});





function fn_custPop(){

    var popupParams = {};

    $("#mainPopupForm input[name=popupNm]").val("carSosReceiptMngVO");
    $("#mainPopupForm input[name=cstmrNm]").val($("#carSosReceiptMngVO input[name=cstmrNm]").val());
    $("#mainPopupForm input[name=hpno]").val($("#carSosReceiptMngVO input[name=hpno]").val());
    $("#mainPopupForm input[name=emailAdres]").val($("#carSosReceiptMngVO input[name=emailAdres]").val());
    
    

    var callbackClass = "callback";
    var selectStyle = "single";
    var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrCarSosPop.do'/>";

    popupParams.width = "800";
    popupParams.height = "700";
    popupParams.title = "popupSelectSingle";
    popupParams.form = document.mainPopupForm;


    popupParams.form.action = url;
    popupParams.form.target = popupParams.title;
    popupParams.form.selectStyle.value = selectStyle;
    popupParams.form.callbackClass.value = callbackClass;

    fn_open_popup(popupParams);	
    /* return false;
	
	var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
	//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
	pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
}


function fn_custCarPop(){

    var popupParams = {};

    $("#mainPopupForm input[name=popupNm]").val("carSosReceiptMngVO");
    $("#mainPopupForm input[name=cstmrNm]").val($("#carSosReceiptMngVO input[name=cstmrNm]").val());
    $("#mainPopupForm input[name=hpno]").val($("#carSosReceiptMngVO input[name=hpno]").val());
    $("#mainPopupForm input[name=emailAdres]").val($("#carSosReceiptMngVO input[name=emailAdres]").val());
    $("#mainPopupForm input[name=vin]").val($("#carSosReceiptMngVO input[name=vin]").val());
    $("#mainPopupForm input[name=vhcleNo]").val($("#carSosReceiptMngVO input[name=vhcleNo]").val());
    
    

    var callbackClass = "callback";
    var selectStyle = "single";
    var url = "<c:url value='/ec4/cmm/cinfo/cstmrCarPop.do'/>";

    popupParams.width = "800";
    popupParams.height = "700";
    popupParams.title = "popupSelectSingle";
    popupParams.form = document.mainPopupForm;


    popupParams.form.action = url;
    popupParams.form.target = popupParams.title;
    popupParams.form.selectStyle.value = selectStyle;
    popupParams.form.callbackClass.value = callbackClass;

    fn_open_popup(popupParams);	
    /* return false;
	
	var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
	//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
	pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
}



function cstmrSearch(rCstmrCd){
    /* if(key.keyCode == 13 || $(this).hasClass("datepicker")){
    	callCnsltHistTable.search(this.value).draw();
    } */

    var sCstmrCd = rCstmrCd;
    //if(null == sCstmrCd || "" == sCstmrCd || undefined == sCstmrCd)sCstmrCd = $("#searchCallCnsltForm input[name=searchCstmrCd]").val();
    if( "" == nvl(sCstmrCd,"") )sCstmrCd = $("#carSosReceiptMngVO input[name=searchCstmrCd]").val();
    
    $('#callCnsltHistTable').DataTable().clear().destroy();
    // 콜상담 테이블
    callCnsltHistTable = $('#callCnsltHistTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        //"order": [[ 1, "desc" ]],
        "rowId": "hpclId",
        "scrollY": "369px",
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
        //"sAjaxSource": "<c:url value='/ec4/call/inbd/selectCallCnsltHistList.do'/>",
        "sAjaxSource": "/ec4/call/inbd/selectCallCnsltHistList.do",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": sCstmrCd},
                    /* {"name": "searchCstmrNm",   "value": $("#searchCallCnsltForm input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno", 		"value": $("#searchCallCnsltForm input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres","value": $("#searchCallCnsltForm input[name=searchEmailAdres]").val()} */
                    {"name": "searchCstmrNm",   "value": $("#carSosReceiptMngVO input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno", 		"value": $("#carSosReceiptMngVO input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres","value": $("#carSosReceiptMngVO input[name=searchEmailAdres]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            //{"visible": false, "targets": [0]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 0
            {"data":"cstmrNm" , "defaultContent" : ""},                                 // 1   1
            {"data":"cnsltDt" , "defaultContent" : ""},                               // 2   1
            {"data":"cnsltNm" , "defaultContent" : ""},                                   // 3
            {"data":"cnsltTyCn" , "defaultContent" : ""},                                     // 4
            {"data":"cnsltKndNm" , "defaultContent" : ""},                             // 5
            {"data":"cnsltRsltNm" , "defaultContent" : ""},                           // 6   4   1
            {"data":"cnsltDscr" , "defaultContent" : ""},                                // 7   5
            {"data":"actDscr" , "defaultContent" : ""},                                     // 8   5
            {"data":"cnsltMemo" , "defaultContent" : ""}                                      // 9   6
        ]
    });
    
    
    //고객정보 load
    var formData = $("#carSosReceiptMngVO").serializeArray();
    //form 과 param을 함께 넘길경우
    //formData.push({name:"cstmrCd", value:$("#carSosReceiptMngVO input[name=cstmrCd]").val()});
    //formData.push({name:"cnsltIncallNo", value:$("#carSosReceiptMngVO input[name=cnsltIncallNo]").val()});
    //formData.push({name:"cstmrNm", value:$("#carSosReceiptMngVO input[name=cstmrNm]").val()});
    //formData.push({name:"brthdy", value:$("#carSosReceiptMngVO input[name=brthdy]").val()});
    //formData.push({name:"hpno", value:$("#carSosReceiptMngVO input[name=hpno]").val()});
    //formData.push({name:"emailAdres", value:$("#carSosReceiptMngVO input[name=emailAdres]").val()});
    
	$.ajax({
		type: "POST",
		dataType:"json",
		async: false,
		url: "<c:url value='/ec4/call/inbd/loadCstmrLastInfo.do'/>",
		data:formData,
		success:function(data) {
			if (data.ok) {
				$("#carSosReceiptMngVO input[name=vin]").val(nvl(data.result.vin,"")); //차대번호
				$("#carSosReceiptMngVO input[name=vhcleNo]").val(nvl(data.result.vehiNo01,"")+""+nvl(data.result.vehiNo02,"")); //차량번호
				
				if( "" != nvl(data.result.lastVhclMdl,"") ){
					$("#carSosReceiptMngVO select[name=vhclMdl]").val(null).trigger('change'); //최근차량정보 콤보
					$("#carSosReceiptMngVO select[name=vhclMdl]").prepend("<option value='"+data.result.lastVhclMdl+"' selected>"+data.result.lastVhclMdlNm+"</option>");
				}
				
				$("#carSosReceiptMngVO input[name=lastReadKm]").val(nvl(data.result.lastReadKm,"")); //주행거리
				$("#carSosReceiptMngVO input[name=typeYear]").val(nvl(data.result.typeYear,"")); //차량연식
				$("#carSosReceiptMngVO input[name=lastInShop]").val(nvl(data.result.lastCustNm,"")); //최근입고정비소
				$("#carSosReceiptMngVO input[name=lastInDate]").val(nvl(data.result.lastRcptDate,"")); //최근입고일자
				$("#carSosReceiptMngVO input[name=zip]").val(nvl(data.result.houseZip,"")); //주소
				$("#carSosReceiptMngVO input[name=adres]").val(nvl(data.result.houseAdres,"")); //주소
				$("#carSosReceiptMngVO input[name=adresDetail]").val(nvl(data.result.houseAdresDetail,"")); //주소
				//$("input[name=searchLastCustMemo]").val(nvl(data.result.cnsltMemo,"")); //최근고객메모
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


</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <!-- top include -->
    <jsp:include page="/ec4Top.do" />

    <!-- left include -->
    <jsp:include page="/ec4Left.do" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                긴급출동 접수
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리</a></li>
                <li class="active">긴급출동 접수</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
      <div id="cnsltMainDiv" class="row">


		<!-- ############################# 메인화면 ######################  -->
        	<div id="custDiv" class="col-md-11"> <!-- DIV 가로영역을 나누는 용도 -->
        		  <div id="callBtn">
	        		  <button type="button" class="btn btn-default">ON</button>
	        		  <button type="button" class="btn btn-default">대기</button>
	        		  <button type="button" class="btn btn-default">이석</button>
	        		  <button type="button" class="btn btn-default">보류</button>
	        		  <button type="button" class="btn btn-default">협의</button>
	        		  <button type="button" class="btn btn-default">호전환</button>
	        		  <button type="button" class="btn btn-default">3자</button>
	        		  <button type="button" class="btn btn-default">걸기</button>
	        		  <button type="button" class="btn btn-default">끊기</button>
	        		  <button type="button" class="btn btn-default">전화번호조회</button>
	        		  <button type="button" class="btn btn-default">대화형검색0</button>
        		  </div>
        		  	<form:form commandName="carSosReceiptMngVO" name="carSosReceiptMngVO" method="post" cssClass="form-horizontal">
        		  	<double-submit:preventer/>
	        		<p class="bg-info toggle-list">○ 고객정보</p>
                    <!-- /.box-header -->
					<div id="postnTable" class="row">
			            <%-- <div class="col-md-3">
			            <form class="form-horizontal">
		                    <div class="form-group dstick" align="center">
						    <a href="#" class="" align="center">
						      <img src="/images/egovframework/ec4/call/callTimeSample1.png" alt="..." border="0" align="center" style="float:left;width:100%;">
						    </a>
						    </div>
						    
		                    <div class="form-group dstick" align="center">
						    <a href="#" class="" align="center">
						      <img src="/images/egovframework/ec4/call/callTimeSample2.png" alt="..." border="0" align="center" style="float:right;">
						    </a>
						    </div>
						</form>
			            </div> --%>
			            <div class="col-md-12">
			            	<!-- 검색항목 -->
		                    <div class="row">
				                    	<div class="form-group dstick">
			                                <label for="custNm" class="col-sm-2 control-label">고객명</label>
			                                <div class="col-sm-2 dstick">
		                                        <div class="input-group">
			                                        <input type="hidden" name="cstmrCd" class="form-control" id="cstmrCd"/>
			                                        <input type="text" name="cstmrNm" class="form-control" id="cstmrNm"/>
			                                        <div class="input-group-btn">
			                                            <button type="button" id="custPop" class="btn btn-info btn-flat">
			                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
			                                            <i class="fa fa-search"></i></button>
			                                        </div>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCustNm">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                    </div>
			                                </div>
			                                <label for="hpno" class="col-sm-2 control-label">핸드폰</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
				                                	<input type="text" name="hpno" class="form-control" id="hpno"/>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCustHp">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
			                                <label for="emailAdres" class="col-sm-2 control-label">이메일</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
				                                	<input type="text" name="emailAdres" class="form-control" id="emailAdres"/>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCustEmail">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="vin" class="col-sm-2 control-label">차대번호</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
				                                	<input type="text" class="form-control" id="vin" name="vin"/>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delVin">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
			                                <label for="vhcleNo" class="col-sm-2 control-label">차량번호</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
			                                		<input type="text" class="form-control" id="vhcleNo" name="vhcleNo"/>
			                                		<div class="input-group-btn">
				                                		<!-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#vehicInfoModal"> -->
				                                		<button type="button" id="custCarPop" class="btn btn-info btn-flat">
				                                			<i class="fa fa-search"></i>
				                                		</button>
			                                		</div>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCarNo">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
			                                <div> 
			                                </div>
				                    	</div>
		                    </div>
		                    <!-- 검색항목  END <<<<<<<<<<<<<-->
		                    
							<!-- 고객정보항목 -->
		                    <div class="row">
		                                <div class="form-group dstick">
		                                    <label for="agreeLbl" class="col-sm-2 control-label">동의여부</label>
		                                    <div class="col-sm-10 checkbox dstick">
									  			<label><input type="checkbox">마케팅활용동의</label>
		                                    </div>
										</div>
		                                <div class="form-group dstick">
		                                    <label for="lastVhcleInfo" class="col-sm-2 control-label">고객차량정보</label>
		                                    <div class="col-sm-2 dstick" style="padding-bottom:0px">
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
				                    	<div class="form-group dstick">
			                                <label for="lastReadKm" class="col-sm-2 control-label">주행거리</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="lastReadKm" name="lastReadKm"/>
			                                </div>
			                                <label for="typeYear" class="col-sm-2 control-label">차량연식</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="typeYear" name="typeYear"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="lastInShop" class="col-sm-2 control-label">최근입고정비소</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="lastInShop" name="lastInShop"/>
			                                </div>
			                                <label for="lastInDate" class="col-sm-2 control-label">최근입고일자</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="lastInDate" name="lastInDate"/>
			                                </div>
				                    	</div>
			                            <div class="form-group">
			                                <label for="homeAdres" class="col-sm-2 control-label">주소</label>
			                                <div class="col-sm-2">
			                                	<div class="input-group">
					                                <input type="text" name="zip" class="form-control" id="zip" readOnly/>
				                                    <!-- <div class="input-group-btn">
				                                        <button type="button" class="btn btn-info btn-flat" onClick="javascript:fn_openUrlJusoSearchBasic()">
				                                        <i class="fa fa-search"></i></button>
				                                    </div> -->
			                                	</div>
			                                </div>
									  	</div>
			                    
			                            <div class="form-group">
			                                <label for="searchBlank" class="col-sm-2 control-label"></label>
			                                <div class="col-sm-10">
				                                <input type="text" name="adres" class="form-control" id="adres" readOnly/>
				                                <input type="text" name="adresDetail" class="form-control" id="adresDetail" readOnly/>
			                                </div>
									  	</div>
		                                <div class="form-group dstick">
		                                    <label for="text01" class="col-sm-2 control-label">웹회원정보</label>
		                                    <div class="col-sm-10 checkbox dstick">
			                                	<label>등급<input type="text" class="form-control-nowd w40" readonly id="custClass"/></label>
			                                	<label>&nbsp;</label>
									  			<label><input type="checkbox" disabled>쉐보레멤버</label>
									  			<label><input type="checkbox" disabled>웹멤버</label>
									  			<label><input type="checkbox" disabled>오토멤버</label>
		                                    </div>
										</div>
				                    	<div class="form-group dstick">
			                                <label for="reqCstmrNm" class="col-sm-2 control-label">의뢰인</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" id="reqCstmrNm" name="reqCstmrNm"/>
			                                </div>
			                                <label for="reqCstmrHpno" class="col-sm-2 control-label">연락처</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" id="reqCstmrHpno" name="reqCstmrHpno"/>
			                                </div>
				                    	</div>
				            </div>
							<!-- 고객정보항목 THE END <<<<<<<<<<<  -->
			            </div>
                    	<!-- /.box-body THE END -->
			        </div>
			        
			        
			        
			        
			        
			        <p class="bg-info toggle-list">○ 긴출정보</p>
			        <div id="emergencyTable" class="row">
				                    	<div class="form-group">
			                                <label for="vocKnd" class="col-sm-2 control-label">사업소구분</label>
			                                <div class="col-sm-4">
		                                        <form:select path="vocKnd" class="form-control input-sm">
		                                            <form:option value="">-- 선택 --</form:option>
		                                            <form:options items="${vocKndList}" itemValue="code" itemLabel="codeNm"/>
		                                        </form:select>		                                
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="cmplSittnCd" class="col-sm-2 control-label">상황분류</label>
			                                <div class="col-sm-4">
		                                        <form:select path="cmplSittnCd" cssClass="form-control input-sm selectCmpl">
		                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </form:select>
		                                        <form:errors cssClass="help-block" path="cmplSittnCd" />
			                                </div>
			                                <div class="col-sm-2">
			                                	<select class="form-control" id="vocKnd" name="vocKnd">
			                                		<option value="일반">일반</option>
			                                	</select>
			                                </div>
			                                <div class="col-sm-2">
			                                	<select class="form-control" id="vocKnd" name="vocKnd">
			                                		<option value="유상">유상</option>
			                                	</select>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="cstmrCarSttusNm" class="col-sm-2 control-label">차량상태</label>
			                                <div class="col-sm-10">
												<input type="text" class="form-control" id="cstmrCarSttusNm" name="cstmrCarSttusNm"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="cstmrPlc" class="col-sm-2 control-label">위치</label>
			                                <div class="col-sm-10">
			                                	<input type="text" name="cstmrPlc" class="form-control" id="cstmrPlc"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="searchCustNm" class="col-sm-2 control-label">POST배정</label>
			                                <div class="col-sm-2">
			                                	<select class="form-control" id="vocKnd" name="vocKnd">
			                                		<option value="긴급출동 호출">긴급출동 호출</option>
			                                	</select>
			                                </div>
			                                <div class="col-sm-2">
		                                        <div class="input-group">
			                                        <input type="hidden" name="searchCstmrCd" class="form-control" id="searchCstmrCd"/>
			                                        <input type="text" name="searchCstmrNm" class="form-control" id="searchCstmrNm"/>
			                                        <div class="input-group-btn">
			                                            <button type="button" id="custPop" class="btn btn-info btn-flat">
			                                            <i class="fa fa-search"></i></button>
			                                        </div>
			                                    </div>
			                                </div>
				                    	</div>
			        </div>
			        </form:form>
					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnEmergencyInsUp"> 접수</button>
                        <button type="button" class="btn btn-info" id="btnEmergencyCancel"> 취소</button>
                        <!-- <button type="button" class="btn btn-info" id="btnCustInsUp"> 종결</button> -->
                    </div>


        	</div>
		</div>
		<!-- row 상단 THE END -->  
		

		        		

	      <div class="row">
		      <div class="col-md-12">
		        		<p class="bg-info toggle-list">○ 긴급출동이력</p>
				        <div id="postnList">
								<!-- 긴급출동이력  -->
								<div id="tab0" style="width: 100%; padding: 0px; display:inline;">
						          <table id="callCnsltHistTable" class="table table-hover">
						            <thead>
						              <tr>
                                        <th><spring:message code="cmm.seq"/></th>
						                <th>고객명</th>
						                <th>상담일자</th>
						                <th>상담원</th>
						                <th>상담유형</th>
						                <th>상담구분</th>
						                <th>상담결과</th>
						                <th>상담내용</th>
						                <th>조치내용</th>
						                <th>상담원메모</th>
						              </tr>
						            </thead>
						            <tbody>
						            </tbody>
						          </table>
						        </div>
				        </div>
		        </div>
	      </div>
      <!-- /.row -->
      
      
      
      
      
      
      
      
      
      
      
      
    </section>
    <!-- /.content -->


    </div>
    <!-- /.content-wrapper -->


	<!-- 고객정보 Modal -->
	<div class="modal fade" id="custInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">고객검색</h4>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 차량정보 Modal -->
	<div class="modal fade" id="vehicInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">차량검색</h4>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>


    

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

</div>
<!-- ./wrapper -->

        <div class="modal modal-center fade" id="popupModal">
            <div class="modal-dialog modal-large modal-center">
                <div class="modal-content modal-large">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
<!-- /.modal -->

	    <form name="mainPopupForm" method="post" id="mainPopupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="popupNm"/>
	        <input type="hidden" name="cstmrCd" value=""/>
	        <input type="hidden" name="cnsltIncallNo" value=""/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	        <input type="hidden" name="vin" value=""/>
	        <input type="hidden" name="vhcleNo" value=""/>
	        <!-- <input type="hidden" name="custVhclMdl" value=""/>
	        <input type="hidden" name="custVhclMdlNm" value=""/> -->
	    </form>
	    
	    
</body>
</html>
