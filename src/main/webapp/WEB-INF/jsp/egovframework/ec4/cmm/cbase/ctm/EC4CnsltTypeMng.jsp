<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4CnsltTypeMng.jsp
    Description : 상담유형 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.05.16    harry     최초 생성

    author : wizvil harry
    since : 2018.05.16
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상담유형 관리</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">

    <!-- DataTables -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

    <!-- Theme style -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/skins/_all-skins.min.css">

    <!-- ec4 common -->
    <link rel="stylesheet" href="/css/egovframework/ec4/cmm/ec4common.css">


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

    <!-- ec4 common -->
    <script src="/js/egovframework/ec4/cmm/ec4common.js"></script>


    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">

    <script type="text/javascript">

        var cnsltTypeTable1;
        var cnsltTypeTable2;
        var cnsltTypeTable3;
        var cnsltTypeTable4;

        $(document).ready(function () {

            if('${message}'){

                alert('${message}');
            }

            $(".sidebar-menu").tree();


            // 상담유형 테이블
            cnsltTypeTable1 = $('#cnsltTypeTable1').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 2, "asc" ]],    // 기본 정렬
                "rowId": "codeId",
                "scrollY": "369px",
                //"pageLength": 10,             // 페이징 관련
                //"pagingType": "full_numbers", // 페이징 관련
                "bPaginate": false,             // 페이징
                //"bLengthChange": true,        // 페이징 관련
                //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],   // 페이징 관련
                "responsive": true,     // 반응형 화면크기 조절시
                "processing": true,
                "ordering": false,      // 필드 정렬
                "searching": false,     // global 검색
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                    		{"name": "searchParntsCodeId",   "value": "0"},
                    		{"name": "searchCnsltSeCode",   "value": document.actionForm.searchCnsltSeCode.value}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": []}
                ],
                "aoColumns": [
                	{"data": "codeId"},
                    {"data": "codeNm"},
                    {"data": "sortOrdr", "defaultContent": ""},
                    {"data": "useAt"}
                ]
            });


            // 상담유형 테이블2
            cnsltTypeTable2 = $('#cnsltTypeTable2').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 2, "asc" ]],    // 기본 정렬
                "rowId": "codeId",
                "scrollY": "369px",
                "bPaginate": false,         // 페이징
                "responsive": true,         // 반응형 화면크기 조절시
                "processing": true,
                "ordering": false,          // 필드 정렬
                "searching": false,         // global 검색
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
                "fnServerParams": function(aoData, a, b){
                    aoData.push(
                            {"name": "searchParntsCodeId", "value": document.actionForm.codeId1.value},
                            {"name": "searchCnsltSeCode",   "value": document.actionForm.searchCnsltSeCode.value}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": []}
                ],
                "aoColumns": [
                    {"data": "codeId"},
                    {"data": "codeNm"},
                    {"data": "sortOrdr", "defaultContent": ""},
                    {"data": "useAt"}
                ]
            });


            // 상담유형 테이블3
            cnsltTypeTable3 = $('#cnsltTypeTable3').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 2, "asc" ]],    // 기본 정렬
                "rowId": "codeId",
                "scrollY": "369px",
                "bPaginate": false,         // 페이징
                "responsive": true,         // 반응형 화면크기 조절시
                "processing": true,
                "ordering": false,          // 필드 정렬
                "searching": false,         // global 검색
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
                "fnServerParams": function(aoData, a, b){
                    aoData.push(
                            {"name": "searchParntsCodeId", "value": document.actionForm.codeId2.value},
                            {"name": "searchCnsltSeCode",   "value": document.actionForm.searchCnsltSeCode.value}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": []}
                ],
                "aoColumns": [
                    {"data": "codeId"},
                    {"data": "codeNm"},
                    {"data": "sortOrdr", "defaultContent": ""},
                    {"data": "useAt"}
                ]
            });


            // 상담유형 테이블4
            cnsltTypeTable4 = $('#cnsltTypeTable4').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 2, "asc" ]],    // 기본 정렬
                "rowId": "codeId",
                "scrollY": "369px",
                "bPaginate": false,         // 페이징
                "responsive": true,         // 반응형 화면크기 조절시
                "processing": true,
                "ordering": false,          // 필드 정렬
                "searching": false,         // global 검색
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
                "fnServerParams": function(aoData, a, b){
                    aoData.push(
                            {"name": "searchParntsCodeId", "value": document.actionForm.codeId3.value},
                            {"name": "searchCnsltSeCode",   "value": document.actionForm.searchCnsltSeCode.value}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": []}
                ],
                "aoColumns": [
                    {"data": "codeId"},
                    {"data": "codeNm"},
                    {"data": "sortOrdr", "defaultContent": ""},
                    {"data": "useAt"}
                ]
            });


            // 상담유형 선택1
            cnsltTypeTable1.on("select", function (e, dt, type, indexes) {

            	var rowData = dt.rows(indexes).data();
            	document.actionForm.codeId1.value = rowData[0].codeId;
            	document.actionForm.codeId2.value = "";
            	document.actionForm.codeId3.value = "";
            	document.actionForm.codeLevel.value = "2";
            	fn_all_grid_reload();
            }).on("deselect", function (e, dt, type, indexes) {

                document.actionForm.codeId1.value = "";
                document.actionForm.codeId2.value = "";
                document.actionForm.codeId3.value = "";
                document.actionForm.codeLevel.value = "2";
                fn_all_grid_reload();
            });


            // 상담유형 선택2
            cnsltTypeTable2.on("select", function (e, dt, type, indexes) {

                var rowData = dt.rows(indexes).data();
                document.actionForm.codeId2.value = rowData[0].codeId;
                document.actionForm.codeId3.value = "";
                document.actionForm.codeLevel.value = "3";
                fn_all_grid_reload();
            }).on("deselect", function (e, dt, type, indexes) {

                document.actionForm.codeId2.value = "";
                document.actionForm.codeId3.value = "";
                document.actionForm.codeLevel.value = "3";
                fn_all_grid_reload();
            });


            // 상담유형 선택3
            cnsltTypeTable3.on("select", function (e, dt, type, indexes) {

                var rowData = dt.rows(indexes).data();
                document.actionForm.codeId3.value = rowData[0].codeId;
                document.actionForm.codeLevel.value = "4";
                fn_all_grid_reload();
            }).on("deselect", function (e, dt, type, indexes) {

                document.actionForm.codeId3.value = "";
                document.actionForm.codeLevel.value = "4";
                fn_all_grid_reload();
            });


            // 상담유형 선택4
            cnsltTypeTable4.on("select", function (e, dt, type, indexes) {

            }).on("deselect", function (e, dt, type, indexes) {

            });


            // 등록버튼
            $("button.btn-cnslt-reg").click(function(){

            	var params = {};
                var frm = document.actionForm;
                var codeLevel = $(this).data("level");

                frm.codeLevel.value = codeLevel;

                if(!$("select[name=searchCnsltSeCode]").val()){

                	alert('<spring:message code="common.select.msg" arguments="${cnsltSeCodeText}"/>');
                	return;
                }else{

                	params.searchCnsltSeCode = frm.searchCnsltSeCode.value;
                }


            	if(codeLevel == "1"){

            		params.parntsCodeId = frm.codeId0.value;
            	}else if(codeLevel == "2"){

            		params.parntsCodeId = frm.codeId1.value;
            	}else if(codeLevel == "3"){

            		params.parntsCodeId = frm.codeId2.value;
                }else if(codeLevel == "4"){

                	params.parntsCodeId = frm.codeId3.value;
                }

            	// 등록 팝업 오픈
            	fn_cnslt_type_reg_popup(params);
            });


            // 수정버튼
            $("button.btn-cnslt-mod").click(function(){

                var params = {};
                var frm = document.actionForm;
                var codeLevel = $(this).data("level");

                frm.codeLevel.value = codeLevel;
                params.cnsltSeCode = frm.searchCnsltSeCode.value;

                if(!$("select[name=searchCnsltSeCode]").val()){

                    alert('<spring:message code="common.select.msg" arguments="${cnsltSeCodeText}"/>');
                    return;
                }else{

                    params.searchCnsltSeCode = frm.searchCnsltSeCode.value;
                }

                if(codeLevel == "1"){

                    params.codeId = fn_get_codeid(cnsltTypeTable1);
                }else if(codeLevel == "2"){

                    params.codeId = fn_get_codeid(cnsltTypeTable2);
                }else if(codeLevel == "3"){

                    params.codeId = fn_get_codeid(cnsltTypeTable3);
                }else if(codeLevel == "4"){

                    params.codeId = fn_get_codeid(cnsltTypeTable4);
                }

                // 수정 팝업 오픈
                fn_cnslt_type_mod_popup(params);
            });


            // 삭제버튼
            $("button.btn-cnslt-del").click(function(){

                var params = {};
                var frm = document.actionForm;
                var codeLevel = $(this).data("level");

                frm.codeLevel.value = codeLevel;

                if(codeLevel == "1"){

                    params.codeId = fn_get_codeid(cnsltTypeTable1);
                }else if(codeLevel == "2"){

                    params.codeId = fn_get_codeid(cnsltTypeTable2);
                }else if(codeLevel == "3"){

                    params.codeId = fn_get_codeid(cnsltTypeTable3);
                }else if(codeLevel == "4"){

                    params.codeId = fn_get_codeid(cnsltTypeTable4);
                }


                if(params.codeId){

                    // 수정
                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/ctm/deleteCnsltType.do'/>",
                        "data": params,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                fn_all_grid_reload();
                            } else {

                                var errorMsg = "";

                                for(var i = 0 ; i < result.errorMessages.length ; i++){

                                    errorMsg = errorMsg + result.errorMessages[i] + "\n"
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
                }else{

                	alert('<spring:message code="common.select.msg" arguments="${codeIdText}"/>');
                }

            });


            // modal close event
            $("div.modal").on('hide.bs.modal', function (event) {

            	fn_all_grid_reload();
            });


            // 상담구분코드 select search
            $("select[name=searchCnsltSeCode]").on("change", function(key){

            	document.actionForm.codeId1.value = "";
                document.actionForm.codeId2.value = "";
                document.actionForm.codeId3.value = "";
                document.actionForm.codeLevel.value = "";
                fn_all_grid_reload();
            });

        });
        // end ready


        // 수정버튼 눌렀을때 codeId 가져오기
        function fn_get_codeid(cnsltTypeTable){

        	var codeId = "";

        	var rowData = cnsltTypeTable.rows(".selected").data();
            if(rowData[0]){

                codeId = rowData[0].codeId;
            }else{

                codeId = "";
            }

            return codeId;
        }


        // 등록 팝업 오픈
        function fn_cnslt_type_reg_popup(params){

        	if(params.parntsCodeId){

	            $("div.modal-content").load("<c:url value='/ec4/cmm/cbase/ctm/cnsltTypeRegPopup.do'/>", params, function(response, status, xhr) {

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
        	}else{

                alert('<spring:message code="common.select.msg" arguments="${parntsCodeIdText}"/>');
            }
        }


        // 수정 팝업 오픈
        function fn_cnslt_type_mod_popup(params){

           	if(params.codeId){

                $("div.modal-content").load("<c:url value='/ec4/cmm/cbase/ctm/cnsltTypeModPopup.do'/>", params, function(response, status, xhr) {

                    if(status == "success"){

                        $("div.modal").modal({"backdrop": "static", "keyboard": false});
                    }else if(status == "error"){

                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                    }
                });
           	}else{

           		alert('<spring:message code="common.select.msg" arguments="${codeIdText}"/>');
           	}
        }


        // 그리드 reload
        function fn_all_grid_reload(){

            var codeLevel = document.actionForm.codeLevel.value;

            if(codeLevel == "1"){

            	cnsltTypeTable1.draw();
            	cnsltTypeTable2.draw();
                cnsltTypeTable3.draw();
                cnsltTypeTable4.draw();
            }else if(codeLevel == "2"){

                cnsltTypeTable2.draw();
                cnsltTypeTable3.draw();
                cnsltTypeTable4.draw();
            }else if(codeLevel == "3"){

                cnsltTypeTable3.draw();
                cnsltTypeTable4.draw();
            }else if(codeLevel == "4"){

                cnsltTypeTable4.draw();
            }else{

            	cnsltTypeTable1.draw();
                cnsltTypeTable2.draw();
                cnsltTypeTable3.draw();
                cnsltTypeTable4.draw();
            }
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
                상담유형 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">기준정보</a></li>
                <li class="active">상담유형 관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <div class="box">
                        <form name="actionForm" method="post" >
							<input type="hidden" name="codeId0" value="0"/>
							<input type="hidden" name="codeId1"/>
							<input type="hidden" name="codeId2"/>
							<input type="hidden" name="codeId3"/>
							<input type="hidden" name="codeLevel"/>

                            <div class="box-body">

                                <div class="form-group col-md-6 margin-bottom-none" >
                                    <label><spring:message code="cnsltType.cnsltSeCode"/></label>
                                    <select name="searchCnsltSeCode" class="form-control input-sm">
		                                <option value="">-- 선택 --</option>
		                                <c:forEach items="${cnsltSeList}" var="result" varStatus="status">
		                                    <option value="${result.code}">${result.codeNm}</option>
		                                </c:forEach>
		                            </select>
                                </div>

	                        </div>
	                        <!-- /.box-body -->
					    </form>
                    </div>
                    <!-- /.box -->
                </div>
            </div>


            <div class="row">

                <!-- left 1 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV1</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="cnsltTypeTable1" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                            <button type="button" id="btnInsert1" class="btn btn-sm btn-warning btn-cnslt-del" data-level="1"><spring:message code="button.delete"/></button>
                            <button type="button" id="btnInsert1" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="1"><spring:message code="button.create"/></button>
                            <button type="button" id="btnUpdate1" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="1"><spring:message code="button.update"/></button>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

                <!-- left 2 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV2</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">

                            <table id="cnsltTypeTable2" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                            <button type="button" id="btnInsert2" class="btn btn-sm btn-warning btn-cnslt-del" data-level="2"><spring:message code="button.delete"/></button>
                            <button type="button" id="btnInsert2" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="2"><spring:message code="button.create"/></button>
                            <button type="button" id="btnUpdate2" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="2"><spring:message code="button.update"/></button>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

                <!-- left 3 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV3</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">

                            <table id="cnsltTypeTable3" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                            <button type="button" id="btnInsert3" class="btn btn-sm btn-warning btn-cnslt-del" data-level="3"><spring:message code="button.delete"/></button>
                            <button type="button" id="btnInsert3" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="3"><spring:message code="button.create"/></button>
                            <button type="button" id="btnUpdate3" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="3"><spring:message code="button.update"/></button>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

                <!-- left 4 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV4</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">

                            <table id="cnsltTypeTable4" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                            <button type="button" id="btnInsert4" class="btn btn-sm btn-warning btn-cnslt-del" data-level="4"><spring:message code="button.delete"/></button>
                            <button type="button" id="btnInsert4" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="4"><spring:message code="button.create"/></button>
                            <button type="button" id="btnUpdate4" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="4"><spring:message code="button.update"/></button>
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

            </div>
            <!-- /.row -->
        </section>
        <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <!-- footer include -->
    <jsp:include page="/ec4Footer.do" />

</div>
<!-- ./wrapper -->

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>
