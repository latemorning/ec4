<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltOutBoundMng.java
  * @Description : EC4CnsltOutBoundMng List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.26    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.04.26
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
    <title>상담화면(Out)</title>
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
    $("#callColectDt").daterangepicker({ //참조: http://www.daterangepicker.com/
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
    $('#callColectDt').on('apply.daterangepicker', function(ev, picker) { 
    	//console.log(picker.startDate.format('YYYY-MM-DD')); 
    	//console.log(picker.endDate.format('YYYY-MM-DD')); 
    	$("#searchBeginDe").val(picker.startDate.format('YYYY-MM-DD'));
    	$("#searchEndDe").val(picker.endDate.format('YYYY-MM-DD'));
    }); 
    $('#callColectDt').on('cancel.daterangepicker', function(ev, picker) {
    	//취소눌러도 검색기본조건으로 사용되도록 초기화하지 않는다
    	//$('#callColectDt').val(''); 
    }); 

    
    $("#searchCnsltUserId").val("${searchCnsltOutBoundMngVO.searchCnsltUserId}");
    $("#searchCnsltUserNm").val("${searchCnsltOutBoundMngVO.searchCnsltUserNm}");
    $("#cnsltntPop").hide();
    $("#searchCnsltUserNm").attr('readonly', true);



    
    
    


    // 대상고객 테이블
    listCnsltOutBoundTable = $('#listCnsltOutBoundTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 3, "desc" ]],
        "rowId": "cstmrCd",
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
        "sAjaxSource": "<c:url value='/ec4/call/outbd/selectCnsltOutBoundList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
            		{"name": "searchCstmrCd",   "value": $("#searchCnsltOutBoundMngVO input[name=searchCstmrCd]").val()},
            		{"name": "searchCstmrNm",   "value": $("#searchCnsltOutBoundMngVO input[name=searchCstmrNm]").val()},
            		{"name": "searchCnsltUserId",   "value": $("#searchCnsltOutBoundMngVO input[name=searchCnsltUserId]").val()},
            		{"name": "searchCnsltUserNm",   "value": $("#searchCnsltOutBoundMngVO input[name=searchCnsltUserNm]").val()},
            		{"name": "scriptKnd",   "value": $("#searchCnsltOutBoundMngVO select[name=scriptKnd] option:selected").val()},
            		{"name": "scriptCd",       "value": $("#searchCnsltOutBoundMngVO select[name=scriptCd] option:selected").val()},
            		{"name": "searchBeginDe",   "value": $("#searchCnsltOutBoundMngVO input[name=searchBeginDe]").val()},
            		{"name": "searchEndDe",     "value": $("#searchCnsltOutBoundMngVO input[name=searchEndDe]").val()},
            		{"name": "searchHpno",       "value": $("#searchCnsltOutBoundMngVO input[name=searchHpno]").val()},
            		{"name": "callState",       "value": $("#searchCnsltOutBoundMngVO select[name=callState] option:selected").val()},
            		{"name": "callAsign",       "value": $("#searchCnsltOutBoundMngVO select[name=callAsign] option:selected").val()},
            		{"name": "searchCnsltTyCn",   "value": $("#searchCnsltOutBoundMngVO input[name=cnsltTyCn]").val()},
            		{"name": "searchCnsltTyCnCode",   "value": $("#searchCnsltOutBoundMngVO input[name=cnsltTyCnCode]").val()},
            		{"name": "instAsignKnd",   "value": $("#searchCnsltOutBoundMngVO select[name=instAsignKnd] option:selected").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,3,4,5]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},//순번
            {"data":"makrCd", "defaultContent": ""},//브랜드
            {"data":"callCd", "defaultContent": ""},//콜번호
            {"data":"callColectGbCd", "defaultContent": ""},//수집구분
            {"data":"cstmrCd", "defaultContent": ""},//고객코드
            {"data":"callCstmrCdSeq", "defaultContent": ""},//고객순번
            {"data":"callColectGbNm", "defaultContent": ""},//수집구분명
            {"data":"scriptKndNm", "defaultContent": ""},//스크립트구분
            {"data":"scriptCdNm", "defaultContent": ""},//스크립트제목
            {"data":"recvNo", "defaultContent": ""},//접수번호
            {"data":"hdqrtrsNm", "defaultContent": ""}, //본부명
            {"data":"replcSeCode", "defaultContent": ""}, //사업소코드
            {"data":"replcNm", "defaultContent": ""}, //사업소명
            {"data":"asignCnsltUserId", "defaultContent": ""},//배분상담원id
            {"data":"asignCnsltUserNm", "defaultContent": ""},//배분상담원명
            {"data":"asignDt", "defaultContent": ""},//배분일자
            {"data":"cstmrNm", "defaultContent": ""},//고객명
            {"data":"carNo", "defaultContent": ""},//차량번호
            {"data":"carNm", "defaultContent": ""},//차량명
            {"data":"hpno", "defaultContent": ""}//핸드폰
        ]
    });


    // 검색 input search
    $("#searchCnsltOutBoundMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	listCnsltOutBoundTable.search(this.value).draw();
        }

    });


    // 검색 select search
    $("#searchCnsltOutBoundMngVO select").on("change", function(key){

    	listCnsltOutBoundTable.search(this.value).draw();
    });


    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	listCnsltOutBoundTable.search(this.value).draw();
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#searchCnsltOutBoundMngVO input[name=searchCstmrNm]").val() == ""){
			$("#searchCnsltOutBoundMngVO input[name=searchCstmrCd]").val("");
		}
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
        popupParams.form = document.searchCnsltOutBoundMngVO;


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

    
    $('#listCnsltOutBoundTable tbody').on('dblclick', 'tr', function () {
    	
    	
    	$("div.modal").modal(
    			{"backdrop": "static",
    		     "keyboard": false,
    		     "remote": "<c:url value='/ec4/call/outbd/cnsltOutBoundMngRegPop.do'/>"
    	});
    	
    	
    	/* var popupParams = {};
    	
    	var idx = $(this).index();
    	var rowData = listCnsltOutBoundTable.rows(idx).data();

    	var txtCodeId = rowData[0].codeId+"/"+rowData[0].codeIdLv2+"/"+rowData[0].codeIdLv3+"/"+rowData[0].codeIdLv4;
    	var txtCodeNm = rowData[0].codeNm+"/"+rowData[0].codeNmLv2+"/"+rowData[0].codeNmLv3+"/"+rowData[0].codeNmLv4;

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/outbd/cnsltOutBoundMngRegPop.do'/>";//EC4CnsltOutBoundMngRegPop

        popupParams.width = "1300";
        popupParams.height = "900";
        popupParams.title = "popupCnsltOutBoundMngReg";
        popupParams.form = document.searchCnsltOutBoundMngVO;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	 */


    } );    

	


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

        fn_all_grid_reload();
    });
	
});






