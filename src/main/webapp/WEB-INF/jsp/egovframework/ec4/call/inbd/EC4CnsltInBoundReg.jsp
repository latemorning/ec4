<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltInBoundReg.java
  * @Description :
  * @Modification Information
  * @
  * @  수정일       수정자               수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.23    harry       최초 생성
  *
  *  @author harry
  *  @since 2018.04.23
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
    <title>고객상담내역등록</title>
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
                    고객상담내역등록
                    <small>&nbsp;</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li><a href="#">상담관리(In)</a></li>
                    <li class="active">고객상담내역등록</li>
                </ol>
            </section>

            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-12">

                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">등록</h3>
                            </div>
                            <!-- /.box-header -->

                            <div class="box-body">
                            <form class="form-horizontal">

                                <div class="form-group">
                                    <label for="text01" class="col-sm-2 control-label">고객명</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
	                                        <input type="text" name="text01" class="form-control" id="text01"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" name="button01" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                    </div>

                                    <label for="text02" class="col-sm-2 control-label">상담원명</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                            <input type="text" name="text02" class="form-control" id="text02"/>
                                            <div class="input-group-btn">
                                                <button type="button" name="button02" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="searchCustNm1" class="col-sm-2 control-label">고객휴대전화</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="searchCustNm1" class="form-control" id="searchCustNm1"/>
                                    </div>

                                    <label for="select2" class="col-sm-2 control-label">상담유형</label>
                                    <div class="col-sm-4">
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
                                    <label for="select1" class="col-sm-2 control-label">상담구분</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" name="select1" id="select1">
                                            <option>option 1</option>
                                            <option>option 2</option>
                                            <option>option 3</option>
                                            <option>option 4</option>
                                            <option>option 5</option>
                                        </select>
                                    </div>

                                    <label for="datepicker01" class="col-sm-2 control-label">처리일자</label>
                                    <div class="col-sm-2">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="datepicker01" class="form-control" id="datepicker01">
                                        </div>
						                <!-- /.input group -->
                                    </div>
                                    <div class="col-sm-2">
                                        <div class="input-group date">
                                            <div class="input-group-addon">
                                                <i class="fa fa-calendar"></i>
                                            </div>
                                            <input type="text" name="datepicker02" class="form-control" id="datepicker02">
                                        </div>
                                        <!-- /.input group -->
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="textarea1" class="col-sm-2 control-label">상담문의내용</label>
                                    <div class="col-sm-10">
                                        <textarea name="textarea1" class="form-control" rows="3" id="textarea1" placeholder="Enter ..."></textarea>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="textarea2" class="col-sm-2 control-label">처리내용</label>
                                    <div class="col-sm-10">
                                        <textarea name="textarea2" class="form-control" rows="3" id="textarea2" placeholder="Enter ..."></textarea>
                                    </div>
                                </div>
                            </form>
                            </div>
                            <!-- /.box-body -->

                            <div class="box-footer text-right">
                                <button type="button" class="btn btn-info"> 목록</button>
                                <button type="button" class="btn btn-warning"> 저장</button>
                            </div>

                        </div>
                        <!-- /.box -->

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
