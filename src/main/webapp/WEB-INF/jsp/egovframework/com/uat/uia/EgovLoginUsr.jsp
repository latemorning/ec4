<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
 /**
  * @Class Name : EgovLoginUsr.jsp
  * @Description : Login 인증 화면
  * @Modification Information
  * @
  * @  수정일        수정자              수정내용
  * @ -------       --------    ---------------------------
  * @ 2009.03.03    박지욱      최초 생성
  *   2011.09.25    서준식      사용자 관리 패키지가 미포함 되었을때에 회원가입 오류 메시지 표시
  *   2011.10.27    서준식      사용자 입력 탭 순서 변경
  *   2018.04.03    harry       로그인 화면 변경
  *  @author 공통서비스 개발팀 박지욱
  *  @since 2009.03.03
  *  @version 1.0
  *  @see
  *
  *  Copyright (C) 2009 by MOPAS  All right reserved.
  */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EC4 | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/AdminLTE.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/resource/adminLTE/plugins/iCheck/square/blue.css">

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
	<!-- iCheck -->
	<script src="/resource/adminLTE/plugins/iCheck/icheck.min.js"></script>
	<script>
	  $(function () {
	    $('input').iCheck({
	      checkboxClass: 'icheckbox_square-blue',
	      radioClass: 'iradio_square-blue',
	      increaseArea: '20%' /* optional */
	    });
	  });
	</script>

    <script type="text/javascript">

    function actionLogin() {
        if (document.loginForm.id.value =="") {
            alert("아이디를 입력하세요");
        } else if (document.loginForm.password.value =="") {
            alert("비밀번호를 입력하세요");
        } else {
            document.loginForm.action="<c:url value='/uat/uia/actionLogin.do'/>";
            document.loginForm.submit();
        }
    }


    function setCookie (name, value, expires) {
        document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
    }


    function getCookie(Name) {
        var search = Name + "=";
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // 쿠키가 존재하면
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정
                if (end == -1) {
                    end = document.cookie.length;
                }
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }


    function saveid(form) {
        var expdate = new Date();
        // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
        if (form.checkId.checked){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
        }else{
            expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
        }
        setCookie("saveid", form.id.value, expdate);
    }


    function getid(form) {
        form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
    }


    $(document).ready(function(){

    	getid(document.loginForm);

    	// 패스워드필드 엔터처리
    	$("#password").keydown(event, function(){

    		if (event.keyCode == 13) {
    			actionLogin();
    		}
    	});


    	// ID저장
    	$("#checkId").click(function(){

    		saveid(document.loginForm);
    	});


    	// 로그인버튼 클릭
        $("#btnLogin").click(function(){

        	actionLogin();
        });
    });
    </script>

</head>



<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
    <b>EC4</b> Admin
  </div>
  <!-- /.login-logo -->
  <div class="login-box-body">
    <p class="login-box-msg">Sign in to start your session</p>

    <form name="loginForm" action ="<c:url value='/uat/uia/actionLogin.do'/>" method="post">
                        <input type="hidden" id="message" name="message" value="<c:out value='${message}'/>">
                        <input name="userSe" type="hidden" value="USR"/>
                        <input name="j_username" type="hidden"/>
      <div class="form-group has-feedback">
        <input type="text" name="id" id="id" class="form-control" placeholder="ID" maxlength="16"/>
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="password" id="password" type="password" class="form-control" placeholder="Password" maxlength="16"/>
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input name="checkId" id="checkId" type="checkbox" value="Remember Me"/> Remember Me
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="button" id="btnLogin" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    </form>



    <a href="#">I forgot my password</a><br>
    <a href="register.html" class="text-center">Register a new membership</a>

  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
</body>
</html>
