<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4CallCnsltMng.jsp
    Description : 콜상담 관리

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.08.08    harry     최초 생성

    author : wizvil harry
    since : 2018.08.08
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>콜상담 관리</title>
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

        var callCnsltTable;

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


            // 콜상담 테이블
            callCnsltTable = $('#callCnsltTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "multi"
                },
                "order": [[10, "desc"]],
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
                "sAjaxSource": "<c:url value='/ec4/call/outbd/hpcl/selectCallCnsltList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchReplcNm",   "value": $("#searchCallCnsltForm input[name=searchReplcNm]").val()},
                            {"name": "searchHdqrtrsNm",   "value": $("#searchCallCnsltForm input[name=searchHdqrtrsNm]").val()},
                            {"name": "searchProgrsSttusCode", "value": $("#searchCallCnsltForm select[name=searchProgrsSttusCode] option:selected").val()},
                            {"name": "searchProgrsResultCode",   "value": $("#searchCallCnsltForm input[name=searchProgrsResultCode]").val()},
                            {"name": "isCallClos",   "value": $("#searchCallCnsltForm input[name=isCallClos]").val()},
                            {"name": "isCallTrget",  "value": $("#searchCallCnsltForm input[name=isCallTrget]").val()},
                            {"name": "isDrscSmsTrget",  "value": $("#searchCallCnsltForm input[name=isDrscSmsTrget]").val()},
                            {"name": "isDrscTrget",  "value": $("#searchCallCnsltForm input[name=isDrscTrget]").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1, 5, 7, 10, 11, 15]},
                    {"orderable": false, "targets": [0, 1, 5, 7, 10, 11, 15]}
                ],
                "columns": [
                    {"data":"rn"},                                          // 0
                    {"data":"replcSeCode"},                                 // 1   1
                    {"data":"replcSeCodeNm"},                               // 2   1
                    {"data":"hdqrtrsNm"},                                   // 3
                    {"data":"replcNm"},                                     // 4
                    {"data":"progrsSttusCode"},                             // 5
                    {"data":"progrsSttusCodeNm"},                           // 6   4   1
                    {"data":"cstmrEsntlId"},                                // 7   5
                    {"data":"cstmrNm"},                                     // 8   5
                    {"data":"carnbr"},                                      // 9   6
                    {"data":"hpclId"},                                      // 10  7
                    {"data":"hpclKey"},                                     // 11  7..
                    {"data":"hpclTelno"},                                   // 12  8   1
                    {"data":"callCnt", "defaultContent": ""},               // 13  9
                    {"data":"chrgCnslrEsntlNm", "defaultContent": ""},      // 14  10
                    {"data":"frstCallResultCode", "defaultContent": ""},    // 15  11
                    {"data":"callResultCodeNm", "defaultContent": ""},      // 16  11
                    {"data":"frstCallOpetrNm", "defaultContent": ""},       // 17  11
                    {"data":"frstCallProcessDt", "defaultContent": ""},     // 18  11
                    {"data":"altrEsntlNm", "defaultContent": ""},           // 19
                    {"data":"asgnDt", "defaultContent": ""}                 // 20
                ]
            });


            // 콜상담 검색 input search
            $("#searchCallCnsltForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                	callCnsltTable.search(this.value).draw();
                }
            });


            // 콜상담 검색 select search
            $("#searchCallCnsltForm select").on("change", function(key){

            	callCnsltTable.search(this.value).draw();
            });


            // checkbox search
            $("#searchCallCnsltForm input:checkbox").click(function(){

                var $except = $(this);
                var $thisName = $(this).attr("name");
                var $thisChecked = $(this).is(":checked");

                var frm = document.searchCallCnsltForm;

                $("#searchCallCnsltForm input:checkbox").not($except).prop("checked", false);
                $("#searchCallCnsltForm > input:hidden").val("");

                // 체크된게 있을때 실행
                if($thisChecked) {

                	// 체크박스 추가되면 조건 추가
                	if ($thisName == "checkDrscTrget"){
                		frm.isDrscTrget.value = "Y";

                	} else if ($thisName == "checkClos"){
                		frm.isCallClos.value = "Y";

                	} else if ($thisName == "checkCallTrget"){
                		frm.isCallTrget.value = "Y";

                	} else if ($thisName == "checkDrscSmsTrget"){
                		frm.isDrscSmsTrget.value = "Y";
                	}
                } else {

                	callCnsltTable.rows().deselect();
                }

                callCnsltTable.search(this.value).draw();
            });



            // 콜상담 선택
            callCnsltTable.on("select", function (e, dt, type, indexes) {

            	var dataLength = dt.rows(".selected").data().length;

                $("#btnCnslrDstb").removeClass("disabled");

                // 마감대상 체크박스 체크된 상태에서만 허용
                if($("#searchCallCnsltForm input:checkbox[name=checkClos]").is(":checked")){

                    $("#btnClos").removeClass("disabled");
                }

                // 부재중SMS 체크박스 체크된 상태에서만 허용
                if($("#searchCallCnsltForm input:checkbox[name=checkDrscSmsTrget]").is(":checked")){

                    $("#btnDrscSms").removeClass("disabled");
                }

                if(dataLength == 1){

                    $("#btnCnslt").removeClass("disabled");
                } else {

                	$("#btnCnslt").addClass("disabled");
                }
            }).on("deselect", function (e, dt, type, indexes) {

            	var dataLength = dt.rows(".selected").data().length;

            	if (dataLength < 1) {

            	    $(".action-button > button").addClass("disabled");

            	} else if (dataLength == 1) {

                    $("#btnCnslt").removeClass("disabled");

                } else if (dataLength > 1) {

                    $("#btnCnslt").addClass("disabled");
                }
            });


            // 상담원 분배버튼
            $("#btnCnslrDstb").click(function(){

                var params = {};
                var hpclList = [];
                var rowData = callCnsltTable.rows(".selected").data();


                if(!$(this).hasClass("disabled")){

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
                }
            });


            // 상담진행 버튼
            $("#btnCnslt").click(function(){

                var params = {};
                var hpclList = [];
                var rowData = callCnsltTable.rows(".selected").data();

                if(!$(this).hasClass("disabled")){

                    // 상담진행 화면 이동
                    var form = document.actionForm;

                    form.action = "/ec4/call/outbd/cnslt/outbdCallCnsltMng.do";
                    form.searchHpclId.value = rowData[0].hpclId;
                    form.searchCstmrEsntlId.value = rowData[0].cstmrEsntlId;
                    form.searchVhcleEsntlId.value = rowData[0].vhcleEsntlId;

                    form.submit();
                }
            });


            // 마감처리 버튼
            $("#btnClos").click(function(){

                var params = {};
                var hpclList = [];
                var rowData = callCnsltTable.rows(".selected").data();


	            if(!$(this).hasClass("disabled") && $("#searchCallCnsltForm input:checkbox[name=checkClos]").is(":checked")){

	                if(confirm("마감하시겠습니까?")){

	                    if(rowData.length < 1){

	                        alert('<spring:message code="common.select.msg" arguments="${hpclText}"/>');
	                    }else{

	                        for(var i=0 ; i<rowData.length ; i++){

	                            params['hpclList['+i+'].hpclId'] = rowData[i].hpclId;
	                            params['hpclList['+i+'].hpclKey'] = rowData[i].hpclKey;
	                        }

	                        // 마감처리
	                        $.ajax({
	                            "type": "POST",
	                            "dataType": "json",
	                            "async": false,
	                            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
	                            "url": "<c:url value='/ec4/call/outbd/hpcl/closHpcl.do'/>",
	                            "data": params,
	                            "success": function(result) {

	                                if(result.isSuccess){

	                                    alert(result.message);
	                                    //$("div.modal").modal('hide');
	                                    callCnsltTable.search("").draw();
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
	                    }
	                } // end if confirm
                } // end if
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

        	callCnsltTable.draw();
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
                콜상담 관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li class="active">콜상담 관리</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- column -->
                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>콜상담 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="searchCallCnsltForm" id="searchCallCnsltForm" method="post" onsubmit="return false;">
                                <input type="hidden" name="searchProgrsResultCode" id="searchProgrsResultCode"/>
                                <input type="hidden" name="isCallClos"/>
                                <input type="hidden" name="isCallTrget"/>
                                <input type="hidden" name="isDrscSmsTrget"/>
                                <input type="hidden" name="isDrscTrget"/>
                                    <div class="row">
		                                <div class="col-md-3">
		                                    <div class="form-group">
		                                        <label for="">사업소명</label>
		                                        <input type="text" name="searchReplcNm" id="searchReplcNm" placeholder="사업소명" class="form-control input-sm"/>
		                                    </div>
		                                </div>
		                                <div class="col-md-3">
		                                    <div class="form-group">
	                                            <label for="">본부명</label>
	                                            <input type="text" name="searchHdqrtrsNm" id="searchHdqrtrsNm" placeholder="본부명" class="form-control input-sm"/>
	                                        </div>
		                                </div>
		                                <div class="col-md-3">
	                                        <div class="form-group">
		                                        <label for="">진행상태</label>
		                                        <select name="searchProgrsSttusCode" id="searchProgrsSttusCode" class="form-control input-sm">
		                                           <option value="">-- 선택 --</option><c:forEach items="${progrsSttusCode}" var="result" varStatus="status">
		                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
		                                        </select>
		                                    </div>
		                                </div>
                                    </div>

                                    <div class="row">

		                                <div class="col-md-2">
	                                        <div class="form-group">
	                                            <div class="checkbox">
	                                                <label>
	                                                    <input type="checkbox" name="checkDrscTrget"/>
	                                                    1차부재콜
	                                                </label>
	                                            </div>
	                                        </div>
		                                </div>

		                                <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="checkClos"/>
                                                        마감대상
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="checkCallTrget"/>
                                                        콜대상
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <div class="form-group">
                                                <div class="checkbox">
                                                    <label>
                                                        <input type="checkbox" name="checkDrscSmsTrget"/>
                                                        부재중SMS대상
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                            </form>

                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>콜상담 목록</h3>
                            <div class="box-tools pull-right action-button">
                                <button type="button" id="btnCnslt" class="btn btn-sm btn-primary disabled">상담진행</button>
                                <button type="button" id="btnCnslrDstb" class="btn btn-sm btn-primary disabled"><spring:message code="hpcl.cnslr"/> <spring:message code="button.dstb"/></button>
                                <button type="button" id="btnDrscSms" class="btn btn-sm btn-primary disabled">부재중SMS처리</button>
                                <button type="button" id="btnClos" class="btn btn-sm btn-primary disabled">마감처리</button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="callCnsltTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><spring:message code="cmm.seq"/></th>
                                        <th>구분코드</th>
                                        <th>구분</th>
                                        <th>본부명</th>
                                        <th>정비소명</th>
                                        <th>상태코드</th>
                                        <th>상태</th>
                                        <th>고객고유ID</th>
                                        <th>고객명</th>
                                        <th>차량번호</th>
                                        <th>해피콜ID</th>
                                        <th>해피콜KEY</th>
                                        <th>콜번호</th>
                                        <th>콜횟수</th>
                                        <th>담당자</th>
                                        <th>1차콜결과코드</th>
                                        <th>1차콜결과</th>
                                        <th>1차콜처리자</th>
                                        <th>1차콜처리일시</th>
                                        <th>할당자</th>
                                        <th>할당일시</th>
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
    <input type="hidden" name="searchCstmrEsntlId"/>
    <input type="hidden" name="searchVhcleEsntlId"/>
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
