<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%

 /**
  * @Class Name : EgovUserManage.jsp
  * @Description : 사용자관리(조회,삭제) JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  *   2011.09.07    서준식          네비게이션명 변경 (사용자 관리 -> 업무사용자관리)
  	  2019.01.03	최재중	   EC4
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.02
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet"  type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet"  type="text/css">
<title>User Manage(List,Del)</title> --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>User Manage(List,Del)</title>
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
function fnCheckAll() {
    var checkField = document.listForm.checkField;
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
function fnDeleteUser() {
    var checkField = document.listForm.checkField;
    var id = document.listForm.checkId;
    var checkedIds = "";
    var checkedCount = 0;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                    checkedIds += ((checkedCount==0? "" : ",") + id[i].value);
                    checkedCount++;
                }
            }
        } else {
            if(checkField.checked) {
                checkedIds = id.value;
            }
        }
    }
    if(checkedIds.length > 0) {
    	//alert(checkedIds);
        if(confirm("<spring:message code="common.delete.msg" />")){
        	document.listForm.checkedIdForDel.value=checkedIds;
            document.listForm.action = "<c:url value='/uss/umt/EgovUserDelete.do'/>";
            document.listForm.submit();
        }
    }
}
function fnSelectUser(id) {
    document.listForm.selectedId.value = id;
    array = id.split(":");
    if(array[0] == "") {
    } else {
        userTy = array[0];
        userId = array[1];
    }
   	document.listForm.selectedId.value = userId;
    document.listForm.action = "<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>";
    document.listForm.submit();

}
function fnAddUserView() {
    document.listForm.action = "<c:url value='/uss/umt/EgovUserInsertView.do'/>";
    document.listForm.submit();
}
function fnLinkPage(pageNo){
    document.listForm.pageIndex.value = pageNo;
    document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.listForm.submit();
}
function fnSearch(){
	document.listForm.pageIndex.value = 1;
	document.listForm.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.listForm.submit();
}
function fnViewCheck(){
    if(insert_msg.style.visibility == 'hidden'){
    	insert_msg.style.visibility = 'visible';
    }else{
    	insert_msg.style.visibility = 'hidden';
    }
}
<c:if test="${!empty resultMsg}">alert("<spring:message code="${resultMsg}" />");</c:if>
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
                업무사용자관리
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">사용자지원</a></li>
                <li class="active">업무사용자관리</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    

    <!-- content start -->
    <form name="listForm" action="<c:url value='/uss/umt/EgovUserManage.do'/>" method="post">
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
			        <input name="selectedId" type="hidden" />
			        <input name="checkedIdForDel" type="hidden" />
			        <input name="pageIndex" type="hidden" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
			        <div>사용자수 <strong><c:out value="${paginationInfo.totalRecordCount}"/></strong></div>
			        <table class="table table-hover" border="0" cellspacing="0" cellpadding="0" summary="조회 기능을 제공한다.">
			            <tr>
			                <td>
			                <div>
			                <label for="sbscrbSttus" >
			                <select name="sbscrbSttus" id="sbscrbSttus" title="검색조건선택1" class="input-sm">
			                    <option value="0" <c:if test="${empty userSearchVO.sbscrbSttus || userSearchVO.sbscrbSttus == '0'}">selected="selected"</c:if> >상태(전체)</option>
			                    <option value="A" <c:if test="${userSearchVO.sbscrbSttus == 'A'}">selected="selected"</c:if> >가입신청</option>
			                    <option value="D" <c:if test="${userSearchVO.sbscrbSttus == 'D'}">selected="selected"</c:if> >삭제</option>
			                    <option value="P" <c:if test="${userSearchVO.sbscrbSttus == 'P'}">selected="selected"</c:if> >승인</option>
			                </select>
			                <select name="searchCondition" id="searchCondition" title="검색조건선택2" class="input-sm">
			                    <option value="0" <c:if test="${userSearchVO.searchCondition == '0'}">selected="selected"</c:if> >ID</option>
			                    <option value="1" <c:if test="${empty userSearchVO.searchCondition || userSearchVO.searchCondition == '1'}">selected="selected"</c:if> >Name</option>
			                </select>
			                <input name="searchKeyword" type="text" value="<c:out value="${userSearchVO.searchKeyword}"/>" title="검색단어입력" />
			                </label>
			                </div>
			                </td>
			                <td>&nbsp;</td>
			                <td>
			                    <table border="0" cellspacing="0" cellpadding="0" summary="">
			                      <tr>
			                        <%-- <td><span class="button"><input type="submit" value="<spring:message code="button.search" />" onclick="fnSearch(); return false;" /></span></td>
			                        <td><span class="button"><a href="javascript:fnDeleteUser();"><spring:message code="button.delete" /></a></span>&nbsp;</td>
			                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserManage.do'/>"><spring:message code="button.list" /></a></span>&nbsp;</td>
			                        <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserInsertView.do'/>" onclick="fnAddUserView(); return false;"><spring:message code="button.create" /></a></span>&nbsp;</td> --%>
			                      </tr>
			                    </table>
			                </td>
			            </tr>
			        </table>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                      	<button type="button" class="btn btn-info" id="btnSearch" onclick="fnSearch(); return false;" > 조회</button>
                      	<button type="button" class="btn btn-info" id="btnDel" onclick="javascript:fnDeleteUser();" > 삭제</button>
                      	<button type="button" class="btn btn-info" id="btnList" onclick="/uss/umt/EgovUserManage.do" > 목록</button>
                      	<button type="button" class="btn btn-info" id="btnInsert" onclick="fnAddUserView(); return false;" > 등록</button>
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
			        <table cellpadding="8" class="table table-hover dataTable no-footer" summary="사용자 목록을 제공한다.">
			            <thead class="dataTables_scrollHead">
			                <tr role="row">
			                    <th class="title" scope="col">No.</th>
			                    <th class="title" scope="col">
			                        <input name="checkAll" type="checkbox" title="Check All" onclick="javascript:fnCheckAll();"/>
			                    </th>
			                    <th class="title" scope="col">아이디</th>
			                    <th class="title" scope="col">사용자이름</th>
			                    <th class="title" scope="col">사용자이메일</th>
			                    <th class="title" scope="col">전화번호</th>
			                    <th class="title" scope="col">등록일</th>
			                    <th class="title" scope="col">가입상태</th>
			                </tr>
			            </thead>
			            <tbody>
			            <%-- 데이터를 없을때 화면에 메시지를 출력해준다 --%>
						<c:if test="${fn:length(resultList) == 0}">
						<tr>
						<td class="lt_text3" colspan="8">
							<spring:message code="common.nodata.msg" />
						</td>
						</tr>
						</c:if>
			                <c:forEach var="result" items="${resultList}" varStatus="status">
			                <tr role="row" class="odd">
			                    <td class="lt_text3" ><c:out value="${status.count}"/></td>
			                    <td class="lt_text3" >
			                        <input name="checkField" title="Check <c:out value="${status.count}"/>" type="checkbox"/>
			                        <input name="checkId" type="hidden" value="<c:out value='${result.userTy}'/>:<c:out value='${result.uniqId}'/>"/>
			                    </td>
			                    <td class="lt_text3" style="cursor:pointer;cursor:hand" >
									<span class="link"><a href="<c:url value='/uss/umt/EgovUserSelectUpdtView.do'/>?selectedId=<c:out value="${result.uniqId}"/>"  onclick="javascript:fnSelectUser('<c:out value="${result.userTy}"/>:<c:out value="${result.uniqId}"/>'); return false;"><c:out value="${result.userId}"/></a></span>
			                    </td>
			                    <td class="lt_text3" ><c:out value="${result.userNm}"/></td>
			                    <td class="lt_text3" ><c:out value="${result.emailAdres}"/></td>
			                    <td class="lt_text3" ><c:out value="${result.areaNo}"/>)<c:out value="${result.middleTelno}"/>-<c:out value="${result.endTelno}"/></td>
			                    <td class="lt_text3" ><c:out value="${result.sbscrbDe}"/></td>
			                    <td class="lt_text3" >
			                        <c:forEach var="emplyrSttusCode_result" items="${emplyrSttusCode_result}" varStatus="status">
			                            <c:if test="${result.sttus == emplyrSttusCode_result.code}"><c:out value="${emplyrSttusCode_result.codeNm}"/></c:if>
			                        </c:forEach>
			                    </td>
			                </tr>
			                </c:forEach>
			            </tbody>
			        </table>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td height="10"></td>
					  </tr>
					</table>
			        <!--  page start -->
			        <table width="717">
			            <tr>
			                <td align="center">
			                <div id="pagination">
			                <ui:pagination paginationInfo = "${paginationInfo}"
			                    type="image"
			                    jsFunction="fnLinkPage"
			                    />
			                </div>
			                </td>
			            </tr>
			        </table>
			        </div>
                </div>
                <!-- <<<<<<<< box THE END -->
			        <!--  page end -->
            </div>
        </div>
    </form>
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
