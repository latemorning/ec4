<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%--
    Class Name : EC4OutbdCallCnsltMng.jsp
    Description : 아웃바운드 상담화면2

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2018.08.09    harry     최초 생성

    author : wizvil harry
    since : 2018.08.09
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>아웃바운드 상담</title>
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

    <!-- InputMask -->
    <script src="/resource/adminLTE/plugins/input-mask/jquery.inputmask.js"></script>
    <script src="/resource/adminLTE/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
    <script src="/resource/adminLTE/plugins/input-mask/jquery.inputmask.extensions.js"></script>

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

    <!-- ec4 common -->
    <script src="/js/egovframework/ec4/cmm/ec4common.js"></script>



    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">

    <script type="text/javascript">


        $(document).ready(function () {

            if('${message}'){

                alert('${message}');
            }


            $(".sidebar-menu").tree();


            //Date picker
            $(".datepicker").datepicker({
              autoclose: true,
              format: "yyyy-mm-dd"
            });


            // modal close event
            $("div.modal").on('hide.bs.modal', function (event) {

            });


            // 전화번호 포멧
            $("span.telno").each(function(){

                var $telno = $(this).text();

                $(this).text( fn_format_telno($telno) );
            });


            // 전화번호 포멧
            $("input.telno").each(function(){

                var $telno = $(this).val();

                $(this).val( fn_format_telno($telno) );
            });


            // 목록 이동
            $(".btn-list").click(function(){

            	var frm = document.actionForm;

            	frm.action = "/ec4/call/outbd/hpcl/callCnsltMng.do";
            	frm.submit();
            });


            // 저장
            $("#btnSave").click(function(){

                var frm = document.cnsltResultFrom;

                frm.action = "/ec4/call/outbd/cnslt/insertCnsltResult.do";
                frm.submit();
            });
        });
        // end ready

    /**
     * 전화번호 format
     * 2018.08.17 harry...
     */
    function fn_format_telno(param){

        return param.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]*)([0-9]{4})/, "$1-$2-$3");
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
                아웃바운드 상담
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>&nbsp;Home</a></li>
                <li><a href="#">아웃바운드</a></li>
                <li class="active">아웃바운드 상담</li>
            </ol>
        </section>
        <!-- Main content -->
        <section class="content">

            <div class="row">
                <div class="col-md-12">
                    <div class="box box-solid">
                        <div class="box-body">
                            <button type="button" class="btn btn-sm btn-primary pull-right btn-list">목록</button>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col-md-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <!-- column -->
                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-user"></i>고객/차량 정보</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="" id="" method="post" onsubmit="return false;">
                                <div class="col-md-6">
                                    <div class="form-group col-md-6">
                                        <label for="">고객명</label>
                                        <input type="text" name="" id="" value="${cstmrVO.cstmrNm}" class="form-control input-sm" placeholder="고객명" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <div class="checkbox">
                                            <label>
                                                </br>
                                                <input type="checkbox" name="" <c:if test="${cstmrVO.callRecptnAgreAt eq 'Y'}">checked="checked"</c:if> disabled/>
                                                고객동의
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">전화번호</label>
                                        <input type="text" name="" id="" value="${cstmrVO.telno}" class="form-control input-sm telno" placeholder="전화번호" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">이동전화</label>
                                        <input type="text" name="" id="" value="${cstmrVO.mbtlnum}" class="form-control input-sm telno" placeholder="이동전화" readonly="readonly"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group col-md-6">
                                        <label for="">차량번호</label>
                                        <input type="text" name="" id="" value="${cstmrCarVO.carnbr}" class="form-control input-sm" placeholder="차량번호" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">차대번호</label>
                                        <input type="text" name="" id="" value="${cstmrCarVO.vinFront}${cstmrCarVO.vinRear}" class="form-control input-sm" placeholder="차대번호" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">차종</label>
                                        <input type="text" name="" id="" value="${cstmrCarVO.vhctyCodeNm}" class="form-control input-sm" placeholder="차종" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">주행거리</label>
                                        <input type="text" name="" id="" value="${cstmrCarVO.drvdstnc}" class="form-control input-sm" placeholder="주행거리" readonly="readonly"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!--/.col -->



                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-phone"></i>해피콜 정보</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="" id="" method="post" onsubmit="return false;">
                                <div class="row">
                                    <div class="form-group col-md-3">
                                        <label for="">콜담당자</label>
                                        <input type="text" name="" id="" value="${hpclVO.chrgCnslrEsntlNm}" placeholder="콜담당자" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">접수번호</label>
                                        <input type="text" name="" id="" value="${hpclVO.rceptNo}" placeholder="접수번호" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">할당자</label>
                                        <input type="text" name="" id="" value="${hpclVO.altrEsntlNm}" placeholder="할당자" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">할당일시</label>
                                        <input type="text" name="" id="" value="${hpclVO.asgnDt}" placeholder="할당일시  " class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                </div>
                                <div class="row justify-content-start">
                                    <div class="form-group col-md-3">
                                        <label for="">1차콜처리자</label>
                                        <input type="text" name="" id="" value="${hpclVO.frstCallOpetrNm}" placeholder="1차콜처리자" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">1차콜처리일시</label>
                                        <input type="text" name="" id="" value="${hpclVO.frstCallProcessDt}" placeholder="1차콜처리일시" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">1차콜결과</label>
                                        <input type="text" name="" id="" value="${hpclVO.frstCallResultCodeNm}" placeholder="1차콜결과" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col-md-3">
                                        <label for="">부재콜처리자</label>
                                        <input type="text" name="" id="" value="${hpclVO.absnceCallOpetrNm}" placeholder="부재콜처리자" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">부재콜처리일시</label>
                                        <input type="text" name="" id="" value="${hpclVO.absnceCallProcessDt}" placeholder="부재콜처리일시" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">부재콜결과</label>
                                        <input type="text" name="" id="" value="${hpclVO.absnceCallResultCodeNm}" placeholder="부재콜결과" class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="">콜횟수</label>
                                        <input type="text" name="" id="" value="${hpclVO.callCnt}" placeholder="콜횟수  " class="form-control input-sm" readonly="readonly"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col-md-12 -->


                <div class="col-md-12">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-save"></i>결과 등록</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">
                            <form name="cnsltResultFrom" method="post" onsubmit="return false;">
                                <double-submit:preventer/>
                                <input type="hidden" name="hpclId" value="${hpclVO.hpclId}"/>
                                <input type="hidden" name="searchHpclId" value="${searchVO.searchHpclId}"/>
                                <input type="hidden" name="searchCstmrEsntlId" value="${searchVO.searchCstmrEsntlId}"/>
                                <input type="hidden" name="searchVhcleEsntlId" value="${searchVO.searchVhcleEsntlId}"/>
                                <input type="hidden" name="recptnAgreSeCode" value="${cstmrVO.recptnAgreSeCode}"/>

                                <div class="col-md-6">
                                    <div class="form-group col-md-12">
                                        <label for="">콜결과 [${hpclVO.frstCallResultCodeNm}]</label>
                                        <select name="callResultCode" id="callResultCode" class="form-control input-sm">
                                           <option value="">-- 선택 --</option><c:forEach items="${progrsResultCode}" var="result" varStatus="status">
                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">수신여부(고객동의[${cstmrVO.callRecptnAgreAt}])</label>
                                        <select name="recptnAgreAt" id="recptnAgreAt" class="form-control input-sm">
                                           <option value="">-- 선택 --</option>
                                           <option value="Y">예[Y]</option>
                                           <option value="N">아니오[N]</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">블랙컨슈머[${cstmrVO.blclstAt}]</label>
                                        <select name="blclstAt" id="blclstAt" class="form-control input-sm">
                                           <option value="">-- 선택 --</option>
                                           <option value="Y">예[Y]</option>
                                           <option value="N">아니오[N]</option>
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">이동전화변경[<span class="telno">${cstmrVO.mbtlnum}</span>]</label>
                                        <input type="text" name="mbtlnumChange" id="mbtlnumChange" placeholder="휴대전화변경" class="form-control input-sm"/>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">전화번호변경[<span class="telno">${cstmrVO.telno}</span>]</label>
                                        <input type="text" name="telnoChange" id="telnoChange" placeholder="전화번호변경" class="form-control input-sm"/>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group col-md-12">
                                        <label for="">참고사항</label>
                                        <textarea name="refrnMatter" class="form-control" rows="3" placeholder="참고사항">${hpclVO.refrnMatter}</textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <label for="">비고</label>
                                        <textarea name="remark" class="form-control" rows="3" placeholder="비고">${hpclVO.remark}</textarea>
                                    </div>
                                    <div class="form-group col-md-12">
                                        <button type="button" id="btnSave" class="btn btn-sm btn-primary pull-right">저장</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col-md-12 -->


                <div class="col-md-12">

                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-wrench"></i>정비 정보</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body">


                            <form name="" id="" method="post" onsubmit="return false;">

                                    <div class="form-group col-md-6">
                                        <label for="">사업소</label>
                                        <div class="row">
                                            <div class="col-xs-3 no-padding-right"><input type="text" name="" id="" value="${hpclVO.replcSeCodeNm}" placeholder="" class="form-control input-sm" readonly="readonly"/></div>
                                            <div class="col-xs-3 no-padding"><input type="text" name="" id="" value="${hpclVO.replcId}" placeholder="" class="form-control input-sm" readonly="readonly"/></div>
                                            <div class="col-xs-3 no-padding"><input type="text" name="" id="" value="${hpclVO.hdqrtrsNm}" placeholder="" class="form-control input-sm" readonly="readonly"/></div>
                                            <div class="col-xs-3 no-padding-left"><input type="text" name="" id="" value="${hpclVO.replcNm}" placeholder="" class="form-control input-sm" readonly="readonly"/></div>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="">작업자</label>
                                        <input type="text" name="" id="" value="${hpclVO.opertorNm}" class="form-control input-sm" placeholder="작업자" readonly="readonly"/>
                                    </div>


                                    <div class="form-group col-md-6">
                                        <label for="">작업내용</label>
                                        <textarea class="form-control" rows="3" placeholder="작업내용 ..." disabled>${hpclVO.workCn}</textarea>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="">수리내역</label>
                                        <textarea class="form-control" rows="3" placeholder="수리내역 ..." disabled>${hpclVO.repairDetail}</textarea>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="">기타사항</label>
                                        <textarea class="form-control" rows="3" placeholder="기타사항 ..." disabled>${hpclVO.etcMatter}</textarea>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="">수리의뢰</label>
                                        <textarea class="form-control" rows="3" placeholder="수리의뢰 ..." disabled>${hpclVO.repairReqest}</textarea>
                                    </div>


                                    <div class="form-group col-md-12">
                                        <label for="">정비소정보</label>
                                        <textarea class="form-control" rows="3" placeholder="정비소정보   ..." disabled>${hpclVO.replcInfo}</textarea>
                                    </div>
                            </form>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col-md-12 -->


            </div>
            <!-- /.row -->





            <div class="row">
                <div class="col-md-12">
                    <div class="box box-solid">
                        <div class="box-body">
                            <button type="button" class="btn btn-sm btn-primary pull-right btn-list">목록</button>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
                <!-- /.col-md-12 -->
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
<form name="actionForm" method="post">
</form>
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>
