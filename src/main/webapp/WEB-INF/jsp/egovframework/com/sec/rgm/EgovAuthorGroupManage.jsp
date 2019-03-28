<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EgovAuthorGroupManage.java
  * @Description : EgovAuthorGroupManage List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.03.23    Lee.m.j       최초 생성
	  2019.01.08	최재중	   EC4
  *  @author Lee.m.j
  *  @since 2009.03.23
  *  @version 1.0
  *  @see
  *
  */
%>
<html lang="ko">
<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<title>권한그룹관리</title> --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>권한그룹관리</title>
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

	var resultCheck = false;

    var checkField = document.listForm.delYn;
    var checkId = document.listForm.checkId;
    var selectAuthor = document.listForm.authorManageCombo;
    var booleanRegYn = document.listForm.regYn;
    var listMberTyCode = document.listForm.mberTyCode;

    var returnId = "";
    var returnAuthor = "";
    var returnRegYn = "";
    var returnmberTyCode = "";

    var checkedCount = 0;

    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i<checkField.length; i++) {
                if(checkField[i].checked) {
                	checkedCount++;
                    checkField[i].value = checkId[i].value;
                    if(returnId == "") {
                        returnId = checkField[i].value;
                        returnAuthor = selectAuthor[i].value;
                        returnRegYn = booleanRegYn[i].value;
                        returnmberTyCode = listMberTyCode[i].value;
                    }
                    else {
                    	returnId = returnId + ";" + checkField[i].value;
                    	returnAuthor = returnAuthor + ";" + selectAuthor[i].value;
                    	returnRegYn = returnRegYn + ";" + booleanRegYn[i].value;
                    	returnmberTyCode = returnmberTyCode + ";" + listMberTyCode[i].value;

                    }
                }
            }

            if(checkedCount > 0)
            	resultCheck = true;
            else {
                alert("선택된  항목이 없습니다.");
                resultCheck = false;
            }

        } else {
        	 if(document.listForm.delYn.checked == false) {
                alert("선택 항목이 없습니다.");
                resultCheck = false;
            }
            else {
                returnId = checkId.value;
                returnAuthor = selectAuthor.value;
                returnRegYn = booleanRegYn.value;
                returnmberTyCode = listMberTyCode.value;

                resultCheck = true;
            }
        }
    } else {
        alert("조회된 결과가 없습니다.");
    }

    document.listForm.userIds.value = returnId;
    document.listForm.authorCodes.value = returnAuthor;
    document.listForm.regYns.value = returnRegYn;
    document.listForm.mberTyCodes.value = returnmberTyCode;
    return resultCheck;
}

