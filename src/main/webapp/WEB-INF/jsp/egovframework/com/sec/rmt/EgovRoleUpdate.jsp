<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
/**
 * @Class Name  : EgovRoleUpdate.java
 * @Description : EgovRoleUpdate jsp
 * @Modification Information
 * @
 * @  수정일         수정자          수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.02.01    lee.m.j          최초 생성
 *   2019.01.08    최재중  EC4
 *  @author lee.m.j
 *  @since 2009.03.11
 *  @version 1.0
 *  @see
 *
 */
 --%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

<c:set var="registerFlag" value="${empty roleManageVO.roleCode ? 'INSERT' : 'UPDATE'}"/>
<c:set var="registerFlagName" value="${empty roleManageVO.roleCode ? '롤 등록' : '롤 수정'}"/>

<html lang="ko">
<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<title>롤관리</title> --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>롤관리</title>
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





<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="roleManage" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">

function fncSelectRoleList() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleList.do'/>";
    varFrom.submit();
}

function fncRoleInsert() {

    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleInsert.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateRoleManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncRoleUpdate() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleUpdate.do'/>";

    if(confirm("저장 하시겠습니까?")){
        if(!validateRoleManage(varFrom)){
            return;
        }else{
            varFrom.submit();
        }
    }
}

function fncRoleDelete() {
    var varFrom = document.getElementById("roleManage");
    varFrom.action = "<c:url value='/sec/rmt/EgovRoleDelete.do'/>";
    if(confirm("삭제 하시겠습니까?")){
        varFrom.submit();
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
                롤 수정
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">보안</a></li>
                <li class="active">롤 수정</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border bg-info">
                    	<!-- <h3 class="box-title">업무사용자수정</h3> -->
                    </div>
                    <!-- /.box-header -->

					<!-- content start -->
					<form:form commandName="roleManage" method="post" cssClass="form-horizontal" >

					<div class="box-body">
								<div class="form-group has-warning">
									<label for="roleCode" class="col-sm-2 control-label">롤 코드</label>
									<div class="col-sm-4">
					                    <form:input path="roleCode" class="form-control" maxlength="20" readonly="true" title="롤 코드" />
					                    <form:errors path="roleCode" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="roleNm" class="col-sm-2 control-label">롤  명</label>
									<div class="col-sm-4">
					                    <form:input path="roleNm" class="form-control" maxlength="50" title="롤  명" />
					                    <form:errors path="roleNm" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="rolePtn" class="col-sm-2 control-label">롤  패턴</label>
									<div class="col-sm-4">
					                    <form:input path="rolePtn" class="form-control" maxlength="200" title="롤  패턴" />
					                    <form:errors path="rolePtn" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="roleDc" class="col-sm-2 control-label">설명</label>
									<div class="col-sm-4">
					                    <form:input path="roleDc" class="form-control" maxlength="50" title="설명" />
					                    <form:errors path="roleDc" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="roleTyp" class="col-sm-2 control-label">롤 타입</label>
									<div class="col-sm-4">
									      <select name="roleTyp" title="롤타입">
									        <c:forEach var="cmmCodeDetail" items="${cmmCodeDetailList}" varStatus="status">
									          <option value="<c:out value='${cmmCodeDetail.code}'/>" <c:if test="${cmmCodeDetail.code == roleManage.roleTyp}">selected</c:if> ><c:out value="${cmmCodeDetail.codeNm}"/></option>
									        </c:forEach>
									      </select>
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="roleSort" class="col-sm-2 control-label">롤 Sort</label>
									<div class="col-sm-4">
					                    <form:input path="roleSort" class="form-control" maxlength="10" title="롤 Sort" />
					                    <form:errors path="roleSort" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="roleCreatDe" class="col-sm-2 control-label">등록일자</label>
									<div class="col-sm-4">
					                    <form:input path="roleCreatDe" class="form-control" readonly="true" title="등록일자" />
					                    <form:errors path="roleCreatDe" cssClass="help-block"/>
									</div>
								</div>
								
								<!-- 조회, 등록, 삭제 버튼 -->
			                    <div class="box-footer text-right">
			                        <button type="button" class="btn btn-info" id="btnList" onclick="javascript:fncSelectRoleList(); return false;" > 목록</button>
			                        <c:if test="${registerFlag == 'INSERT'}">
			                        <button type="submit" class="btn btn-info" id="btnInsert" onclick="javascript:fncRoleInsert(); return false;" > 저장</button>
			                        </c:if>
			                        <c:if test="${registerFlag == 'UPDATE'}">
			                        <button type="submit" class="btn btn-info" id="btnUpdate" onclick="javascript:fncRoleUpdate(); return false;" > 수정</button>
			                        <button type="submit" class="btn btn-info" id="btnDelete" onclick="javascript:fncRoleDelete(); return false;" > 삭제</button>
			                        </c:if>
			                    </div>
					</div>
								
	
					<%-- <table width="100%" cellpadding="8" class="table-search" border="0">
					 <tr>
					  <td width="40%" class="title_left">
					   <img src="<c:url value='/images/egovframework/com/cmm/icon/tit_icon.gif' />" width="16" height="16" hspace="3" align="middle" alt="제목아이콘이미지">&nbsp;<c:out value="${registerFlagName}"/>
					  </td>
					  <th width="10%" align="right">
					   <table border="0" cellspacing="0" cellpadding="0">
					    <tr>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif' />" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncSelectRoleList()" style="selector-dummy:expression(this.hideFocus=false);">목록</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td>&nbsp;&nbsp;</td>
					      <c:if test="${registerFlag == 'INSERT'}">
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncRoleInsert()" style="selector-dummy:expression(this.hideFocus=false);">등록</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td>&nbsp;&nbsp;</td>
					      </c:if>
					      <c:if test="${registerFlag == 'UPDATE'}">
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncRoleUpdate()" style="selector-dummy:expression(this.hideFocus=false);">수정</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td>&nbsp;&nbsp;</td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_left.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      <td class="btnBackground" nowrap="nowrap"><a href="#LINK" onclick="javascript:fncRoleDelete()" style="selector-dummy:expression(this.hideFocus=false);">삭제</a>
					      </td>
					      <td><img src="<c:url value='/images/egovframework/com/cmm/btn/bu2_right.gif'/>" width="8" height="20" alt="버튼이미지"></td>
					      </c:if>
					    </tr>
					   </table>
					  </th>
					 </tr>
					</table> --%>
					
					
					
					<!-- 검색조건 유지 -->
					<c:if test="${registerFlag == 'UPDATE'}">
					<input type="hidden" name="searchCondition" value="<c:out value='${roleManageVO.searchCondition}'/>"/>
					<input type="hidden" name="searchKeyword" value="<c:out value='${roleManageVO.searchKeyword}'/>"/>
					<input type="hidden" name="pageIndex" value="<c:out value='${roleManageVO.pageIndex}'/>"/>
					</c:if>
					</form:form>
				    <div align="right">
				        <input type="text" name="message" value="<c:out value='${message}'/>" size="30" readonly="readonly" title="메시지" />
				    </div>
			        <!-- content end -->
                    
                </div>
                <!-- <<<<<<<< box THE END -->
        	</div>
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
      
</body>
</html>

