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
    <title>고객상담내역</title>
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
    
    <!-- ################ 사용자 정의 ################################ -->
    <link rel="stylesheet" type="text/css" href="/css/egovframework/ec4/cmm/ec4common.css">

	<!-- ec4 common -->
	<script src="/js/egovframework/ec4/cmm/ec4common.js"></script>


    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">


<script type="text/javaScript" language="javascript" defer="defer">

var callCnsltTable;


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
    
    



    // 콜상담 테이블
    callCnsltTable = $('#callCnsltTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[1, "desc"]],
        "rowId": "cnsltInBdId",
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
        "sAjaxSource": "<c:url value='/ec4/call/inbd/selectCallCnsltHistList.do'/>", /*내역조회, 이력조회 같은쿼리 호출한다. 요건확인후 다시 작업해야함*/
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrCd]").val()},
                    {"name": "searchCstmrNm",   "value": $("#cnsltInBoundMngVO input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno",   "value": $("#cnsltInBoundMngVO input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres", "value": $("#cnsltInBoundMngVO input[name=searchEmailAdres]").val()},
                    {"name": "searchCnsltUserId",   "value": $("#cnsltInBoundMngVO input[name=searchCnsltUserId]").val()},
                    {"name": "searchCnsltUserNm",   "value": $("#cnsltInBoundMngVO input[name=searchCnsltUserNm]").val()},
                    {"name": "cnsltTyCn",   "value": $("#cnsltInBoundMngVO input[name=cnsltTyCn]").val()},
                    {"name": "cnsltTyCnCode",   "value": $("#cnsltInBoundMngVO input[name=cnsltTyCnCode]").val()},
                    {"name": "searchCnsltKnd", "value": $("#cnsltInBoundMngVO select[name=cnsltKnd] option:selected").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            /* {"visible": false, "targets": [1, 5, 7, 10, 14]}, */
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 0
            {"data":"cstmrNm", "defaultContent": ""},                                 // 1   1
            {"data":"callerNm", "defaultContent": ""},                                 // 1   1
            {"data":"cnsltNm", "defaultContent": ""},                               // 2   1
            {"data":"hpno", "defaultContent": ""},                                   // 3
            {"data":"callTypeNm", "defaultContent": ""},                                     // 4
            {"data":"cnsltKndNm", "defaultContent": ""},                             // 5
            {"data":"cnsltDscr", "defaultContent": ""},                           // 6   4   1
            {"data":"actDscr", "defaultContent": ""}                                // 7   5
        ]
    });


    // 콜상담 검색 input search
    $("#cnsltInBoundMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	callCnsltTable.search(this.value).draw();
        }
    });


    // 콜상담 검색 select search
    $("#cnsltInBoundMngVO select").on("change", function(key){

    	callCnsltTable.search(this.value).draw();
    });
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	callCnsltTable.search(this.value).draw();
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
	
	

	$(document).on("click","#cnsltTypePop",function() {
        var popupParams = {};
        
        $("#searchCnsltTyCn").val($("#cnsltTyCn").val());
        $("#searchCnsltTyCnCode").val($("#cnsltTyCnCode").val());

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/inbd/cnsltInBoundTypePop.do'/>";

        popupParams.width = "1000";
        popupParams.height = "700";
        popupParams.title = "popupSelectCnsltType";
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


	$(document).on("click","#cnsltntPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cnsltUserNm]").val($("#searchCallCnsltForm input[name=searchCnsltUserNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cnsltUserNm]").val($("#searchCnsltUserNm").val());
        $("#popupForm input[name=hpno]").val($("#searchHpno").val());
        $("#popupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/cnslt/cnsltntPop.do'/>";

        popupParams.width = "1250";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/call/cnslt/cnsltntPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCnsltUserNm").keyup(function(){
		if($("#cnsltInBoundMngVO input[name=searchCnsltUserNm]").val() == ""){
			$("#cnsltInBoundMngVO input[name=searchCnsltUserId]").val("");
		}
	});
});
function cstmrSearch(){
	
}
function rtnCnsltTypeList(){
	
}
function rtnCnsltTypeListData(){
	
}
function cnsltntSearch(){
	
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
                    고객상담내역조회
                    <small>&nbsp;</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">상담관리(In)</a></li>
                    <li class="active">고객상담내역조회</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">

	                    <form:form commandName="cnsltInBoundMngVO" name="cnsltInBoundMngVO" method="post" cssClass="form-horizontal">
	                    <double-submit:preventer/>
				        <input type="hidden" name="callbackClass"/>
				        <input type="hidden" name="selectStyle" value="single"/>
                        <div class="box box-primary">
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
                                    <label for="searchCstmrNm" class="col-sm-2 control-label">고객명</label>
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

                                    <label for="searchEmailAdres" class="col-sm-2 control-label">이메일</label>
                                    <div class="col-sm-2">
                                        <input type="text" name="searchEmailAdres" class="form-control" id="searchEmailAdres"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="searchCnsltnt" class="col-sm-2 control-label">상담원</label>
                                    <div class="col-sm-2">
                                        <div class="input-group">
                                        	<input type="hidden" name="searchCnsltUserId" class="form-control" id="searchCnsltUserId"/>
	                                        <input type="text" name="searchCnsltUserNm" class="form-control" id="searchCnsltUserNm"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="cnsltntPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                    </div>

                                    <label for="cnsltTyCn" class="col-sm-2 control-label">상담유형</label>
                                    <div class="col-sm-2">
                                        <div class="input-group">
                                        	<input type="text" name="cnsltTyCn" class="form-control" id="cnsltTyCn" readOnly/>
                                        	<input type="hidden" name="cnsltTyCnCode" class="form-control" id="cnsltTyCnCode" readOnly/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="cnsltTypePop" class="btn btn-info btn-flat">
	                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
	                                            <i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                    </div>

                                    <label for="cnsltKnd" class="col-sm-2 control-label">상담구분</label>
                                    <div class="col-sm-2">
	                                    <form:select path="cnsltKnd" class="form-control input-sm">
	                                        <form:option value="">-- 선택 --</form:option>
	                                        <form:options items="${cnsltKndList}" itemValue="code" itemLabel="codeNm"/>
	                                    </form:select>	
                                    </div>
                                </div>
                            </form>
	                        </div>
	                        <!-- /.box-body -->

                            <div class="box-footer text-right">
                                <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
                                <!-- <button type="button" class="btn btn-primary"> 등록</button>
                                <button type="button" class="btn btn-warning"> 삭제</button> -->
                            </div>

                        </div>
                        <!-- /.box -->
                        </form:form>

                    </div>

                </div>


	            <!-- ############################# 메인화면 ######################  -->
	            <div class="box box-primary">
	                <!-- <div class="col-xs-12"> --> <!-- DIV 가로영역을 나누는 용도 -->

	                    <div class="box with-border">
	                        <div class="box-header with-border">
	                            <h3 class="box-title">리스트</h3>
	                            <div class="box-tools pull-right">
                                    <button type="button" id="btnURLShortSMSSend" class="btn btn-sm btn-primary disabled">고객이 파일첨부할 URL SMS발송</button>  <!-- 어떤버튼인지 알기쉽게 버튼명 길게 만들었다. 최종 개발할때 버튼명 교정필요 -->
	                            </div>
	                        </div>
	                        <!-- /.box-header -->

	                        <div class="box-body table-responsive">
	                            <table id="callCnsltTable" class="table table-hover">
	                                <thead>
	                                    <tr>
	                                        <th>순서</th>
	                                        <th>고객명</th>
	                                        <th>통화자</th>
	                                        <th>상담원명</th>
	                                        <th>고객핸드폰</th>
	                                        <th>상담유형</th>
	                                        <th>상담구분</th>
	                                        <th>상담문의내용</th>
	                                        <th>처리내용</th>
	                                    </tr>
	                                </thead>
	                            </table>
	                        </div>
	                        <!-- /.box-body -->
	                    </div>
	                    <!-- /.box -->

	                <!-- </div> -->
	            </div>

            </section>
            <!-- /.content -->

        </div>
        <!-- /.content-wrapper -->


        <!-- footer include -->
        <jsp:include page="/ec4Footer.do" />

    </div>
    <!-- ./wrapper -->


	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
            <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
            <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
            <input type="hidden" name="searchCnsltTyCnCode" id="searchCnsltTyCnCode" value=""/>
	    </form>


</body>
</html>
