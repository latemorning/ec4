<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltOutBoundMng.java
  * @Description : EC4CnsltOutBoundMng List 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.26    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.04.26
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
    <title>상담화면(Out)</title>
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

$(document).ready(function(){
	$(document).on("click","#custPop",function() {
		var txtUrl = "/ec4/call/cnslt/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top
    });

});
$(function(){

	//고객정보 펼치기/접기
	$(".toggle-trigger").click(function () {
		if($("#postnTable").css('visibility') == "visible") {
		    $('#postnTable').css('visibility', 'hidden');
		    $('#callBtn').css('visibility', 'hidden');
		    $('#custDiv').css('display', 'none');
		    $('#custDiv').attr("class","");
			$('#callDiv').attr("class","col-md-12");
			$(".cnslt-trigger").html("○ 상담저장(<a href='#'>고객정보 펼치기</a>)");
			/* $(".toggle-trigger").html("◁ 고객정보(펼치기/접기)");
			$('#custDiv').attr("class","col-md-1");
			$('#callDiv').attr("class","col-md-11"); */
		 }
	});
	
	$(".cnslt-trigger").click(function () {
		if($("#postnTable").css('visibility') == "hidden") {
		    $('#postnTable').css('visibility', 'visible');
		    $('#callBtn').css('visibility', 'visible');
			$(".toggle-trigger").html("○ 고객정보(<a href='#'>접기</a>)");
			$(".cnslt-trigger").html("○ 상담저장");
		    $('#custDiv').css('display', 'inline');
			$('#custDiv').attr("class","col-md-7");
			$('#callDiv').attr("class","col-md-5");
		}
	});
	

	//이력정보 펼치기/접기
	$(".toggle-list").click(function () {
		if ($("#postnList").is(":hidden")) {
			$('#cnsltMainDiv').css("height","");
			$("#postnList").slideDown("slow");
			$(".toggle-list").html("▽ 이력정보(<a href='#'>펼치기/접기</a>)");
		}else {
			$('#cnsltMainDiv').css("height","650px");
			$("#postnList").slideUp("slow");
			$(".toggle-list").html("▲ 이력정보(<a href='#'>펼치기/접기</a>)");
		}
	});

	/* $("#tab").val('0');
	$("#postnList").tabs({
		activate : function(event, ui) {
			alert("ddddddddddd");
			var idx = ui.newTab.index();
			$("#tab").val(idx);
			$('#bottomTab1').attr("class","active");
			//commonObj.setGridHeight("detail"+idx, "200px");
		}
	});  */

	$('#histTab a').click(function(e){
		//탭 숨기기/보이기 
		e.preventDefault();
		$(this).tab('show');
		
		//해당 탭 테이블 숨기기
		$('#histTab li').each(function(index, item){
			//console.log(index);
			$('#tab'+index).css('display', 'none');
		});
		//클릭 탭 테이블 보이기
		$($(this).attr("href")).css('display', 'inline');
	});

	
});

</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">



