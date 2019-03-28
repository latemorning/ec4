<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EgovGroupManage.java
  * @Description : EgovGroupManage List 화면
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
    <title>매니저 상담처리</title>
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

    
    //Date picker
    /* $(".datepicker").datepicker({
      autoclose: true,
      format: "yyyy-mm-dd"
    }); */
	$("#searchBeginDe").val((moment().subtract(1, 'month')).format('YYYY-MM-DD'));
	$("#searchEndDe").val(moment().format('YYYY-MM-DD'));
    $("#cnsltDe").daterangepicker({ //참조: http://www.daterangepicker.com/
        //dateFormat: 'YYYY-MM-DD',
        startDate: moment().subtract(1, 'month'), //1개월전
        //startDate: moment().subtract(30, 'days'), //30일전
        locale: {
        	format : 'YYYY-MM-DD'
        }
    }, function(start, end, label) {
    	//console.log("start["+start.format('YYYY-MM-DD')+"]");
    	//console.log("end["+end.format('YYYY-MM-DD')+"]");
    });
    $('#cnsltDe').on('apply.daterangepicker', function(ev, picker) { 
    	//console.log(picker.startDate.format('YYYY-MM-DD')); 
    	//console.log(picker.endDate.format('YYYY-MM-DD')); 
    	$("#searchBeginDe").val(picker.startDate.format('YYYY-MM-DD'));
    	$("#searchEndDe").val(picker.endDate.format('YYYY-MM-DD'));
    }); 
    $('#cnsltDe').on('cancel.daterangepicker', function(ev, picker) {
    	//취소눌러도 검색기본조건으로 사용되도록 초기화하지 않는다
    	//$('#cnsltDe').val(''); 
    }); 


    
    


    // 캠페인 테이블
    cnsltInBoundMgrProcTable = $('#cnsltInBoundMgrProcTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 3, "desc" ]],
        "rowId": "cnsltIncallNo",
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
        "sAjaxSource": "<c:url value='/ec4/call/inbd/cnsltInBoundMgrProcList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrCd]").val()},
                    {"name": "searchCstmrNm",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrNm]").val()},
                    {"name": "searchShopNm",   "value": $("#cnsltInBoundMngVO input[name=searchShopNm]").val()},
                    {"name": "searchBeginDe",   "value": $("#cnsltInBoundMngVO input[name=searchBeginDe]").val()},
                    {"name": "searchEndDe",     "value": $("#cnsltInBoundMngVO input[name=searchEndDe]").val()},
                    {"name": "searchHpno",   	"value": $("#cnsltInBoundMngVO input[name=searchHpno]").val()},
                    {"name": "searchTelno",   	"value": $("#cnsltInBoundMngVO input[name=searchTelno]").val()},
                    {"name": "cnsltTyCn",   	"value": $("#cnsltInBoundMngVO input[name=cnsltTyCn]").val()},
                    {"name": "cnsltTyCnCode",   	"value": $("#cnsltInBoundMngVO input[name=cnsltTyCnCode]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,2]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},
            {"data":"cstmrCd", "defaultContent": ""},
            {"data":"cnsltIncallNo", "defaultContent": ""},
            {"data":"cstmrNm" , "defaultContent" : ""},                                 // 1   1
            {"data":"callerNm" , "defaultContent" : ""},                                 // 1   1
            {"data":"cnsltNm" , "defaultContent" : ""},                               // 2   1
            {"data":"cnsltDt" , "defaultContent" : ""},                                   // 3
            {"data":"cnsltKndNm" , "defaultContent" : ""},                                     // 4
            {"data":"callTypeNm" , "defaultContent" : ""},                             // 5
            {"data":"cnsltMemo" , "defaultContent" : ""},                           // 6   4   1
            {"data":"telno" , "defaultContent" : ""},                                // 7   5
            {"data":"vhclMdlNm" , "defaultContent" : ""},                                // 8   5
            /* {"data":"cmplCd1Nm" , "defaultContent" : ""},                                // 9   5
            {"data":"cmplCd2Nm" , "defaultContent" : ""},                                // 10   5
            {"data":"cmplCd3Nm" , "defaultContent" : ""},                                */
            {"data":"processSttusNm" , "defaultContent" : ""}                                // 12   5
        ]
    });


    // 검색 input search
    $("#cnsltInBoundMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	cnsltInBoundMgrProcTable.search(this.value).draw();
        }

    });


    // 검색 select search
    $("#cnsltInBoundMngVO select").on("change", function(key){

    	cnsltInBoundMgrProcTable.search(this.value).draw();
    });


    // 선택
    cnsltInBoundMgrProcTable.on("select", function (e, dt, type, indexes) {

        $("#btnUpdate").removeClass("disabled");
        $("#btnDeleteAction").removeClass("disabled");
    }).on("deselect", function (e, dt, type, indexes) {

        $("#btnUpdate").addClass("disabled");
        $("#btnDeleteAction").addClass("disabled");
    });





    // 수정버튼
    $("#btnUpdate").click(function(){

        var params = {};

        var rowData = cnsltInBoundMgrProcTable.rows(".selected").data();
        if(rowData[0]){
            params.cstmrCd = rowData[0].cstmrCd;
            params.cnsltIncallNo = rowData[0].cnsltIncallNo;
        }
        
        // 수정 팝업 오픈
        fn_cnsltInBoundMgrProc_popup(params);
    });


    
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	cnsltInBoundMgrProcTable.search(this.value).draw();
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#cnsltInBoundMngVO input[name=searchCstmrNm]").val() == ""){
			$("#cnsltInBoundMngVO input[name=searchCstmrCd]").val("");
		}
	});


	$(document).on("click","#custPop",function() {
        var popupParams = {};

        //$("#mainPopupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
        //$("#mainPopupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#mainPopupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#mainPopupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
        $("#mainPopupForm input[name=hpno]").val($("#searchHpno").val());
        $("#mainPopupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrPop.do'/>";

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
    });
	
	//CMS구분
    $("select[name=searchVocKnd]").change(function(){
    	$("select[name=recptKnd]").val(null).trigger('change');
    	$("select[name=searchCnsltCategory]").val(null).trigger('change');
    	$("select[name=recptRoot]").val(null).trigger('change');
    	$("select[name=cstmrProtectKnd]").val(null).trigger('change');
    	$("select[name=cstmrDemand]").val(null).trigger('change');
    	$("select[name=searchCmplSittnCd]").val(null).trigger('change');
    	$("select[name=accidentYnCd]").val(null).trigger('change');
    	$("select[name=processSttus]").val(null).trigger('change');

    	$("select[name=searchBussplcCd2]").val(null).trigger('change');
    	$("select[name=searchBussplcCd3]").val(null).trigger('change');
    	$("select[name=searchBussplcCd4]").val(null).trigger('change');
    });
	

	//상담구분
    $("select[name=searchCnsltKnd]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if(this.value == '03'){
			$("#searchClaimDiv").show();
		}else{
			$("#searchClaimDiv").hide();
		}
    });
	
	//상담카테고리
    $(".selectCategy").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=searchVocKnd] option:selected").val(),
   		            "searchCodeId": "VOCCTGY",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=searchCnsltCategory] option:selected").val()
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
   		            "searchUpCode": $("select[name=searchVocKnd] option:selected").val(),
   		            "searchCodeId": "VOCSITT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=searchCmplSittnCd] option:selected").val()
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
   		            "codeKnd": $("select[name=searchVocKnd] option:selected").val(),
   		            "upCodeId": "null",
   		            "codeId": $("select[name=searchBussplcCd1] option:selected").val(),
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
   		            "codeKnd": $("select[name=searchVocKnd] option:selected").val(),
   		            "upCodeId": $("select[name=searchBussplcCd1] option:selected").val(),
   		            "codeId": $("select[name=searchBussplcCd2] option:selected").val(),
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
   		            "codeKnd": $("select[name=searchVocKnd] option:selected").val(),
   		         	"upCodeId": $("select[name=searchBussplcCd2] option:selected").val(),
   		            "codeId": $("select[name=searchBussplcCd3] option:selected").val(),
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
    	$("select[name=searchBussplcCd4]").val(null).trigger('change');
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
   		    	if("SCMS" == $("select[name=searchVocKnd] option:selected").val()){
   		    		upCodeId = $("select[name=searchBussplcCd3] option:selected").val();
   		    		codeId = $("select[name=searchBussplcCd4] option:selected").val();
   		    		
   		    	}else if("CCMS" == $("select[name=searchVocKnd] option:selected").val()){
   		    		upCodeId = $("select[name=searchBussplcCd2] option:selected").val();
   		    		codeId = $("select[name=searchBussplcCd3] option:selected").val();
   		    		code = $("select[name=searchBussplcCd4] option:selected").val();
   		    	}
   		        return {
   	   		            "codeKnd": $("select[name=searchVocKnd] option:selected").val(),
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
	
	
	
	
	//불만코드 팝업
	$(document).on("click","#searchCmplCdPop",function() {
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
    });	
	
	
	
	
	
	$(document).on("click","#cnsltTypePop",function() {
        var popupParams = {};

        $("#searchCnsltTyCn").val($("#cnsltTyCn").val());
        $("#searchCnsltTyCnCode").val($("#cnsltTyCnCode").val());

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/inbd/cnsltInBoundTypePop.do'/>";

        popupParams.width = "1000";
        popupParams.height = "700";
        popupParams.title = "popupSelectCnsltType";
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
    });	


	$(document).on("click","#cnsltntPop",function() {
        var popupParams = {};

        //$("#mainPopupForm input[name=cnsltUserNm]").val($("#searchCallCnsltForm input[name=searchCnsltUserNm]").val());
        //$("#mainPopupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#mainPopupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#mainPopupForm input[name=cnsltUserNm]").val($("#searchCnsltUserNm").val());
        $("#mainPopupForm input[name=hpno]").val($("#searchHpno").val());
        $("#mainPopupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/cnslt/cnsltntPop.do'/>";

        popupParams.width = "1250";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.mainPopupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/call/cnslt/cnsltntPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCnsltUserNm").keyup(function(){
		if($("#cnsltInBoundMngVO input[name=searchCnsltUserNm]").val() == ""){
			$("#cnsltInBoundMngVO input[name=searchCnsltUserId]").val("");
		}
	});
	
	
	
	
	
	
	
	
	
	


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

        fn_all_grid_reload();
    });

});




