<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4CmmCodeMng.jsp
    Description : 공통코드 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.05.15    harry     최초 생성

    author : wizvil harry
    since : 2018.05.15
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>공통코드 관리</title>
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

        $(document).ready(function () {

        	if('${message}'){

        		alert('${message}');
        	}

            $(".sidebar-menu").tree();


            // 공통코드 테이블
            var cmmCodeTable = $('#cmmCodeTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 4, "asc" ]],
                "rowId": "codeId",
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
                "sAjaxSource": "<c:url value='/ec4/cmm/cbase/cmt/selectCmmCodeList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchClCode",   "value": $("#searchCmmCodeForm select[name=searchClCode] option:selected").val()},
                            {"name": "searchCodeId",   "value": $("#searchCmmCodeForm input[name=searchCodeId]").val()},
                            {"name": "searchCodeIdNm", "value": $("#searchCmmCodeForm input[name=searchCodeIdNm]").val()},
                            {"name": "searchUseAt",    "value": $("#searchCmmCodeForm select[name=searchUseAt] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1]},
                    {"orderable": false, "targets": [0, 5]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"clCode"},
                    {"data":"clCodeNm"},
                    {"data":"codeId"},
                    {"data":"codeIdNm"},
                    {"data":"useAt"}
                ]
            });


            // 공통코드 검색 input search
            $("#searchCmmCodeForm input").on("keyup change", function(key){

                if(key.keyCode == 13){

                	cmmCodeTable.search(this.value).draw();
                }
            });

            // 공통코드 검색 select search
            $("#searchCmmCodeForm select").on("change", function(key){

            	cmmCodeTable.search(this.value).draw();
            });

            // 공통코드 선택
            cmmCodeTable.on("select", function (e, dt, type, indexes) {

            	$("#btnCmmCodeUpdate").removeClass("disabled");
                $("#btnCmmCodeDelete").removeClass("disabled");
            }).on("deselect", function (e, dt, type, indexes) {

            	$("#btnCmmCodeUpdate").addClass("disabled");
                $("#btnCmmCodeDelete").addClass("disabled");
            });


            // 등록
            $("#btnCmmCodeInsert").click(function(){

                var frm = document.actionForm;

                frm.action = "<c:url value='/ec4/cmm/cbase/cmt/registCmmCodeView.do'/>";

                frm.submit();
            });


            // 수정
            $("#btnCmmCodeUpdate").click(function(){

            	if(!$(this).hasClass("disabled")){

            		var rowData = cmmCodeTable.rows(".selected").data();
            		var codeId = rowData[0].codeId;

            		if(codeId){

                        var frm = document.actionForm;

                        frm.action = "<c:url value='/ec4/cmm/cbase/cmt/modifyCmmCodeView.do'/>";
                        frm.codeId.value = codeId;

                        frm.submit();
            		}//if
            	}//hasClass
            });


            // 삭제
            $("#btnCmmCodeDelete").click(function(){

            	if(!$(this).hasClass("disabled")){

            		if(confirm('<spring:message code="common.delete.msg"/>')){

		            	var params = {};
		            	var rowData = cmmCodeTable.rows(".selected").data();

		            	if(rowData[0]){

		            	    params.codeId = rowData[0].codeId;
		            	}


		                if(!params.codeId){
		                    // if(!$(this).hasClass("disabled")) 여기서 1차로 걸러져서 실행 될 일이 없음
		                    alert('<spring:message code="common.delete.pre.msg" arguments="코드"/>');
		                } else {

		                    $.ajax({
		                        "type": "POST",
		                        "dataType": "json",
		                        "async": false,
		                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
		                        "url": "<c:url value='/ec4/cmm/cbase/cmt/deleteCmmCode.do'/>",
		                        "data": params,
		                        "success": function(result) {

		                            if(result.isSuccess){

		                                alert(result.message);
		                                cmmCodeTable.search("").draw();
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


        });
        // end ready
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
                공통코드 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">기준정보</a></li>
                <li class="active">공통코드 관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- left column -->
                <div class="col-md-12">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>공통코드 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchCmmCodeForm" id="searchCmmCodeForm" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="searchClCode" class="col-sm-2 control-label">분류명</label>
                                    <div class="col-sm-10">
                                           <select name="searchClCode" id="searchClCode" class="form-control input-sm">
                                               <option value="">-- 분류명선택 --</option><c:forEach items="${clCodeList}" var="result" varStatus="status">
                                               <option value="${result.code}">${result.codeNm}</option></c:forEach>
                                           </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchCodeId" class="col-sm-2 control-label">코드ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCodeId" id="searchCodeId" placeholder="코드ID" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchCodeIdNm" class="col-sm-2 control-label">코드명</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCodeIdNm" id="searchCodeIdNm" placeholder="코드명" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group margin-bottom-none">
                                    <label class="col-sm-2 control-label">사용여부</label>
                                    <div class="col-sm-10">
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
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>공통코드 목록</h3>
                            <div class="box-tools pull-right">
                                <button type="button" id="btnCmmCodeInsert" class="btn btn-sm btn-primary">등록</button>
                                <button type="button" id="btnCmmCodeUpdate" class="btn btn-sm btn-primary disabled">수정</button>
                                <button type="button" id="btnCmmCodeDelete" class="btn btn-sm btn-warning disabled">삭제</button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="cmmCodeTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th>분류코드</th>
                                        <th>분류명</th>
                                        <th>코드ID</th>
                                        <th>코드명</th>
                                        <th>사용여부</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!-- /.box-body -->
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
<form name="actionForm" method="post">
    <input type="hidden" name="codeId" />
</form>
</body>
</html>
