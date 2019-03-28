<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4GoodsManageMng.jsp
    Description : 콜상품 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2019.02.12    harry     최초 생성

    author : wizvil harry
    since : 2019.02.12
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>콜상품 관리</title>
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

        let goodsManageTable;

        $(document).ready(function () {

        	// 상품관리
            goodsManageTable = $('#goodsManageTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                "rowId": "goodsCode",
                "scrollY": "190px",
                "bPaginate": true,
                "pageLength": 100,
                "pagingType": "full_numbers",
                "bLengthChange": false,
                "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": false,
                "searching": false,
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/call/outbd/smt/cgm/selectGoodsManageList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                        {"name": "searchGoodsSe", "value": $("#searchGoodsManageForm select[name=searchGoodsSe] option:selected").val()},
                        {"name": "searchGoodsSj", "value": $("#searchGoodsManageForm input[name=searchGoodsSj]").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1, 3, 4, 8, 9, 10, 11, 12, 13, 14]},
                    {"className": "text-center", "targets": [0, 2, 5, 6, 7]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"goodsCode"},
                    {"data":"goodsNm", "defaultContent": ""},
                    {"data":"callOccnd", "defaultContent": ""},
                    {"data":"smsOccnd", "defaultContent": ""},
                    {"data":"callUntpc", "defaultContent": ""},
                    {"data":"smsUntpc", "defaultContent": ""},
                    {"data":"smsBasscnt", "defaultContent": ""},
                    {"data":"sortOrdr", "defaultContent": ""},
                    {"data":"useAt", "defaultContent": ""},
                    {"data":"remark", "defaultContent": ""},
                    {"data":"frstRegisterId", "defaultContent": ""},
                    {"data":"frstRegistPnttm", "defaultContent": ""},
                    {"data":"lastUpdusrId", "defaultContent": ""},
                    {"data":"lastUpdtPnttm", "defaultContent": ""}
                ]
            });


            // 상품 선택
            goodsManageTable.on("select", function (e, dt, type, indexes) {

                let rowData = dt.rows(indexes).data();

                for(i=0 ; i<rowData.context[0].aoColumns.length ; i++){

                    let key = rowData.context[0].aoColumns[i].data;
                    let value = rowData[0][key];

                    $("#goodsManageDetailVO").find(":input[name='" + key + "']").val(value);
                }
            }).on("deselect", function (e, dt, type, indexes) {

                $("#goodsManageDetailVO").find(":input").val("");
            });


            // 삭제
            $("#btnDelete").click(function(){

                if(confirm('<spring:message code="common.delete.msg"/>')){

                    let params = {};
                    let rowData = goodsManageTable.rows(".selected").data();

                    if(rowData[0]){
                        params.goodsCode = rowData[0].goodsCode;
                    }

                    if(!params.goodsCode){

                        alert('<spring:message code="common.delete.pre.msg" arguments="${goodsCodeText}"/>');
                    } else {

                        $.ajax({
                            "type": "POST",
                            "dataType": "json",
                            "async": false,
                            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                            "url": "<c:url value='/ec4/call/outbd/smt/cgm/deleteGoodsManage.do'/>",
                            "data": params,
                            "success": function(result) {

                                if(result.isSuccess){

                                    alert(result.message);
                                    goodsManageTable.search("").draw();
                                    $("#goodsManageDetailVO").find(":input").val("");
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
            });


            // 등록버튼 팝업 오픈
            $("#btnCreate").click(function(){

                let params = {};
                let url = "/ec4/call/outbd/smt/cgm/goodsManageRegPopup.do";

                let regPopup = new CmmnPopup(url, params);
                regPopup.openPopup();
            });


            // 수정버튼 팝업 오픈
            $("#btnUpdate").click(function(){

                let url = "/ec4/call/outbd/smt/cgm/goodsManageModPopup.do";

                let params = {};
                let rowData = goodsManageTable.rows(".selected").data();

                if(rowData[0]){

                    params.searchGoodsCode = rowData[0].goodsCode;

                    let modPopup = new CmmnPopup(url, params);

                    modPopup.openPopup();
                }else{

                	alert('<spring:message code="common.update.pre.msg" arguments="${goodsCodeText}"/>');
                }
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
                콜상품 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li><a href="#">시스템관리</a></li>
                <li class="active">콜상품 관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- column -->
                <div class="col-md-6">
                    <div class="box box-solid box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상품 목록</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="goodsManageTable" class="table table-hover table-condensed">
                                <thead>
                                    <tr>
                                        <th><spring:message code="cmm.seq"/></th>
                                        <th><spring:message code="goodsManage.goodsCode"/></th>
                                        <th><spring:message code="goodsManage.goodsNm"/></th>
                                        <th><spring:message code="goodsManage.callOccnd"/></th>
                                        <th><spring:message code="goodsManage.smsOccnd"/></th>
                                        <th><spring:message code="goodsManage.callUntpc"/></th>
                                        <th><spring:message code="goodsManage.smsUntpc"/></th>
                                        <th><spring:message code="goodsManage.smsBasscnt"/></th>
                                        <th><spring:message code="cmm.sortOrdr"/></th>
                                        <th><spring:message code="cmm.useAt"/></th>
                                        <th><spring:message code="cmm.remark"/></th>
                                        <th><spring:message code="cmm.frstRegisterId"/></th>
                                        <th><spring:message code="cmm.frstRegistPnttm"/></th>
                                        <th><spring:message code="cmm.lastUpdusrId"/></th>
                                        <th><spring:message code="cmm.lastUpdtPnttm"/></th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <div class="box-tools pull-left">
                                <button type="button" id="btnDelete" class="btn btn-xs btn-danger"><spring:message code="button.delete"/></button>
                            </div>
                            <div class="box-tools pull-right">
                                <button type="button" id="btnCreate" class="btn btn-sm btn-primary"><spring:message code="button.create"/></button>
                                <button type="button" id="btnUpdate" class="btn btn-sm btn-primary"><spring:message code="button.update"/></button>
                            </div>
                        </div>
                        <!-- box-footer -->

                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->
                <div class="col-md-6">

                    <div class="box box-solid box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>상품 상세</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
	                        <!-- form start -->
	                        <form id="goodsManageDetailVO">
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.goodsCode"/></label>
	                                    <input type="text" name="goodsCode" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.goodsNm"/></label>
	                                    <input type="text" name="goodsNm" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.callOccnd"/></label>
	                                    <input type="text" name="callOccnd" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.smsOccnd"/></label>
	                                    <input type="text" name="smsOccnd" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.callUntpc"/></label>
	                                    <input type="text" name="callUntpc" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.smsUntpc"/></label>
	                                    <input type="text" name="smsUntpc" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="goodsManage.smsBasscnt"/></label>
	                                    <input type="text" name="smsBasscnt" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="cmm.useAt"/></label>
	                                    <input type="text" name="useAt" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-12">
	                                    <label><spring:message code="cmm.remark"/></label>
	                                    <textarea name="remark" cols="3" class="form-control input-sm" readonly="readonly"></textarea>
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="cmm.frstRegisterId"/></label>
	                                    <input type="text" name="frstRegisterId" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="cmm.frstRegistPnttm"/></label>
	                                    <input type="text" name="frstRegistPnttm" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                            </div>
	                            <div class="row">
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="cmm.lastUpdusrId"/></label>
	                                    <input type="text" name="lastUpdusrId" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                                <div class="form-group col-md-6">
	                                    <label><spring:message code="cmm.lastUpdtPnttm"/></label>
	                                    <input type="text" name="lastUpdtPnttm" class="form-control input-sm" readonly="readonly" />
	                                </div>
	                            </div>
	                        </form>
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
</form>

<div class="modal modal-default fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
    </div>
</div>

</body>
</html>