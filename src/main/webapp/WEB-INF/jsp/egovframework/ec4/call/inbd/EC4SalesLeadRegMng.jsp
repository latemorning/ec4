<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EgovGroupManage.java
  * @Description : EgovGroupManage List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.16    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.04.16
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
    <title>SALES리드 판매정보</title>
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
	$("#searchBeginDe").val((moment().subtract(1, 'month')).format('YYYY-MM-DD'));
	$("#searchEndDe").val(moment().format('YYYY-MM-DD'));
    $("#cnsltDe").daterangepicker({ //참조: http://www.daterangepicker.com/
        //dateFormat: 'YYYY-MM-DD',
        startDate: moment().subtract(1, 'month'), //1개월전
        //startDate: moment().subtract(30, 'days'), //30일전
        locale: {
        	format : 'YYYY-MM-DD'
        }
    }, function(start, end, label) {
    	//console.log("start["+start.format('YYYY-MM-DD')+"]");
    	//console.log("end["+end.format('YYYY-MM-DD')+"]");
    });
    $('#cnsltDe').on('apply.daterangepicker', function(ev, picker) { 
    	//console.log(picker.startDate.format('YYYY-MM-DD')); 
    	//console.log(picker.endDate.format('YYYY-MM-DD')); 
    	$("#searchBeginDe").val(picker.startDate.format('YYYY-MM-DD'));
    	$("#searchEndDe").val(picker.endDate.format('YYYY-MM-DD'));
    }); 
    $('#cnsltDe').on('cancel.daterangepicker', function(ev, picker) {
    	//취소눌러도 검색기본조건으로 사용되도록 초기화하지 않는다
    	//$('#cnsltDe').val(''); 
    }); 


    
    


    // 캠페인 테이블
    salesLeadTable = $('#salesLeadTable').DataTable({
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
        "sAjaxSource": "<c:url value='/ec4/call/inbd/salesLeadRegMngList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrCd]").val()},
                    {"name": "searchCstmrNm",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrNm]").val()},
                    {"name": "searchShopNm",   "value": $("#cnsltInBoundMngVO input[name=searchShopNm]").val()},
                    {"name": "searchBeginDe",   "value": $("#cnsltInBoundMngVO input[name=searchBeginDe]").val()},
                    {"name": "searchEndDe",     "value": $("#cnsltInBoundMngVO input[name=searchEndDe]").val()},
                    {"name": "searchHpno",   	"value": $("#cnsltInBoundMngVO input[name=searchHpno]").val()},
                    {"name": "searchTelno",   	"value": $("#cnsltInBoundMngVO input[name=searchTelno]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,2,3]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},
            {"data":"cstmrCd", "defaultContent": ""},
            {"data":"leadDt", "defaultContent": ""},
            {"data":"leadSeq", "defaultContent": ""},
            {"data":"cstmrNm", "defaultContent": ""},
            {"data":"callerNm", "defaultContent": ""},
            {"data":"hpno", "defaultContent": ""},
            {"data":"telno", "defaultContent": ""},
            {"data":"modelNm", "defaultContent": ""},
            {"data":"shopNm", "defaultContent": ""},
            {"data":"delvDt", "defaultContent": ""}
        ]
    });


    // 검색 input search
    $("#cnsltInBoundMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	salesLeadTable.search(this.value).draw();
        }

    });


    // 검색 select search
    $("#cnsltInBoundMngVO select").on("change", function(key){

    	salesLeadTable.search(this.value).draw();
    });


    // 선택
    salesLeadTable.on("select", function (e, dt, type, indexes) {

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
        fn_salesLead_reg_popup(params);
    });


    // 수정버튼
    $("#btnUpdate").click(function(){

        var params = {};

        var rowData = salesLeadTable.rows(".selected").data();
        if(rowData[0]){
            params.cstmrCd = rowData[0].cstmrCd;
            params.leadDt = rowData[0].leadDt;
            params.leadSeq = rowData[0].leadSeq;
        }
        
        // 수정 팝업 오픈
        fn_salesLead_mod_popup(params);
    });


    // 삭제
    $("#btnDeleteAction").click(function(){

        if(!$(this).hasClass("disabled")){

            if(confirm('<spring:message code="common.delete.msg"/>')){

                var params = {};
                var rowData = salesLeadTable.rows(".selected").data();

                if(rowData[0]){
                    params.cstmrCd = rowData[0].cstmrCd;
                    params.leadDt = rowData[0].leadDt;
                    params.leadSeq = rowData[0].leadSeq;
                }

                if(!params.cstmrCd){

                    alert('<spring:message code="common.delete.pre.msg" arguments="${cmpgnIdText}"/>');
                } else {

                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/call/inbd/deleteSalesLead.do'/>",
                        "data": params,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                salesLeadTable.search("").draw();
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
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	salesLeadTable.search(this.value).draw();
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#cnsltInBoundMngVO input[name=searchCstmrNm]").val() == ""){
			$("#cnsltInBoundMngVO input[name=searchCstmrCd]").val("");
		}
	});


	$(document).on("click","#custPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
        $("#popupForm input[name=hpno]").val($("#searchHpno").val());
        $("#popupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrPop.do'/>";

        popupParams.width = "800";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

        fn_all_grid_reload();
    });

});



// 등록 팝업 오픈
function fn_salesLead_reg_popup(params){

    $("div.modal-content").load("<c:url value='/ec4/call/inbd/salesLeadRegPopup.do'/>", params, function(response, status, xhr) {

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
function fn_salesLead_mod_popup(params){

   	if(params.cstmrCd){

        $("div.modal-content").load("<c:url value='/ec4/call/inbd/salesLeadModPopup.do'/>", params, function(response, status, xhr) {

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

	salesLeadTable.draw();
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
                SALES리드 판매정보
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리</a></li>
                <li class="active">SALES리드 판매정보</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="cnsltInBoundMngVO" name="cnsltInBoundMngVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>
                <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
                <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
                <input type="hidden" name="searchBeginDe" id="searchBeginDe" value=""/>
                <input type="hidden" name="searchEndDe" id="searchEndDe" value=""/>
		        <input type="hidden" name="callbackClass"/>
		        <input type="hidden" name="selectStyle" value="single"/>
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
                                <label for="searchCnsltDe" class="col-sm-2 control-label">상담일자</label>
                                <div class="col-sm-4">
					                <div class="input-group">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
	                                  <input type="text" class="form-control pull-right" name="cnsltDe" id="cnsltDe">
	                                </div>
                                </div>
                                <div class="col-sm-2">
                                </div>
                                <label for="searchShopNm" class="col-sm-2 control-label">전시장</label>
                                <div class="col-sm-2">
                                        <input type="text" name="searchShopNm" class="form-control" id="searchShopNm"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCustNm" class="col-sm-2 control-label">고객명</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
                                        	<input type="hidden" name="searchCstmrCd" class="form-control" id="searchCstmrCd"/>
	                                        <input type="text" name="searchCstmrNm" class="form-control" id="searchCstmrNm"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="custPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
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
							<table id="salesLeadTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th><spring:message code="cmm.seq"/></th>
					                <th>고객번호</th>
					                <th>리드일자</th>
					                <th>리드순번</th>
					                <th>고객명</th>
					                <th>통화자</th>
					                <th>핸드폰</th>
					                <th>일반전화</th>
					                <th>차종</th>
					                <th>전시장</th>
					                <th>희망출고일</th>
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
<!-- /.modal -->
	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	    </form>
</body>
</html>
