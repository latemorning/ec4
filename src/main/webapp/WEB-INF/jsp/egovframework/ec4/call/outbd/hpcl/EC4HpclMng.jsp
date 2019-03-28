<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4HpclMng.jsp
    Description : 해피콜 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.07.10    harry     최초 생성

    author : wizvil harry
    since : 2018.07.10
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>해피콜 인터페이스</title>
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

        var hpclTable;

        $(document).ready(function () {

            if('${message}'){

                alert('${message}');
            }

            $(".sidebar-menu").tree();

            //Date picker
            $(".datepicker").datepicker({
              autoclose: true,
              format: "yyyy-mm-dd"
            });


            // 해피콜 테이블
            hpclTable = $('#hpclTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "multi"
                },
                "order": [[ 1, "desc" ]],
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
                "sAjaxSource": "<c:url value='/ec4/call/outbd/hpcl/selectHpclList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchCmpgnNm",   "value": $("#searchHpclForm input[name=searchCmpgnNm]").val()},
                            {"name": "searchCstmrNm",   "value": $("#searchHpclForm input[name=searchCstmrNm]").val()},
                            {"name": "searchHpclTelno",   "value": $("#searchHpclForm input[name=searchHpclTelno]").val()},
                            {"name": "searchMemo",     "value": $("#searchHpclForm input[name=searchMemo]").val()},
                            {"name": "searchProgrsSttusCode", "value": $("#searchHpclForm select[name=searchProgrsSttusCode] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1, 2, 6, 10]},
                    {"orderable": false, "targets": [0, 1, 2, 6, 10]}
                ],
                "columns": [
                    {"data":"rn"},                                   // 0
                    {"data":"hpclId"},                               // 1   1
                    {"data":"cmpgnId", "defaultContent": ""},        // 2   1
                    {"data":"cmpgnNm", "defaultContent": ""},        // 3
                    {"data":"cnslrId", "defaultContent": ""},        // 4
                    {"data":"cnslrNm", "defaultContent": ""},        // 5
                    {"data":"cstmrEsntlId", "defaultContent": ""},   // 6   4   1
                    {"data":"cstmrNm", "defaultContent": ""},        // 7   5
                    {"data":"hpclTelno"},                            // 8   6
                    {"data":"memo", "defaultContent": ""},           // 9   7
                    {"data":"progrsSttusCode"},                      // 10  8   1
                    {"data":"progrsSttusCodeNm"},                    // 11  9
                    {"data":"frstRegisterId", "defaultContent": ""}, // 12  10
                    {"data":"frstRegistPnttm", "defaultContent": ""} // 13  11
                ]
            });


            // 해피콜 검색 input search
            $("#searchHpclForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                    hpclTable.search(this.value).draw();
                }
            });

            // 해피콜 검색 select search
            $("#searchHpclForm select").on("change", function(key){

                hpclTable.search(this.value).draw();
            });


            // 해피콜 선택
            hpclTable.on("select", function (e, dt, type, indexes) {

            	var dataLength = dt.rows(".selected").data().length;

                $("#btnHpclDstb").removeClass("disabled");
                $("#btnCnslrDstb").removeClass("disabled");

                if(dataLength == 1){

                    $("#btnCnslt").removeClass("disabled");
                } else {

                	$("#btnCnslt").addClass("disabled");
                }
            }).on("deselect", function (e, dt, type, indexes) {

            	var dataLength = dt.rows(".selected").data().length;

            	if(dataLength < 1){

            	    $("#btnHpclDstb").addClass("disabled");
            	    $("#btnCnslrDstb").addClass("disabled");
            	}

            	if(dataLength == 1){

                    $("#btnCnslt").removeClass("disabled");
                } else {

                    $("#btnCnslt").addClass("disabled");
                }
            });


            // 캠페인 분배버튼
            $("#btnHpclDstb").click(function(){

                var params = {};
                var hpclList = [];
                var rowData = hpclTable.rows(".selected").data();


                if(rowData.length < 1){

                	alert('<spring:message code="common.select.msg" arguments="${hpclText}"/>');
                }else{

                	for(var i=0 ; i<rowData.length ; i++){

                		params['hpclList['+i+'].hpclId'] = rowData[i].hpclId;
                		params['hpclList['+i+'].oldCmpgnId'] = rowData[i].cmpgnId;
                	}

                    // 분배 팝업 오픈
                    fn_hpcl_dstb_popup(params);
                }
            });


            // 상담원 분배버튼
            $("#btnCnslrDstb").click(function(){

                var params = {};
                var hpclList = [];
                var rowData = hpclTable.rows(".selected").data();


                if(rowData.length < 1){

                    alert('<spring:message code="common.select.msg" arguments="${hpclText}"/>');
                }else{

                    for(var i=0 ; i<rowData.length ; i++){

                        params['hpclList['+i+'].hpclId'] = rowData[i].hpclId;
                        params['hpclList['+i+'].cmpgnId'] = rowData[i].cmpgnId;
                    }

                    // 분배 팝업 오픈
                    fn_cnslr_dstb_popup(params);
                }
            });


            // 상담진행 버튼
            $("#btnCnslt").click(function(){

                var params = {};
                var hpclList = [];
                var rowData = hpclTable.rows(".selected").data();

                if(!$(this).hasClass("disabled")){

                    // 상담진행 화면 이동
                    var form = document.actionForm;

                    form.action = "/ec4/call/outbd/cnslt/outbdCnsltMng.do";
                    form.searchHpclId.value = rowData[0].hpclId;
                    form.searchCmpgnId.value = rowData[0].cmpgnId;
                    form.searchCstmrEsntlId.value = rowData[0].cstmrEsntlId;

                    form.submit();
                }
            });


            // modal close event
            $("div.modal").on('hide.bs.modal', function (event) {

                fn_all_grid_reload();
            });

            $("div.modal").on('shown.bs.modal', function (event) {

            	// 모달로 datatable 그릴 때 헤더 크기 맞춤
                $(window).trigger('resize');
            });

        });
        // end ready


        // 분배 팝업 오픈
        function fn_hpcl_dstb_popup(params){

            $("div.modal-content").load("<c:url value='/ec4/call/outbd/hpcl/hpclDstbPopup.do'/>", params, function(response, status, xhr) {

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


        // 상담원 분배 팝업 오픈
        function fn_cnslr_dstb_popup(params){

            $("div.modal-content").load("<c:url value='/ec4/call/outbd/hpcl/cnslrDstbPopup.do'/>", params, function(response, status, xhr) {

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


        // 그리드 reload
        function fn_all_grid_reload(){

            hpclTable.draw();
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
                해피콜 인터페이스
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li class="active">해피콜 인터페이스</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- left column -->
                <div class="col-md-12">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>해피콜 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchHpclForm" id="searchHpclForm" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="searchCmpgnNm" class="col-sm-2 control-label"><spring:message code="cmpgn.cmpgnNm"/></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCmpgnNm" id="searchCmpgnNm" placeholder="<spring:message code="cmpgn.cmpgnNm"/>" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchCstmrNm" class="col-sm-2 control-label"><spring:message code="cmm.cstmrNm"/></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCstmrNm" id="searchCstmrNm" placeholder="<spring:message code="cmm.cstmrNm"/>" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchHpclTelno" class="col-sm-2 control-label"><spring:message code="hpcl.hpclTelno"/></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchHpclTelno" id="searchHpclTelno" placeholder="<spring:message code="hpcl.hpclTelno"/>" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchMemo" class="col-sm-2 control-label"><spring:message code="hpcl.memo"/></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchMemo" id="searchMemo" placeholder="<spring:message code="hpcl.memo"/>" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group margin-bottom-none">
                                    <label class="col-sm-2 control-label"><spring:message code="hpcl.progrsSttusCode"/></label>
                                    <div class="col-sm-10">
                                        <select name="searchProgrsSttusCode" id="searchProgrsSttusCode" class="form-control input-sm">
                                           <option value="">-- 선택 --</option><c:forEach items="${progrsSttusCode}" var="result" varStatus="status">
                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
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
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>해피콜 목록</h3>
                            <div class="box-tools pull-right">
                                <button type="button" id="btnCnslt" class="btn btn-sm btn-primary disabled">상담진행</button>
                                <button type="button" id="btnHpclDstb" class="btn btn-sm btn-primary disabled"><spring:message code="cmpgn.cmpgn"/> <spring:message code="button.dstb"/></button>
                                <button type="button" id="btnCnslrDstb" class="btn btn-sm btn-primary disabled"><spring:message code="hpcl.cnslr"/> <spring:message code="button.dstb"/></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="hpclTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><spring:message code="cmm.seq"/></th>
                                        <th><spring:message code="hpcl.hpclId"/></th>
                                        <th><spring:message code="cmpgn.cmpgnId"/></th>
                                        <th><spring:message code="cmpgn.cmpgnNm"/></th>
                                        <th><spring:message code="hpcl.cnslrId"/></th>
                                        <th><spring:message code="hpcl.cnslrNm"/></th>
                                        <th><spring:message code="hpcl.cstmrEsntlId"/></th>
                                        <th><spring:message code="cmm.cstmrNm"/></th>
                                        <th><spring:message code="hpcl.hpclTelno"/></th>
                                        <th><spring:message code="hpcl.memo"/></th>
                                        <th><spring:message code="hpcl.progrsSttusCode"/></th>
                                        <th><spring:message code="hpcl.progrsSttus"/></th>
                                        <th><spring:message code="cmm.frstRegisterId"/></th>
                                        <th><spring:message code="cmm.frstRegistPnttm"/></th>
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
    <input type="hidden" name="searchHpclId"/>
    <input type="hidden" name="searchCmpgnId"/>
    <input type="hidden" name="searchCstmrEsntlId"/>
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
</body>
</html>
