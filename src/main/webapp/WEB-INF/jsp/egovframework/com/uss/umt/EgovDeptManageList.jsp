<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%

/**
 * @Class Name : EgovDeptManageList.java
 * @Description : EgovDeptManageList jsp
 * @Modification Information
 * @
 * @  수정일                    수정자                수정내용
 * @ ---------     --------    ---------------------------
 * @ 2009.02.01    lee.m.j     최초 생성
 * @ 2015.06.16	   조정국	    0건 조회 표시 메시지 버그수정
 *
 *  @author lee.m.j
 *  @since 2009.03.21
 *  @version 1.0
 *  @see
 *
 *  Copyright (C) 2009 by MOPAS  All right reserved.
 */

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet" type="text/css">
<title>부서 목록조회</title> --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>부서 목록조회</title>
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
<!--

function fncCheckAll() {
    var checkField = document.listForm.delYn;
    if(document.listForm.checkAll.checked) {
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

function fncManageChecked() {

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var returnValue = "";
    var returnBoolean = false;
    var checkCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnValue == "")
                        returnValue = checkField[i].value;
                    else
                        returnValue = returnValue + ";" + checkField[i].value;
                }
            }
            if(checkCount > 0)
                returnBoolean = true;
            else {
                alert("선택된  부서가 없습니다.");
                returnBoolean = false;
            }
        } else {
            if(document.listForm.delYn.checked == false) {
                alert("선택된 부서가 없습니다.");
                returnBoolean = false;
            }
            else {
                returnValue = checkId.value;
                returnBoolean = true;
            }
        }
    } else {
    	alert("조회된 결과가 없습니다.");
    }

    document.listForm.bannerIds.value = returnValue;
    return returnBoolean;
}

function fncSelectDeptManageList(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>";
    document.listForm.submit();
}

function fncSelectDeptManage(bannerId) {
    document.listForm.bannerId.value = bannerId;
    document.listForm.action = "<c:url value='/uss/umt/dpt/getDeptManage.do'/>";
    document.listForm.submit();
}

function fncAddDeptManageInsert() {
	if(document.listForm.pageIndex.value == "") {
		document.listForm.pageIndex.value = 1;
	}
    document.listForm.action = "<c:url value='/uss/umt/dpt/addViewDeptManage.do'/>";
    document.listForm.submit();
}

function fncDeptManageListDelete() {
	if(fncManageChecked()) {
        if(confirm("삭제하시겠습니까?")) {
            document.listForm.action = "<c:url value='/uss/umt/dpt/removeDeptManageList.do'/>";
            document.listForm.submit();
        }
    }
}

function linkPage(pageNo){
    document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/dpt/selectDeptManageList.do'/>";
    document.listForm.submit();
}

function press() {

    if (event.keyCode==13) {
    	fncSelectDeptManageList('1');
    }
}
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
                부서관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">사용자지원</a></li>
                <li class="active">부서관리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    





					<form name="listForm" action="<c:url value='/uss/umt/dpt/selectBannerList.do'/>" method="post">
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
								<table width="100%" cellpadding="8" class="table table-hover" border="0">
								 <tr>
								  <td width="60%">부서 명 : <input name="searchKeyword" type="text" value="<c:out value="${deptManageVO.searchKeyword}"/>" size="25"  onkeypress="press();" title="검색조건선택"></td>
								  <%-- <th width="20%" align="right">
								       <table border="0" cellspacing="0" cellpadding="0">
								        <tr>
								          <td><span class="button"><input type="submit" value="<spring:message code="button.inquire" />" onclick="fncSelectDeptManageList('1'); return false;"></span></td>
								          <td>&nbsp;&nbsp;</td>
								          <td><span class="button"><a href="<c:url value='/uss/umt/dpt/addViewDeptManage.do'/>?pageIndex=<c:out value='${deptManageVO.pageIndex}'/>&amp;searchKeyword=<c:out value="${bannerVO.searchKeyword}"/>&amp;searchCondition=1" onclick="fncAddDeptManageInsert(); return false;"><spring:message code="button.create" /></a></span></td>
								        </tr>
								       </table>
								  </th> --%>
								 </tr>
								</table>
								<input type="hidden" name="orgnztId">
								<input type="hidden" name="pageIndex" value="<c:if test="${empty deptManageVO.pageIndex }">1</c:if><c:if test="${!empty deptManageVO.pageIndex }"><c:out value='${deptManageVO.pageIndex}'/></c:if>">
								<input type="hidden" name="searchCondition" value="1">
			                    </div>
			                    <!-- /.box-body THE END -->
			
								<!-- 조회, 등록, 삭제 버튼 -->
			                    <div class="box-footer text-right">
			                      	<button type="button" class="btn btn-info" id="btnSearch" onclick="fncSelectDeptManageList('1'); return false;" > 조회</button>
			                      	<button type="button" class="btn btn-info" id="btnInsert" onclick="fncAddDeptManageInsert(); return false;" > 등록</button>
			                    </div>
			                    
			                </div>
						</div>
					</div>
					</form>
					
					
					
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
								<table width="100%" cellpadding="8" class="table table-hover dataTable no-footer" summary="부서에 대한 목록을 제공한다.">
								 <thead class="dataTables_scrollHead">
								  <tr role="row">
								    <th class="title" width="20%" nowrap>부서 ID</th>
								    <th class="title" width="30%" nowrap>부서 명</th>
								    <th class="title" width="50%" nowrap>설명</th>
								  </tr>
								 </thead>
								 <tbody>
								 <%-- 데이터를 없을때 화면에 메시지를 출력해준다 --%>
								<c:if test="${fn:length(deptManageList) == 0}">
								<tr>
								<td class="lt_text3" colspan="3">
									<spring:message code="common.nodata.msg" />
								</td>
								</tr>
								</c:if>
								 <c:forEach var="deptManage" items="${deptManageList}" varStatus="status">
								  <tr role="row" class="odd">
								    <td class="lt_text3" nowrap><c:out value="${deptManage.orgnztId}"/></td>
								    <td class="lt_text3" nowrap>
								        <form name="item" method="post" action="<c:url value='/uss/umt/dpt/getDeptManage.do'/>">
								            <input type="hidden" name="orgnztId" value="<c:out value="${deptManage.orgnztId}"/>">
								            <input type="hidden" name="pageIndex" value="<c:out value='${deptManageVO.pageIndex}'/>">
								            <input type="hidden" name="searchKeyword" value="<c:out value="${deptManageVO.searchKeyword}"/>">
								            <span class="link"><input type="submit" value="<c:out value="${deptManage.orgnztNm}"/>" onclick="fncSelectDeptManage('<c:out value="${deptManage.orgnztId}"/>'); return false;"></span>
								        </form>
								    </td>
								    <td class="lt_text3" nowrap><c:out value="${deptManage.orgnztDc}"/></td>
								  </tr>
								 </c:forEach>
								 </tbody>
								</table>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
								  <tr>
								    <td height="10"></td>
								  </tr>
								</table>
								
								<c:if test="${!empty deptManageVO.pageIndex }">
								<div align="center">
								    <div>
								        <ui:pagination paginationInfo = "${paginationInfo}"
								            type="default"
								            jsFunction="linkPage"
								            />
								    </div>
								
								</div>
								</c:if>
						        </div>
			                </div>
			                <!-- <<<<<<<< box THE END -->
						        <!--  page end -->
			            </div>
			        </div>






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
