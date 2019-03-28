<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4VhcleModelController.java
  * @Description : EC4VhcleModelController List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.01.15    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2019.01.15
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
    <title>차량정보 관리</title>
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

    
    
    $("#detailLinkVhcleModelTableDIV").hide();
    $("#btnLinkInsertAction").addClass("disabled");
    


    // 차량상세모델 테이블    
    detailVhcleModelTable = $('#detailVhcleModelTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 1, "desc" ]],
        "rowId": "vhcleModelId",
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
        "sAjaxSource": "<c:url value='/ec4/cmm/cbase/vhi/selectVhcleDetailModelList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchVhcleModelId",   "value": $("#vhcleModelVO select[name=searchVhcleModelId] option:selected").val()},
                    {"name": "searchUseAt",   "value": $("#vhcleModelVO select[name=searchUseAt] option:selected").val()},
                    {"name": "searchDetailModelNm",   "value": $("#vhcleModelVO input[name=searchDetailModelNm]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,2,6]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},
            {"data":"vhcleModelId", "defaultContent": ""},
            {"data":"detailModelId", "defaultContent": ""},
            {"data":"detailModelNm", "defaultContent": ""},
            {"data":"mdyrBegin", "defaultContent": ""},
            {"data":"mdyrEnd", "defaultContent": ""},
            {"data":"vhcleModelNm", "defaultContent": ""},
            {"data":"linkVhcleModel"},
            {"data":"useAt", "defaultContent": "", "width":"10%"}
        ]
    });

    

    // 검색 input search
    $("#vhcleModelVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

    		if( $("#detailLinkVhcleModelTableDIV").is(':visible') ){
    	    	detailLinkVhcleModelTable.search(this.value).draw();
    		}else{
        		detailVhcleModelTable.search(this.value).draw();
    		}
        }

    });


    // 검색 select search
    $("#vhcleModelVO select").on("change", function(key){

		if( $("#detailLinkVhcleModelTableDIV").is(':visible') ){
	    	detailLinkVhcleModelTable.search(this.value).draw();
		}else{
	    	detailVhcleModelTable.search(this.value).draw();
		}
    });


    // 선택
    detailVhcleModelTable.on("select", function (e, dt, type, indexes) {

        $("#btnUpdate").removeClass("disabled");
        $("#btnDeleteAction").removeClass("disabled");
    }).on("deselect", function (e, dt, type, indexes) {

        $("#btnUpdate").addClass("disabled");
        $("#btnDeleteAction").addClass("disabled");
    });


    // 등록버튼
    $("#btnInsert").click(function(){

		if( $("#detailLinkVhcleModelTableDIV").is(':visible') ){
	    	alert("IF조회결과는 등록버튼 사용이 불가합니다.");
	    	return;
		}

        var params = {};

        var frm = document.actionForm;

        // 등록 팝업 오픈
        fn_detailVhcleModel_reg_popup(params);
    });


    // 수정버튼
    $("#btnUpdate").click(function(){

		if( $("#detailLinkVhcleModelTableDIV").is(':visible') ){
			alert("IF조회결과는 수정버늩 사용이 불가합니다.");
	    	return;
		}

        var params = {};

        var rowData = detailVhcleModelTable.rows(".selected").data();
        if(rowData[0]){
            params.detailModelId = rowData[0].detailModelId;
        }
        
        // 수정 팝업 오픈
        fn_detailVhcleModel_mod_popup(params);
    });


    // 삭제
    $("#btnDeleteAction").click(function(){

		if( $("#detailLinkVhcleModelTableDIV").is(':visible') ){
	    	alert("IF조회결과는 삭제 불가합니다.");
	    	return;
		}

        if(!$(this).hasClass("disabled")){

            if(confirm('<spring:message code="common.delete.msg"/>')){

                var params = {};
                var rowData = detailVhcleModelTable.rows(".selected").data();

                if(rowData[0]){
                    params.detailModelId = rowData[0].detailModelId;
                }

                if(!params.detailModelId){

                    alert('<spring:message code="common.delete.pre.msg" arguments="${cmpgnIdText}"/>');
                } else {

                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/deleteVhcleDetailModel.do'/>",
                        "data": params,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                detailVhcleModelTable.search("").draw();
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });
                }//if
            }//confirm
        }//hasClass
    });


    // 인터페이스 상세모델 조회
    $("#btnInterfaceSearch").click(function(){
    	
        $("#detailVhcleModelTableDIV").hide();
        $("#detailLinkVhcleModelTableDIV").show();
        $("#btnLinkInsertAction").removeClass("disabled");
        
        $("#btnInsert").addClass("disabled");
        $("#btnUpdate").addClass("disabled");
        $("#btnDeleteAction").addClass("disabled");
        
        
    	$('#detailLinkVhcleModelTable').DataTable().clear().destroy();
        detailLinkVhcleModelTable = $('#detailLinkVhcleModelTable').DataTable({
            "language": lang_kor,
            /* "select": {
                "style": "single"
            }, */
            "order": [[ 1, "desc" ]],
            "rowId": "detailModelId",
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
            "sAjaxSource": "<c:url value='/ec4/cmm/cbase/vhi/selectLinkVhcleDetailModelList.do'/>",
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "searchDetailModelNm",   "value": $("#vhcleModelVO input[name=searchDetailModelNm]").val()}
                );
            },
            "sServerMethod": "POST",
            "columnDefs": [
                {"visible": false, "targets": [1,5]},
                {"orderable": false, "targets": [0]},
                {
                    'targets': 6,
                    'searchable': false,
                    'orderable': false,
                    //'className': 'dt-body-center',
                    'render': function (data, type, full, meta){
                    	if("" == nvl(data,"")){
                            return '<form:select path="vhcleModelId" class="form-control input-sm selectDtlVhclMdl"><form:option value=""> 모델  </form:option><form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/></form:select>';
                    	}else{
                    		return data;
                    	}
                    }
                 }
            ],
            "columns": [
                {"data":"rn", "width":"5%"},
                {"data":"detailModelId", "defaultContent": ""},
                {"data":"detailModelNm", "defaultContent": ""},
                {"data":"mdyrBegin", "defaultContent": "", "width":"12%"},
                {"data":"mdyrEnd", "defaultContent": "", "width":"10%"},
                {"data":"vhcleModelNm", "defaultContent": ""},
                {"data":"linkVhcleModel"},
                {"data":"useAt", "defaultContent": "", "width":"8%"},
                {"data":"ifMdlCode", "defaultContent": ""}
            ],
            "drawCallback": function(data) {
        	    $(".selectDtlVhclMdl").select2({
        	    	"ajax": {
        	   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
        	   		    "dataType": 'json',
        	   		    "delay": 250,
        	   		    "data": function (params) {
        	   		        return {
        	   		            "upCodeId": "",/* 차종 */
        	   		            "cnsltSeCode": "",/* 제조사 */
        	   		            "codeId": ""
        	   		        };
        	   		    }
        	   		},
        	    	"placeholder": "-- 모델 --",
        	        "width": "100%",
        	        "tags": false,
        	        "minimumResultsForSearch": 100
        	    });	
             }
        });
    });


    // 링크상세모델 등록
    $("#btnLinkInsertAction").click(function(){

		if( $("#detailVhcleModelTableDIV").is(':visible') ){
	    	alert("일발조회결과는 IF등록 불가합니다.");
	    	return;
		}

        if(!$(this).hasClass("disabled")){


	                var params = {};
	                var rowData = $('#detailLinkVhcleModelTable').DataTable().rows().data();
	                var formData = $("#vhcleDetailModelVO").serializeArray();
	
	                if(rowData.length < 1){
	                    //alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
	                    alert("IF조회후 IF등록하세요.");
	                    return;
	                }else{
	                    /* for(var i=0 ; i<rowData.length ; i++){
	                        formData.push({name:"detailLinkVhcleModelTable["+i+"].detailModelNm", value:rowData[i].detailModelNm});
	                        formData.push({name:"detailLinkVhcleModelTable["+i+"].mdyrBegin", value:rowData[i].mdyrBegin});
	                        formData.push({name:"detailLinkVhcleModelTable["+i+"].mdyrEnd", value:rowData[i].mdyrEnd});
	                        formData.push({name:"detailLinkVhcleModelTable["+i+"].vhcleModelNm", value:rowData[i].vhcleModelNm});
	                        formData.push({name:"detailLinkVhcleModelTable["+i+"].vhcleModelId", value:rowData[i].vhcleModelId});
	                        formData.push({name:"detailLinkVhcleModelTable["+i+"].useAt", value:rowData[i].useAt});
	                        console.log(rowData[i]);
	                    }
						$.each(rowData, function(index){
							if("" != nvl($("select[name=vhcleModelId"+index+"] option:selected").val(),"")){
								alert($("select[name=vhcleModelId"+index+"] option:selected").val());
							}
		                });  */
		                var tableIdx=0;
	            		$('#vhcleDetailModelVO .selectDtlVhclMdl').each(function(idx){
	            			//if (!$(this).is('option:selected')) {  이거 안먹힌다
	            			if ("" != nvl($(this).val(),"")){
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].detailModelNm", value:rowData[idx].detailModelNm});
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].mdyrBegin", value:rowData[idx].mdyrBegin});
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].mdyrEnd", value:rowData[idx].mdyrEnd});
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].vhcleModelNm", value:rowData[idx].vhcleModelNm});
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].vhcleModelId", value:nvl($(this).val(),"")});
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].useAt", value:rowData[idx].useAt});
		                        formData.push({name:"detailLinkVhcleModelTable["+tableIdx+"].ifMdlCode", value:rowData[idx].ifMdlCode});
		                        tableIdx++;
	            			} 
	            		});
	                }

                
                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/insertLinkDetailVhcleModel.do'/>",
                        "data": formData,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                detailLinkVhcleModelTable.search("").draw();
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });
        }//hasClass
    });
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	
        $("#detailVhcleModelTableDIV").show();
        $("#detailLinkVhcleModelTableDIV").hide();
        $("#btnLinkInsertAction").addClass("disabled");
        $("#btnInsert").removeClass("disabled");
        
    	detailVhcleModelTable.search(this.value).draw();
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
   		            "codeId": $("select[name=vhcleModelId] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	

	
    

	$(document).on("click","#btnNewVhcleModelPop",function() {
        var popupParams = {};
        
        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/cmm/cbase/vhi/newVhcleModelListPop.do'/>";

        popupParams.width = "600";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);

    });
	
	
	


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

        fn_all_grid_reload();
    });

});



