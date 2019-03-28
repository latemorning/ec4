<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%--
    Class Name : EC4DetailCodeReg.jsp
    Description : 상세코드 등록

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.05.17    harry     최초 생성

    author : wizvil harry
    since : 2018.05.17
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상세코드 등록</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/select2/dist/css/select2.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/skins/_all-skins.min.css">
    <!-- ec4 common -->
    <link rel="stylesheet" href="/css/egovframework/ec4/cmm/ec4common.css">

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
    <!-- ec4 common -->
    <script src="/js/egovframework/ec4/cmm/ec4common.js"></script>

    <script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
    <validator:javascript formName="detailCodeVO" staticJavascript="false" xhtml="true" cdata="false"/>

    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">

    <script type="text/javascript">

        $(document).ready(function () {

            $(".sidebar-menu").tree();


            //
            $(".select2").select2({
           	    "ajax": {
           		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectCodeComboList.do'/>",
           		    "dataType": 'json',
           		    "delay": 250,
           		    "data": function (params) {
           		        return {
           		            "searchClCode": $("select[name=clCode] option:selected").val(),
           		            "searchCodeId": $("select[name=codeId] option:selected").val()
           		        };
           		    }
           		},
            	"placeholder": "-- 선택 --",
                "width": "100%",
                "tags": false,
                "minimumResultsForSearch": 100
            });


            //$("select[name=codeId]").val("${detailCodeVO.clCode}").trigger('click');
            //$("select[name=codeId]").trigger('change');
            //$("select[name=codeId]").val("${detailCodeVO.codeId}");

            //alert("${detailCodeVO.codeId}");

            $(".select2").on("click", function (e) {

            });


            $("select[name=codeId]").trigger('click');



            $("select[name=clCode]").change(function(){

            	$("select[name=codeId]").val(null).trigger('change');
            });


            // 코드 등록
            $("#btnDetailCodeInsert").click(function(){

                frm = document.detailCodeVO;

                /* if(!validateDetailCodeVO(frm)){
                    return;
                } */

                // 등록
                frm.action = "<c:url value='/ec4/cmm/cbase/cmt/insertDetailCode.do'/>";
                frm.submit();
            });


            // 목록
            $("#btnDetailCodeList").click(function(){

                frm = document.detailCodeVO;

                frm.action = "<c:url value='/ec4/cmm/cbase/cmt/detailCodeMng.do'/>";
                frm.submit();
            });

        });
        // end ready

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
                상세코드 등록
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">기준정보</a></li>
                <li class="active">상세코드 등록</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="row">

                <!-- left column -->
                <div class="col-md-12">

                    <!-- Horizontal Form -->
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-save"></i>상세코드 등록</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form:form commandName="detailCodeVO" name="detailCodeVO" method="post" cssClass="form-horizontal">
                            <double-submit:preventer/>
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="clCode" class="col-sm-2 control-label">분류코드</label>
                                    <div class="col-sm-10">
                                        <form:select path="clCode" class="form-control input-sm">
                                            <form:option value="">-- 선택 --</form:option>
                                            <form:options items="${clCodeList}" itemValue="code" itemLabel="codeNm"/>
                                        </form:select>
                                    </div>
                                </div>

                                <div class="form-group has-warning">
                                    <label for="codeId" class="col-sm-2 control-label">코드ID</label>
                                    <div class="col-sm-10">
                                        <form:select path="codeId" cssClass="form-control input-sm select2">
                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                        </form:select>
                                        <form:errors cssClass="help-block" path="codeId" />
                                    </div>
                                </div>

                                <div class="form-group has-warning">
                                    <label for="code" class="col-sm-2 control-label">상세코드</label>
                                    <div class="col-sm-10">
                                        <form:input path="code" cssClass="form-control input-sm" maxlength="60"/>
                                        <form:errors cssClass="help-block" path="code" />
                                    </div>
                                </div>

                                <div class="form-group has-warning">
                                    <label for="codeNm" class="col-sm-2 control-label">상세코드명</label>
                                    <div class="col-sm-10">
                                        <form:input path="codeNm" cssClass="form-control input-sm" maxlength="60"/>
                                        <form:errors cssClass="help-block" path="codeNm" />
                                    </div>
                                </div>

                                <div class="form-group has-warning">
                                    <label for="codeDc" class="col-sm-2 control-label">상세코드설명</label>
                                    <div class="col-sm-10">
                                        <form:textarea path="codeDc" cssClass="form-control" rows="3" placeholder="Enter ..."></form:textarea>
                                        <form:errors cssClass="help-block" path="codeDc" />
                                    </div>
                                </div>

                                <div class="form-group margin-bottom-none">
                                    <label class="col-sm-2 control-label">사용여부</label>
                                    <div class="col-sm-10">
                                        <form:select path="useAt" cssClass="form-control input-sm">
                                            <form:option value="Y">사용</form:option>
                                            <form:option value="N">미사용</form:option>
                                        </form:select>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer text-right">
                                <button type="button" id="btnDetailCodeInsert" class="btn btn-sm btn-primary">저장</button>
                                <button type="button" id="btnDetailCodeList" class="btn btn-sm btn-warning">목록</button>
                            </div>
                            <!-- /.box-footer -->
                        </form:form>
                    </div>
                    <!-- /.box -->
                </div>
                <!--/.col (left) -->

            </div>
            <!-- /.row -->

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
