<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovUserInsert.jsp
  * @Description : 사용자등록View JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.02    조재영          최초 생성
  	  2019.01.03	최재중	   EC4
  *
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
<link href="<c:url value='/css/egovframework/com/com.css' />" rel="stylesheet" type="text/css">
<link href="<c:url value='/css/egovframework/com/button.css' />" rel="stylesheet"  type="text/css">
<title>User Insert</title> --%>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>User Insert</title>
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
<validator:javascript formName="userManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/egovframework/com/sym/ccm/zip/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnIdCheck(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.userManageVO.emplyrId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.userManageVO.emplyrId.value = retVal;
    }
}
function showModalDialogCallback(retVal) {
	if(retVal) {
	    document.userManageVO.emplyrId.value = retVal;
	}
}
function fnListPage(){
    document.userManageVO.action = "<c:url value='/uss/umt/EgovUserManage.do'/>";
    document.userManageVO.submit();
}
function fnInsert(){
    if(validateUserManageVO(document.userManageVO)){
    	if(document.userManageVO.password.value != document.userManageVO.password2.value){
            alert("<spring:message code="fail.user.passwordUpdate2" />");
            return;
        }
        document.userManageVO.submit();
    }
}
function fn_egov_inqire_cert() {
	var url = "<c:url value='/uat/uia/EgovGpkiRegist.do' />";
	var popupwidth = '500';
	var popupheight = '400';
	var title = '인증서';

	Top = (window.screen.height - popupheight) / 3;
	Left = (window.screen.width - popupwidth) / 2;
	if (Top < 0) Top = 0;
	if (Left < 0) Left = 0;
	Future = "fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,	scrollbars=no,resizable=no,left=" + Left + ",top=" + Top + ",width=" + popupwidth + ",height=" + popupheight;
	PopUpWindow = window.open(url, title, Future)
	PopUpWindow.focus();
}

function fn_egov_dn_info_setting(dn) {
	var frm = document.userManageVO;

	frm.subDn.value = dn;
}

