<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4MsgTmplatMng.jsp
    Description : SMS템플릿 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2019.01.31    harry     최초 생성

    author : wizvil harry
    since : 2019.01.31
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SMS템플릿 관리</title>
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

        $(document).ready(function () {

            if('${message}'){
                alert('${message}');
            }


            // SMS템플릿 테이블
            var smsTmplatTable = $('#smsTmplatTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                "rowId": "smsTmplatId",
                "scrollY": "360px",
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
                "sAjaxSource": "<c:url value='/ec4/call/outbd/smt/stm/selectMsgTmplatList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                        {"name": "searchSmsTmplatSe", "value": $("#searchSmsTmplatForm select[name=searchSmsTmplatSe] option:selected").val()},
                        {"name": "searchSmsTmplatSj", "value": $("#searchSmsTmplatForm input[name=searchSmsTmplatSj]").val()},
                        {"name": "searchSndngCn",     "value": $("#searchSmsTmplatForm input[name=searchSndngCn]").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1, 4, 5, 6]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"smsTmplatId"},
                    {"data":"smsTmplatSe", "defaultContent": ""},
                    {"data":"smsTmplatSj", "defaultContent": ""},
                    {"data":"sndngCn", "defaultContent": ""},
                    {"data":"frstRegisterId", "defaultContent": ""},
                    {"data":"frstRegistPnttm", "defaultContent": ""}
                ]
            });




            // 검색 input search
            $("#searchCmpgnForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                	smsTmplatTable.search(this.value).draw();
                }

            });


            // 검색 select search
            $("#searchCmpgnForm select").on("change", function(key){

            	smsTmplatTable.search(this.value).draw();
            });


            // 선택
            smsTmplatTable.on("select", function (e, dt, type, indexes) {

                $("#btnCmpgnUpdate").removeClass("disabled");
                $("#btnCmpgnDeleteAction").removeClass("disabled");
            }).on("deselect", function (e, dt, type, indexes) {

                $("#btnCmpgnUpdate").addClass("disabled");
                $("#btnCmpgnDeleteAction").addClass("disabled");
            });




        });
        // end ready





    </script>
</head>

<body class="hold-transition skin-blue sidebar-mini">

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <!-- column -->
            <div class="col-md-7">
            </div>

            <div class="col-md-5">



                            <div class="nav-tabs-custom">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#tab_1" data-toggle="tab">정비소 상세</a></li>
                                    <li><a href="#tab_2" data-toggle="tab">SMS 템플릿</a></li>
                                    <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1">

                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-search"></i>메시지 템플릿 검색</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <form name="searchSmsTmplatForm" id="searchSmsTmplatForm" method="post" class="" onsubmit="return false;">
                            <div class="row">
                             <div class="form-group col-md-4">
                                 <label for="searchSmsTmplatSe"><spring:message code="msgTmplat.smsTmplatSe"/></label>
                                 <select name="searchSmsTmplatSe" id="searchSmsTmplatSe" class="form-control input-sm">
                                       <option value="">-- 선택 --</option><c:forEach items="${smsTmplatSeList}" var="result" varStatus="status">
                                       <option value="${result.code}">${result.codeNm}</option></c:forEach>
                                    </select>
                             </div>
                             <div class="form-group col-md-4">
                                 <label for=""><spring:message code="msgTmplat.smsTmplatSj"/></label>
                                 <input type="text" name="searchSmsTmplatSj" id="searchSmsTmplatSj" placeholder="<spring:message code="msgTmplat.smsTmplatSj"/>" class="form-control input-sm"/>
                             </div>
                             <div class="form-group col-md-4">
                                 <label for=""><spring:message code="msgTmplat.sndngCn"/></label>
                                 <input type="text" name="searchSndngCn" id="searchSndngCn" placeholder="<spring:message code="msgTmplat.sndngCn"/>" class="form-control input-sm"/>
                             </div>
                         </div>
                        </form>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->

                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-list"></i>메시지 템플릿 목록</h3>
                        <div class="box-tools pull-right">
                            <button type="button" id="btnInsert" class="btn btn-sm btn-warning btn-cnslt-del"><spring:message code="button.delete"/></button>
                            <button type="button" id="btnInsert" class="btn btn-sm btn-primary btn-cnslt-reg"><spring:message code="button.create"/></button>
                            <button type="button" id="btnUpdate" class="btn btn-sm btn-primary btn-cnslt-mod"><spring:message code="button.update"/></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="smsTmplatTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th><spring:message code="cmm.seq"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatId"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatSe"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatSj"/></th>
                                    <th><spring:message code="msgTmplat.sndngCn"/></th>
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
                                    <!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2">

                                    </div>
                                    <!-- /.tab-pane -->
                                </div>
                                <!-- /.tab-content -->
                            </div>
                            <!-- nav-tabs-custom -->



            </div>
            <!--/.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->

<form name="actionForm" method="post">
</form>

</body>
</html>