<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovMenuCreatManage.jsp
  * @Description : 메뉴생성관리 조회 화면
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
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mcm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mcm/button/";
%>
<html lang="ko">
<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>메뉴생성관리</title> --%>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>메뉴생성관리</title>
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
<script  language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 최초조회 함수
 ******************************************************** */
function fMenuCreatManageSelect(){
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 페이징 처리 함수
 ******************************************************** */
function linkPage(pageNo){
	document.menuCreatManageForm.pageIndex.value = pageNo;
	document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
   	document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 조회 처리 함수
 ******************************************************** */
function selectMenuCreatManageList() {
	document.menuCreatManageForm.pageIndex.value = 1;
    document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>";
    document.menuCreatManageForm.submit();
}

/* ********************************************************
 * 메뉴생성 화면 호출
 ******************************************************** */
function selectMenuCreat(vAuthorCode) {
	document.menuCreatManageForm.authorCode.value = vAuthorCode;
   	document.menuCreatManageForm.action = "<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>";
   	document.menuCreatManageForm.submit();
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
                메뉴생성관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">시스템관리</a></li>
                <li class="active">메뉴생성관리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    

    <!-- content start -->
	<!-- ********** 여기서 부터 본문 내용 *************** -->
	
	<form name="menuCreatManageForm" action ="<c:url value='/sym/mnu/mcm/EgovMenuCreatManageSelect.do'/>" method="post">
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
					<input name="checkedMenuNoForDel" type="hidden" />
					<input name="authorCode"          type="hidden" />
					<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
				
					<table class="table table-hover" border="0" cellpadding="0" cellspacing="1">
					 <tr>
					  <td width="100%">
					    <table width="100%" border="0" cellpadding="0" cellspacing="1" class="table-register" summary="메뉴생성관리 검색조건" >
						<caption>메뉴생성관리 검색조건 </caption>
					      <tr>
					        <th width="20%" height="40" class="" scope="row"><label for="searchKeyword">보안설정대상ID*&nbsp;</label></th>
					        <td width="80%">
					          <table border="0" cellspacing="0" cellpadding="0" align="left">
					            <tr>
					              <td >&nbsp;<input name="searchKeyword" type="text" size="80" value=""  maxlength="60" title="검색조건"/></td>
					              <td width="5%"></td>
								  <%-- <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="selectMenuCreatManageList(); return false;"/></span></td> --%>
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
                      	<button type="button" class="btn btn-info" id="btnSearch" onclick="selectMenuCreatManageList(); return false;" > 조회</button>
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
					<table width="100%" cellpadding="8" class="table table-hover dataTable no-footer" summary="메뉴생성관리  목록화면으로 권한코드, 권한명, 권한설명, 메뉴생성여부, 메뉴생성으로 구성됨" >
					 <caption>메뉴생성관리 목록 </caption>
					 <thead class="dataTables_scrollHead">
					  <tr role="row">
					    <th class="title" width="20%" scope="col">권한코드</th>
					    <th class="title" width="20%" scope="col">권한명</th>
					    <th class="title" width="20%" scope="col">권한 설명</th>
					    <th class="title" width="20%" scope="col">메뉴생성여부</th>
					    <th class="title" width="20%" scope="col">메뉴생성</th>
					</tr>
					 </thead>
					 <tbody>
					
					
					 <c:forEach var="result" items="${list_menumanage}" varStatus="status">
					  <tr role="row" class="odd">
					    <td class="lt_text3" style="cursor:hand;" ><c:out value="${result.authorCode}"/></td>
					    <td class="lt_text3" style="cursor:hand;" ><c:out value="${result.authorNm}"/></td>
					    <td class="lt_text3" style="cursor:hand;" ><c:out value="${result.authorDc}"/></td>
					    <td class="lt_text3" style="cursor:hand;" >
					          <c:if test="${result.chkYeoBu > 0}">Y</c:if>
					          <c:if test="${result.chkYeoBu == 0}">N</c:if>
					    </td>
					    <td class="lt_text3" >
					       <table border="0" cellspacing="0" cellpadding="0" align="center">
					         <tr>
					           <td width="10"></td>
					    	   <td><span class="button"><a href="<c:url value='/sym/mnu/mcm/EgovMenuCreatSelect.do'/>?authorCode='<c:out value="${result.authorCode}"/>'"  onclick="selectMenuCreat('<c:out value="${result.authorCode}"/>'); return false;">메뉴생성</a></span></td>
					           <td width="10"></td>
					         </tr>
					       </table>
					    </td>
					  </tr>
					 </c:forEach>
					 </tbody>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
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
					<input type="hidden" name="req_menuNo">
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