// 등록 팝업 오픈
function fn_detailVhcleModel_reg_popup(params){

    $("div.modal-content").load("<c:url value='/ec4/cmm/cbase/vhi/detailVhcleModelRegPopup.do'/>", params, function(response, status, xhr) {

        if(status == "success"){

            $("div.modal").modal({"backdrop": "static", "keyboard": false});
        }else if(status == "error"){

            alert("ERROR : " +
                    "\n Status Code : " + xhr.status
                    + "\n Status Text : " + xhr.statusText
                    //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
                 );
            return;
        }
    });
}


// 수정 팝업 오픈
function fn_detailVhcleModel_mod_popup(params){

   	if(params.detailModelId){

        $("div.modal-content").load("<c:url value='/ec4/cmm/cbase/vhi/detailVhcleModelModPopup.do'/>", params, function(response, status, xhr) {

            if(status == "success"){

                $("div.modal").modal({"backdrop": "static", "keyboard": false});
            }else if(status == "error"){

                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
   	}else{

   		alert('<spring:message code="common.select.msg" arguments="${cmpgnIdText}"/>');
   	}
}


// 그리드 reload
function fn_all_grid_reload(){

	detailVhcleModelTable.draw();
}


function cstmrSearch(){
	
}
function rtnCnsltTypeList(){
	
}
function rtnCnsltTypeListData(){
	
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
                차량정보 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">기준정보</a></li>
                <li class="active">차량정보관리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="vhcleModelVO" name="vhcleModelVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>
            	<!-- >>>>>>>>>>>> box START -->
            	<input type="text" style="display:none;"/>
                <div class="box">
                    <div class="box-header with-border">
                    	<h3 class="box-title">상세모델검색</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal">
                            <div class="form-group">
                                <label for="searchVhcleModelId" class="col-sm-2 control-label">차종</label>
                                <div class="col-sm-2">
	                                    <form:select path="searchVhcleModelId" class="form-control input-sm selectVhclMdl">
	                                        <form:option value="">-- 모델 --</form:option>
	                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                    </form:select>
	                                    <form:errors cssClass="help-block" path="searchVhcleModelId" />
                                </div>
                                <label for="searchDetailModelNm" class="col-sm-2 control-label">상세모델명</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchDetailModelNm" class="form-control" id="searchDetailModelNm"/>
                                </div>
                                <label for="searchUseAt" class="col-sm-2 control-label">사용여부</label>
                                <div class="col-sm-2">
	                                    <select name="searchUseAt" class="form-control input-sm">
	                                        <option value="">-- 사용여부선택 --</option>
	                                        <option value="Y">사용</option>
	                                        <option value="N">미사용</option>
	                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
                        <button type="button" class="btn btn-info" id="btnInterfaceSearch"> IF조회</button>
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
                                <button type="button" id="btnInsert" class="btn btn-sm btn-primary"><spring:message code="button.create"/></button>
                                <button type="button" id="btnUpdate" class="btn btn-sm btn-primary disabled"><spring:message code="button.update"/></button>
                                <button type="button" id="btnDeleteAction" class="btn btn-sm btn-warning disabled"><spring:message code="button.delete"/></button>
                                <button type="button" id="btnLinkInsertAction" class="btn btn-sm btn-primary disabled">IF등록</button>
                                <button type="button" id="btnNewVhcleModelPop" class="btn btn-default btn-primary">모델등록</button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive" id="detailVhcleModelTableDIV">
							<table id="detailVhcleModelTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th><spring:message code="cmm.seq"/></th>
					                <th>모델코드</th>
					                <th>상세코드</th>
					                <th>상세모델명</th>
					                <th>from연식</th>
					                <th>to연식</th>
					                <th>모델명</th>
					                <th>차종</th>
					                <th>사용여부</th>
					              </tr>
					            </thead>
				          </table>
                    </div>

					<form:form commandName="vhcleDetailModelVO" name="vhcleDetailModelVO" method="post" cssClass="form-horizontal">
                    <div class="box-body table-responsive" id="detailLinkVhcleModelTableDIV">
							<table id="detailLinkVhcleModelTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th><spring:message code="cmm.seq"/></th>
					                <th>상세코드</th>
					                <th>상세모델명</th>
					                <th>from연식</th>
					                <th>to연식</th>
					                <th>모델명</th>
					                <th>차종</th>
					                <th>사용여부</th>
					                <th>인터페이스모델코드</th>
					              </tr>
					            </thead>
				          </table>
                    </div>
                    </form:form>
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
<!-- /.modal -->
	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	    </form>
</body>
</html>
