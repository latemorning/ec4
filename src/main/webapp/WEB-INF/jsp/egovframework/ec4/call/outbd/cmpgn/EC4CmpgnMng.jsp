<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4CmpgnMng.jsp
    Description : 캠페인 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.06.29    harry     최초 생성

    author : wizvil harry
    since : 2018.06.29
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>캠페인 관리</title>
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
    
    <!-- jfile -->    
    <link href="<c:url value="/resource/jfile/swfupload/css/custom.css" />" rel="stylesheet" type="text/css" />
    

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

    <!-- jfile -->    
    <script type="text/javascript" src="<c:url value="/resource/jfile/json.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/jwork/jwork.fileUpload.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/jwork/jwork.fileDownload.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/swfupload/swfupload/swfupload.js" />"></script>
    <script type="text/javascript" src="<c:url value="/resource/jfile/swfupload/js/swfupload.queue.js" />"></script>
    
    <script type="text/javascript">

        var cmpgnTable;

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


            // 캠페인 테이블
            cmpgnTable = $('#cmpgnTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                "rowId": "cmpgnId",
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
                "sAjaxSource": "<c:url value='/ec4/call/outbd/cmpgn/selectCmpgnList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchCmpgnNm",   "value": $("#searchCmpgnForm input[name=searchCmpgnNm]").val()},
                            {"name": "searchBeginDe",   "value": $("#searchCmpgnForm input[name=searchBeginDe]").val()},
                            {"name": "searchEndDe",     "value": $("#searchCmpgnForm input[name=searchEndDe]").val()},
                            {"name": "searchSttusCode", "value": $("#searchCmpgnForm select[name=searchSttusCode] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"cmpgnId"},
                    {"data":"cmpgnNm"},
                    {"data":"beginDe"},
                    {"data":"endDe", "defaultContent": ""},
                    {"data":"sttusCodeNm", "defaultContent": ""},
                    {"data":"registerId"},
                    {"data":"registDe"}
                ]
            });


            // 캠페인 검색 input search
            $("#searchCmpgnForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                	cmpgnTable.search(this.value).draw();
                }

            });


            // 캠페인 검색 select search
            $("#searchCmpgnForm select").on("change", function(key){

            	cmpgnTable.search(this.value).draw();
            });


            // 캠페인 선택
            cmpgnTable.on("select", function (e, dt, type, indexes) {

                $("#btnCmpgnUpdate").removeClass("disabled");
                $("#btnCmpgnDeleteAction").removeClass("disabled");
            }).on("deselect", function (e, dt, type, indexes) {

                $("#btnCmpgnUpdate").addClass("disabled");
                $("#btnCmpgnDeleteAction").addClass("disabled");
            });


            // 등록버튼
            $("#btnCmpgnInsert").click(function(){

                var params = {};

                var frm = document.actionForm;

                // 등록 팝업 오픈
                fn_cmpgn_reg_popup(params);
            });


            // 수정버튼
            $("#btnCmpgnUpdate").click(function(){

                var params = {};

                var rowData = cmpgnTable.rows(".selected").data();
                if(rowData[0]){
                    params.cmpgnId = rowData[0].cmpgnId;
                }

                // 수정 팝업 오픈
                fn_cmpgn_mod_popup(params);
            });


            // 삭제
            $("#btnCmpgnDeleteAction").click(function(){

                if(!$(this).hasClass("disabled")){

                    if(confirm('<spring:message code="common.delete.msg"/>')){

                        var params = {};
                        var rowData = cmpgnTable.rows(".selected").data();

                        if(rowData[0]){
                            params.cmpgnId = rowData[0].cmpgnId;
                        }

                        if(!params.cmpgnId){

                            alert('<spring:message code="common.delete.pre.msg" arguments="${cmpgnIdText}"/>');
                        } else {

                            $.ajax({
                                "type": "POST",
                                "dataType": "json",
                                "async": false,
                                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                                "url": "<c:url value='/ec4/call/outbd/cmpgn/deleteCmpgn.do'/>",
                                "data": params,
                                "success": function(result) {

                                    if(result.isSuccess){

                                        alert(result.message);
                                        cmpgnTable.search("").draw();
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

                fn_all_grid_reload();
            });

        });
        // end ready


        // 등록 팝업 오픈
        function fn_cmpgn_reg_popup(params){

            $("div.modal-content").load("<c:url value='/ec4/call/outbd/cmpgn/cmpgnRegPopup.do'/>", params, function(response, status, xhr) {

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
        function fn_cmpgn_mod_popup(params){

           	if(params.cmpgnId){

                $("div.modal-content").load("<c:url value='/ec4/call/outbd/cmpgn/cmpgnModPopup.do'/>", params, function(response, status, xhr) {

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

        	cmpgnTable.draw();
        }

        function send1(){       
            fileUploadObj1.startUpload();
        }
        function uploadCompleted1(){
            fileUploadObj1.refresh();
            //alert(fileUploadObj1.getFileId());
            frm = document.cmpgnVO;
            frm.fileId.value = fileUploadObj1.getFileId();
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
                캠페인 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li class="active">캠페인 관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- left column -->
                <div class="col-md-12">

                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>캠페인 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchCmpgnForm" id="searchCmpgnForm" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="searchCmpgnNm" class="col-sm-2 control-label"><spring:message code="cmpgn.cmpgnNm"/></label>
                                    <div class="col-sm-10">
                                        <input type="text" name="searchCmpgnNm" id="searchCmpgnNm" placeholder='<spring:message code="cmpgn.cmpgnNm"/>' class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="searchBeginDe" class="col-sm-2 control-label"><spring:message code="cmpgn.beginDe"/></label>
                                    <div class="col-sm-4">
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <input type="text" name="searchBeginDe" id="searchBeginDe" placeholder='<spring:message code="cmpgn.beginDe"/>' class="form-control input-sm datepicker"/>
                                        </div>
                                    </div>
                                    <label for="searchEndDe" class="col-sm-2 control-label"><spring:message code="cmpgn.endDe"/></label>
                                    <div class="col-sm-4">
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <input type="text" name="searchEndDe" id="searchEndDe" placeholder='<spring:message code="cmpgn.endDe"/>' class="form-control input-sm datepicker"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group margin-bottom-none">
                                    <label class="col-sm-2 control-label"><spring:message code="cmpgn.sttus"/></label>
                                    <div class="col-sm-10">
                                        <select name="searchSttusCode" id="searchSttusCode" class="form-control input-sm">
                                           <option value="">-- 선택 --</option><c:forEach items="${sttusCodeList}" var="result" varStatus="status">
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
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>캠페인 목록</h3>
                            <div class="box-tools pull-right">
                                <button type="button" id="btnCmpgnInsert" class="btn btn-sm btn-primary"><spring:message code="button.create"/></button>
                                <button type="button" id="btnCmpgnUpdate" class="btn btn-sm btn-primary disabled"><spring:message code="button.update"/></button>
                                <button type="button" id="btnCmpgnDeleteAction" class="btn btn-sm btn-warning disabled"><spring:message code="button.delete"/></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="cmpgnTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><spring:message code="cmm.seq"/></th>
                                        <th><spring:message code="cmpgn.cmpgnId"/></th>
                                        <th><spring:message code="cmpgn.cmpgnNm"/></th>
                                        <th><spring:message code="cmpgn.beginDe"/></th>
                                        <th><spring:message code="cmpgn.endDe"/></th>
                                        <th><spring:message code="cmpgn.sttus"/></th>
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