/*
if (typeof(opener.fn_egov_dn_info_setting) == 'undefined') {
	alert('메인 화면이 변경되거나 없습니다');
	this.close();
} else {
	opener.fn_egov_dn_info_setting(dn);
	this.close();
}
*/

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
                업무사용자 등록
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
			        <form:form commandName="userManageVO" action="${pageContext.request.contextPath}/uss/umt/EgovUserInsert.do" name="userManageVO" method="post" cssClass="form-horizontal" >
			            <!-- 우편번호검색 -->
			            <input type="hidden" name="zip_url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />


					<div class="box-body">
								<div class="form-group has-warning">
									<label for="emplyrId" class="col-sm-2 control-label">사용자아이디</label>
									<div class="col-sm-4">
										<div class="input-group">
						                    <form:input path="emplyrId" id="emplyrId" class="form-control" maxlength="20" readonly="true" title="사용자아이디" />
						                    <form:errors path="emplyrId" cssClass="help-block"/>
						                    <div class="input-group-btn">
							                    <a href="#LINK" onclick="fnIdCheck();">
							                        <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="" />(중복아이디 검색)
							                    </a>
						                    </div>
					                    </div>
									</div>
									<label for="emplyrNm" class="col-sm-2 control-label">사용자이름</label>
									<div class="col-sm-4">
					                    <form:input path="emplyrNm" id="emplyrNm" class="form-control"  maxlength="60" title="사용자이름" />
					                    <form:errors path="emplyrNm" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="password" class="col-sm-2 control-label">비밀번호</label>
									<div class="col-sm-4">
					                    <form:password path="password" id="password" title="비밀번호" class="form-control" maxlength="20" />
					                    <form:errors path="password" cssClass="help-block"/>
									</div>
									<label for="password2" class="col-sm-2 control-label">비밀번호확인</label>
									<div class="col-sm-4">
					                    <input name="password2" id="password2" title="비밀번호확인" type="password" class="form-control" maxlength="20" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="passwordHint" class="col-sm-2 control-label">비밀번호힌트</label>
									<div class="col-sm-4">
					                    <form:select path="passwordHint" id="passwordHint" title="비밀번호힌트" class="form-control input-sm">
					                        <form:option value="" label="--선택하세요--"/>
					                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>
					                    <form:errors path="passwordHint" cssClass="help-block"/>
									</div>
									<label for="passwordCnsr" class="col-sm-2 control-label">비밀번호정답</label>
									<div class="col-sm-4">
					                    <form:input path="passwordCnsr" id="passwordCnsr" class="form-control" maxlength="100" title="비밀번호정답"/>
					                    <form:errors path="passwordCnsr" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="insttCode" class="col-sm-2 control-label">소속기관코드</label>
									<div class="col-sm-4">
					                    <form:select path="insttCode" id="insttCode" title="소속기관코드" class="form-control input-sm">
					                        <form:option value="" label="--선택하세요--"/>
					                        <form:options items="${insttCode_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>
					                    <form:errors path="insttCode" cssClass="help-block"/>
									</div>
									<label for="orgnztId" class="col-sm-2 control-label">조직아이디</label>
									<div class="col-sm-4">
					                    <form:select path="orgnztId" id="orgnztId" title="조직아이디" class="form-control input-sm">
					                        <form:option value="" label="--선택하세요--"/>
					                        <form:options items="${orgnztId_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>
					                    <form:errors path="orgnztId" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="ofcpsNm" class="col-sm-2 control-label">직위명</label>
									<div class="col-sm-4">
					                    <form:input path="ofcpsNm" id="ofcpsNm" class="form-control" maxlength="50" title="직위명"/>
					                    <form:errors path="ofcpsNm" cssClass="help-block" />
									</div>
									<label for="emplNo" class="col-sm-2 control-label">사번</label>
									<div class="col-sm-4">
					                    <form:input path="emplNo" id="emplNo" class="form-control" maxlength="20" title="사번"/>
					                    <form:errors path="emplNo" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="sexdstnCode" class="col-sm-2 control-label">성별구분코드</label>
									<div class="col-sm-4">
					                    <form:select path="sexdstnCode" id="sexdstnCode" title="성별구분코드" class="form-control input-sm">
					                        <form:option value="" label="--선택하세요--"/>
					                        <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>
					                    <form:errors path="sexdstnCode" cssClass="help-block"/>
									</div>
									<label for="brth" class="col-sm-2 control-label">생일</label>
									<div class="col-sm-4">
					                    <form:input path="brth" id="brth" class="form-control" maxlength="8" title="생일"/>
					                    <form:errors path="brth" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="areaNo" class="col-sm-2 control-label">집전화번호</label>
									<div class="col-sm-4">
					                    <form:input path="areaNo" id="areaNo" cssClass="txaIpUmt" size="4" maxlength="4" title="지역번호"/>
					                    - <form:input path="homemiddleTelno" id="homemiddleTelno" cssClass="txaIpUmt" size="4" maxlength="4" title="중간번호"/>
					                    - <form:input path="homeendTelno" id="homeendTelno" cssClass="txaIpUmt" size="4" maxlength="4" title="끝자리번호"/>
					                    <form:errors path="areaNo" cssClass="help-block" />
					                    <form:errors path="homemiddleTelno" cssClass="help-block" />
					                    <form:errors path="homeendTelno" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="offmTelno" class="col-sm-2 control-label">사무실전화번호</label>
									<div class="col-sm-4">
					                    <form:input path="offmTelno" id="offmTelno" class="form-control" maxlength="15" title="사무실전화번호"/>
					                    <form:errors path="offmTelno" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="fxnum" class="col-sm-2 control-label">팩스번호</label>
									<div class="col-sm-4">
					                    <form:input path="fxnum" id="fxnum" class="form-control" maxlength="15" title="팩스번호"/>
					                    <form:errors path="fxnum" cssClass="help-block" />
									</div>
									<label for="moblphonNo" class="col-sm-2 control-label">핸드폰번호</label>
									<div class="col-sm-4">
					                    <form:input path="moblphonNo" id="moblphonNo" class="form-control" maxlength="15" title="핸드폰번호"/>
					                    <form:errors path="moblphonNo" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="emailAdres" class="col-sm-2 control-label">이메일주소</label>
									<div class="col-sm-4">
					                    <form:input path="emailAdres" id="emailAdres" class="form-control" maxlength="50" title="이메일주소"/>
					                    <form:errors path="emailAdres" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="zipAdres" class="col-sm-2 control-label">우편번호</label>
									<div class="col-sm-4">
					                    <input name="zip_view" id="zip_view" type="text" size="20" value="<c:out value='${userManageVO.zip}'/>"  maxlength="8" readonly title="우편번호"/>
					                    <form:hidden path="zip" />
				                        <a href="#LINK" onclick="fn_egov_ZipSearch(document.userManageVO, document.userManageVO.zip, document.userManageVO.zip_view, document.userManageVO.homeadres);">
				                            <img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />" alt="" />(우편번호 검색)
				                        </a>
					                    <form:errors path="zip" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="homeadres" class="col-sm-2 control-label">주소</label>
									<div class="col-sm-10">
					                    <form:input path="homeadres" id="homeadres" class="form-control" maxlength="100" readonly="true" title="주소"/>
					                    <form:errors path="homeadres" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group">
									<label for="detailAdres" class="col-sm-2 control-label">상세주소</label>
									<div class="col-sm-10">
					                    <form:input path="detailAdres" id="detailAdres" class="form-control" maxlength="50" title="상세주소"/>
					                    <form:errors path="detailAdres" cssClass="help-block" />
									</div>
								</div>
								
								<div class="form-group has-warning">
									<label for="groupId" class="col-sm-2 control-label">그룹아이디</label>
									<div class="col-sm-4">
					                    <form:select path="groupId" id="groupId" title="그룹아이디" class="form-control input-sm">
					                        <form:option value="" label="--선택하세요--"/>
					                        <form:options items="${groupId_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>
					                   <form:errors path="groupId" cssClass="help-block"/>
									</div>
									<label for="emplyrSttusCode" class="col-sm-2 control-label">사용자상태코드</label>
									<div class="col-sm-4">
					                    <form:select path="emplyrSttusCode" id="emplyrSttusCode" title="사용자상태코드" class="form-control input-sm">
					                        <form:option value="" label="--선택하세요--"/>
					                        <form:options items="${emplyrSttusCode_result}" itemValue="code" itemLabel="codeNm"/>
					                    </form:select>
					                    <form:errors path="emplyrSttusCode" cssClass="help-block"/>
									</div>
								</div>
								
								<div class="form-group">
									<label for="subDn" class="col-sm-2 control-label">사용자DN</label>
									<div class="col-sm-10">
					                    <form:input path="subDn" id="subDn" cssClass="txaIpUmt" size="40" maxlength="100" title="사용자DN"/>
					                    &nbsp;<a href="#LINK" onclick="fn_egov_inqire_cert()" style="selector-dummy: expression(this.hideFocus=false);"><img src="<c:url value='/images/egovframework/com/cmm/icon/search.gif' />"
						     			width="15" height="15" alt="search"/></a>
					                    <form:errors path="subDn" cssClass="error" />
									</div>
								</div>
								<!-- 조회, 등록, 삭제 버튼 -->
			                    <div class="box-footer text-right">
			                        <button type="submit" class="btn btn-info" id="btnInsert" onclick="fnInsert(); return false;" > 등록</button>
			                        <button type="button" class="btn btn-info" id="btnList" onclick="fnListPage(); return false;" > 목록</button>
			                        <button type="button" class="btn btn-info" id="btnCancel" onclick="javascript:document.userManageVO.reset();" > 취소</button>
			                    </div>
					</div>
					
					
					
					
					
			        <%-- <table width="717" border="0" cellspacing="0" cellpadding="0">
			            <tr>
			                <td colspan="2" height="10"></td>
			            </tr>
			            <tr>
			                <td colspan="2" align="center">
			                    <table border="0" cellspacing="0" cellpadding="0" align="center">
			                        <tr>
			                            <td><span class="button"><input type="submit" value="<spring:message code="button.create" />" onclick="fnInsert(); return false;" /></span>&nbsp;</td>
			                            <td><span class="button"><a href="<c:url value='/uss/umt/EgovUserManage.do'/>" onclick="fnListPage(); return false;"><spring:message code="button.list" /></a></span>&nbsp;</td>
			                            <td><span class="button"><a href="#LINK" onclick="javascript:document.userManageVO.reset();"><spring:message code="button.reset" /></a></span></td>
			                        </tr>
			                    </table>
			                </td>
			            </tr>
			        </table> --%>
			
			        <!-- 검색조건 유지 -->
			        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
			        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
			        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
			        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
			        </form:form>
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
