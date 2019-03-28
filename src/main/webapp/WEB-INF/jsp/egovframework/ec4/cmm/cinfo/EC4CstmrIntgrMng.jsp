<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CstmrIntgrMngController.java
  * @Description : EC4CstmrIntgrMngController List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2019.02.07    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2019.02.07
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>고객통합정보</title>
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
    <!-- bootstrap daterangepicker -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/select2/dist/css/select2.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/skins/_all-skins.min.css">

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
    <!-- bootstrap daterangepicker -->
    <script src="/resource/adminLTE/bower_components/moment/moment.js"></script>
    <script src="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
    <!-- Select2 -->
    <script src="/resource/adminLTE/bower_components/select2/dist/js/select2.full.min.js"></script>
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
    
    <!-- ################ 사용자 정의 ################################ -->
    <link rel="stylesheet" type="text/css" href="/css/egovframework/ec4/cmm/ec4common.css">

	<!-- ec4 common -->
	<script src="/js/egovframework/ec4/cmm/ec4common.js"></script>


    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">


<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){

    if('${message}'){

        alert('${message}');
    }

    $(".sidebar-menu").tree();

    
    //Date picker
    /* $(".datepicker").datepicker({
      autoclose: true,
      format: "yyyy-mm-dd"
    }); */


    
    


    // 고객통합정보 테이블
    cstmrIntgrTable = $('#cstmrIntgrTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 1, "desc" ]],
        "rowId": "cstmrCd",
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
        "sAjaxSource": "<c:url value='/ec4/cmm/cinfo/cstmrIntgrMngList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "cstmrCd",   	"value": $("#cstmrIntgrMngVO input[name=searchCstmrCd]").val()},
                    {"name": "cstmrNm",   	"value": $("#cstmrIntgrMngVO input[name=searchCstmrNm]").val()},
                    {"name": "hpno",   		"value": $("#cstmrIntgrMngVO input[name=searchHpno]").val()},
                    {"name": "telno",   	"value": $("#cstmrIntgrMngVO input[name=searchTelno]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},
            {"data":"cstmrCd", "defaultContent": ""},
            {"data":"cstmrNm", "defaultContent": ""},
            {"data":"hpno", "defaultContent": ""},
            {"data":"telno", "defaultContent": ""},
            {"data":"brthdy", "defaultContent": ""},
            {"data":"emailAddress", "defaultContent": ""},
            {"data":"mberGrad", "defaultContent": ""},
            {"data":"chevMembYn", "defaultContent": ""},
            {"data":"webMembYn", "defaultContent": ""},
            {"data":"wutoMembYn", "defaultContent": ""},
            {"data":"homeAddress", "defaultContent": ""}
        ]
    });


    // 검색 input search
    $("#cstmrIntgrMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	cstmrIntgrTable.search(this.value).draw();
        }

    });


    // 검색 select search
    $("#cstmrIntgrMngVO select").on("change", function(key){

    	cstmrIntgrTable.search(this.value).draw();
    });


    // 선택
    cstmrIntgrTable.on("select", function (e, dt, type, indexes) {

        $("#btnUpdate").removeClass("disabled");
        $("#btnDeleteAction").removeClass("disabled");
    }).on("deselect", function (e, dt, type, indexes) {

        $("#btnUpdate").addClass("disabled");
        $("#btnDeleteAction").addClass("disabled");
    });


    // 등록버튼
    $("#btnInsert").click(function(){

        var params = {};

        var frm = document.actionForm;

        // 등록 팝업 오픈
        fn_cstmrIntgr_reg_popup(params);
    });


    // 수정버튼
    $("#btnUpdate").click(function(){

        var params = {};

        var rowData = cstmrIntgrTable.rows(".selected").data();
        if(rowData[0]){
            params.cstmrCd = rowData[0].cstmrCd;
        }
        
        // 수정 팝업 오픈
        fn_cstmrIntgr_mod_popup(params);
    });


    // 삭제
    $("#btnDeleteAction").click(function(){

        if(!$(this).hasClass("disabled")){

            if(confirm('<spring:message code="common.delete.msg"/>')){

                var params = {};
                var rowData = cstmrIntgrTable.rows(".selected").data();

                if(rowData[0]){
                    params.cstmrCd = rowData[0].cstmrCd;
                }

                if(!params.cstmrCd){

                    alert('<spring:message code="common.delete.pre.msg" arguments="${cmpgnIdText}"/>');
                } else {

                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/cmm/cinfo/deleteCstmrIntgrMng.do'/>",
                        "data": params,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                cstmrIntgrTable.search("").draw();
                            } else {

                                var errorMsg = "";
                                if(result.message){
                                    for(var i = 0 ; i < result.message.length ; i++){
                                        errorMsg = errorMsg + result.message[i]
                                    }
                                }else{
                                    for(var i = 0 ; i < result.errorMessages.length ; i++){
                                        errorMsg = errorMsg + result.errorMessages[i] + "\n"
                                    }
                                }
                                alert(errorMsg);
                            }
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
                }//if
            }//confirm
        }//hasClass
    });
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	cstmrIntgrTable.search(this.value).draw();
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#cstmrIntgrMngVO input[name=searchCstmrNm]").val() == ""){
			$("#cstmrIntgrMngVO input[name=searchCstmrCd]").val("");
		}
	});


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

        fn_all_grid_reload();
    });

});