// 수정 팝업 오픈
function fn_cnsltInBoundMgrProc_popup(params){

   	if(params.cnsltIncallNo){

        $("#popupModal div.modal-content").load("<c:url value='/ec4/call/inbd/cnsltInBoundMgrProcPop.do'/>", params, function(response, status, xhr) {

            if(status == "success"){

                $("#popupModal").modal({"backdrop": "static", "keyboard": false});
            }else if(status == "error"){

                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
   	}else{

   		alert('<spring:message code="common.select.msg" arguments="${cnsltInboundMgrProcIdText}"/>');
   	}
}


// 그리드 reload
function fn_all_grid_reload(){

	cnsltInBoundMgrProcTable.draw();
}


function cstmrSearch(){
	
}
function rtnCnsltTypeList(){
	
}
function rtnCnsltTypeListData(){
	
}
function cnsltntSearch(){
	
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
                매니저 상담처리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리</a></li>
                <li class="active">매니저 상담처리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="cnsltInBoundMngVO" name="cnsltInBoundMngVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>
                <input type="hidden" name="searchBeginDe" id="searchBeginDe" value=""/>
                <input type="hidden" name="searchEndDe" id="searchEndDe" value=""/>
		        <input type="hidden" name="callbackClass"/>
		        <input type="hidden" name="selectStyle" value="single"/>
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                    	<h3 class="box-title">검색</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal">
                            <div class="form-group">
                                <label for="searchCnsltDe" class="col-sm-2 control-label">상담일자</label>
                                <div class="col-sm-4">
					                <div class="input-group">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
	                                  <input type="text" class="form-control pull-right" name="cnsltDe" id="cnsltDe">
	                                </div>
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label for="searchShopNm" class="col-sm-2 control-label">전시장</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchShopNm" class="form-control" id="searchShopNm"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCustNm" class="col-sm-2 control-label">고객명</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
                                        	<input type="hidden" name="searchCstmrCd" class="form-control" id="searchCstmrCd"/>
	                                        <input type="text" name="searchCstmrNm" class="form-control" id="searchCstmrNm"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="custPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                </div>
                                <label for="searchHpno" class="col-sm-2 control-label">핸드폰</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchHpno" class="form-control" id="searchHpno"/>
                                </div>
                                <label for="searchTelno" class="col-sm-2 control-label">일반전화</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchTelno" class="form-control" id="searchTelno"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCnsltnt" class="col-sm-2 control-label">상담원</label>
                                <div class="col-sm-2">
                                    <div class="input-group">
                                    	<input type="hidden" name="searchCnsltUserId" class="form-control" id="searchCnsltUserId"/>
                                     <input type="text" name="searchCnsltUserNm" class="form-control" id="searchCnsltUserNm"/>
                                     <div class="input-group-btn">
                                         <button type="button" id="cnsltntPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                                     </div>
                                 </div>
                                </div>

                                <label for="cnsltTyCn" class="col-sm-2 control-label">상담유형</label>
                                <div class="col-sm-6">
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
                                <label for="searchVocKnd" class="col-sm-2 control-label">CMS구분</label>
                                <div class="col-sm-2">
                                       <form:select path="searchVocKnd" class="form-control input-sm">
                                           <form:option value="">-- 선택 --</form:option>
                                           <form:options items="${vocKndList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>                                        
                                    <!-- <select class="form-control" id="searchVocKnd" name="searchVocKnd">
                                        <option value="">선택</option>
                                        <option value="SCMS">SCMS</option>
                                        <option value="CCMS">CCMS</option>
                                    </select> -->
                                </div>
                                <label for="searchCnsltKnd" class="col-sm-2 control-label">상담구분</label>
                                <div class="col-sm-2">
                                    <form:select path="searchCnsltKnd" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltKndList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>    
                                    <!-- <select class="form-control" id="searchCnsltKnd">
                                        <option value="N">일반접수</option>
                                        <option value="C">클레임접수</option>
                                        <option value="V">VOC</option>
                                    </select> -->
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchBussplc" class="col-sm-2 control-label">사업소</label>
                                <div class="col-sm-2">
                                       <%-- <form:select path="searchBussplcCd1" cssClass="form-control input-sm selectBpc1">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="searchBussplcCd1" /> --%>
                                       <select class="form-control" name="searchBussplcCd1" id="searchBussplcCd1">
                                           <option value="N">네트워크</option>
                                       </select>
                                </div>
                                <div class="col-sm-2">
                                       <form:select path="searchBussplcCd2" cssClass="form-control input-sm selectBpc2">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="searchBussplcCd2" />
                                </div>
                                <div class="col-sm-3">
                                       <form:select path="searchBussplcCd3" cssClass="form-control input-sm selectBpc3">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="searchBussplcCd3" />
                                </div>
                                <div class="col-sm-3">
                                       <form:select path="searchBussplcCd4" cssClass="form-control input-sm selectBpc4">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="searchBussplcCd4" />
                                </div>
                            </div>
                            <div class="col-sm-12" id="searchClaimDiv" style="display:none;">
		                            <div class="form-group">
		                                <label for="searchCnsltCategory" class="col-sm-2 control-label">상담카테고리</label>
		                                <div class="col-sm-2 dstick">
		                                    <form:select path="searchCnsltCategory" cssClass="form-control input-sm selectCategy">
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="searchCnsltCategory" />
		                                </div>
		                                <label for="searchCmplCdNm" class="col-sm-2 control-label">불만코드</label>
		                                <div class="col-sm-2">
		                                    <div class="input-group">
		                                        <input type="text" name="searchCmplCdNm" class="form-control" id="searchCmplCdNm" readOnly/>
		                                        <input type="hidden" name="searchCmplCd" class="form-control" id="searchCmplCd" readOnly/>
		                                        <input type="hidden" name="searchCmplCd1No" id="searchCmplCd1No" readOnly/>
		                                        <input type="hidden" name="searchCmplCd2No" id="searchCmplCd2No" readOnly/>
		                                        <input type="hidden" name="searchCmplCd3No" id="searchCmplCd3No" readOnly/>
		                                        <input type="hidden" name="searchCmplCd4No" id="searchCmplCd4No" readOnly/>
		                                        <input type="hidden" name="searchCmplCdLvl" id="searchCmplCdLvl" readOnly/>
		                                        <input type="hidden" name="searchCmplCd1Nm" id="searchCmplCd1Nm" readOnly/>
		                                        <input type="hidden" name="searchCmplCd2Nm" id="searchCmplCd2Nm" readOnly/>
		                                        <input type="hidden" name="searchCmplCd3Nm" id="searchCmplCd3Nm" readOnly/>
		                                        <input type="hidden" name="searchCmplCd4Nm" id="searchCmplCd4Nm" readOnly/>
		                                        <div class="input-group-btn">
		                                            <button type="button" id="searchCmplCdPop" class="btn btn-info btn-flat">
		                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
		                                            <i class="fa fa-search"></i></button>
		                                        </div>
		                                    </div>
		                                </div>
		                                <label for="searchCmplSittnCd" class="col-sm-2 control-label">불만상황</label>
		                                <div class="col-sm-2 dstick">
		                                    <form:select path="searchCmplSittnCd" cssClass="form-control input-sm selectCmpl">
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="searchCmplSittnCd" />
		                                </div>
		                            </div>
		                            <div class="form-group">
		                                <label for="searchCnsltTitle" class="col-sm-2 control-label">상담제목</label>
		                                <div class="col-sm-10 dstick">
		                                    <input type="text" name="searchCnsltTitle" class="form-control" id="searchCnsltTitle"/>
		                                </div>
		                            </div>
                            </div>
                            
                            
                        </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
                        <!-- <button type="button" class="btn btn-primary"> 등록</button>
                        <button type="button" class="btn btn-warning"> 삭제</button> -->
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
                </form:form>
            </div>
        </div>


	    <!-- ############################# 메인화면 ######################  -->
      	<div class="box box-primary">
        	<!-- <div class="col-xs-12"> --> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-list"></i>리스트</h3>
                        <div class="box-tools pull-right">
                                <%-- <button type="button" id="btnInsert" class="btn btn-sm btn-primary"><spring:message code="button.create"/></button> --%>
                                <button type="button" id="btnUpdate" class="btn btn-sm btn-primary disabled"><spring:message code="button.update"/></button>
                                <button type="button" id="btnURLShortSMSSend" class="btn btn-sm btn-primary disabled">고객이 파일첨부할 URL SMS발송</button>  <!-- 어떤버튼인지 알기쉽게 버튼명 길게 만들었다. 최종 개발할때 버튼명 교정필요 -->
                                <%-- <button type="button" id="btnDeleteAction" class="btn btn-sm btn-warning disabled"><spring:message code="button.delete"/></button> --%>
                        </div>
                    </div>
                    <!-- /.box-header -->


                    <div class="box-body table-responsive">
							<table id="cnsltInBoundMgrProcTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th><spring:message code="cmm.seq"/></th>
					                <th>고객번호</th>
					                <th>콜번호</th>
					                <th>고객명</th>
					                <th>통화자</th>
					                <th>상담원명</th>
					                <th>상담일자</th>
					                <th>상담구분</th>
					                <th>상담유형</th>
					                <th>상담내용</th>
					                <th>연락처</th>
					                <th>차종</th>
					                <!-- <th>VOC코드1</th>
					                <th>VOC코드2</th>
					                <th>VOC코드3</th> -->
					                <th>처리구분</th>
					              </tr>
					            </thead>
				          </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- <<<<<<<< box THE END -->
        	<!-- </div> -->
		</div>
      <!-- /.row -->
      
      
      








    </section>
    <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

</div>
<!-- ./wrapper -->
<form name="actionForm" method="post">
</form>

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

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
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
            <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
            <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
            <input type="hidden" name="searchCnsltTyCnCode" id="searchCnsltTyCnCode" value=""/>
	    </form>
</body>
</html>
