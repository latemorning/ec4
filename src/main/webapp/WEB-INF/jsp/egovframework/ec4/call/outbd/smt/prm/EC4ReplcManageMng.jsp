<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4ReplcManageMng.jsp
    Description : 정비소관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2019.01.25    harry     최초 생성

    author : wizvil harry
    since : 2019.01.25
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>정비소관리</title>
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

    <!-- bootstrap datepicker -->
    <script src="/resource/adminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>

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

        var replcManageTable;
        var smsTmplatTable;
        var cntrctManageTable;

        $(document).ready(function () {

            if('${message}'){

                alert('${message}');
            }

            $(".sidebar-menu").tree();

            //Date picker
            $(".datepicker").datepicker({
                autoclose: true,
                format: "yyyy-mm-dd"
            })


            // 정비소 테이블
            replcManageTable = $('#replcManageTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                "rowId": "replcCode",
                "scrollY": "400px",
                "bPaginate": true,
                "pageLength": 10,
                "pagingType": "full_numbers",
                "bLengthChange": true,
                "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": false,
                "searching": false,
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/call/outbd/smt/prm/selectReplcManageList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                        {"name": "searchReplcCode",   "value": $("#searchReplcManageForm input[name=searchReplcCode]").val()},
                        {"name": "searchReplcTy",     "value": $("#searchReplcManageForm select[name=searchReplcTy] option:selected").val()},
                        {"name": "searchReplcNm",     "value": $("#searchReplcManageForm input[name=searchReplcNm]").val()},
                        {"name": "searchHdqrtrsCode", "value": $("#searchReplcManageForm input[name=searchHdqrtrsCode]").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [7]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"replcCode", "defaultContent": ""},
                    {"data":"replcTyNm", "defaultContent": ""},
                    {"data":"replcNm", "defaultContent": ""},
                    {"data":"smsDsptchNo", "defaultContent": ""},
                    {"data":"replcEmail", "defaultContent": ""},
                    {"data":"useAt", "defaultContent": ""},
                    {"data":"scdCallUseAt", "defaultContent": ""},
                    {"data":"hdqrtrsCode", "defaultContent": ""}
                ]
            });


            // 정비소 검색 input search
            $("#searchReplcManageForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                	fn_replc_grid_reload();
                }
            });

            // 정비소 검색 select search
            $("#searchReplcManageForm select").on("change", function(key){

            	fn_replc_grid_reload();
            });


            // 정비소 선택
            replcManageTable.on("select", function (e, dt, type, indexes) {

                $("#btnDelete").removeClass("disabled");
                $("#btnUpdate").removeClass("disabled");

                var rowData = dt.rows(indexes).data();


                var params = {};
                params.replcCode = rowData[0].replcCode;

                // 서버 ajax
	            $.ajax({
	                "type": "POST",
	                "dataType": "json",
	                "async": false,
	                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
	                "url": "<c:url value='/ec4/call/outbd/smt/prm/selectReplcManage.do'/>",
	                "data": params,
	                "success": function(result) {

	                    if(result.isSuccess){

	                    	$.each(result, function(key, value){

	                    		var formObj = $("#replcManageDetailVO").find(":input[name='" + key + "']");

	                    		/* switch (formObj.prop("tagName")) {

	                    		    case 'INPUT':
	                    		    	formObj.val(value);
	                    		    	break;

	                    		    case 'TEXTAREA':
	                    		    	formObj.val(value);
	                    		    	break;
	                    		} */

	                    		formObj.val(value);
	                        });

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
	                            "\n Status Code : " + xhr.status
	                          + "\n Status Text : " + xhr.statusText
	                          //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
	                    );
	                    return;
	                }
	            });


	            if(smsTmplatTable){

	            	// 템플릿 목록 테이블 redraw
	                fn_set_search_replc_code(params.replcCode);
	            	fn_tmplat_grid_reload();
	            }

	            if(cntrctManageTable){

                    // 계약 목록 테이블 redraw
                    fn_set_cntrct_search_replc_code(params.replcCode);
                    fn_cntrct_grid_reload();
                }

            }).on("deselect", function (e, dt, type, indexes) {

            	$("#btnDelete").addClass("disabled");
                $("#btnUpdate").addClass("disabled");

                $("#replcManageDetailVO").find(":input").val("");

                if(smsTmplatTable){

                	// 템플릿 목록 테이블이 로딩되었을경우 redraw
                    fn_set_search_replc_code("");
                	fn_tmplat_grid_reload();
                }
            });


            // 등록버튼
            $("#btnCreate").click(function(){

                var params = {};

                var frm = document.actionForm;

                // 등록 팝업 오픈
                fn_replc_manage_reg_popup(params);
            });


            // 수정버튼
            $("#btnUpdate").click(function(){

                var params = {};
                var rowData = replcManageTable.rows(".selected").data();

                if(rowData[0]){
                	params.replcCode = rowData[0].replcCode;
                }

                // 수정 팝업 오픈
                fn_replc_manage_mod_popup(params);
            });


            // 삭제
            $("#btnDelete").click(function(){

                if(!$(this).hasClass("disabled")){

                    if(confirm('<spring:message code="common.delete.msg"/>')){

                        var params = {};
                        var rowData = replcManageTable.rows(".selected").data();

                        if(rowData[0]){
                        	params.replcCode = rowData[0].replcCode;
                        }

                        if(!params.replcCode){

                            alert('<spring:message code="common.delete.pre.msg" arguments="${replcCodeText}"/>');
                        } else {

                            $.ajax({
                                "type": "POST",
                                "dataType": "json",
                                "async": false,
                                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                                "url": "<c:url value='/ec4/call/outbd/smt/prm/deleteReplcManage.do'/>",
                                "data": params,
                                "success": function(result) {

                                    if(result.isSuccess){

                                        alert(result.message);
                                        fn_replc_grid_reload();
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


            // modal close event
            $("div.modal").on('hide.bs.modal', function (event) {

            	fn_replc_grid_reload();
            });


            $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {

            	  e.target // newly activated tab
            	  e.relatedTarget // previous active tab

                  var params = {};
            	  var rowData = replcManageTable.rows(".selected").data();

                  if(rowData[0]){
                      params.searchReplcCode = rowData[0].replcCode;
                  }

            	  if($(e.target).attr("href") == "#tab_2"){

            		  $("#tab_2").load("<c:url value='/ec4/call/outbd/smt/stm/msgTmplatList.do'/>", params, function(response, status, xhr) {

                          if(status == "success"){

                              // 처리 내용 없음
                          }else if(status == "error"){

                              alert("ERROR : " +
                                      "\n Status Code : " + xhr.status
                                      + "\n Status Text : " + xhr.statusText
                                      //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
                                   );
                              return;
                          }
                      });

            	  }else if($(e.target).attr("href") == "#tab_3"){

            		  $("#tab_3").load("<c:url value='/ec4/call/outbd/smt/cmt/cntrctManageList.do'/>", params, function(response, status, xhr) {

                          if(status == "success"){

                              // 처리 내용 없음
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

            });

        });
        // end ready


        // 등록 팝업 오픈
        function fn_replc_manage_reg_popup(params){

            $("div.modal-content").load("<c:url value='/ec4/call/outbd/smt/prm/replcManageRegPopup.do'/>", params, function(response, status, xhr) {

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
        function fn_replc_manage_mod_popup(params){

           	if(params.replcCode){

                $("div.modal-content").load("<c:url value='/ec4/call/outbd/smt/prm/replcManageModPopup.do'/>", params, function(response, status, xhr) {

                    if(status == "success"){

                        $("div.modal").modal({"backdrop": "static", "keyboard": false});
                    }else if(status == "error"){

                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                    }
                });
           	}else{

           		alert('<spring:message code="common.select.msg" arguments="${replcCodeText}"/>');
           	}
        }


        // replc grid reload
        function fn_replc_grid_reload(){

        	replcManageTable.draw();
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
                정비소관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li><a href="#">시스템관리</a></li>
                <li class="active">정비소관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- column -->
                <div class="col-md-12">
                    <div class="box box-solid box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>정비소검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchReplcManageForm" id="searchReplcManageForm" method="post" class="" onsubmit="return false;">
                                <div class="row">
	                                <div class="form-group col-md-3">
	                                    <label for=""><spring:message code="replcManage.replcCode"/></label>
	                                    <input type="text" name="searchReplcCode" id="searchReplcCode" placeholder="<spring:message code="replcManage.replcCode"/>" class="form-control input-sm"/>
	                                </div>
	                                <div class="form-group col-md-3">
                                        <label><spring:message code="replcManage.replcTy"/></label>
                                        <select name="searchReplcTy" id="searchReplcTy" class="form-control input-sm">
                                           <option value="">-- 선택 --</option><c:forEach items="${replcTyList}" var="result" varStatus="status">
                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
                                        </select>
                                    </div>
	                                <div class="form-group col-md-3">
	                                    <label for=""><spring:message code="replcManage.replcNm"/></label>
	                                    <input type="text" name="searchReplcNm" id="searchReplcNm" placeholder="<spring:message code="replcManage.replcNm"/>" class="form-control input-sm"/>
	                                </div>
	                                <div class="form-group col-md-3">
                                        <label for=""><spring:message code="replcManage.hdqrtrsCode"/></label>
                                        <input type="text" name="searchHdqrtrsCode" id="searchHdqrtrsCode" placeholder="<spring:message code="replcManage.hdqrtrsCode"/>" class="form-control input-sm"/>
                                    </div>
	                            </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->


                    <div class="row">
                        <div class="col-md-6">
		                    <div class="box box-solid box-default">
		                        <div class="box-header">
		                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>정비소 목록</h3>
		                            <div class="box-tools pull-right">
		                                <button type="button" id="btnDelete" class="btn btn-sm btn-warning btn-cnslt-del disabled"><spring:message code="button.delete"/></button>
		                                <button type="button" id="btnCreate" class="btn btn-sm btn-primary btn-cnslt-reg"><spring:message code="button.create"/></button>
		                                <button type="button" id="btnUpdate" class="btn btn-sm btn-primary btn-cnslt-mod disabled"><spring:message code="button.update"/></button>
		                            </div>
		                        </div>
		                        <!-- /.box-header -->
		                        <div class="box-body table-responsive">
		                            <table id="replcManageTable" class="table table-hover">
		                                <thead>
		                                    <tr>
		                                        <th><spring:message code="cmm.seq"/></th>
		                                        <th><spring:message code="replcManage.replcCode"/></th>
		                                        <th><spring:message code="replcManage.replcTy"/></th>
		                                        <th><spring:message code="replcManage.replcNm"/></th>
		                                        <th><spring:message code="replcManage.smsDsptchNo"/></th>
		                                        <th><spring:message code="replcManage.replcEmail"/></th>
		                                        <th><spring:message code="cmm.useAt"/></th>
		                                        <th><spring:message code="replcManage.scdCallUseAt"/></th>
		                                        <th><spring:message code="replcManage.hdqrtrsCode"/></th>
		                                    </tr>
		                                </thead>
		                            </table>
		                        </div>
		                        <!-- /.box-body -->
		                    </div>
		                    <!-- /.box -->
                        </div>

                        <div class="col-md-6">

                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_1" data-toggle="tab">정비소 상세</a></li>
                                    <li><a href="#tab_2" data-toggle="tab">SMS 템플릿</a></li>
                                    <li><a href="#tab_3" data-toggle="tab">계약 정보</a></li>
                                    <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">

			                            <div class="box box-solid box-default">
			                                <div class="box-header">
			                                    <h3 class="box-title"><i class="fa fa-fw fa-sticky-note-o"></i>정비소 상세</h3>
			                                    <div class="box-tools pull-right">
			                                    </div>
			                                </div>
			                                <!-- /.box-header -->
			                                <div class="box-body">

			                                    <!-- form start -->
			                                    <form id="replcManageDetailVO">
			                                        <div class="row">
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.replcCode"/></label>
			                                                <input type="text" name="replcCode" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.replcTy"/></label>
			                                                <input type="text" name="replcTyNm" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                        </div>

			                                        <div class="row">
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.replcNm"/></label>
			                                                <input type="text" name="replcNm" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.hdqrtrsCode"/></label>
			                                                <input type="text" name="hdqrtrsCode" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                        </div>

			                                        <div class="row">
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.smsDsptchNo"/></label>
			                                                <input type="text" name="smsDsptchNo" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.replcEmail"/></label>
			                                                <input type="text" name="replcEmail" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                        </div>
			                                        <div class="row">
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="cmm.useAt"/></label>
			                                                <input type="text" name="useAt" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                            <div class="form-group col-md-6">
			                                                <label><spring:message code="replcManage.scdCallUseAt"/></label>
			                                                <input type="text" name="scdCallUseAt" class="form-control input-sm" readonly="readonly" />
			                                            </div>
			                                        </div>
			                                        <div class="row">
			                                            <div class="form-group col-md-12">
			                                                <label><spring:message code="replcManage.replcGdcc"/></label>
			                                                <textarea name="replcGdcc" cols="3" class="form-control input-sm" readonly="readonly"></textarea>
			                                            </div>
			                                        </div>
			                                        <div class="row">
			                                            <div class="form-group col-md-12">
			                                                <label><spring:message code="replcManage.replcExcpGdcc"/></label>
			                                                <textarea name="replcExcpGdcc" cols="3" class="form-control input-sm" readonly="readonly"></textarea>
			                                            </div>
			                                        </div>
			                                        <div class="row">
			                                            <div class="form-group col-md-12">
			                                                <label><spring:message code="cmm.remark"/></label>
			                                                <textarea name="remark" cols="3" class="form-control input-sm" readonly="readonly"></textarea>
			                                            </div>
			                                        </div>
			                                    </form>

			                                </div>
			                                <!-- /.box-body -->

                                        </div>
                                        <!-- /.box -->

                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">

                                    </div>
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_3">

                                    </div>
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div>
                            <!-- nav-tabs-custom -->


                        </div>
                    </div>

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
<form name="actionForm" method="post">
</form>

<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>
</body>
</html>