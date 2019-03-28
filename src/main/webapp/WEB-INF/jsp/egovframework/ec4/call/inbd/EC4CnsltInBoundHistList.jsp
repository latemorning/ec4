<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltInBoundMng.java
  * @Description : EC4CnsltInBoundHist List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.23    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.04.23
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
    <title>고객상담이력</title>
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


    
    



    // 콜상담 테이블
    callCnsltTable = $('#callCnsltTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[1, "desc"]],
        "rowId": "cnsltInBdId",
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
        "sAjaxSource": "<c:url value='/ec4/call/inbd/selectCallCnsltHistList.do'/>", /*내역조회, 이력조회 같은쿼리 호출한다. 요건확인후 다시 작업해야함*/
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrCd]").val()},
                    {"name": "searchCstmrNm",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno",   "value": $("#cnsltInBoundMngVO input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres", "value": $("#cnsltInBoundMngVO input[name=searchEmailAdres]").val()},
                    {"name": "searchCnsltUserId",   "value": $("#cnsltInBoundMngVO input[name=searchCnsltUserId]").val()},
                    {"name": "searchCnsltUserNm",   "value": $("#cnsltInBoundMngVO input[name=searchCnsltUserNm]").val()},
                    {"name": "cnsltTyCn",   "value": $("#cnsltInBoundMngVO input[name=cnsltTyCn]").val()},
                    {"name": "cnsltTyCnCode",   "value": $("#cnsltInBoundMngVO input[name=cnsltTyCnCode]").val()},
                    {"name": "searchCnsltKnd", "value": $("#cnsltInBoundMngVO select[name=cnsltKnd] option:selected").val()},
                    {"name": "vmcd", "value": $("#cnsltInBoundMngVO select[name=vmcd] option:selected").val()},
                    {"name": "vhctCd", "value": $("#cnsltInBoundMngVO select[name=vhctCd] option:selected").val()},
                    {"name": "vhclMdl", "value": $("#cnsltInBoundMngVO select[name=vhclMdl] option:selected").val()},
                    {"name": "vhclDetlMdl", "value": $("#cnsltInBoundMngVO select[name=vhclDetlMdl] option:selected").val()},
                    {"name": "searchCarNo", "value": $("#cnsltInBoundMngVO input[name=searchCarNo]").val()},
                    {"name": "searchBeginDe",   "value": $("#cnsltInBoundMngVO input[name=searchBeginDe]").val()},
                    {"name": "searchEndDe",   "value": $("#cnsltInBoundMngVO input[name=searchEndDe]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            /* {"visible": false, "targets": [1, 5, 7, 10, 14]}, */
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 0
            {"data":"cstmrNm" , "defaultContent" : ""},                                 // 1   1
            {"data":"callerNm" , "defaultContent" : ""},                                 // 1   1
            {"data":"cnsltNm" , "defaultContent" : ""},                               // 2   1
            {"data":"cnsltDt" , "defaultContent" : ""},                                   // 3
            {"data":"cnsltKndNm" , "defaultContent" : ""},                                     // 4
            {"data":"callTypeNm" , "defaultContent" : ""},                             // 5
            {"data":"cnsltDscr" , "defaultContent" : ""},                           // 6   4   1
            {"data":"telno" , "defaultContent" : ""},                                // 7   5
            {"data":"vhctyNm" , "defaultContent" : ""},                                // 8   5
            {"data":"cmplCd1Nm" , "defaultContent" : ""},                                // 9   5
            {"data":"cmplCd2Nm" , "defaultContent" : ""},                                // 10   5
            {"data":"cmplCd3Nm" , "defaultContent" : ""},                                // 11   5
            {"data":"processSttusNm" , "defaultContent" : ""}                                // 12   5
        ]
    });


    // 콜상담 검색 input search
    $("#cnsltInBoundMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	callCnsltTable.search(this.value).draw();
        }
    });


    // 콜상담 검색 select search
    $("#cnsltInBoundMngVO select").on("change", function(key){

    	callCnsltTable.search(this.value).draw();
    });
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	callCnsltTable.search(this.value).draw();
    });


	$(document).on("click","#custPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
        $("#popupForm input[name=hpno]").val($("#searchHpno").val());
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
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#cnsltInBoundMngVO input[name=searchCstmrNm]").val() == ""){
			$("#cnsltInBoundMngVO input[name=searchCstmrCd]").val("");
		}
	});


	$(document).on("click","#cnsltntPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cnsltUserNm]").val($("#searchCallCnsltForm input[name=searchCnsltUserNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cnsltUserNm]").val($("#searchCnsltUserNm").val());
        $("#popupForm input[name=hpno]").val($("#searchHpno").val());
        $("#popupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/cnslt/cnsltntPop.do'/>";

        popupParams.width = "1250";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.popupForm;


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

});
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
                고객상담이력
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리(In)</a></li>
                <li class="active">고객상담이력</li>
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
                <div class="box box-primary">
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
                            </div>
                            <div class="form-group">
                                <label for="searchCstmrNm" class="col-sm-2 control-label">고객명</label>
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
                                <div></div>
                            </div>
                            <div class="form-group">
                                <label for="searchVchl" class="col-sm-2 control-label">차량정보</label>
                                <div class="col-sm-10">
                                   <div class="col-sm-12 dstick">
	                                    <div class="col-sm-3 dstick">
		                                    <form:select path="vhclMdl" class="form-control input-sm selectVhclMdl">
		                                        <form:option value="">-- 모델 --</form:option>
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclMdl" />
	                                    </div>
	                                    <div class="col-sm-6 dstick">
		                                    <form:select path="vhclDetlMdl" class="form-control input-sm selectDetlMdl">
		                                        <form:option value="">-- 세부모델 --</form:option>
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclDetlMdl" />
	                                    </div>
                                   </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCarNo" class="col-sm-2 control-label">차량번호</label>
                                <div class="col-sm-2">
                                	<input type="text" name="searchCarNo" class="form-control" id="searchCarNo"/>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">상담구분</label>
                                <div class="col-sm-2">
	                                    <form:select path="cnsltKnd" class="form-control input-sm">
	                                        <form:option value="">-- 선택 --</form:option>
	                                        <form:options items="${cnsltKndList}" itemValue="code" itemLabel="codeNm"/>
	                                    </form:select>	
                                </div>
                               	<label for="searchCnaltType" class="col-sm-2 control-label">상담유형</label>
                                <div class="col-sm-2">
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
                    </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
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
                        <h3 class="box-title">리스트</h3>
                        <div class="box-tools">
                               &nbsp;
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body table-responsive">
				          <table id="callCnsltTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th><spring:message code="cmm.seq"/></th>
					                <th>고객명</th>
					                <th>통화자</th>
					                <th>상담원명</th>
					                <th>상담일자</th>
					                <th>상담구분</th>
					                <th>상담유형</th>
					                <th>상담내용</th>
					                <th>연락처</th>
					                <th>차종</th>
					                <th>VOC코드1</th>
					                <th>VOC코드2</th>
					                <th>VOC코드3</th>
					                <th>처리구분</th>
					              </tr>
					            </thead>
					            <tbody>
					            </tbody>
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


	    <form name="popupForm" method="post" id="popupForm">
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