//그리드 reload
function fn_all_grid_reload(){

	listCnsltOutBoundTable.draw();
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
                상담화면(Out)
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리(Out)</a></li>
                <li class="active">상담화면</li>
            </ol>
        </section>

	<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
      	<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="searchCnsltOutBoundMngVO" name="searchCnsltOutBoundMngVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>
                <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
                <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
                <input type="hidden" name="searchCnsltTyCnCode" id="searchCnsltTyCnCode" value=""/>
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
                                <label for="searchCallColectDt" class="col-sm-2 control-label">생성일자</label>
                                <div class="col-sm-4">
					                <div class="input-group">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
	                                  <input type="text" class="form-control pull-right" name="callColectDt" id="callColectDt">
	                                </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCallKnd" class="col-sm-2 control-label">스크립트구분</label>
                                <div class="col-sm-2">
                                    <form:select path="scriptKnd" class="form-control input-sm" alt="스크립트구분">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scriptKnd" />
                                </div>
                                <label for="searchScriptCd" class="col-sm-2 control-label">스크립트제목</label>
                                <div class="col-sm-2">
                                    <form:select path="scriptCd" class="form-control input-sm" alt="스크립트제목">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptTitleList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scriptCd" />
                                </div>
                                <label for="searchCallState" class="col-sm-2 control-label">콜진행상태</label>
                                <div class="col-sm-2">
                                    <form:select path="callState" class="form-control input-sm" alt="콜진행상태">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${callStateList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="callState" />
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
                                <label for="searchCnsltnt" class="col-sm-2 control-label">담당상담원</label>
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
                            <div class="form-group">
                                <label for="searchCarNo" class="col-sm-2 control-label">차량번호</label>
                                <div class="col-sm-2">
                                    <input type="text" name="searchCarNo" class="form-control" id="searchCarNo"/>
                                </div>
                                <label for="searchHpno" class="col-sm-2 control-label">핸드폰번호</label>
                                <div class="col-sm-2">
                                    <input type="text" name="searchHpno" class="form-control" id="searchHpno"/>
                                </div>
                                <%-- <label for="searchCallAsign" class="col-sm-2 control-label">배정상태</label>
                                <div class="col-sm-2">
                                    <form:select path="callAsign" class="form-control input-sm" alt="배정상태">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${callAsignList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="callAsign" />
                                </div> --%>
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
      	<div class="row">
        	<div class="col-xs-12"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-top:5px;padding-top:5px;float:left;">리스트</h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding" style="height:750px;">
				          <table id="listCnsltOutBoundTable" class="table table-hover">
				            <thead>
				              <tr>
				                <th>순번</th>
				                <th>브랜드</th>
				                <th>콜번호</th>
				                <th>수집구분코드</th>
				                <th>고객코드</th>
				                <th>고객순번</th>
				                <th>수집구분</th>
				                <th>스크립트구분</th>
				                <th>스크립트제목</th>
				                <th>접수번호</th>
				                <th>본부명</th>
				                <th>사업소코드</th>
				                <th>사업소명</th>
				                <th>배분상담원ID</th>
				                <th style="background-color:#FFFF00;">배분상담원</th>
				                <th style="background-color:#EBF1FB;">배분일자</th>
				                <th>고객명</th>
				                <th>차량번호</th>
				                <th>차량명</th>
				                <th>휴대폰</th>
				              </tr>
				            </thead>
				            <tbody>
				          	</tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- <<<<<<<< box THE END -->
        	</div>
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

        <div class="modal modal-center fade" id="modal-default">
            <div class="modal-dialog modal-large modal-center">
                <div class="modal-content modal-large">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
<!-- /.modal -->
	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	    </form>
</body>
</html>