<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovProgramListManage.jsp
  * @Description : 프로그램목록 조회 화면
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  2019.01.03	최재중	   EC4
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/prm/button/";
%>
<html lang="ko">
<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>프로그램목록리스트</title> --%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>프로그램목록리스트</title>
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

<style type="text/css">
	h1 {font-size:12px;}
	caption {visibility:hidden; font-size:0; height:0; margin:0; padding:0; line-height:0;}
</style>

<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 모두선택 처리 함수
 ******************************************************** */
function fCheckAll() {
    var checkField = document.progrmManageForm.checkField;
    if(document.progrmManageForm.checkAll.checked) {
        if(checkField) {
            if(checkField.length > 1) {
                for(var i=0; i < checkField.length; i++) {
                    checkField[i].checked = true;
                }
            } else {
                checkField.checked = true;
            }
        }
    } else {
        if(checkField) {
            if(checkField.length > 1) {
                for(var j=0; j < checkField.length; j++) {
                    checkField[j].checked = false;
                }
            } else {
                checkField.checked = false;
            }
        }
    }
}

/* ********************************************************
 * 멀티삭제 처리 함수
 ******************************************************** */
function fDeleteProgrmManageList() {
    var checkField = document.progrmManageForm.checkField;
    var ProgrmFileNm = document.progrmManageForm.checkProgrmFileNm;
    var checkProgrmFileNms = "";
    var checkedCount = 0;
    if(checkField) {
    	if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkProgrmFileNms += ((checkedCount==0? "" : ",") + ProgrmFileNm[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
            	checkProgrmFileNms = ProgrmFileNm.value;
            }
        }
    }

    document.progrmManageForm.checkedProgrmFileNmForDel.value=checkProgrmFileNms;
    document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgrmManageListDelete.do'/>";
    document.progrmManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
//	document.menuManageForm.searchKeyword.value =
	document.progrmManageForm.pageIndex.value = pageNo;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
   	document.progrmManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectProgramListManage() {
	document.progrmManageForm.pageIndex.value = 1;
	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>";
	document.progrmManageForm.submit();
}
/* ********************************************************
 * 입력 화면 호출 함수
 ******************************************************** */
function insertProgramListManage() {
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListRegist.do'/>";
   	document.progrmManageForm.submit();
}
/* ********************************************************
 * 상세조회처리 함수
 ******************************************************** */
function selectUpdtProgramListDetail(progrmFileNm) {
	document.progrmManageForm.tmp_progrmNm.value = progrmFileNm;
   	document.progrmManageForm.action = "<c:url value='/sym/prm/EgovProgramListDetailSelect.do'/>";
   	document.progrmManageForm.submit();
}
/* ********************************************************
 * focus 시작점 지정함수
 ******************************************************** */
 function fn_FocusStart(){
		var objFocus = document.getElementById('F1');
		objFocus.focus();
	}

<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</noscript>
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
                프로그램목록 조회
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">시스템관리</a></li>
                <li class="active">프로그램관리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    

    <!-- content start -->


	<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="progrmManageForm" action ="<c:url value='/sym/prm/EgovProgramListManageSelect.do' />" method="post">
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">

                <div class="box">
                    <div class="box-header with-border">
                    	<h3 class="box-title">검색</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">	
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
					<input name="checkedProgrmFileNmForDel" type="hidden" />
				
					
				
					<table class="table table-hover" border="0" cellpadding="0" cellspacing="1">
					 <tr>
					  <td width="100%">
					    <table width="100%" border="0" cellspacing="1" class="table-register" summary="프로그램목록관리 검색조건">
					   	<caption>프로그램목록관리</caption>
					      <tr>
					        <th width="20%" height="40" class="" scope="row"><label for="searchKeyword">프로그램명</label><img src="<c:url value='/images/egovframework/com/cmm/icon/required.gif' />" width="15" height="15" alt="필수입력표시"></th>
					        <td width="80%">
					          <table border="0" cellspacing="0" cellpadding="0" align="left">
					            <tr>
					              <td >&nbsp;<input name="searchKeyword" type="text" size="60" value="${searchVO.searchKeyword}"  maxlength="60" id="F1" title="검색조건"></td>
					              <td width="5%"></td>
					              <%-- <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="selectProgramListManage(); return false;"></span></td>
					              <td width="5%"></td>
					              <td width="20%"><span class="button"><a href="<c:url value='/sym/prm/EgovProgramListRegist.do'/>" onclick="insertProgramListManage(); return false;"><spring:message code="button.create" /></a></span></td>
					              <td width="5%"></td>
					              <td width="20%"><span class="button"><a href="#LINK" onclick="fDeleteProgrmManageList(); return false;"><spring:message code="button.delete" /></a></span></td>
					              <td width="50"></td> --%>
					            </tr>
					          </table>
					        </td>
					      </tr>
					    </table>
					   </td>
					 </tr>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td height="10">&nbsp; </td>
					  </tr>
					</table>
                    </div>
                    <!-- /.box-body THE END -->


					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                      	<button type="submit" class="btn btn-info" id="btnSearch" onclick="selectProgramListManage(); return false;" > 조회</button>
                      	<button type="button" class="btn btn-info" id="btnInsert" onclick="insertProgramListManage(); return false;" > 등록</button>
                      	<button type="button" class="btn btn-info" id="btnDelete" onclick="fDeleteProgrmManageList(); return false;" > 삭제</button>
                    </div>
                    
                </div>
			</div>
		</div>
		<div class="row">
            <div class="col-md-12">
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-top:5px;padding-top:5px;float:left;">리스트</h3>
                        <div class="box-tools">
                               &nbsp;
                               <!-- <button type="button" class="btn btn-info"> 액셀</button> -->
                               <%-- <button type="button" id="btnInsert" class="btn btn-sm btn-primary"><spring:message code="button.create"/></button> --%>
                               <%-- <button type="button" id="btnUpdate" class="btn btn-sm btn-primary disabled"><spring:message code="button.update"/></button> --%>
                               <%-- <button type="button" id="btnDeleteAction" class="btn btn-sm btn-warning disabled"><spring:message code="button.delete"/></button> --%>
                        </div>
                    </div>
                    <!-- /.box-header -->

			        <div class="box-body no-padding" style="height:750px;">
					<table width="100%" cellpadding="8" class="table table-hover dataTable no-footer" style="table-layout:fixed" summary="프로그램목록관리 목록으로 프로그램파일명, 프로그램명, url,프로그램설명 으로 구성">
					   	<caption>프로그램목록관리 목록</caption>
					 <thead>
					  <tr>
					    <th class="title" width="20" scope="col">
					    <input type="checkbox" name="checkAll" class="check2" onclick="javascript:fCheckAll();" title="전체선택">
					    </th>
					    <th class="title" width="150" scope="col">프로그램파일명</th>
					    <th class="title" width="137" scope="col">프로그램명</th>
					    <th class="title" width="260" scope="col">URL</th>
					    <th class="title" width="150" scope="col">프로그램설명</th>
					  </tr>
					 </thead>
					 <tbody>
					 <%-- 데이터를 없을때 화면에 메시지를 출력해준다 --%>
					 <c:if test="${fn:length(list_progrmmanage) == 0}">
					 <tr>
					 <td class="lt_text3" colspan="5">
						<spring:message code="common.nodata.msg" />
					 </td>
					 </tr>
					 </c:if>
					 <c:forEach var="result" items="${list_progrmmanage}" varStatus="status">
					  <tr>
					    <td class="lt_text3" nowrap>
					       <input type="checkbox" name="checkField" class="check2" title="선택">
					       <input name="checkProgrmFileNm" type="hidden" value="<c:out value='${result.progrmFileNm}'/>"/>
					    </td>
					    <td class="lt_text" style="cursor:hand;" nowrap>
					            <span class="link"><a href="<c:url value='/sym/prm/EgovProgramListDetailSelect.do'/>?tmp_progrmNm=<c:out value="${result.progrmFileNm}"/>"  onclick="selectUpdtProgramListDetail('<c:out value="${result.progrmFileNm}"/>'); return false;">
					
					            <c:if test="${fn:length(result.progrmFileNm)> 22}">
							    	<c:out value="${fn:substring(result.progrmFileNm,0, 22)}"/>...
							    </c:if>
							    <c:if test="${fn:length(result.progrmFileNm)<= 22}">
							    	<c:out value="${result.progrmFileNm}"/>
							    </c:if>
					
					            </a></span>
					    </td>
					    <td class="lt_text" nowrap>
					    <c:if test="${fn:length(result.progrmKoreanNm)> 12}">
					    	<c:out value="${fn:substring(result.progrmKoreanNm,0, 12)}"/>...
					    </c:if>
					    <c:if test="${fn:length(result.progrmKoreanNm)<= 12}">
					    	<c:out value="${result.progrmKoreanNm}"/>
					    </c:if>
					    </td>
					    <td class="lt_text" nowrap>
					    <c:if test="${fn:length(result.URL)> 35}">
					    	<c:out value="${fn:substring(result.URL,0, 35)}"/>...
					    </c:if>
					    <c:if test="${fn:length(result.URL)<= 35}">
					    	<c:out value="${result.URL}"/>
					    </c:if>
					
					    </td>
					    <td class="lt_text" nowrap><c:out value="${result.progrmDc}"/></td>
					  </tr>
					 </c:forEach>
					 </tbody>
					 <!--tfoot>
					  <tr class="">
					   <td colspan=6 align="center"></td>
					  </tr>
					 </tfoot -->
					</table>
					<table width="717" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td height="10"></td>
					  </tr>
					  <tr>
					    <td height="10">
					<!-- 페이징 시작 -->
					<div align="center">
					  <div>
						<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
					  </div>
					</div>
					<!-- 페이징 끝 -->
					    </td>
					  </tr>
					</table>
					
					
					
					<input type="hidden" name="cmd">
					<input type="hidden" name="tmp_progrmNm">
			        </div>
                </div>
                <!-- <<<<<<<< box THE END -->
			        <!--  page end -->
            </div>
        </div>
	</form>
	<!-- ********** 여기까지 내용 *************** -->


    <!-- content end -->


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
</body>
</html>