<!-- Main content -->
    <section class="content">
    

    
    	<div class="row">
		<!-- ############################# 메인화면 ######################  -->
        	<div id="custDiv" class="col-md-6"> <!-- DIV 가로영역을 나누는 용도 -->
        		  <div id="callBtn">
	        		  <button type="button" class="btn btn-default">ON</button>
	        		  <button type="button" class="btn btn-default">대기</button>
	        		  <button type="button" class="btn btn-default">이석</button>
	        		  <button type="button" class="btn btn-default">보류</button>
	        		  <button type="button" class="btn btn-default">협의</button>
	        		  <button type="button" class="btn btn-default">호전환</button>
	        		  <button type="button" class="btn btn-default">3자</button>
	        		  <button type="button" class="btn btn-default">걸기</button>
	        		  <button type="button" class="btn btn-default">끊기</button>
        		  </div>
                    <div class="box-header with-border">
                        <h1 class="box-title toggle-trigger">○ 고객정보(<a href='#'>접기</a>)</h1>
                    </div>
                    <!-- /.box-header -->
					<div id="postnTable" class="row">
			            	<!-- 검색항목 -->
		                    <div class="row">
				                    <form class="form-horizontal">
				                    	<div class="form-group dstick">
			                                <label for="searchCustNm" class="col-sm-2 control-label">고객명</label>
			                                <div class="col-sm-2 dstick">
		                                        <div class="input-group">
			                                        <input type="text" name="text01" class="form-control" id="text01"/>
			                                        <div class="input-group-btn">
			                                            <button type="button" id="custPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
			                                        </div>
			                                    </div>
			                                </div>
			                                <label for="searchCallType" class="col-sm-2 control-label">핸드폰</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" id="searchCallType"/>
			                                </div>
			                                <label for="searchCallKnd" class="col-sm-2 control-label">이메일</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" id="searchCallKnd"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="searchCustNm" class="col-sm-2 control-label">차대번호</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" id="searchCustNm"/>
			                                </div>
			                                <label for="searchCallType" class="col-sm-2 control-label">차량번호</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" id="searchCallType"/>
			                                </div>
			                                <div>
			                                	<button type="button" class="btn btn-info"> 조회</button>
			                                </div>
				                    	</div>
				                    </form>
		                    </div>
		                    <!-- 검색항목  END <<<<<<<<<<<<<-->
		                    
							<!-- 고객정보항목 -->
		                    <div class="row">
				                    <form class="form-horizontal">

		                                <div class="form-group dstick">
		                                    <label for="text01" class="col-sm-2 control-label">수신여부</label>
		                                    <div class="col-sm-10 checkbox dstick">
									  			<label><input type="checkbox">전체</label>
									  			<label><input type="checkbox">전화</label>
									  			<label><input type="checkbox">SMS</label>
									  			<label><input type="checkbox">이메일</label>
									  			<label><input type="checkbox">FAX</label>
									  			<label><input type="checkbox">DM</label>
		                                    </div>
										</div>
		                                <div class="form-group dstick">
		                                    <label for="text02" class="col-sm-3 control-label">최근차량정보</label>
		                                    <div class="col-sm-9 dstick" style="padding-bottom:0px">
					                                    <div class="col-sm-12 dstick">
							                                    <div class="col-sm-3 dstick">
							                                        <select class="form-control" name="select2" id="select2">
							                                            <option>브랜드</option>
							                                            <option>option 2</option>
							                                            <option>option 3</option>
							                                            <option>option 4</option>
							                                            <option>option 5</option>
							                                        </select>
							                                    </div>
							                                    <div class="col-sm-4 dstick">
							                                        <select class="form-control" name="select2" id="select2">
							                                            <option>모델</option>
							                                            <option>option 2</option>
							                                            <option>option 3</option>
							                                            <option>option 4</option>
							                                            <option>option 5</option>
							                                        </select>
							                                    </div>
							                                    <div class="col-sm-4 dstick">
							                                        <select class="form-control" name="select2" id="select2">
							                                            <option>차종</option>
							                                            <option>option 2</option>
							                                            <option>option 3</option>
							                                            <option>option 4</option>
							                                            <option>option 5</option>
							                                        </select>
							                                    </div>
					                                    </div>
					
														<div class="col-sm-12 dstick" style="padding-bottom:0px">
							                                    <div class="col-sm-3 dstick">
							                                        <select class="form-control" name="select2" id="select2">
							                                            <option>색상</option>
							                                            <option>option 2</option>
							                                            <option>option 3</option>
							                                            <option>option 4</option>
							                                            <option>option 5</option>
							                                        </select>
							                                    </div>
							                                    <div class="col-sm-4 dstick">
							                                        <select class="form-control" name="select2" id="select2">
							                                            <option>스펙</option>
							                                            <option>option 2</option>
							                                            <option>option 3</option>
							                                            <option>option 4</option>
							                                            <option>option 5</option>
							                                        </select>
							                                    </div>
							                                    <div class="col-sm-4 dstick">
							                                        <select class="form-control" name="select2" id="select2">
							                                            <option>연식</option>
							                                            <option>option 2</option>
							                                            <option>option 3</option>
							                                            <option>option 4</option>
							                                            <option>option 5</option>
							                                        </select>
							                                    </div>
														</div>
			                                </div>
		                                </div>
				                    	<div class="form-group dstick">
			                                <label for="searchCustNm" class="col-sm-3 control-label">최근계약번호</label>
			                                <div class="col-sm-3 dstick">
			                                	<input type="text" class="form-control" id="searchCustNm"/>
			                                </div>
			                                <label for="searchCallType" class="col-sm-2 control-label">이메일</label>
			                                <div class="col-sm-4 dstick">
			                                	<input type="text" class="form-control" id="searchCallType"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="searchCustNm" class="col-sm-2 control-label">주소</label>
			                                <div class="col-sm-10 dstick">
			                                	<input type="text" class="form-control" id="searchCustNm"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="searchCustNm" class="col-sm-2 control-label">고객메모</label>
			                                <div class="col-sm-10 dstick">
			                                	<input type="text" class="form-control" id="searchCustNm"/>
			                                </div>
				                    	</div>
				                    </form>
				            </div>
							<!-- 고객정보항목 THE END <<<<<<<<<<<  -->
                    	<!-- /.box-body THE END -->
			        </div>


        	</div>
        	<div class="col-md-1"> <!-- DIV 가로영역을 나누는 용도 -->
        	</div>
        	<div id="callDiv" class="col-md-5"> <!-- DIV 가로영역을 나누는 용도 -->
        		  <div>
        		  <button type="button" class="btn btn-default">긴급출동전화번호</button>
        		  <button type="button" class="btn btn-default">A/S네트워크조회</button>
        		  <button type="button" class="btn btn-default">SALES네트워크조회</button>
        		  <button type="button" class="btn btn-default">기타유관부서조회</button>
        		  </div>
                  <div class="box-header with-border">
                      <h1 class="box-title cnslt-trigger">○ 상담저장</h1>
                  </div>
                  <div class="row">
                  		<div class="col-md-12"> <!-- DIV 가로영역을 나누는 용도 -->
                  			<form class="form-horizontal">
                                <div class="form-group">
                                    <label for="text01" class="col-sm-3 control-label">등록정보</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="text01" class="form-control" id="text01"/>
                                    </div>

                                    <label for="text02" class="col-sm-3 control-label">통화유형</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="select2" id="select2">
                                            <option>통화유형</option>
                                            <option>option 2</option>
                                            <option>option 3</option>
                                            <option>option 4</option>
                                            <option>option 5</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label for="text02" class="col-sm-3 control-label">콜구분</label>
                                    <div class="col-sm-3">
                                        <select class="form-control" name="select2" id="select2">
                                            <option>OSC해피콜</option>
                                            <option>FF해피콜</option>
                                            <option>캠페인1</option>
                                        </select>
                                    </div>
                                    <label for="text01" class="col-sm-3 control-label">통화자명</label>
                                    <div class="col-sm-3">
                                        <input type="text" name="text01" class="form-control" id="text01"/>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-12">
								          <table class="table">
								            <thead>
								              <tr>
								              </tr>
								            </thead>
								            <tbody>
								            	<tr>
									            	<td>만족하신가요?</td>
									            	<td>
				                                        <select class="form-control" name="select2" id="select2">
				                                            <option>예</option>
				                                            <option>아니요</option>
				                                        </select>
									            	</td>
								            	</tr>
								            	<tr>
									            	<td>점수를준다면?</td>
									            	<td>
				                                        <select class="form-control" name="select2" id="select2">
				                                            <option>100</option>
				                                            <option>50</option>
				                                            <option>20</option>
				                                            <option>0</option>
				                                        </select>
									            	</td>
								            	</tr>
								            	<tr>
									            	<td>의견주세요.</td>
									            	<td><input type="text"/></td>
								            	</tr>
								            </tbody>
								          </table>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="textarea1" class="col-sm-3 control-label">상담결과</label>
                                    <div class="col-sm-9">
	                                        <select class="form-control" name="select2" id="select2">
	                                            <option>option 1</option>
	                                            <option>option 2</option>
	                                            <option>option 3</option>
	                                            <option>option 4</option>
	                                            <option>option 5</option>
	                                        </select>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="textarea1" class="col-sm-3 control-label">상담(STT)<br>내용</label>
                                    <div class="col-sm-9">
                                        <textarea name="textarea1" class="form-control" rows="3" id="textarea1" placeholder="Enter ..."></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="textarea2" class="col-sm-3 control-label">상담원<br>메모</label>
                                    <div class="col-sm-9">
                                        <textarea name="textarea2" class="form-control" rows="3" id="textarea2" placeholder="Enter ..."></textarea>
                                    </div>
                                </div>
                  			</form>
                  		</div>
                  </div>
        	</div>
		</div>
		<!-- row 상단 THE END -->

      <div class="row">
  		  <div align='right'>
  		  <button type="button" class="btn btn-default">마케팅활용동의거절</button>
  		  <button type="button" class="btn btn-default">취소</button>
  		  <button type="button" class="btn btn-default">상담저장</button>
  		  <button type="button" class="btn btn-default">상담완료</button>
  		  <button type="button" class="btn btn-default">정비예약</button>
  		  <button type="button" class="btn btn-default">DB변경</button>
  		  <button type="button" class="btn btn-default">의뢰요청</button>
  		  <button type="button" class="btn btn-default">KMS연결</button>
  		  </div>
        <div class="col-md-12">
        <p class="bg-info toggle-list">▽ 이력정보(<a href='#'>펼치기/접기</a>)</p>
        <div id="postnList">
				<ul class="nav nav-tabs nav-justified" id="histTab">
				  <li id="bottomTab0" role="presentation" class="active"><a href="#tab0">상담이력</a></li>
				  <li id="bottomTab1" role="presentation"><a href="#tab1">계약/판매이력</a></li>
				  <li id="bottomTab2" role="presentation"><a href="#tab2">정비이력</a></li>
				  <li id="bottomTab3" role="presentation"><a href="#tab3">KMS이력</a></li>
				  <li id="bottomTab4" role="presentation"><a href="#tab4">AUTO포인트</a></li>
				  <li id="bottomTab5" role="presentation"><a href="#tab5">캠페인자료실</a></li>
				  <li id="bottomTab6" role="presentation"><a href="#tab6">예상정비조회</a></li>
				  <li id="bottomTab7" role="presentation"><a href="#tab7">정기소모품</a></li>
				</ul>
				<!-- 상담이력  -->
				<div id="tab0" style="width: 100%; padding: 0px; display:inline;">
		          <table class="table">
		            <thead>
		              <tr>
		                <th>순번</th>
		                <th>고객명</th>
		                <th>상담일자</th>
		                <th>상담원</th>
		                <th>상담유형</th>
		                <th>상담구분</th>
		                <th>상담결과</th>
		                <th>상담내용</th>
		                <th>조치내용</th>
		                <th>상담원메모</th>
		              </tr>
		            </thead>
		            <tbody>
		            </tbody>
		          </table>
		        </div>
				<!-- 계약/판매이력  -->
				<div id="tab1" style="width: 100%; padding: 0px; display:none;">
		          <table class="table">
		            <thead>
		              <tr>
		                <th>순번</th>
		                <th>고객명</th>
		                <th>계약자명</th>
		                <th>계약일자</th>
		                <th>계약번호</th>
		                <th>판매일자</th>
		                <th>차대번호</th>
		                <th>차량번호</th>
		                <th>담당영업사원</th>
		                <th>비고</th>
		              </tr>
		            </thead>
		            <tbody>
		            </tbody>
		          </table>
		        </div>
				<!-- 정비이력  -->
				<div id="tab2" style="width: 100%; padding: 0px; display:none;">
		          <table class="table">
		            <thead>
		              <tr>
		                <th>순번</th>
		                <th>고객명</th>
		                <th>정비일자</th>
		                <th>수납일자</th>
		                <th>차대번호</th>
		                <th>차량번호</th>
		                <th>정비사</th>
		                <th>비고</th>
		              </tr>
		            </thead>
		            <tbody>
		            </tbody>
		          </table>
		        </div>
        </div>
        </div>
      </div>








    </section>
    <!-- /.content -->


	    <form name="popupForm" method="post">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
	        <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
	    </form>

</body>
</html>