function fncSelectAuthorGroupList(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncAddAuthorGroupInsert() {

	if(!fncManageChecked()) return;

    if(confirm("등록하시겠습니까?")) {

        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupInsert.do'/>";
        document.listForm.submit();
    }
}

function fncAuthorGroupDeleteList() {

	if(!fncManageChecked()) return;

    if(confirm("삭제하시겠습니까?")) {
        document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupDelete.do'/>";
        document.listForm.submit();
    }
}

function linkPage(pageNo){
    //document.listForm.searchCondition.value = "1";
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/sec/rgm/EgovAuthorGroupList.do'/>";
    document.listForm.submit();
}

function fncSelectAuthorGroupPop() {

    if(document.listForm.searchCondition.value == '3') {
    	window.open("<c:url value='/sec/gmt/EgovGroupSearchList.do'/>","notice","height=500, width=485, top=50, left=20, scrollbars=no, resizable=no");
    } else {
        alert("그룹을 선택하세요.");
        return;
    }

    /*
    var url = "<c:url value='/sec/gmt/EgovGroupSearchView.do'/>";
    var varParam = new Object();
    var openParam = "dialogWidth:500px;dialogHeight:485px;scroll:no;status:no;center:yes;resizable:yes;";
    var retVal;

    if(document.listForm.searchCondition.value == '3') {
        retVal = window.showModalDialog(url, varParam, openParam);
        if(retVal) {
            document.listForm.searchKeyword.value = retVal;
        }
    } else {
        alert("그룹을 선택하세요.");
        return;
    }
    */

}

function onSearchCondition() {
	document.listForm.searchKeyword.value = "";
	if(document.listForm.searchCondition.value == '3') {
        document.listForm.searchKeyword.readOnly = true;
	} else {
		document.listForm.searchKeyword.readOnly = false;
	}
}

function press() {

    if (event.keyCode==13) {
    	fncSelectAuthorGroupList('1');
    }
}
//-->
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
                권한그룹관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">보안</a></li>
                <li class="active">권한그룹관리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    

    <!-- content start -->
	<form:form name="listForm" action="${pageContext.request.contextPath}/sec/rgm/EgovAuthorGroupList.do" method="post">
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
					  <td width="65%">조회조건: <select name="searchCondition" onchange="onSearchCondition()" title="조회조건선택">
					                    <option value="1" <c:if test="${authorGroupVO.searchCondition == '1'}">selected</c:if> >사용자 ID</option>
					                    <option value="2" <c:if test="${authorGroupVO.searchCondition == '2'}">selected</c:if> >사용자 명</option>
					                    <option value="3" <c:if test="${authorGroupVO.searchCondition == '3'}">selected</c:if> >그룹</option>
					                </select>&nbsp;<input name="searchKeyword" type="text" value="<c:out value='${authorGroupVO.searchKeyword}'/>" size="25" title="검색" onkeypress="press();"/>
					  </td>
					  <%-- <td width="10%">
					     <table border="0" cellspacing="0" cellpadding="0">
					       <tr>
					         <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
					         <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncSelectAuthorGroupPop()">그룹조회 팝업</a></td>
					         <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					       </tr>
					     </table>
					  </td> --%>
					  <th width="20%" align="right">
					   <table border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <%-- <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncSelectAuthorGroupList('1')" style="selector-dummy:expression(this.hideFocus=false);">조회</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td>&nbsp;&nbsp;</td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncAddAuthorGroupInsert(); return false;" style="selector-dummy:expression(this.hideFocus=false);">등록</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td>&nbsp;&nbsp;</td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncAuthorGroupDeleteList()" style="selector-dummy:expression(this.hideFocus=false);">삭제</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td> --%>
					    </tr>
					   </table>
					  </th>
					 </tr>
					</table>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                      	<button type="button" class="btn btn-info" id="btnPopUp" onclick="javascript:fncSelectAuthorGroupPop()" > 그룹조회팝업</button>
                      	<button type="button" class="btn btn-info" id="btnSearch" onclick="javascript:fncSelectAuthorGroupList('1')" > 조회</button>
                      	<button type="button" class="btn btn-info" id="btnDel" onclick="javascript:fncAuthorGroupDeleteList()" > 삭제</button>
                      	<button type="button" class="btn btn-info" id="btnList" onclick="javascript:fncAddAuthorGroupInsert(); return false;" > 등록</button>
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
					<table width="100%" cellpadding="8" class="table table-hover dataTable no-footer" summary="권한 그룹을 관리하는 테이블입니다.사용자 ID,사용자 명,사용자 유형,권한,등록 여부의 정보를 담고 있습니다.">
					 <thead class="dataTables_scrollHead">
					  <tr role="row">
					    <th class="title" width="5%" scope="col" nowrap="nowrap"><input type="checkbox" name="checkAll" class="check2" onclick="javascript:fncCheckAll()" title="전체선택체크박스"></th>
					    <th class="title" width="10%" scope="col" nowrap="nowrap">사용자 ID</th>
					    <th class="title" width="10%" scope="col" nowrap="nowrap">사용자 명</th>
					    <th class="title" width="10%" scope="col" nowrap="nowrap">사용자 유형</th>
					    <th class="title" width="20%" scope="col" nowrap="nowrap">권한</th>
					    <th class="title" width="10%" scope="col" nowrap="nowrap">등록 여부</th>
					  </tr>
					 </thead>
					 <tbody>
					 <c:forEach var="authorGroup" items="${authorGroupList}" varStatus="status">
					  <tr role="row" class="odd">
					    <td class="lt_text3" nowrap="nowrap"><input type="checkbox" name="delYn" class="check2" title="선택"><input type="hidden" name="checkId" value="<c:out value="${authorGroup.uniqId}"/>"/></td>
					    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorGroup.userId}"/></td>
					    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorGroup.userNm}"/></td>
					    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorGroup.mberTyNm}"/><input type="hidden" name="mberTyCode" value="${authorGroup.mberTyCode}"/></td>
					    <td class="lt_text3" nowrap="nowrap"><select name="authorManageCombo" title="권한">
						        <c:forEach var="authorManage" items="${authorManageList}" varStatus="status">
						            <option value="<c:out value="${authorManage.authorCode}"/>" <c:if test="${authorManage.authorCode == authorGroup.authorCode}">selected</c:if> ><c:out value="${authorManage.authorNm}"/></option>
						        </c:forEach>
						    </select></td>
					    <td class="lt_text3" nowrap="nowrap"><c:out value="${authorGroup.regYn}"/><input type="hidden" name="regYn" value="<c:out value="${authorGroup.regYn}"/>"></td>
					  </tr>
					 </c:forEach>
					 </tbody>
					</table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td height="10"></td>
					  </tr>
					</table>
					<c:if test="${!empty authorGroupVO.pageIndex }">
					<div align="center">
					    <div>
					        <ui:pagination paginationInfo = "${paginationInfo}"
					            type="default"
					            jsFunction="linkPage"
					            />
					    </div>
					    <div align="right">
					        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지"/>
					    </div>
					</div>
					</c:if>
					<input type="hidden" name="userId"/>
					<input type="hidden" name="userIds"/>
					<input type="hidden" name="authorCodes"/>
					<input type="hidden" name="regYns"/>
					<input type="hidden" name="mberTyCodes"/>
					
					<input type="hidden" name="pageIndex" value="<c:out value='${authorGroupVO.pageIndex}'/>"/>
			        </div>
                </div>
                <!-- <<<<<<<< box THE END -->
			        <!--  page end -->
            </div>
        </div>
	</form:form>
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
