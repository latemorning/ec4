<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%--
    Class Name : EC4VhcleModelList.jsp
    Description : 차량정보 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.04.16    harry     최초 생성

    author : wizvil harry
    since : 2018.04.16
--%>
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

	<!--
	<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
	<validator:javascript formName="vhcleDetailModelVO" staticJavascript="false" xhtml="true" cdata="false"/>
	<validator:javascript formName="vhcleModelVO" staticJavascript="false" xhtml="true" cdata="false"/>
	 -->

	<script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
	<link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">

    <script type="text/javascript">

		$(document).ready(function () {

		    $(".sidebar-menu").tree();


		    // 모델 테이블
		    var vhcleTable = $('#vhcleTable').DataTable({
		        "language": lang_kor,
		        "select": {
                    "style": "single"
                },
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
                /* "ajax" : {
                    "url": "/ec4/cmm/cbase/vhi/selectVhcleModelList.do",
                    "type": "POST",
                    "data": function(c, d){
                    	//                                  tr            th        form obj
                        c.searchVhctyCode    = d.nTFoot.childNodes[1].childNodes[0].children[0].value;
                    	c.searchVhcleModelNm = d.nTFoot.childNodes[1].childNodes[1].children[0].value;
                    	c.searchUseAt        = d.nTFoot.childNodes[1].childNodes[2].children[0].value;
                    }
                }, */
                "sAjaxSource": "/ec4/cmm/cbase/vhi/selectVhcleModelList.do",
                "fnServerParams": function(aoData){
                    aoData.push(
                    		{"name": "searchVhcleMakrCode", "value": $("#searchVhcleModelForm select[name=searchVhcleMakrCode] option:selected").val()},
                    		{"name": "searchVhctyCode",     "value": $("#searchVhcleModelForm select[name=searchVhctyCode] option:selected").val()},
                    		{"name": "searchVhcleModelNm",  "value": $("#searchVhcleModelForm input[name=searchVhcleModelNm]").val()},
                    		{"name": "searchUseAt",         "value": $("#searchVhcleModelForm select[name=searchUseAt] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [0, 1, 3]}
                ],
                "columns": [
                    {"data":"vhcleModelId" , "defaultContent" : ""},
                    {"data":"vhcleMakrCode" , "defaultContent" : ""},
                    {"data":"vhcleMakrNm" , "defaultContent" : ""},
                    {"data":"vhctyCode" , "defaultContent" : ""},
                    {"data":"vhctyNm" , "defaultContent" : ""},
                    {"data":"vhcleModelNm" , "defaultContent" : ""},
                    {"data":"useAt" , "defaultContent" : ""}
                ]
		    });


	        // 세부모델 테이블
            var vhcleDetailTable = $('#vhcleDetailTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
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
                "bServerSide": true,
                "searching": false,
                /* "ajax" : {
                    "url": "/ec4/cmm/cbase/vhi/selectVhcleDetailModelList.do",
                    "type": "POST",
                    "data": function(c, d){

                        c.searchVhcleModelId  = $("#searchVhcleDetailModelForm input[name=searchVhcleModelId]").val();
                        c.searchDetailModelNm = $("#searchVhcleDetailModelForm input[name=searchDetailModelNm]").val();
                        c.searchMdyrBegin     = $("#searchVhcleDetailModelForm input[name=searchMdyrBegin]").val();
                        c.searchMdyrEnd       = $("#searchVhcleDetailModelForm input[name=searchMdyrEnd]").val();
                        c.searchUseAt         = $("#searchVhcleDetailModelForm select[name=searchUseAt] option:selected").val();
                    }
                }, */
                "sAjaxSource": "/ec4/cmm/cbase/vhi/selectVhcleDetailModelList.do",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchVhcleModelId",  "value": $("#searchVhcleDetailModelForm input[name=searchVhcleModelId]").val()},
                            {"name": "searchDetailModelNm", "value": $("#searchVhcleDetailModelForm input[name=searchDetailModelNm]").val()},
                            {"name": "searchMdyrBegin",     "value": $("#searchVhcleDetailModelForm input[name=searchMdyrBegin]").val()},
                            {"name": "searchMdyrEnd",       "value": $("#searchVhcleDetailModelForm input[name=searchMdyrEnd]").val()},
                            {"name": "searchUseAt",         "value": $("#searchVhcleDetailModelForm select[name=searchUseAt] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [0]}
                ],
                "columns": [
                    {"data":"detailModelId" , "defaultContent" : ""},
                    {"data":"vhcleModelNm" , "defaultContent" : ""},
                    {"data":"detailModelNm" , "defaultContent" : ""},
                    {"data":"mdyrBegin" , "defaultContent" : ""},
                    {"data":"mdyrEnd" , "defaultContent" : ""},
                    {"data":"useAt" , "defaultContent" : ""}
                ]
            });


		    // 모델 테이블 검색
/*  		    vhcleTable.columns().every(function(){

		    	var that = this;

		        $("input", this.footer()).on("keyup change", function(key){

		        	if(key.keyCode == 13){

			            if(that.search() !== this.value){

			            	that.search(this.value)
			            	.draw();
			            }
		        	}
		        });

		        $("select", this.footer()).on("change", function(key){

                        that.search(this.value)
                        .draw();
                });
		    }); */

            // 모델 검색 input search
            $("#searchVhcleModelForm input").on("keyup change", function(key){

                if(key.keyCode == 13){

                    vhcleTable.search(this.value).draw();
                }
            });

            // 모델 검색 select search
            $("#searchVhcleModelForm select").on("change", function(key){

                vhcleTable.search(this.value).draw();
            });


 	        // 모델 선택
            vhcleTable.on("select", function (e, dt, type, indexes) {

                var vfrm = document.vhcleModelVO;
                var vdfrm = document.vhcleDetailModelVO;
                var vdsfrm = document.searchVhcleDetailModelForm;
                var rowData = vhcleTable.rows(indexes).data();

                vfrm.vhcleModelId.value   = rowData[0].vhcleModelId;
                vfrm.vhcleMakrCode.value  = rowData[0].vhcleMakrCode;
                vfrm.vhctyCode.value      = rowData[0].vhctyCode;
                vfrm.vhcleModelNm.value   = rowData[0].vhcleModelNm;
                vfrm.useAt.value          = rowData[0].useAt;

                vdfrm.vhcleModelId.value  = rowData[0].vhcleModelId;
                vdfrm.vhcleModelNm.value  = rowData[0].vhcleModelNm;
                vdfrm.detailModelId.value = "";
                vdfrm.detailModelNm.value = "";
                vdfrm.mdyrBegin.value     = "";
                vdfrm.mdyrEnd.value       = "";
                vdfrm.useAt.value         = "Y";

                vdsfrm.searchVhcleModelId.value = rowData[0].vhcleModelId;

                vhcleDetailTable.search(vdsfrm.searchVhcleModelId.value).draw();

            }).on("deselect", function (e, dt, type, indexes) {

                var vfrm = document.vhcleModelVO;
                var vdfrm = document.vhcleDetailModelVO;
                var vdsfrm = document.searchVhcleDetailModelForm;

                vfrm.vhcleModelId.value  = "";
                vfrm.vhcleMakrCode.value = "";
                vfrm.vhctyCode.value     = "";
                vfrm.vhcleModelNm.value  = "";
                vfrm.useAt.value         = "Y";

                vdfrm.vhcleModelId.value = "";
                vdfrm.vhcleModelNm.value = "";
                vdfrm.detailModelId.value = "";
                vdfrm.detailModelNm.value = "";
                vdfrm.mdyrBegin.value     = "";
                vdfrm.mdyrEnd.value       = "";
                vdfrm.useAt.value         = "Y";

                vdsfrm.searchVhcleModelId.value = "";

                vhcleDetailTable.clear().draw();
            });


            // 세부모델 선택
            vhcleDetailTable.on("select", function (e, dt, type, indexes) {

                var vdfrm = document.vhcleDetailModelVO;
                var rowData = vhcleDetailTable.rows(indexes).data();

                vdfrm.detailModelId.value = rowData[0].detailModelId;
                vdfrm.detailModelNm.value = rowData[0].detailModelNm;
                vdfrm.mdyrBegin.value     = rowData[0].mdyrBegin;
                vdfrm.mdyrEnd.value       = rowData[0].mdyrEnd;
                vdfrm.useAt.value         = rowData[0].useAt;

            }).on("deselect", function (e, dt, type, indexes) {

                var vdfrm = document.vhcleDetailModelVO;

                vdfrm.detailModelId.value = "";
                vdfrm.detailModelNm.value = "";
                vdfrm.mdyrBegin.value     = "";
                vdfrm.mdyrEnd.value       = "";
                vdfrm.useAt.value         = "Y";
            });


		    // 세부모델 검색 input search
            $("#searchVhcleDetailModelForm input").on("keyup change", function(key){

                if(key.keyCode == 13){

                	vhcleDetailTable.search(this.value).draw();
                }
            });

		    // 세부모델 검색 select search
            $("#searchVhcleDetailModelForm select").on("change", function(key){

                vhcleDetailTable.search(this.value).draw();
            });



		    // 모델 등록/수정 function
		    $("#btnVhcleInsert").click(function(){

		    	frm = document.vhcleModelVO;

		    	/*
		        if(!validateVhcleModelVO(frm)){
		            return;
		        }
		    	*/

		        var vhcleModelId = frm.vhcleModelId.value;

                if(!frm.vhcleMakrCode.value){

                	alert("제조사를 선택해 주세요");
                	return;
                }

                if(!frm.vhctyCode.value){

                	alert("차종을 선택해 주세요");
                	return;
                }

                if(!frm.vhcleModelNm.value){

                	alert("모델명을 입력해 주세요");
                    return;
                }


		        if(!vhcleModelId){

		        	// 등록
	                $.ajax({
	                    "type": "POST",
	                    "dataType": "json",
	                    "async": false,
	                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
	                    "url": "<c:url value='/ec4/cmm/cbase/vhi/insertVhcleModel.do'/>",
	                    "data": $("#vhcleModelVO").serialize(),
	                    "success": function(result) {

	                        if(result.isSuccess){

	                        	alert(result.message);
	                        	vhcleTable.search("").draw();
	                        	initVhcleModelVO();
	                        } else {

	                        	alert(result.message);
	                        }
	                    }
	                    ,error: function(xhr, status, error){

	                        alert(status);
	                        return;
	                    }
	                });

		        } else {

		        	// 수정
                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/updateVhcleModel.do'/>",
                        "data": $("#vhcleModelVO").serialize(),
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                vhcleTable.search("").draw();
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });

		        }

		    });



		    // 모델 삭제
		    $("#btnVhcleDelete").click(function(){

		    	frm = document.vhcleModelVO;

		    	var vhcleModelId = frm.vhcleModelId.value;

		    	if(!vhcleModelId){

		    		$('#modal-warning').find(".modal-body p").text("삭제할 모델을 선택해 주세요");
		    		$('#modal-warning').modal();
		    	}else{

                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/deleteVhcleModel.do'/>",
                        "data": $("#vhcleModelVO").serialize(),
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                vhcleTable.search("").draw();
                                initVhcleModelVO();
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });

		    	}
		    });


	        /* 세부모델 등록/수정 function */
            $("#btnDetailInsert").click(function(){

                frm = document.vhcleDetailModelVO;

                /*
                if(!validateVhcleDetailModelVO(frm)){
                    return;
                }
                */

                var detailModelId = frm.detailModelId.value;

                if(!detailModelId){

                    // 등록

                	$.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/insertVhcleDetailModel.do'/>",
                        "data": $("#vhcleDetailModelVO").serialize(),
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                vhcleDetailTable.search("").draw();
                                initVhcleDetailModelVO("insert");
                            } else {

                                for(var i = 0 ; i < result.errorMessages.length ; i++){

                                    alert(result.errorMessages[i]);
                                }
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });

                } else {

                    // 수정

                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/updateVhcleDetailModel.do'/>",
                        "data": $("#vhcleDetailModelVO").serialize(),
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                vhcleDetailTable.search("").draw();
                                initVhcleDetailModelVO("update");
                            } else {

                            	for(var i = 0 ; i < result.errorMessages.length ; i++){

                                    alert(result.errorMessages[i]);
                                }
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });
                }

            });


            // 모델 form 신규
            $("#btnVhcleReset").click(function(){

                initVhcleModelVO();
            });


            // 세부모델 form 신규
            $("#btnDetailReset").click(function(){

            	initVhcleDetailModelVO("insert");
            });


            // 세부모델 삭제
            $("#btnDetailDelete").click(function(){

                frm = document.vhcleDetailModelVO;

                var detailModelId = frm.detailModelId.value;

                if(!detailModelId){

                    $('#modal-warning').find(".modal-body p").text("삭제할 세부모델을 선택해 주세요");
                    $('#modal-warning').modal();
                }else{

                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cbase/vhi/deleteVhcleDetailModel.do'/>",
                        "data": $("#vhcleDetailModelVO").serialize(),
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                vhcleDetailTable.search("").draw();
                                initVhcleDetailModelVO("delete");
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });

                }
            });


		});
		// end ready



        // 모델 폼 초기화
		function initVhcleModelVO(){

			frm = document.vhcleModelVO;

            frm.vhcleModelId.value = "";
            frm.vhcleMakrCode.value = "";
            frm.vhctyCode.value = "";
            frm.vhcleModelNm.value = "";
            frm.useAt.value = "Y";
		}


        // 세부모델 폼 초기화
        function initVhcleDetailModelVO(actionFlag){

            frm = document.vhcleDetailModelVO;

            frm.detailModelId.value = "";
            frm.detailModelNm.value = "";
            frm.mdyrBegin.value = "";
            frm.mdyrEnd.value = "";
            frm.useAt.value = "Y";
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
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
	            <li><a href="#">기준정보</a></li>
	            <li class="active">차량정보 관리</li>
	        </ol>
	    </section>

	    <!-- Main content -->
	    <section class="content">
	        <div class="row">

	            <!-- left column -->
	            <div class="col-md-6">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">모델 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
	                        <form name="searchVhcleModelForm" id="searchVhcleModelForm" method="post" class="form-horizontal" onsubmit="return false;">
	                            <div class="form-group">
	                                <label for="searchVhcleMakrCode" class="col-sm-3 control-label">제조사</label>
	                                <div class="col-sm-9">
	                                       <select name="searchVhcleMakrCode" id="searchVhcleMakrCode" class="form-control input-sm">
	                                           <option value="">-- 차종선택 --</option><c:forEach items="${makrCodeList}" var="result" varStatus="status">
	                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
	                                       </select>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label for="searchVhctyCode" class="col-sm-3 control-label">차종</label>
	                                <div class="col-sm-9">
	                                       <select name="searchVhctyCode" id="searchVhctyCode" class="form-control input-sm">
	                                           <option value="">-- 차종선택 --</option><c:forEach items="${modelCodeList}" var="result" varStatus="status">
	                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
	                                       </select>
	                                </div>
	                            </div>
	                            <div class="form-group">
	                                <label for="searchVhcleModelNm" class="col-sm-3 control-label">모델명</label>
	                                <div class="col-sm-9">
	                                    <input type="text" name="searchVhcleModelNm" id="searchVhcleModelNm" placeholder="모델명" class="form-control input-sm"/>
	                                </div>
	                            </div>
	                            <div class="form-group margin-bottom-none">
	                                <label class="col-sm-3 control-label">사용여부</label>
	                                <div class="col-sm-9">
	                                    <select name="searchUseAt" class="form-control input-sm">
	                                        <option value="">-- 사용여부선택 --</option>
	                                        <option value="Y">사용</option>
	                                        <option value="N">미사용</option>
	                                    </select>
	                                </div>
	                            </div>
	                        </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


	                <div class="box">
	                    <div class="box-header with-border">
	                        <h3 class="box-title">모델 목록</h3>
	                    </div>
			            <!-- /.box-header -->
			            <div class="box-body table-responsive">
	                        <table id="vhcleTable" class="table table-hover">
			                    <thead>
			                        <tr>
			                            <th>ID</th>
			                            <th>제조사코드</th>
			                            <th>제조사</th>
			                            <th>차종코드</th>
			                            <th>차종</th>
			                            <th>모델명</th>
			                            <th>사용여부</th>
			                        </tr>
			                    </thead>
			                </table>
			            </div>
			            <!-- /.box-body -->
	                </div>
	                <!-- /.box -->


	                <!-- Horizontal Form -->
	                <div class="box box-primary">
	                    <div class="box-header with-border">
	                        <h3 class="box-title">모델</h3>
	                    </div>
	                    <!-- /.box-header -->
	                    <!-- form start -->
	                    <form:form commandName="vhcleModelVO" name="vhcleModelVO" method="post" cssClass="form-horizontal">
	                        <double-submit:preventer/>
		                    <form:hidden path="vhcleModelId"/>
		                    <div class="box-body">
		                        <div class="form-group">
		                            <label for="vhcleMakrCode" class="col-sm-3 control-label">제조사</label>
		                            <div class="col-sm-9">
		                                <form:select path="vhcleMakrCode" cssClass="form-control input-sm">
			                                <form:option value="">-- 선택 --</form:option>
		                                    <form:options items="${makrCodeList}" itemValue="code" itemLabel="codeNm"/>
		                                </form:select>
		                                <form:errors path="vhcleMakrCode" />
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <label for="vhctyCode" class="col-sm-3 control-label">차종</label>
		                            <div class="col-sm-9">
		                                <form:select path="vhctyCode" cssClass="form-control input-sm">
			                                <form:option value="">-- 선택 --</form:option>
		                                    <form:options items="${modelCodeList}" itemValue="code" itemLabel="codeNm"/>
		                                </form:select>
		                                <form:errors path="vhctyCode" />
		                            </div>
		                        </div>
		                        <div class="form-group">
		                            <label for="vhcleModelNm" class="col-sm-3 control-label">모델명</label>
		                            <div class="col-sm-9">
		                                <form:input path="vhcleModelNm" cssClass="form-control input-sm" maxlength="50"/>
		                                <form:errors path="vhcleModelNm" />
		                                <!-- 엔터 눌렀을때 submit 방지용 -->
		                                <input type="text" name="dummy01" style="display: none;"/>
		                            </div>
		                        </div>
		                        <div class="form-group margin-bottom-none">
		                            <label class="col-sm-3 control-label">사용여부</label>
		                            <div class="col-sm-9">
		                                <form:select path="useAt" cssClass="form-control input-sm">
		                                    <form:option value="Y">사용</form:option>
		                                    <form:option value="N">미사용</form:option>
		                                </form:select>
		                            </div>
		                        </div>
		                    </div>
		                    <!-- /.box-body -->
		                    <div class="box-footer text-right">
		                        <button type="button" id="btnVhcleReset" class="btn btn-sm btn-default">신규</button>
		                        <button type="button" id="btnVhcleInsert" class="btn btn-sm btn-primary">저장</button>
		                        <button type="button" id="btnVhcleDelete" class="btn btn-sm btn-warning">삭제</button>
		                    </div>
		                    <!-- /.box-footer -->
		                </form:form>
		            </div>
		            <!-- /.box -->
	            </div>
	            <!--/.col (left) -->

	            <!-- right column -->
	            <div class="col-md-6">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title">세부모델 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchVhcleDetailModelForm" id="searchVhcleDetailModelForm" method="post" class="form-horizontal" onsubmit="return false;">
                                <input type="hidden" name="searchVhcleModelId"/>
                                <div class="form-group">
                                    <label for="searchDetailModelNm" class="col-sm-3 control-label">세부모델명</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="searchDetailModelNm" id="searchDetailModelNm" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchMdyrBegin" class="col-sm-3 control-label">연식From</label>
                                    <div class="col-sm-3">
                                        <input name="searchMdyrBegin" id="searchMdyrBegin" class="form-control input-sm"/>
                                    </div>
                                    <label for="searchMdyrEnd" class="col-sm-3 control-label">연식To</label>
                                    <div class="col-sm-3">
                                        <input name="searchMdyrEnd" id="searchMdyrEnd" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group margin-bottom-none">
                                    <label class="col-sm-3 control-label">사용여부</label>
                                    <div class="col-sm-9">
                                        <select name="searchUseAt" class="form-control input-sm">
                                            <option value="">-- 사용여부선택 --</option>
                                            <option value="Y">사용</option>
                                            <option value="N">미사용</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


			        <div class="box">
			            <div class="box-header with-border">
			                <h3 class="box-title">세부모델 목록</h3>
			            </div>
			            <!-- /.box-header -->
			            <div class="box-body table-responsive">
			                <table id="vhcleDetailTable" class="table table-hover">
			                    <thead>
			                        <tr>
			                            <th>세부모델ID</th>
			                            <th>모델명</th>
			                            <th>세부모델명</th>
			                            <th>연식From</th>
			                            <th>연식To</th>
			                            <th>사용여부</th>
			                        </tr>
			                    </thead>
			                </table>
			            </div>
			            <!-- /.box-body -->
			        </div>
			        <!-- /.box -->


		            <!-- Horizontal Form -->
		            <div class="box box-primary">
		                <div class="box-header with-border">
		                    <h3 class="box-title">세부모델</h3>
		                </div>
		                <!-- /.box-header -->
		                <!-- form start -->
		                <form:form commandName="vhcleDetailModelVO" name="vhcleDetailModelVO" method="post" cssClass="form-horizontal">
		                    <double-submit:preventer/>
		                    <input type="hidden" name="vhcleModelId"/>
		                    <input type="hidden" name="detailModelId"/>
		                <div class="box-body">
		                    <div class="form-group">
		                        <label class="col-sm-3 control-label">모델명</label>
		                        <div class="col-sm-9">
		                            <form:input path="vhcleModelNm" cssClass="form-control input-sm" readonly="true"/>
		                            <form:errors path="vhcleModelNm"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="detailModelNm" class="col-sm-3 control-label">세부모델명</label>
		                        <div class="col-sm-9">
		                            <form:input path="detailModelNm" cssClass="form-control input-sm"/>
		                            <form:errors path="detailModelNm"/>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label for="mdyrBegin" class="col-sm-3 control-label">연식 From</label>
		                        <div class="col-sm-3">
		                            <form:input path="mdyrBegin" cssClass="form-control input-sm"/>
		                            <form:errors path="mdyrBegin"/>
		                        </div>
		                        <label for="mdyrEnd" class="col-sm-3 control-label">연식 To</label>
		                        <div class="col-sm-3">
		                            <form:input path="mdyrEnd" cssClass="form-control input-sm"/>
		                            <form:errors path="mdyrEnd"/>
		                        </div>
		                    </div>
		                    <div class="form-group margin-bottom-none">
		                        <label class="col-sm-3 control-label">사용여부</label>
		                        <div class="col-sm-9">
		                            <form:select path="useAt" cssClass="form-control input-sm">
		                                <form:option value="Y">사용</form:option>
		                                <form:option value="N">미사용</form:option>
		                            </form:select>
		                        </div>
		                    </div>
		                </div>
		                <!-- /.box-body -->
		                <div class="box-footer text-right">
		                    <button type="button" id="btnDetailReset" class="btn btn-sm btn-default">신규</button>
		                    <button type="button" id="btnDetailInsert" class="btn btn-sm btn-primary">저장</button>
		                    <button type="button" id="btnDetailDelete" class="btn btn-sm btn-warning">삭제</button>
		                </div>
		                <!-- /.box-footer -->
		                </form:form>
		            </div>
	                <!-- /.box -->

	            </div>
	            <!--/.col (right) -->
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

</body>
</html>