// 등록 팝업 오픈
function fn_cstmrIntgr_reg_popup(params){

    $("#popupModal div.modal-content").load("<c:url value='/ec4/cmm/cinfo/cstmrIntgrMngRegPopup.do'/>", params, function(response, status, xhr) {

        if(status == "success"){

            $("#popupModal").modal({"backdrop": "static", "keyboard": false});
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
function fn_cstmrIntgr_mod_popup(params){

   	if(params.cstmrCd){

        $("#popupModal div.modal-content").load("<c:url value='/ec4/cmm/cinfo/cstmrIntgrMngModPopup.do'/>", params, function(response, status, xhr) {

            if(status == "success"){

                $("#popupModal").modal({"backdrop": "static", "keyboard": false});
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

	cstmrIntgrTable.draw();
}


function cstmrSearch(){
	
}
function rtnCnsltTypeList(){
	
}
function rtnCnsltTypeListData(){
	
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
                고객통합정보
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">정보관리</a></li>
                <li class="active">고객통합정보</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="cstmrIntgrMngVO" name="cstmrIntgrMngVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>

            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                    	<h3 class="box-title">검색</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal">
                            <div class="form-group">
                                <label for="searchCustNm" class="col-sm-2 control-label">고객명</label>
                                <div class="col-sm-2">
                                       	<input type="hidden" name="searchCstmrCd" class="form-control" id="searchCstmrCd"/>
                                        <input type="text" name="searchCstmrNm" class="form-control" id="searchCstmrNm"/>
                                </div>
                                <label for="searchHpno" class="col-sm-2 control-label">핸드폰</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchHpno" class="form-control" id="searchHpno"/>
                                </div>
                                <label for="searchTelno" class="col-sm-2 control-label">일반전화</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchTelno" class="form-control" id="searchTelno"/>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
                        <!-- <button type="button" class="btn btn-primary"> 등록</button>
                        <button type="button" class="btn btn-warning"> 삭제</button> -->
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
                </form:form>
            </div>
        </div>


	    <!-- ############################# 메인화면 ######################  -->
      	<div class="box box-primary">
        	<!-- <div class="col-xs-12"> --> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-list"></i>리스트</h3>
                        <div class="box-tools pull-right">
                                <button type="button" id="btnInsert" class="btn btn-sm btn-primary"><spring:message code="button.create"/></button>
                                <button type="button" id="btnUpdate" class="btn btn-sm btn-primary disabled"><spring:message code="button.update"/></button>
                                <button type="button" id="btnDeleteAction" class="btn btn-sm btn-warning disabled"><spring:message code="button.delete"/></button>
                        </div>
                    </div>
                    <!-- /.box-header -->


                    <div class="box-body table-responsive">
							<table id="cstmrIntgrTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th><spring:message code="cmm.seq"/></th>
					                <th>고객번호</th>
					                <th>고객명</th>
					                <th>핸드폰</th>
					                <th>일반전화</th>
						            <th>생일</th>
						            <th>이메일</th>
						            <th>회원등급</th>
						            <th>쉐보레멤버여부</th>
						            <th>웹멤버여부</th>
						            <th>오토멤버여부</th>
						            <th>집주소</th>
					              </tr>
					            </thead>
				          </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- <<<<<<<< box THE END -->
        	<!-- </div> -->
		</div>
      <!-- /.row -->
      
      
      








    </section>
    <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

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

        <div class="modal modal-center fade" id="popupModal">
            <div class="modal-dialog modal-large modal-center">
                <div class="modal-content modal-large">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>


<!-- /.modal -->
	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	    </form>
</body>
</html>
