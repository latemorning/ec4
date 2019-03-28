<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--
 /**
  * @Class Name : EgovProgramListDetailSelectUpdt.jsp
  * @Description : 프로그램목록 상세조회및 수정 화면
  * @Modification Ination
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.10    이용          최초 생성
  *	  2019.01.03	최재중	   EC4
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  //String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  //String imagePath_button = "/images/egovframework/com/sym/prm/button/";
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>
<html lang="ko">
<head>
<%-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/com.css' />" type="text/css">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/button.css' />" type="text/css">
<title>프로그램목록리스트</title> --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>프로그램목록 수정</title>
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
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 수정처리 함수
 ******************************************************** */
function updateProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){
		if(!validateProgrmManageVO(form)){
			return;
		}else{
            form.action="<c:url value='/sym/prm/EgovProgramListDetailSelectUpdt.do' />";
			form.submit();
		}
	}
}

/* ********************************************************
 * 삭제처리함수
 ******************************************************** */
function deleteProgramListManage(form) {
	if(confirm("<spring:message code="common.delete.msg" />")){
        form.action="<c:url value='/sym/prm/EgovProgramListManageDelete.do' />";
		form.submit();
	}
}

/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramListManageSelect.do' />";
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
                프로그램목록 수정
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
					<!-- ********** 여기서 부터 본문 내용 *************** -->
					
					<form:form commandName="progrmManageVO" method="post" cssClass="form-horizontal" >
					
					<div class="box-body">
								<div class="form-group has-warning">
									<label for="progrmFileNm" class="col-sm-2 control-label">프로그램파일명</label>
									<div class="col-sm-4">
					                    <form:input path="progrmFileNm" class="form-control" maxlength="50" title="프로그램파일명" />
					                    <form:errors path="progrmFileNm" cssClass="help-block"/>
									</div>
									<label for="progrmStrePath" class="col-sm-2 control-label">저장경로</label>
									<div class="col-sm-4">
					                    <form:input path="progrmStrePath" class="form-control"  maxlength="60" title="저장경로" />
					                    <form:errors path="progrmStrePath" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="progrmKoreanNm" class="col-sm-2 control-label">한글명</label>
									<div class="col-sm-4">
					                    <form:input path="progrmKoreanNm" class="form-control" maxlength="60" title="한글명" />
					                    <form:errors path="progrmKoreanNm" cssClass="help-block"/>
									</div>
									<label for="URL" class="col-sm-2 control-label">URL</label>
									<div class="col-sm-4">
					                    <form:input path="URL" class="form-control"  maxlength="60" title="URL" />
					                    <form:errors path="URL" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="progrmDc" class="col-sm-2 control-label">프로그램설명</label>
									<div class="col-sm-10">
									     <form:textarea path="progrmDc" rows="14" cols="110" cssClass="txaClass" title="프로그램설명"/>
									     <form:errors path="progrmDc"/>
									</div>
								</div>
								
								<!-- 조회, 등록, 삭제 버튼 -->
			                    <div class="box-footer text-right">
			                        <button type="button" class="btn btn-info" id="btnList" onclick="selectList(); return false;" > 목록</button>
			                        <button type="submit" class="btn btn-info" id="btnUpdate" onclick="updateProgramListManage(document.forms[1]); return false;" > 수정</button>
			                        <button type="button" class="btn btn-info" id="btnDelete" onclick="deleteProgramListManage(document.forms[1]); return false;" > 삭제</button>
			                    </div>
					</div>

					
					<%-- <table width="717" border="0" cellspacing="0" cellpadding="0">
					  <tr>
					    <td height="10"></td>
					  </tr>
					  <tr>
					    <td>
							<table width="717" border="0" cellspacing="0" cellpadding="0" align="right">
							<tr>
							  <td width="600">&nbsp;</td>
					
					          <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" onclick="selectList(); return false;">목록</a></span></td>
					          <td width="5%"></td>
					          <td><span class="button"><input type="submit" value="<spring:message code="button.update" />" onclick="updateProgramListManage(document.forms[0]); return false;"></span></td>
					          <td width="5%"></td>
					          <td><span class="button"><a href="<c:url value='/sym/prm/EgovProgramListManageDelete.do'/>?progrmFileNm=<c:out value="${progrmManageVO.progrmFileNm  }"/>" onclick="deleteProgramListManage(document.forms[0]); return false;"><spring:message code="button.delete" /></a></span></td>
							</tr>
							</table>
					    </td>
					  </tr>
					</table> --%>
					
					<br>
					
					<input name="cmd" type="hidden" value="<c:out value='update'/>"/>
					<!-- <input name="tmp_progrmNm" type="hidden"/> -->
					</form:form>
					<!-- ********** 여기까지 내용 *************** -->
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

