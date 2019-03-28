<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4MblMyRecallMng.java
  * @Description :
  * @Modification Information
  * @
  * @  수정일       수정자               수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.05.08    CJJ       최초 생성
  *
  *  @author CJJ
  *  @since 2018.05.08
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
    <title>리콜확인</title>
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


<script type="text/javaScript" language="javascript" defer="defer">

    $(document).ready(function(){

        //Date picker
        $('#datepicker01,#datepicker02').datepicker({
          autoclose: true
        })
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
                    리콜확인
                    <small>&nbsp;</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">My</a></li>
                    <li class="active">리콜확인</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
            
				<!-- ############################# 검색조건 ######################  -->
		      	<div class="row">
		            <div class="col-xs-12">
		            
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
		                                <label for="searchCustNm" class="col-xs-4 control-label">검색일자</label>
		                                <div class="col-xs-8">
			                                <input type="text" class="form-control" id="searchCustNm" value="2018-04-20~2018-04-21"/>
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
            
            
            
                <div class="row">
                    <div class="col-xs-12">

                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">리콜내역</h3>
                            </div>
                            <!-- /.box-header -->

		                    <div class="box-body no-padding" style="height:750px;">
						          <table class="table table-hover">
						            <thead>
						              <tr>
						                <th>순번</th>
						                <th>선택</th>
						                <th>구분</th>
						                <th>리콜명</th>
						                <th>내용</th>
						              </tr>
						            </thead>
						            <tbody>
						          	</tbody>
						          </table>
		                    </div>
		                    <!-- /.box-body -->
                        </div>

                        
                        
                    </div>

                </div>



            </section>
            <!-- /.content -->

        </div>
        <!-- /.content-wrapper -->


        <!-- footer include -->
        <jsp:include page="/ec4Footer.do" />

    </div>
    <!-- ./wrapper -->
</body>
</html>
