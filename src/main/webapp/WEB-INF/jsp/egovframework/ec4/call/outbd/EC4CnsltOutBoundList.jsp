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
    <title>OutBound현황조회</title>
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
	
});

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
                OutBound현황조회
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리(Out)</a></li>
                <li class="active">OutBound현황조회</li>
            </ol>
        </section>

	<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
      	<div class="row">
            <div class="col-md-12">
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                    	<h3 class="box-title">검색</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal">
                            <div class="form-group">
                                <label for="searchCustNm" class="col-sm-2 control-label">상담일자</label>
                                <div class="col-sm-2">
	                                <input type="text" class="form-control" id="searchCustNm" value="2018-04-20~2018-04-21"/>
                                </div>
                                <label for="searchCallType" class="col-sm-1 control-label">콜구분</label>
                                <div class="col-sm-2">
                                    <select class="form-control" name="select2" id="select2">
                                        <option>전체</option>
                                        <option>OSC해피콜</option>
                                        <option>FF해피콜</option>
                                        <option>신차해피콜</option>
                                        <option>캠페인1</option>
                                        <option>캠페인2</option>
                                    </select>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">스크립트제목</label>
                                <div class="col-sm-3">
                                    <select class="form-control" name="select2" id="select2">
                                        <option>전체</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCallType" class="col-sm-2 control-label">고객명</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
	                                        <input type="text" name="text01" class="form-control" id="text01"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" name="button01" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">담당상담원</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
	                                        <input type="text" name="text01" class="form-control" id="text01"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" name="button01" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">상담유형</label>
                                <div class="col-sm-2">
                                	<select class="form-control"><option>상담유형</option></select>
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="searchCallType" class="col-sm-2 control-label">차량번호</label>
                                <div class="col-sm-2">
                                    <input type="text" name="text01" class="form-control" id="text01"/>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">핸드폰번호</label>
                                <div class="col-sm-2">
                                    <input type="text" name="text01" class="form-control" id="text01"/>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">콜진행상태</label>
                                <div class="col-sm-2">
                                	<select class="form-control">
                                		<option>미완료</option>
                                		<option>완료</option>
                                		<option>전체</option>
                                	</select>
                                </div>
						  	</div>
                    </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info"> 조회</button>
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
            </div>
        </div>
        


	    <!-- ############################# 메인화면 ######################  -->
      	<div class="row">
        	<div class="col-xs-12"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-top:5px;padding-top:5px;float:left;">리스트</h3>
                        <div class="box-tools">
                               &nbsp;
                               <button type="button" class="btn btn-info"> 액셀</button>
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding" style="height:750px;">
				          <table class="table table-hover">
				            <thead>
				              <tr>
				                <th>순번</th>
				                <th>고객명</th>
				                <th>핸드폰번호</th>
				                <th>콜구분</th>
				                <th>상담원명</th>
				                <th>상담유형</th>
				                <th>상담구분</th>
				                <th>처리상태</th>
				                <th>문의내용</th>
				                <th>조치내용</th>
				              </tr>
				            </thead>
				            <tbody>
				          	</tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
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
<!-- ./wrapper -->
</body>
</html>
