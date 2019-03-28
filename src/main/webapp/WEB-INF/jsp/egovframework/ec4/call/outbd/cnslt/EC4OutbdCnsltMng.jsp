<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ImgUrl" value="${pageContext.request.contextPath}/images/egovframework/com/cmm/"/>
<c:set var="CssUrl" value="${pageContext.request.contextPath}/css/egovframework/com/"/>
<%--
    Class Name : EC4OutbdCnsltMng.jsp
    Description : 아웃바운드 상담

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.07.23    harry     최초 생성

    author : wizvil harry
    since : 2018.07.23
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>아웃바운드 상담</title>
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

    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="/resource/adminLTE/plugins/iCheck/all.css">

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

    <!-- iCheck 1.0.1 -->
    <script src="/resource/adminLTE/plugins/iCheck/icheck.min.js"></script>

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

        var cstmrCarTable;

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

            //iCheck for checkbox and radio inputs
		    $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
		      checkboxClass: 'icheckbox_minimal-blue',
		      radioClass   : 'iradio_minimal-blue'
		    })
		    //Red color scheme for iCheck
		    $('input[type="checkbox"].minimal-red, input[type="radio"].minimal-red').iCheck({
		      checkboxClass: 'icheckbox_minimal-red',
		      radioClass   : 'iradio_minimal-red'
		    })
		    //Flat red color scheme for iCheck
		    $('input[type="checkbox"].flat-red, input[type="radio"].flat-red').iCheck({
		      checkboxClass: 'icheckbox_flat-green',
		      radioClass   : 'iradio_flat-green'
		    })


            // 캠페인 테이블
            cstmrCarTable = $('#cstmrCarTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                //"rowId": "outbdCnsltId",
                "scrollY": "180px",
                "bPaginate": false,
                //"pageLength": 10,
                //"pagingType": "full_numbers",
                //"bLengthChange": true,
                //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": false,
                "searching": false,
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/cmm/cinfo/ccm/selectCstmrCarList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"vhcleEsntlId"},
                    {"data":"vin"},
                    {"data":"carnbr"},
                    {"data":"vhctyCode", "defaultContent": ""}
                ]
            });


            // 캠페인 검색 input search
            $("#searchCmpgnForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                	cstmrCarTable.search(this.value).draw();
                }

            });


            // 캠페인 검색 select search
            $("#searchCmpgnForm select").on("change", function(key){

            	cstmrCarTable.search(this.value).draw();
            });


            // 캠페인 선택
            cstmrCarTable.on("select", function (e, dt, type, indexes) {

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
                fn_outbd_cnslt_reg_popup(params);
            });


            // 수정버튼
            $("#btnCmpgnUpdate").click(function(){

                var params = {};

                var rowData = cstmrCarTable.rows(".selected").data();
                if(rowData[0]){
                    params.outbdCnsltId = rowData[0].outbdCnsltId;
                }

                // 수정 팝업 오픈
                fn_outbd_cnslt_mod_popup(params);
            });


            // 삭제
            $("#btnCmpgnDeleteAction").click(function(){

                if(!$(this).hasClass("disabled")){

                    if(confirm('<spring:message code="common.delete.msg"/>')){

                        var params = {};
                        var rowData = cstmrCarTable.rows(".selected").data();

                        if(rowData[0]){
                            params.outbdCnsltId = rowData[0].outbdCnsltId;
                        }

                        if(!params.outbdCnsltId){

                            alert('<spring:message code="common.delete.pre.msg" arguments="${outbdCnsltIdText}"/>');
                        } else {

                            $.ajax({
                                "type": "POST",
                                "dataType": "json",
                                "async": false,
                                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                                "url": "<c:url value='/ec4/call/outbd/cnslt/deleteCmpgn.do'/>",
                                "data": params,
                                "success": function(result) {

                                    if(result.isSuccess){

                                        alert(result.message);
                                        cstmrCarTable.search("").draw();
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
        function fn_outbd_cnslt_reg_popup(params){

            $("div.modal-content").load("<c:url value='/ec4/call/outbd/cnslt/outbdCnsltRegPopup.do'/>", params, function(response, status, xhr) {

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
        function fn_outbd_cnslt_mod_popup(params){

            if(params.outbdCnsltId){

                $("div.modal-content").load("<c:url value='/ec4/call/outbd/cnslt/outbdCnsltModPopup.do'/>", params, function(response, status, xhr) {

                    if(status == "success"){

                        $("div.modal").modal({"backdrop": "static", "keyboard": false});
                    }else if(status == "error"){

                        alert("Error: " + xhr.status + ": " + xhr.statusText);
                    }
                });
            }else{

                alert('<spring:message code="common.select.msg" arguments="${outbdCnsltIdText}"/>');
            }
        }


        // 그리드 reload
        function fn_all_grid_reload(){

        	cstmrCarTable.draw();
        }
        </script>


        <script type="text/javaScript" language="javascript">
        /* ********************************************************
         * 저장처리화면
         ******************************************************** */
        function fn_egov_save_QustnrRespondInfo(){

        	var varFrom = document.qustnrRespondInfoManage;

            //설문정보 Validtation
            <c:forEach items="${Comtnqustnrqesitm}" var="QestmInfo" varStatus="status1">
	            <c:if test="${QestmInfo.qestnTyCode eq 1}">if((!fn_egov_selectBoxChecking("${QestmInfo.qestnrQesitmId}"))){
	                alert('${status1.count}번 설문문항을 작성해 주세요!');
	                document.getElementsByName("${QestmInfo.qestnrQesitmId}")[0].focus();
	                return;
	            }<c:forEach items="${Comtnqustnriem}" var="QestmItem" varStatus="status01">
	                    <c:if test="${QestmInfo.qestnrTmplatId eq QestmItem.qestnrTmplatId and QestmInfo.qestnrId eq QestmItem.qestnrId and QestmInfo.qestnrQesitmId and QestmItem.qestnrQesitmId}">
		                    <c:if test="${QestmItem.etcAnswerAt eq 'Y'}">//기타답변을 선택했는체크
		                    if(fn_egov_RadioBoxValue("${QestmInfo.qestnrQesitmId}") == "${QestmItem.qustnrIemId}"){
		                        if(document.getElementById("ETC_${QestmItem.qustnrIemId}").value == ""){
		                            alert('${status1.count}번 설문문항 기타답변을 작성해주세요!');
		                            document.getElementById("ETC_${QestmItem.qustnrIemId}").focus();
		                            return;
		                        }
		                    }</c:if>
		                </c:if>
	                </c:forEach>
	            </c:if>
	            <c:if test="${QestmInfo.qestnTyCode eq '2'}">if(document.getElementById("${QestmInfo.qestnrQesitmId}").value == ""){
	                alert('${status1.count}번 설문문항을 작성해 주세요!');
	                document.getElementById("${QestmInfo.qestnrQesitmId}").focus();
	                return;
	            }</c:if>
            </c:forEach>

            if(confirm('<spring:message code="common.save.msg"/>')){

                //varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
                varFrom.action = "${pageContext.request.contextPath}/uss/olp/qnn/EgovQustnrRespondInfoManageRegist.do";
                varFrom.submit();
            }
        }

    /************************************************************************
    //셀렉트 박스 선택했는 찾는 함수
    ************************************************************************/
    function fn_egov_selectBoxChecking(sbName){

        var FLength= document.getElementsByName(sbName).length;

        var reuslt = false;
        for(var i=0; i < FLength; i++)
        {
            if(document.getElementsByName(sbName)[i].checked == true){
                reuslt=true;
            }
        }

        return reuslt;
    }
    /************************************************************************
    //셀렉트박스 값 컨트롤 함수
    ************************************************************************/
    function fn_egov_SelectBoxValue(sbName)
    {
    var FValue = "";
    for(var i=0; i < document.getElementById(sbName).length; i++)
    {
    if(document.getElementById(sbName).options[i].selected == true){

    FValue=document.getElementById(sbName).options[i].value;
    }
    }

    return  FValue;
    }

    /************************************************************************
    //라디오박스 체크 박스
    ************************************************************************/
    function fn_egov_RadioBoxValue(sbName)
    {
        var FLength = document.getElementsByName(sbName).length;
        var FValue = "";
        for(var i=0; i < FLength; i++)
        {
            if(document.getElementsByName(sbName)[i].checked == true){
                FValue = document.getElementsByName(sbName)[i].value;
            }
        }

        return FValue;
    }


    /************************************************************************
    //라디오박스 : 최대선택건수 체크
    ************************************************************************/
    function fn_egov_checkbox_amout(sbName, sbCount, sbObj){

        var FLength= document.getElementsByName(sbName).length;

        var reuslt = false;
        var reusltCount = 0;

        for(var i=0 ; i<FLength ; i++)
        {
            if(document.getElementsByName(sbName)[i].checked == true){
                reusltCount++;
            }
        }

        if(reusltCount > sbCount){
            alert("최대선택건수 [" + sbCount + "]건을  초과하였습니다!" );
            sbObj.checked=false;
            return;
        }
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
                아웃바운드 상담
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li class="active">아웃바운드 상담</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <!-- left column -->
                <div class="col-md-6">
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-user"></i>고객 정보</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form:form commandName="cstmrVO" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="cstmrNm" class="col-sm-2 control-label">고객명</label>
                                    <div class="col-sm-4">
                                        <form:input path="cstmrNm" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <label for="sexdstnCode" class="col-sm-2 control-label">성별</label>
                                    <div class="col-sm-4">
                                        <form:input path="sexdstnCode" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="brthdy" class="col-sm-2 control-label">생년월일</label>
                                    <div class="col-sm-4">
                                        <form:input path="brthdy" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <label for="email" class="col-sm-2 control-label">이메일</label>
                                    <div class="col-sm-4">
                                        <form:input path="email" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="mbtlnum" class="col-sm-2 control-label">휴대전화</label>
                                    <div class="col-sm-4">
                                        <form:input path="mbtlnum" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <label for="telno" class="col-sm-2 control-label">전화번호</label>
                                    <div class="col-sm-4">
                                        <form:input path="telno" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="houseZip" class="col-sm-2 control-label">우편번호</label>
                                    <div class="col-sm-4">
                                        <form:input path="houseZip" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="houseAdres" class="col-sm-2 control-label">주소</label>
                                    <div class="col-sm-10">
                                        <form:input path="houseAdres" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="houseDetailAdres" class="col-sm-2 control-label">상세주소</label>
                                    <div class="col-sm-10">
                                        <form:input path="houseDetailAdres" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="memo" class="col-sm-2 control-label">메모</label>
                                    <div class="col-sm-10">
                                        <form:textarea path="memo" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-car"></i>차량 정보</h3>
                            <div class="box-tools pull-right">
                                <button type="button" id="btnCnslt" class="btn btn-sm btn-primary">로딩</button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="cstmrCarTable" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>순번</th>
                                        <th>차량고유ID</th>
                                        <th>차대번호</th>
                                        <th>차량번호</th>
                                        <th>차종</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-phone"></i>해피콜 정보</h3>
                            <div class="box-tools pull-right">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form:form commandName="hpclVO" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="rceptNo" class="col-sm-2 control-label">접수번호</label>
                                    <div class="col-sm-4">
                                        <form:input path="rceptNo" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <label for="rceptDt" class="col-sm-2 control-label">접수일시</label>
                                    <div class="col-sm-4">
                                        <form:input path="rceptDt" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
	                            <c:forEach var="result" items="${hpclFieldList}" varStatus="status">
	                                <div class="form-group">
	                                    <label for="rceptNo" class="col-sm-2 control-label">${result.fieldNm}</label>
	                                    <div class="col-sm-10">
	                                        <input class="form-control input-sm" value="${result.fieldValue}" readonly="readonly"/>
	                                    </div>
	                                </div>
	                            </c:forEach>
                            </form:form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!--/. left col -->
                <!-- right column -->
                <div class="col-md-6">

                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>설문정보</h3>
                            <div class="box-tools pull-right">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form:form commandName="cmpgnVO" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">캠페인명</label>
                                    <div class="col-sm-10">
                                        <form:input path="cmpgnNm" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">캠페인기간</label>
                                    <div class="col-sm-5">
                                        <form:input path="beginDe" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <div class="col-sm-5">
                                        <form:input path="endDe" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">설문제목</label>
                                    <div class="col-sm-10">
                                        <form:input path="qustnrSj" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">설문목적</label>
                                    <div class="col-sm-10">
                                        <form:input path="qustnrPurps" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">설문기간</label>
                                    <div class="col-sm-5">
                                        <form:input path="qustnrBgnde" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <div class="col-sm-5">
                                        <form:input path="qustnrEndde" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">설문안내</label>
                                    <div class="col-sm-10">
                                        <form:textarea path="qustnrWritngGuidanceCn" cssClass="form-control input-sm" rows="4" readonly="true"/>
                                    </div>
                                </div>


                            </form:form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                    <div class="box box-default">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>설문</h3>
                            <div class="box-tools pull-right">
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">

							<form name="qustnrRespondInfoManage" method="post">

							    <c:set var="isSaveable" value="true"/>
							    <c:forEach items="${Comtnqustnrqesitm}" var="QestmInfo" varStatus="status1">

							        <c:set var="objType" value=""/>
							        <c:if test="${QestmInfo.mxmmChoiseCo eq 1}"><c:set var="objType" value="radio"/></c:if>
							        <c:if test="${QestmInfo.mxmmChoiseCo ne 1}"><c:set var="objType" value="checkbox"/></c:if>
							        <c:set var="formType" value=""/>
							        <c:if test="${QestmInfo.qestnTyCode eq '1'}"><c:set var="formType" value="form-inline"/></c:if>
							        <c:set var="isDisabled" value=""/>
							        <c:if test="${not empty QestmInfo.respondAnswerCn or not empty QestmInfo.qustnrIemId}">
							            <c:set var="isDisabled" value="disabled"/>
							            <c:set var="isSaveable" value="false"/>
							        </c:if>

							        <!-- iCheck -->
							        <div class="box box-no-border margin-bottom-none">
							            <div class="box-header">
							                <h3 class="box-title">
							                    ${status1.count}.&nbsp;<c:out value="${fn:replace(QestmInfo.qestnCn, crlf, '<br/>')}" escapeXml="false"/>
							                    <c:if test="${QestmInfo.mxmmChoiseCo > 1}"><span class="text-red"">(최대선택건수 ${QestmInfo.mxmmChoiseCo})</span></c:if>
							                </h3>
							            </div>
							            <div class="box-body">
							                <!-- Minimal style -->
							                <!-- checkbox -->
							                <div class="${formType}">

                                                <fieldset ${isDisabled}>
	                                                <div class="form-group">
												        <%-- 객관식 --%>
												        <c:if test="${QestmInfo.qestnTyCode eq 1}">
												            <div class="${objType}">
													            <c:forEach items="${Comtnqustnriem}" var="QestmItem" varStatus="status01">
													                <c:if test="${QestmInfo.qestnrTmplatId eq QestmItem.qestnrTmplatId and QestmInfo.qestnrId eq QestmItem.qestnrId and QestmInfo.qestnrQesitmId eq QestmItem.qestnrQesitmId}">
														                <%-- 다중체크구현 로직 --%>
			                                                            <label class="${objType}-inline">
			                                                                <input type="${objType}" name="${QestmItem.qestnrQesitmId}" value="${QestmItem.qustnrIemId}" <c:if test="${not empty QestmItem.selectIemId}">checked="checked"</c:if> <c:if test="${QestmInfo.mxmmChoiseCo ne 1}">onClick="fn_egov_checkbox_amout('${QestmItem.qestnrQesitmId}', ${QestmInfo.mxmmChoiseCo}, this)"</c:if>/><c:out value="${fn:replace(QestmItem.iemCn, crlf, '<br/>')}" escapeXml="false"/>
			                                                            </label>
													                    <%-- 기타답변여부 --%>
													                    <c:if test="${QestmItem.etcAnswerAt eq 'Y'}">
													                        <label class="sr-only" for="ETC_${QestmItem.qustnrIemId}">기타</label>
										                                    <input type="text" name="ETC_${QestmItem.qustnrIemId}" id="ETC_${QestmItem.qustnrIemId}" value="${QestmItem.etcAnswerCn}" class="form-control input-sm" maxlength="1000" title="기타답변여부"/>
													                    </c:if>
													                    <c:if test="${QestmItem.etcAnswerAt eq 'N' or QestmItem.etcAnswerAt eq ''}">
										                                    <input type="hidden" name="ETC_${QestmItem.qustnrIemId}" id="ETC_${QestmItem.qustnrIemId}" value="${QestmItem.etcAnswerCn}"/>
													                    </c:if>
													                </c:if>
													            </c:forEach>
												            </div>
												        </c:if>
												        <%-- 주관식 --%>
												        <c:if test="${QestmInfo.qestnTyCode eq '2'}">
												            <textarea name="${QestmInfo.qestnrQesitmId}" id="${QestmInfo.qestnrQesitmId}" class="form-control" value="" rows="4" ${isDisabled}>${QestmInfo.respondAnswerCn}</textarea>
												        </c:if>
											        </div>
											        <!-- /.form-group -->
										        </fieldset>
							                </div>
							                <!-- /.form-inline -->
							            </div>
							            <!-- /.box-body -->
							        </div>
							        <!-- /.box -->
							    <input type="hidden" name="MXMM_${QestmInfo.qestnrQesitmId}" value="${QestmInfo.mxmmChoiseCo}">
							    <input type="hidden" name="TY_${QestmInfo.qestnrQesitmId}" value="${QestmInfo.qestnTyCode}">
							    </c:forEach>

                                <c:if test="${isSaveable}">
                                    <button type="button" class="btn btn-sm btn-primary" onclick="fn_egov_save_QustnrRespondInfo(document.forms[0]); return false;">저장</button>
                                </c:if>

								<input type="hidden" name="qestnrTmplatId" id="qestnrTmplatId" value="${qestnrTmplatId}"/>
								<input type="hidden" name="qestnrId" id="qestnrId" value="${qestnrId}"/>
								<input type="hidden" name="cmd" value="save"/>
								<input type="hidden" name="searchHpclId" value="${searchVO.searchHpclId}"/>
								<input type="hidden" name="searchCmpgnId" value="${searchVO.searchCmpgnId}"/>
								<input type="hidden" name="searchCstmrEsntlId" value="${searchVO.searchCstmrEsntlId}"/>
							</form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/. right col -->
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
