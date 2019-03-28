<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltInBoundMng.java
  * @Description : EC4CstmrMktAgreeMobilePop POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2019.02.27    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2019.02.27
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SMS마케팅활용동의</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
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
    


<script type="text/javaScript" language="javascript" defer="defer">
var listCstmrTable;
$(document).ready(function(){
	
	history.replaceState({},null,location.pathname);
	

});


</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">




<!-- Main content -->
    <section class="content">
    
    
    <form id="formSubmit" name="formSubmit" action="" method="post">
    	<input type="hidden" name="pInfoAgreeYn" />
    <!-- <div class="clear">
      <input type="checkbox" id="agree" name="agree" /><label for="agree" class="mgl_10 tt_14 bold_black ">회원가입 약관, 개인정보처리방침에 모두 동의합니다.</label>
    </div> -->
	<div class="agreement">
<!-- 		<div class="agree_box box1">
			<h4 class="agree_tit">쉐보레 회원가입 약관</h4>
			<div class="gray_scrollbox">
				<h5>1. 회원가입 약관(내국인)</h5>
				<dl>
				  <dt>제 1조 (목적)</dt>
				  <dd>이 약관은 전기통신 사업법 및 동 법 시행령에 의하여 한국지엠주식회사(이하 "회사" 라 합니다.)가 제공하는 인터넷 홈페이지 서비스 (이하 "서비스" 라 합니다.)의 이용조건 및<br>
				  절차에 관한 사항, 회사와 이용자의 권리와 의무 및 책임사항을 규정함을 목적으로 합니다.</dd>
				  <dt>제 2조 (약관의 효력과 개정)</dt>
				  <dd>
					<ul>
					  <li>1. 이 약관은 전기통신사업법 제 31 조, 동 법 시행규칙 제 21조의 2에 따라 공시절차를 거친 후 홈페이지를 통하여 이를 공지하거나 전자우편 기타의 방법으로 이용자에게 통지함으로써 효력을 발생합니다.</li>
					  <li>2. 회사는 본 약관을 사전 고지 없이 개정할 수 있으며, 개정된 약관은 제 9조에 정한 방법으로 공지합니다. 회원은 개정된 약관에 동의하지 아니하는 경우 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 개정에 대한 동의로 간주됩니다. 개정된 약관은 공지와 동시에 그 효력이 발생됩니다.</li>
					</ul>
				  </dd>
				  <dt>제 3조 (약관 이외의 준칙)</dt>
				  <dd>이 약관에 명시되어 있지 않은 사항은 전기통신 기본법, 전기통신 사업법, 기타 관련법령의 규정에 따릅니다.</dd>
				  <dt>제 4조 (용어의 정의)</dt>
				  <dd>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
					<ul>
					  <li>1. 회원 : 서비스에 개인정보를 제공하여 회원등록을 한 자로서, 서비스의 정보를 지속적으로 제공받으며, 이용할 수 있는 자를 말합니다.</li>
					  <li>2. 이용자 : 본 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
					  <li>3. 아이디 (ID) : 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자와 숫자의 조합을 말합니다.</li>
					  <li>4. 비밀번호 : 회원이 통신상의 자신의 비밀을 보호하기 위해 선정한 문자와 숫자의 조합을 말합니다.</li>
					  <li>5. 전자우편 (이메일) : 인터넷을 통한 우편입니다.</li>
					  <li>6. 해지 : 회사 또는 회원이 서비스 이용 이후 그 이용계약을 종료 시키는 의사표시를 말합니다.</li>
					  <li>7. 홈페이지 : 회사가 이용자에게 서비스를 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 이용자가 열람 및 이용할 수 있도록 설정한 가상의 서비스 공간을 말합니다.</li>
					  <li>8. 쉐보레 멤버스 회원 : 쉐보레 차량보유자 중 쉐보레 멤버스에 차대번호를 등록한 자로서, 쉐보레 멤버스 회원을 위한 특별한 혜택을 제공받을 수 있는 자를 말합니다.</li>
					  <li>9. 쉐비 케어 : 회사가 쉐보레 멤버스 회원을 위한 서비스를 제공하기 위해 마련한 홈페이지 상의 가상의 서비스 공간을 말합니다.</li>
					</ul>
				  </dd>
				  <dt>제 5조 (서비스의 제공 및 변경)</dt>
				  <dd>
					<ul>
					  <li>1. 회사가 제공하는 서비스는 다음과 같습니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 회사에 대한 홍보 내용</li>
						  <li>2) 회사가 판매하는 제품 안내</li>
						  <li>3) 기타 회사가 제공하는 각종 정보</li>
						  <li>4) 고객 상담 서비스</li>
						  <li>5) 회원 이용 서비스</li>
						</ul>
					  </li>
					  <li>2. 회사는 필요한 경우 서비스의 내용을 추가 또는 변경하여 제공할 수 있습니다.</li>
					</ul>
				  </dd>
				  <dt>제 6조 (서비스의 변경 및 중지)</dt>
				  <dd>
					<ul>
					  <li>1. 회사는 기존에 제공되는 서비스에 대하여 수시로 서비스의 전부 또는 일부를 별도의 통지 없이 변경할 수 있습니다.</li>
					  <li>2. 회사는 컴퓨터 등 정보통신설비의 보수점검/교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중지할 수 있습니다.</li>
					  <li>3. 제 2항에 의한 서비스 중지의 경우에는 제 9조에 정한 방법으로 이용자에게 통지합니다.</li>
					  <li>4. 회사는 제 1항의 사유로 서비스의 제공이 일시적으로 중지됨으로 인하여 이용자 또는 제 3자가 입은 손해에 대하여 배상하지 아니합니다. 단, 회사에 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.</li>
					</ul>
				  </dd>
				  <dt>제 7조 (회원가입)</dt>
				  <dd>
					<ul>
					  <li>1. 이용자는 회사가 정한 가입양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</li>
					  <li>2. 이용자는 반드시 실명으로 회원가입을 하여야 하며, 1건의 회원가입 신청을 할 수 있습니다.</li>
					  <li>3. 회사는 제 1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 성명이 실명이 아닌 경우</li>
						  <li>2) 등록 내용에 허위, 기재누락, 오기가 있는 경우</li>
						  <li>3) 타인의 명의를 사용하여 신청한 경우</li>
						  <li>4) 가입신청자가 이 약관 제 8조 3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우(단, 제 8조 3항에 의한 회원자격 상실 후 3년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우는 예외로 합니다.)</li>
						  <li>5) 만 14세 미만의 아동</li>
						  <li>6) 기타 회원으로 회사 소정의 이용신청요건을 충족하지 못하는 경우</li>
						</ul>
					  </li>
					  <li>4. 회원가입계약의 성립시기는 회사의 승낙이 이용자에게 도달한 시점으로 합니다.</li>
					  <li>5. 회원은 제 10조 1항에 의한 등록사항에 변경이 있는 경우 회원정보변경 항목을 통해 직접 변경사항을 수정, 등록하여야 합니다.</li>
					</ul>
				  </dd>
				  <dt>제 8조 (회원탈퇴 및 자격 상실 등)</dt>
				  <dd>
					<ul>
					  <li>1. 회원은 언제든지 회원의 탈퇴를 홈페이지에 요청할 수 있으며, 홈페이지는 즉시 이에 응합니다.</li>
					  <li>2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 회원자격을 제한 및 정지시킬 수 있습니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 가입 신청 시에 허위 내용을 등록한 경우</li>
						  <li>2) 서비스 이용을 방해하거나 그 정보를 도용하는 등 서비스 운영질서를 위협하는 경우</li>
						  <li>3) 서비스를 이용하여 법령과 이 약관이 금지하거나, 공공질서 및 미풍양속에 반하는 행위를 하는 경우</li>
						  <li>4) 제 13조 에 명기된 회원의 의무사항을 준수하지 못할 경우</li>
						</ul>
					  </li>
					  <li>3. 회사가 회원자격을 제한/정지시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 회사는 회원자격을 상실 시킬 수 있습니다.</li>
					  <li>4. 회사가 회원자격을 상실 시키는 경우 회원에게 이를 통지하고 탈퇴를 처리합니다. 이 경우 회원에게 이를 통지하고, 탈퇴 전에 소명할 기회를 부여합니다.</li>
					  <li>5. 쉐보레 멤버스 회원의 회원자격은 가입 후 5년간 유지됩니다.</li>
					</ul>
				  </dd>
				  <dt>제 9조 (이용자에 대한 통지)</dt>
				  <dd>
					<ul>
					  <li>1. 회사가 이용자에 대한 통지를 하는 경우, 이용자가 서비스에 제출한 전자우편 주소로 할 수 있습니다</li>
					  <li>2. 회사가 불특정 다수 이용자에 대한 통지의 경우 1주일 이상 서비스 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.</li>
					</ul>
				  </dd>
				  <dt>제 10조 (개인 정보 보호)</dt>
				  <dd>
					<ul>
					  <li>1. 회사는 이용자 정보 수집 시 회사측이 필요한 최소한의 정보를 수집합니다. 또한 회사가 이벤트나 공동프로모션을 진행할 경우 진행에 필요한 정보를 장래의 파트너, 광고주, 협력사 및 제휴사와 합법적으로 공유할 수 있습니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 성명</li>
						  <li>2) 성별</li>
						  <li>3) 아이디</li>
						  <li>4) 비밀번호</li>
						  <li>5) 생년월일</li>
						  <li>6) 이메일</li>
						  <li>7) 휴대전화</li>
						  <li>8) 일반전화</li>
						  <li>9) 주소</li>
						</ul>
					  </li>
					  <li>2. 회사가 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.</li>
					  <li>3. 제공된 개인정보는 당해 이용자의 동의 없이 제 3자에게 제공할 수 없으며, 이에 대한 모든 책임은 회사가 집니다. 다만 다음의 경우에는 예외로 합니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보 (성명, 주소, 일반전화)를 알려주는 경우</li>
						  <li>2) 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우</li>
						  <li>3) 관계법령에 의하여 국가기관으로부터 요구 받은 경우</li>
						  <li>4) 범죄에 대한 수사상의 목적이 있거나, 정보통신 윤리위원회의 요청이 있는 경우</li>
						  <li>5) 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우</li>
						</ul>
					  </li>
					  <li>4. 이용자는 언제든지 회사가 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 할 수 있습니다. 회사의 개인정보 관리책임자 및 연락처는 아래와 같습니다.<br>
					  - 개인정보 책임자 : <strong>성기인 전무</strong><br>
					  - 개인정보 담당부서 : AD &amp; Communications팀<br>
					  문의 전화 : 080-3000-5000<br>
					  문의 이메일 : gmk.pip@gm.com
					  </li>
					</ul>
				  </dd>
				  <dt>제 11조 (회사의 의무)</dt>
				  <dd>
					<ul>
					  <li>1. 회사는 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야만 합니다.</li>
					  <li>2. 회사는 서비스에 관련된 설비를 항상 운용할 수 있는 상태로 유지/보수하고, 장애가 발생하는 경우 지체 없이 이를 수리/복구할 수 있도록 최선의 노력을 다하여야 합니다.</li>
					  <li>3. 회사는 이용자가 안전하게 서비스를 이용할 수 있도록 이용자의 개인정보보호를 위한 보안시스템을 갖추어야 합니다.</li>
					  <li>4. 회사는 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
					</ul>
				  </dd>
				  <dt>제 12조 (회원의 ID 및 비밀번호에 대한 의무)</dt>
				  <dd>
					<ul>
					  <li>1. 회원에게 부여된 아이디(ID)와 비밀번호의 관리책임은 회원에게 있으며 관리 소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.</li>
					  <li>2. 회원이 자신의 ID 및 비밀번호를 도난 당하거나 제 3자가 사용하고 있음을 인지한 경우에는 바로 회사에 통보하고 회사의 안내가 있는 경우에는 그에 따라야 합니다.</li>
					</ul>
				  </dd>
				  <dt>제 13조 (회원의 의무)</dt>
				  <dd>
					<ul>
					  <li>1. 회원은 관계법령, 본 약관의 규정, 이용안내 및 주의사항 등 회사가 통지하는 사항을 준수하여야 하며, 기타 회사의 업무에 방해되는 행위를 하여서는 안됩니다.</li>
					  <li>2. 회원은 회사의 사전승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
					  <li>3. 회원은 서비스를 이용하여 얻은 정보를 회사의 사전승낙 없이 복사, 복제, 변경, 번역, 출판/방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.</li>
					  <li>4. 회원은 자기 신상정보의 변경사항 발생시 즉각 변경하여야 합니다. 회원정보를 수정하지 않아 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.</li>
					  <li>5. 회원은 서비스 이용과 관련하여 다음 각 호의 행위를 하지 않아야 하며, 다음 행위를 함으로 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 다른 회원의 아이디(ID)를 부정하게 사용하는 행위</li>
						  <li>2) 다른 회원의 이메일 주소를 취득하여 스팸메일을 발송하는 행위</li>
						  <li>3) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위</li>
						  <li>4) 선량한 풍속, 기타 사회질서를 해하는 행위</li>
						  <li>5) 회사 및 타인의 명예를 훼손하거나 모욕하는 행위</li>
						  <li>6) 회사 및 타인의 지적재산권 등의 권리를 침해하는 행위</li>
						  <li>7) 해킹행위 또는 컴퓨터 바이러스의 유포행위</li>
						  <li>8) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위</li>
						  <li>9) 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위</li>
						  <li>10) 회사가 제공하는 서비스의 내용을 변경하는 행위</li>
						  <li>11) 기타 관계법령에 위배되는 행위</li>
						</ul>
					  </li>
					</ul>
				  </dd>
				  <dt>제 14조 (게시물 삭제)</dt>
				  <dd>
					<ul>
					  <li>1. 회사는 이용자가 게시하거나 등록하는 서비스내의 게시물이 제 13조의 규정에 위반되거나, 다음 각 호에 해당한다고 판단되는 경우 사전통지 없이 게시물을 삭제할 수 있습니다.
						<ul class="mgl_10 pdb_5">
						  <li>1) 다른 이용자 또는 제 3자를 비방하거나 중상모략으로 명예를 손상시키는 내용</li>
						  <li>2) 공공질서 또는 미풍양속에 위반되는 내용</li>
						  <li>3) 범죄적 행위에 결부된다고 인정되는 내용</li>
						  <li>4) 제 3자의 저작권 등 기타 권리를 침해하는 내용</li>
						  <li>5) 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 내용</li>
						  <li>6) 근거나 확인절차 없이 회사를 비난하거나 유언비어를 유포한 내용</li>
						  <li>7) 기타 관계법령에 의거하여 위반된다고 판단되는 내용</li>
						</ul>
					  </li>
					  <li>2. 회사는 이용자가 게시하거나 등록하는 서비스내의 게시물이 제 13조의 규정에 위반되거나 동 조 제 1항 각 호에 해당한다고 판단되는 정보를 링크하고 있을 경우 사전통지 없이 게시물을 삭제할 수 있습니다.</li>
					</ul>
				  </dd>
				  <dt>제 15조 (게시물에 대한 권리 / 의무)</dt>
				  <dd>게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 이용자에게 있습니다.</dd>
				  <dt>제 16조 (연결 "홈페이지"와 피연결 "홈페이지"간의 관계)</dt>
				  <dd>
					<ul>
					  <li>1. 상위 "홈페이지"와 하위 "홈페이지"가 하이퍼 링크(예:하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨) 방식 등으로 연결된 경우, 전자를 연결 "홈페이지"라고 하고 후자를 피연결 "홈페이지(웹사이트)"라고 합니다.</li>
					  <li>2. 연결 "홈페이지"는 피연결 "홈페이지"가 독자적으로 제공하는 재화 및 용역에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않습니다.</li>
					</ul>
				  </dd>
				  <dt>제 17조 (저작권의 귀속 및 이용제한)</dt>
				  <dd>
					<ul>
					  <li>1. 회사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 회사에 귀속합니다.</li>
					  <li>2. 이용자는 서비스를 이용함으로써 얻은 정보를 회사의 사전승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하여서는 안됩니다.</li>
					</ul>
				  </dd>
				  <dt>제 18조 (양도금지)</dt>
				  <dd>회원이 서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.</dd>
				  <dt>제 19조 (손해배상)</dt>
				  <dd>회사는 무료로 제공되는 서비스와 관련하여 이용자에게 어떠한 손해가 발생하더라도 동 손해가 회사의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 부여하지 아니합니다.</dd>
				  <dt>제 20조 (면책 / 배상)</dt>
				  <dd>
					<ul>
					  <li>1. 회사는 이용자가 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 이용자는 자신의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 회사의 고의 또는 중과실에 의한 것이 아닌 한, 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 이용자에게 있습니다.</li>
					  <li>2. 회사는 제 13조의 규정에 위반하여 이용자간 또는 이용자와 제 3자간에 서비스를 매개로 한 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 이용자가 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.</li>
					  <li>3. 이용자가 제 13조, 기타 이 약관의 규정을 위반함으로 인하여 회사가 이용자 또는 제 3자에 대하여 책임을 부담하게 되고, 이로써 회사에게 손해가 발생하게 되는 경우, 이 약관을 위반한 이용자는 회사에게 발생하는 모든 손해를 배상하여야 하며, 동 손해로부터 회사를 면책시켜야 합니다.</li>
					</ul>
				  </dd>
				  <dt>제 21조 (분쟁의 해결)</dt>
				  <dd>
					<ul>
					  <li>1. 회사와 이용자는 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.</li>
					  <li>2. 제 1항의 규정에도 불구하고, 동 분쟁으로 인하여 소송이 제기될 경우 동 소송은 서울지방법원을 관할로 합니다.</li>
					  <li>3. 동 소송에는 대한민국 법을 적용합니다.</li>
					</ul>
				  </dd>
				  <dt>제 22조 (기타)</dt>
				  <dd>이 약관에 명시되지 아니한 사항의 처리를 위하여 이용자는 회사 고객센터(일반전화 : 080-3000-5000)를 이용합니다.</dd>
				  <dt>부칙</dt>
				  <dd>이 약관은 2011년 3월 1일부터 시행합니다.</dd>
				</dl>
			</div>
			<p class="fl c_000">회원가입 약관에 동의합니다.</p>
			<div class="fr">
				<input type="radio" class="agreeY" id="privacyAgree01" name="agree01" title="회원가입 약관" /><label for="privacyAgree01" class="mgr_15 mgl_10">동의함</label>
				<input type="radio" class="agreeN" id="privacyDisagree01" name="agree01" checked="checked" /><label for="privacyDisagree01" class="mgl_10">동의안함</label>
			</div>
			<p class="desc">* 동의를 거부할 수 있으며, 동의 거부 시에는 해당 서비스 이용에 제한이 있습니다.</p>
		</div> -->
		<div class="agree_box box2">
		  <h4 class="agree_tit">개인정보 수집 및 이용에 대한 안내 (필수)</h4>
		  <div class="pre-scrollable" style="height:100px;">
			  <ol>
				<li>
					<span class="tt_13 tt_bold ">1. 수집 및 이용 목적</span>
					<p class="pdb_10">쉐보레 홈페이지 서비스는 다음의 목적을 위해 개인정보를 수집 및 이용 합니다.</p>
					<p class="pdb_20">수집된 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 수집 목적이 변경될 경우 사전에 알리고 동의를 받을 예정 입니다.</p>
					<dl>
					  <dt class="first">&bull; 회원 가입 및 관리 (필수 서비스)</dt>
					  <dd class="pdl_15">회원 가입 및 회원제 서비스 이용에 따른 본인 확인, 개인 식별, 부정이용 방지, 비인가 이용 방지, 가입의사 확인, 분쟁 조정을 위한 기록 보존, 불만처리 등 민원처리, 고지사항 전달 등의 목적으로 개인정보를 처리 합니다.</dd>
					  <dt>&bull;마케팅 및 광고에 활용 (선택 서비스)</dt>
					  <dd class="pdl_15">신규 서비스(제품) 개발 및 이벤트 등 광고성 정보 전달, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 고객의 서비스 이용에 대한 통계 자료 생성 목적으로 처리 됩니다. </dd>
					  <dd class="pdl_15">※ 위 내용은 ‘마케팅 및 광고에 활용’에 동의한 경우에만 해당 합니다.</dd>
					</dl>
				</li>
				<li class="pdb_20">
					<span class="tt_13 tt_bold pdb_10">2. 수집하는 개인정보의 항목</span>
					<ul>
						<li class="pdl_15">- 필수 항목 : 성명, 성별, 아이디, 비밀번호, 생년월일, 이메일, 휴대전화, 주소</li>
						<li class="pdl_15">- 선택 항목 : 일반전화, 결혼여부, 제공 서비스, 관심 차종</li>
					</ul>
				</li>
				<li class="pdb_20">
					<span class="tt_13 tt_bold pdb_10">3. 개인정보의 보유 및 이용 기간</span>
					<p class="pdb_10">회원의 개인정보는 회원 탈퇴 시 지체 없이 파기 합니다.</p>
				</li>
				<li class="pdb_20">
					<span class="tt_13 tt_bold pdb_10">4. 동의를 거부할 권리가 있다는 사실과 동의 거부에 따른 불이익 내용</span>
					<p class="pdb_10">회원은 ‘쉐보레 홈페이지’에서 수집하는 개인정보에 대해 동의를 거부할 권리가 있으며 동의 거부 시에는 회원가입, 회원제 서비스 이용이 제한 됩니다.</p>
				</li>
			  </ol>
			  <p>※ 서비스 이용과정이나 사업·과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.<br />- 접속 IP 정보, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록</p>
			  <p>※ 사용자 아이디 및 쿠키를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 개인정보 추가 수집이 발생할 수 있으며, 이러한 경우 별도의 동의를 받습니다.</p>
		  </div>
		  <p class="fl c_000">위 개인정보 수집 및 이용에 동의 합니다.</p>
		  <div class="fr">
			<input type="radio" class="agreeY" id="privacyAgree02" name="agree02" title="개인정보 수집 및 이용에 대한 안내" /><label for="privacyAgree02" class="mgr_15 mgl_10">동의함</label>
			<input type="radio" class="agreeN" id="privacyDisagree02" name="agree02" checked="checked" /><label for="privacyDisagree02" class="mgl_10">동의안함</label>
		  </div>
		  <p class="desc">* 동의를 거부할 수 있으며, 동의 거부 시에는 해당 서비스 이용에 제한이 있습니다.</p>
		</div>
		<div class="agree_box box3">
		  <h4 class="agree_tit">마케팅 및 광고에 활용 (선택)</h4>
		  <div class="gray_scrollbox h50">
			<p>개인정보 항목 중 이메일, 휴대전화, 주소를 이용하여 마케팅 및 광고에 활용 합니다.</p>
		  </div>
		  <p class="fl c_000">마케팅 및 광고 활용에 동의 합니다.</p>
		  <div class="fr">
			<input type="radio" id="privacyAgree03" name="mktYn" value="Y" title="마케팅 및 광고에 활용" /><label for="privacyAgree03" class="mgr_15 mgl_10">동의함</label>
			<input type="radio" id="privacyDisagree03" name="mktYn" value="N" checked="checked" /><label for="privacyDisagree03" class="mgl_10">동의안함</label>
		  </div>
		  <p class="desc">* 동의를 거부하셔도 회원 가입 및 관리 서비스는 이용이 가능 합니다.</p>
		</div>
		<div class="agree_box box4">
			<h4 class="agree_tit">식별정보의 제공 및 활용</h4>
			<div class="gray_scrollbox">
				<dl>
					<dt>식별정보의 제공 및 활용</dt>
					<dd>회사는 회원가입 시 본인 확인 등을 위해 아래와 같이 식별정보를 제공하고 있습니다.
						<ul class="mgl_10">
							<li>1. <span class="tt_bold">제공받는 자</span> : NICE신용평가정보㈜</li>
							<li>2. <span class="tt_bold">제공되는 신용정보의 항목</span> : 개인식별정보(생년월일, 성별, 성명, 일반전화, 주소)</li>
							<li>3. <span class="tt_bold">제공받는 자의 이용 목적</span> : 실명확인</li>
							<li>4. <span class="tt_bold">제공받는 자의 보유 및 이용 기간</span> : 한국지엠은 식별확인을 위한 정보는 보유하지 않고 개인식별 후 즉시 파기합니다.</li>
						</ul>
					</dd>
				</dl>
			</div>
			<p class="fl c_000">식별정보의 제공 및 활용에 수집에 동의합니다.</p>
			<div class="fr">
				<input type="radio" class="agreeY" id="privacyAgree04" name="agree04" title="식별정보의 제공 및 활용"><label for="privacyAgree04" class="mgr_15 mgl_10">동의함</label>
				<input type="radio" class="agreeN" id="privacyDisagree04" name="agree04" checked="checked"><label for="privacyDisagree04" class="mgl_10">동의안함</label>
			</div>
			<p class="desc">* 동의를 거부하실 수 있으며, 동의 거부 시에는 서비스 이용에 제한이 있습니다.</p>
		</div>
		<div class="agree_box box5">
			<h4 class="agree_tit">개인정보위탁에 대한 동의 (필수)</h4>
			<div class="pre-scrollable" style="height:100px;">
				<dl>
					<dt>개인정보의 처리 위탁에 대한 고지</dt>
					<dd>회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.
						<table class="tabletype1 mgt_10 mgb_10">
						<caption>개인정보의 처리 위탁 구분, 수탁자, 위탁업무 내용</caption>
							<colgroup>
								<col width="20%">
								<col width="40%">
								<col width="40%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">수탁자</th>
									<th scope="col">위탁업무내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>고객센터</td>
									<td>오토브레인</td>
									<td>&middot; 고객의 불만처리 민원처리, AS 센터 접수, 아웃바운드콜 대행, 정비 서비스 만족도 조사<br/>&middot; (마케팅) 신규서비스 및 제품 개발 활동</td>
								</tr>
								<tr>
									<td rowspan="8">기타</td>
									<td>오상자이엘</td>
									<td>&middot; 오토카드 / 쉐보레 멤버스 서비스 운영 및 포인트 정산 업무 및 유치수당 정산</td>
								</tr>
								<tr>
									<td>제이티넷</td>
									<td>&middot; 할부 금융 관련 전산 시스템 운영 및 관리</td>
								</tr>
								<tr>
									<td>한국 테라웨어하우스</td>
									<td rowspan="2">&middot; 전산시스템 운영 및 관리</td>
								</tr>
								<tr>
									<td>에이치피 디아이에스</td>
								</tr>
								<tr>
									<td>넥솔 위즈빌</td>
									<td>&middot; 전산시스템 운영 및 관리<br/>&middot; ETCS 하이패스 등록 관련 운영 및 관리<br/>&middot; 이메일 / 문자메시지 / 우편물 발송 대행</td>
								</tr>
								<tr>
									<td>더위버 크리에이티브</td>
									<td>&middot; 웹사이트 운영 및 관리<br/>&middot; 홈페이지 이벤트 운영 및 관리<br/>&middot; 이메일 / 문자메시지 발송 대행</td>
								</tr>
								<tr>
									<td>씽크트리</td>
									<td>&middot; 전산시스템 운영 및 관리</td>
								</tr>
								<tr>
									<td>General Motors Holdings LLC</td>
									<td>&middot; 전산시스템 운영 및 관리<br/>&middot; 자동차 계약 내용 및 보증 정비 내역 열람</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
			<p class="fl c_000">개인정보 필수 위탁에 동의합니다. </p>
			<div class="fr">
				<input type="radio" class="agreeY" id="privacyAgree05" name="agree05" value="Y" title="개인정보위탁에 대한 동의 (필수)"><label for="privacyAgree05" class="mgr_15 mgl_10">동의함</label>
				<input type="radio" class="agreeN" id="privacyDisagree05" name="agree05" value="N" checked="checked"><label for="privacyDisagree05" class="mgl_10">동의안함</label>
			</div>
			<p class="desc">* 동의를 거부하실 수 있으며, 동의 거부 시에는 서비스 이용에 제한이 있습니다.</p>
		</div>
		<div class="agree_box box6">
			<h4 class="agree_tit">개인정보위탁에 대한 동의 (선택)</h4>
			<div class="pre-scrollable" style="height:100px;">
				<dl>
					<dt>개인정보의 처리 위탁에 대한 고지</dt>
					<dd>회사는 서비스 이행을 위해 아래와 같이 외부 전문업체에 위탁하여 운영하고 있습니다.
						<table class="tabletype1 mgt_10 mgb_10">
						<caption>개인정보의 처리 위탁 구분, 수탁자, 위탁업무 내용</caption>
							<colgroup>
								<col width="20%">
								<col width="40%">
								<col width="40%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col">구분</th>
									<th scope="col">수탁자</th>
									<th scope="col">위탁업무내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>고객센터</td><td>오토브레인</td><td>&middot; 고객의 불만처리 민원처리, AS 센터 접수, 아웃바운드콜 대행, 정비 서비스 만족도 조사<br/>&middot; (마케팅) 신규서비스 및 제품 개발 활동</td>
								</tr>
								<tr>
									<td>차량 판매 서비스</td><td>한국지엠 판매 대리점 <a href="http://www.chevrolet.co.kr/purchase/dealer-location.gm" target="_blank">[자세히보기]</a></td><td>&middot; 차량 판매 대행 및 계약 철회에 따른 계약 정보 관리 및 실적 증빙 관리<br/>&middot; 견적, 시승, 카탈로그 제공 서비스, 고지사항 전달, 차량 관리 서비스<br/>&middot; (마케팅)이벤트 정보 수집 대행, 광고 홍보성 정보 전달</td>
								</tr>
								<tr>
									<td>탁송업체</td><td>디케이엘 주식회사</td><td>&middot; 출고장 운영 및 차량 인도<br/>&middot; 차량 탁송</td>
								</tr>
								<tr>
									<td rowspan="3">정비 및 차량 관리서비스</td><td>한국지엠 서비스 네트워크 <a href="http://www.chevrolet.co.kr/chevy/as.gm" target="_blank">[자세히보기]</a></td><td>&middot; 차량 정비 및 관리 서비스, 쉐보레 멤버스 서비스 운영<br/>&middot; (마케팅)이벤트 정보 수집 대행, 광고 홍보성 정보 전달</td>
								</tr>
								<tr>
									<td>SK 네트웍스(주) <a href="https://ers.speedmate.com/pds/board/colist.PNG" target="_blank">[자세히보기]</a>, 블루칩 C&amp;S</td><td>&middot; 긴급출동 서비스 및 긴급출동 서비스 관련 시스템 운영</td>
								</tr>
								<tr>
									<td>지디엠에스</td><td>&middot;방문 정비 서비스 운영 (Fly Doctor 서비스)</td>
								</tr>
								<tr>
									<td>쉐보레 멤버스</td><td>오상자이엘</td><td>&middot; 오토카드 / 쉐보레 멤버스 서비스 운영 및 포인트 정산 업무 및 유치수당 정산</td>
								</tr>
								<tr>
									<td rowspan="27">기타<br/>(전산 운영 및 마케팅 &middot; 홍보 대행 등)</td><td>제이티넷</td><td>&middot; 할부 금융 관련 전산 시스템 운영 및 관리</td>
								</tr>
								<tr>
									<td>한국 테라웨어하우스</td><td rowspan="2">&middot; 전산시스템 운영 및 관리</td>
								</tr>
								<tr>
									<td>에이치피 디아이에스</td>
								</tr>
								<tr>
									<td>넥솔 위즈빌</td><td>&middot; 전산시스템 운영 및 관리<br/>&middot; ETCS 하이패스 등록 관련 운영 및 관리<br/>&middot; 이메일 / 문자메시지 / 우편물 발송 대행</td>
								</tr>
								<tr>
									<td>더위버 크리에이티브</td><td>&middot; 웹사이트 운영 및 관리<br/>&middot; 홈페이지 이벤트 운영 및 관리<br/>&middot; 이메일 / 문자메시지 발송 대행</td>
								</tr>
								<tr>
									<td>General Motors Holdings LLC</td><td>&middot; 전산시스템 운영 및 관리<br/>&middot; 자동차 계약 내용 및 보증 정비 내역 열람</td>
								</tr>
								<tr>
									<td>㈜엔엔씨테크</td><td>&middot; 정비 서비스 만족도 조사</td>
								</tr>
								<tr>
									<td>컨슈머 인사이트</td><td rowspan="7">&middot; 고객 만족도 조사 및 설문조사</td>
								</tr>
								<tr>
									<td>한국리서치</td>
								</tr>
								<tr>
									<td>TNS(테일러넬슨소프레스 코리아)</td>
								</tr>
								<tr>
									<td>마크로밀엠브레인</td>
								</tr>
								<tr>
									<td>IPSOS Korea</td>
								</tr>
								<tr>
									<td>닐슨 컴퍼니 코리아</td>
								</tr>
								<tr>
									<td>갤럽 코리아</td>
								</tr>
								<tr>
									<td>RDA </td><td>&middot; 차량 초기 품질 및 만족도 조사, 시스템 운영</td>
								</tr>
								<tr>
									<td>펑타이</td><td rowspan="4">&middot; 캠페인 운영 및 관리, 경품 지급 대행<br/>&middot; 소셜 운영 대행</td>
								</tr> 
								<tr>
									<td>비욘드</td>
								</tr>
								<tr>
									<td>아이엠월드와이드</td>
								</tr>
								<tr>
									<td>제일기획</td>
								</tr>
								<tr>
									<td>(주)레드컴뮤니케이션즈</td><td rowspan="2">&middot; 소셜 운영 대행</td>
								</tr>
								<tr>
									<td>디지털오션</td>
								</tr>
								<tr>
									<td>에스엠 컬쳐&amp;컨텐츠</td><td rowspan="5">&middot; 캠페인 운영 및 관리, 경품 지급 대행</td>
								</tr>
								<tr>
									<td>㈜오롯</td>
								</tr>
								<tr>
									<td>블루인 마케팅 서비스</td>
								</tr>
								<tr>
									<td>브리온컴퍼니</td>
								</tr>
								<tr>
									<td>㈜유니온커뮤니케이션즈</td>
								</tr>
								<tr>
									<td>젤라블루</td><td>&middot; 경품 지급 대행</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
			<p class="fl c_000">개인정보 선택 위탁에 동의합니다. </p>
			<div class="fr">
				<input type="radio" id="privacyAgree06" name="trustYn" value="Y" title="개인정보위탁에 대한 동의 (선택)"><label for="privacyAgree06" class="mgr_15 mgl_10">동의함</label>
				<input type="radio" id="privacyDisagree06" name="trustYn" value="N" checked="checked"><label for="privacyDisagree06" class="mgl_10">동의안함</label>
			</div>
			<p class="desc">* 동의를 거부하셔도 회원 가입 및 관리 서비스는 이용이 가능합니다</p>
		</div>
		<div class="agree_box box7">
			<h4 class="agree_tit">개인정보 제3자 제공 및 국외 이전에 대한 동의 (선택)</h4>
			<div class="pre-scrollable" style="height:100px;">
				<div class="terms_inner terms_inner1">
					<h5>1) 개인정보 제3자 제공에 대한 동의</h5>
					<table class="tabletype1">
						<caption>개인정보 제3자 제공에 대한 동의 테이블</caption>
						<colgroup>
							<col style="width:200px;">
							<col style="width:245px;">
							<col style="width:200px;">
							<col>
						</colgroup>
						<thead>
							<tr>
								<th scope="row">제공받는 자</th>
								<th scope="row">제공받는 자의 개인정보 이용 목적</th>
								<th scope="row">제공하는 개인정보 항목</th>
								<th scope="row">보유 및 이용 기간</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>General Motors Holdings LLC</td>
								<td>전산 시스템 운영 및 관리<br>데이터 분석 및 제품 개발 활동<br>개인 맞춤형 서비스 개발</td>
								<td>성명, 생년월일, 주소, 전화번호(직장, 자택), 휴대전화번호, 차량 정보, 구매 이력, 정비 이력, 마케팅 활동 이력</td>
								<td>이용 목적 달성 시 까지</td>
							</tr>
						</tbody>
					</table>
					<div class="desc_area">
						<h5>● 동의를 거부할 권리 및 동의 거부에 따른 불이익의 내용</h5>
						<p>개인정보 제3자 제공을 거부할 수 있으며, 동의한 이후에도 언제든지 이를 철회할 수 있습니다. 다만 거부할 경우에는 제3자가 제공하는 서비스에 제한이 있습니다.</p>
					</div>
				</div>
				<div class="terms_inner terms_inner2 last">
					<h4 class="ltxt">2) 개인정보 국외 이전에 대한 동의</h4>
					<table class="tabletype1">
						<caption>개인정보 국외 이전에 대한 동의 테이블</caption>
						<colgroup>
							<col style="width:22%;">
							<col style="width:21%;">
							<col style="width:16%;">
							<col style="width:16%;">
							<col style="width:16%;">
							<col style="width:10%;">
						</colgroup>
						<thead>
							<tr>
								<th scope="row">제공받는 자</th>
								<th scope="row">제공받는 자의 개인정보 이용 목적</th>
								<th scope="row">제공하는 개인정보 항목</th>
								<th scope="row">제공받는 자의 개인정보 보유 및 이용 기간</th>
								<th scope="row">이전되는 국가 및 <br>이전 방법</th>
								<th scope="row">이전 시점</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>General Motors Holdings LLC<br>정보보호담당자 : Christopher Murphy<br>(연락처 : privacy@gm.com)</td>
								<td>전산 시스템 운영 및 관리<br>데이터 분석 및 제품 개발 활동<br>개인 맞춤형 서비스 개발</td>
								<td>성명, 생년월일, 주소, 전화번호(직장, 자택), 휴대전화번호, 차량 정보, 구매 이력, 정비 이력, 마케팅 활동 이력</td>
								<td>이용 목적 달성 시 까지</td>
								<td>미국 / 시스템을 이용한 전산 입력, 메일 전송</td>
								<td>즉시</td>
							</tr>
						</tbody>
					</table>
					<div class="desc_area">
						<h5>● 동의를 거부할 권리 및 동의 거부에 따른 불이익의 내용</h5>
						<p>개인정보 국외이전을 거부할 수 있으며, 동의한 이후에도 언제든지 이를 철회할 수 있습니다. 다만 거부할 경우에는 제3자가 제공하는 서비스에 제한이 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="radio_area">
				<div>
					<ul>
						<li>
							<span>(선택) 개인정보 제3자 제공에 대해 동의합니다.<span><label for="agree8_1"><input type="radio" class="agreeY_S" name="agree8" title="(선택) 개인정보 제3자 제공에 대해 동의" id="agree8_1" /> 동의함</label><label><input type="radio" name="agree8" id="agree8_2" class="agreeN"  checked="checked"/> 동의안함</label></span></span>
						</li>
						<li>
							<span>(선택) 개인정보 국외 이전에 대해 동의합니다.<span><label for="agree9_1"><input type="radio" class="agreeY_S" name="agree9" title="(선택) 개인정보 국외 이전에 대해 동의" id="agree9_1" /> 동의함</label><label><input type="radio" name="agree9" id="agree9_2" class="agreeN" checked="checked"/> 동의안함</label></span></span>
						</li>
					</ul>
				</div>
			</div>
		</div>
    </div> <!-- //agreement -->
    <div class="clear mgt_60 ta_r">
      <a href="javascript:void(0);" class="basicBtn mgr_10 grayType" id="btnCancel">취소</a><a href="#" class="basicBtn" id="btnSubmit">확인</a>
    </div>
    </form>





    </section>
    <!-- /.content -->




</body>
</html>
