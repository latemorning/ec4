<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4DetailCodeMng.jsp
    Description : 상세코드 관리

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
    <title>상세코드 관리</title>
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


            // 상세코드 테이블
            var detailCodeTable = $('#detailCodeTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 4, "asc" ]],
                //"rowId": "codeId",
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
                "sAjaxSource": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchCodeId",   "value": $("#searchDetailCodeForm input[name=searchCodeId]").val()},
                            {"name": "searchCodeIdNm", "value": $("#searchDetailCodeForm input[name=searchCodeIdNm]").val()},
                            {"name": "searchCode",     "value": $("#searchDetailCodeForm input[name=searchCode]").val()},
                            {"name": "searchCodeNm",   "value": $("#searchDetailCodeForm input[name=searchCodeNm]").val()},
                            {"name": "searchUseAt",    "value": $("#searchDetailCodeForm select[name=searchUseAt] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": []},
                    {"orderable": false, "targets": [0, 5]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"codeId"},
                    {"data":"codeIdNm"},
                    {"data":"code"},
                    {"data":"codeNm"},
                    {"data":"useAt"}
                ]
            });


            // 상세코드 검색 input search
            $("#searchDetailCodeForm input").on("keyup change", function(key){

                if(key.keyCode == 13){

                	detailCodeTable.search(this.value).draw();
                }
            });

            // 상세코드 검색 select search
            $("#searchDetailCodeForm select").on("change", function(key){

            	detailCodeTable.search(this.value).draw();
            });

            // 상세코드 선택
            detailCodeTable.on("select", function (e, dt, type, indexes) {

                $("#btnDetailCodeUpdate").removeClass("disabled");
                $("#btnDetailCodeDelete").removeClass("disabled");
            }).on("deselect", function (e, dt, type, indexes) {

                $("#btnDetailCodeUpdate").addClass("disabled");
                $("#btnDetailCodeDelete").addClass("disabled");
            });


            // 등록
            $("#btnDetailCodeInsert").click(function(){

                var frm = document.actionForm;

                frm.action = "<c:url value='/ec4/cmm/cbase/cmt/registDetailCodeView.do'/>";

                frm.submit();
            });


            // 수정
            $("#btnDetailCodeUpdate").click(function(){

                if(!$(this).hasClass("disabled")){

                    var rowData = detailCodeTable.rows(".selected").data();
                    var code = rowData[0].code;
                    var codeId = rowData[0].codeId;

                    if(code && codeId){

                        var frm = document.actionForm;

                        frm.action = "<c:url value='/ec4/cmm/cbase/cmt/modifyDetailCodeView.do'/>";
                        frm.code.value = code;
                        frm.codeId.value = codeId;

                        frm.submit();
                    }//if
                }//hasClass
            });


            // 삭제
            $("#btnDetailCodeDelete").click(function(){

                if(!$(this).hasClass("disabled")){

                    if(confirm('<spring:message code="common.delete.msg"/>')){

                        var params = {};
                        var rowData = detailCodeTable.rows(".selected").data();

                        if(rowData[0]){

                        	params.code = rowData[0].code;
                            params.codeId = rowData[0].codeId;
                        }

                        if(params.codeId && params.code){

                        	$.ajax({
                                "type": "POST",
                                "dataType": "json",
                                "async": false,
                                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                                "url": "<c:url value='/ec4/cmm/cbase/cmt/deleteDetailCode.do'/>",
                                "data": params,
                                "success": function(result) {

                                    if(result.isSuccess){

                                        alert(result.message);
                                        detailCodeTable.search("").draw();
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

                            // if(!$(this).hasClass("disabled")) 여기서 1차로 걸러져서 실행 될 일이 없음
                            alert('<spring:message code="common.delete.pre.msg" arguments="상세코드"/>');
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
                상세코드 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">기준정보</a></li>
                <li class="active">상세코드 관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- left column -->
                <div class="col-md-12">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>상세코드 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchDetailCodeForm" id="searchDetailCodeForm" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="searchCodeId" class="col-sm-2 control-label">코드</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCodeId" id="searchCodeId" placeholder="코드" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchCodeIdNm" class="col-sm-2 control-label">코드명</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCodeIdNm" id="searchCodeIdNm" placeholder="코드명" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchCode" class="col-sm-2 control-label">상세코드</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCode" id="searchCode" placeholder="상세코드" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchCodeNm" class="col-sm-2 control-label">상세코드명</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCodeNm" id="searchCodeNm" placeholder="상세코드명" class="form-control input-sm"/>
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
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상세코드 목록</h3>
                            <div class="box-tools pull-right">
                                <button type="button" id="btnDetailCodeInsert" class="btn btn-sm btn-primary">등록</button>
                                <button type="button" id="btnDetailCodeUpdate" class="btn btn-sm btn-primary disabled">수정</button>
                                <button type="button" id="btnDetailCodeDelete" class="btn btn-sm btn-warning disabled">삭제</button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="detailCodeTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>상세코드</th>
                                        <th>상세코드명</th>
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
    <input type="hidden" name="code" />
    <input type="hidden" name="codeId" />
</form>
</body>
</html>
