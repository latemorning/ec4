<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>EC4 | Blank Page</title>
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

    <style type="text/css">
		.modal.modal-center {
		  text-align: center;
		}

		@media screen and (min-width: 768px) {
		  .modal.modal-center:before {
		    display: inline-block;
		    vertical-align: top;
		    height: 100%;
		  }
		}

		.modal-dialog.modal-center {
		  display: inline-block;
		  text-align: left;
		  vertical-align: middle;
		}

		.modal-dialog.modal-large {
		  width: 80%;
		  height: auto;
		  margin-top: 20px;
		  margin-bottom: 0px;
		  margin-left: 0px;
		  margin-right: 0px;
		  padding: 0;
		}

		.modal-content.modal-large {
		  height: auto;
		  min-height: 80%;
		}
    </style>

    <!-- jQuery 3 -->
    <script src="/resource/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/resource/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Select2 -->
    <script src="/resource/adminLTE/bower_components/select2/dist/js/select2.full.min.js"></script>
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

    <script>

    /*
        callback은 스크립트 맨 처음에 위치
    */

    // callback select single
    function callback(sResult) {

        var oResult = JSON.parse(sResult);

        var selValues = [];

        for(var i=0 ; i<oResult.length ; i++){

        	selValues.push(oResult[i].value);
        }

        $("select[name=testSel]").val(selValues);
        $("select[name=testSel]").trigger('change');
    }


    // callback select multi
    function callbackPopupMultiSelectTest(sResult) {

        var oResult = JSON.parse(sResult);

        var selValues = [];

        for(var i=0 ; i<oResult.length ; i++){

            selValues.push(oResult[i].value);
        }

        $("select[name=testSelMulti]").val(selValues);
        $("select[name=testSelMulti]").trigger('change');
    }


    // callback text
    function callbackPopupTextTest(sResult) {

        var oResult = JSON.parse(sResult);

        $("input:text[name=testValue]").val(oResult[0].value);
        $("input:text[name=testText]").val(oResult[0].label);
    }


    $(document).ready(function () {

        $(".sidebar-menu").tree();

        $(".select2").select2({
        	placeholder: "Select an option",
        	width: "100%"
        });



        $("#btnDefaultModal").click(function(){

        	var params = $("#popupForm").serialize();

        	alert(params);

        	$("div#modal-default").modal(
        			{"backdrop": "static",
        		     "keyboard": false,
        		     "remote": "<c:url value='/ec4/cmm/cbase/vhi/vhcleModelPopup.do'/>"
        		    });
        });


        $("#btnLargeModal").click(function(){

            $("div#modal-large").modal(
                    {"backdrop": "static",
                     "keyboard": false,
                     "remote": "<c:url value='/ec4/cmm/cbase/vhi/vhcleModelPopup.do'/>"
                    });
        });


        // popup select single
        $("#btnPopupTest").click(function(){

            var popupParams = {};

            var callbackClass = "callback";
            var selectStyle = "single";
            var url = "<c:url value='/ec4/cmm/ec4PopupTest.do'/>";

            popupParams.width = "800";
            popupParams.height = "700";
            popupParams.title = "popupSelectSingle";
            popupParams.form = document.popupForm;


            popupParams.form.action = url;
            popupParams.form.target = popupParams.title;
            popupParams.form.selectStyle.value = selectStyle;
            popupParams.form.callbackClass.value = callbackClass;

            fn_open_popup(popupParams);
        });


        // popup select multi
        $("#btnPopupMultiSelectTest").click(function(){

            var popupParams = {};

            var callbackClass = "callbackPopupMultiSelectTest";
            var selectStyle = "multi";
            var url = "<c:url value='/ec4/cmm/ec4PopupTest.do'/>";

            popupParams.width = "800";
            popupParams.height = "700";
            popupParams.title = "popupMultiSelectTest";
            popupParams.form = document.popupForm;


            popupParams.form.action = url;
            popupParams.form.target = popupParams.title;
            popupParams.form.selectStyle.value = selectStyle;
            popupParams.form.callbackClass.value = callbackClass;

            fn_open_popup(popupParams);
        });



        // popup text
        $("#btnPopupTextTest").click(function(){

        	var popupParams = {};

        	var callbackClass = "callbackPopupTextTest";
        	var selectStyle = "single";
        	var url = "<c:url value='/ec4/cmm/ec4PopupTest.do'/>";

        	popupParams.width = "800";
        	popupParams.height = "700";
        	popupParams.title = "popupTextTest";
        	popupParams.form = document.popupForm;


        	popupParams.form.action = url;
        	popupParams.form.target = popupParams.title;
        	popupParams.form.selectStyle.value = selectStyle;
        	popupParams.form.callbackClass.value = callbackClass;

        	fn_open_popup(popupParams);
        });


        $("#changeUrl").click(function(){

        	let link = $("#link").val();

        	if(!link){

	        	alert('긴 URL을 입력해주세요');
	        }else{

 	        	var firebaseDynamicLinks = new FirebaseDynamicLinks(link);

 	        	firebaseDynamicLinks.shortenLinks();
	        	$("#shortUrl").val(firebaseDynamicLinks.shortLinks);
        	}
        });

    });
    // end ready



    /**
     * 주소 검색 화면 호출(Basic)
     */
    function fn_openUrlJusoSearchBasic() {
        var pop = window.open("/ec4/cmm/zip/rdnmadrSearchPopup.do", "pop_basic",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }

    /**
     * 주소 검색 화면 호출(Full)
     */
    function fn_openUrlJusoSearchFull() {
        var pop = window.open("./JusoSearchFull.html",  "pop_full",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }

    /**
     * 주소 검색 화면 호출(Skin)
     */
    function fn_openUrlJusoSearchSkin(skinNo) {
        var pop = window.open("./JusoSearchSkin" + skinNo + ".html",    "pop_basic",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }

    /**
     * 결과 처리
     */
    function fn_setJuso(data) {
        $("#roadFullAddr").val(data["roadFullAddr"]);
        $("#roadAddrPart1").val(data["roadAddrPart1"]);
        $("#roadAddrPart2").val(data["roadAddrPart2"]);
        $("#jibunAddr").val(data["jibunAddr"]);
        $("#engAddr").val(data["engAddr"]);
        $("#zipNo").val(data["zipNo"]);
        $("#admCd").val(data["admCd"]);
        $("#rnMgtSn").val(data["rnMgtSn"]);
        $("#bdMgtSn").val(data["bdMgtSn"]);

        $("#bdNm").val(data["bdNm"]);
        $("#bdKdcd").val(data["bdKdcd"]);
        $("#siNm").val(data["siNm"]);
        $("#sggNm").val(data["sggNm"]);
        $("#emdNm").val(data["emdNm"]);
        $("#liNm").val(data["liNm"]);
        $("#rn").val(data["rn"]);
        $("#udrtYn").val(data["udrtYn"]);
        $("#buldMnnm").val(data["buldMnnm"]);
        $("#buldSlno").val(data["buldSlno"]);
        $("#mtYn").val(data["mtYn"]);
        $("#lnbrMnnm").val(data["lnbrMnnm"]);
        $("#lnbrSlno").val(data["lnbrSlno"]);
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
                Blank page
                <small>it all starts here</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">Examples</a></li>
                <li class="active">Blank page</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">Title</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">
                    <form class="form-horizontal">

	                    <div class="row">
	                        <div class="col-md-12">
	                            main body 1
	                            <button type="button" id="btnDefaultModal" class="btn btn-default">Launch Default Modal</button>
	                            <button type="button" id="btnLargeModal" class="btn btn-default">Launch Large Modal</button>
	                        </div>
	                    </div>

	                    <div class="form-group">
	                        <label class="col-sm-2 control-label">Single</label>
	                        <div class="col-sm-8 no-padding">
		                        <select name="testSel" class="form-control">
		                            <option value="VHCTD01">승용차</option>
		                            <option value="VHCTD02">스포츠카</option>
		                            <option value="VHCTD03">SUV</option>
		                            <option value="VHCTD04">승합차</option>
		                            <option value="VHCTD05">트럭/화물</option>
		                            <option value="VHCTD06">캠핑카</option>
		                        </select>
		                    </div>
		                    <div class="col-sm-2 no-padding">
                                <button type="button" class="btn btn-box-tool" id="btnPopupTest"><i class="fa fa-plus"></i></button>
                            </div>
	                    </div>
	                    <!-- /.form-group -->

	                    <div class="form-group">
                            <label class="col-sm-2 control-label">multiple</label>
                            <div class="col-sm-8 no-padding">
                                <select name="testSelMulti" class="form-control select2" multiple="multiple">
                                    <option value="VHCTD01">승용차</option>
                                    <option value="VHCTD02">스포츠카</option>
                                    <option value="VHCTD03">SUV</option>
                                    <option value="VHCTD04">승합차</option>
                                    <option value="VHCTD05">트럭/화물</option>
                                    <option value="VHCTD06">캠핑카</option>
                                </select>
                            </div>
                            <div class="col-sm-2 no-padding">
                                <button type="button" class="btn btn-box-tool" id="btnPopupMultiSelectTest"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.form-group -->

	                    <div class="form-group">
                            <label class="col-sm-2 control-label">text 선택</label>
                            <div class="col-sm-4 no-padding">
                                <input type="text" name="testValue" class="form-control"/>
                            </div>
                            <div class="col-sm-4 no-padding">
                                <input type="text" name="testText" class="form-control"/>
                            </div>
                            <div class="col-sm-2 no-padding">
                                <button type="button" class="btn btn-box-tool" id="btnPopupTextTest"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.form-group -->
                    </form>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    Footer
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->


            <div class="box box-solid box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">Firebase Dynamic Links REST API</h3>
                </div>
                <div class="box-body">
                    <form>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>긴 URL</label>
                                <input type="text" name="link" id="link" class="form-control input-sm"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label>짧은 URL</label>
                                <input type="text" name="shortUrl" id="shortUrl" class="form-control input-sm"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <button type="button" id="changeUrl" class="btn btn-primary btn-block">변환</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->



            <!-- Default box -->
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">우편번호</h3>

                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse" data-toggle="tooltip" title="Collapse">
                        <i class="fa fa-minus"></i></button>
                        <button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Remove">
                        <i class="fa fa-times"></i></button>
                    </div>
                </div>
                <div class="box-body">

                    <div class="row">
                        <div class="col-md-12">

							<p>
							<input type="button" value="주소조회(Basic)" onClick="javascript:fn_openUrlJusoSearchBasic()">
							<input type="button" value="주소조회(Full)" onClick="javascript:fn_openUrlJusoSearchFull()">
							<input type="button" value="주소조회(Skin1)" onClick="javascript:fn_openUrlJusoSearchSkin('1')">
							<input type="button" value="주소조회(Skin2)" onClick="javascript:fn_openUrlJusoSearchSkin('2')">
							</p>
							<table>
							    <tr><td>전체 도로명주소</td><td><input size="50" type="text" id="roadFullAddr"></td></tr>
							    <tr><td>도로명주소</td><td><input size="50" type="text" id="roadAddrPart1"></td></tr>
							    <tr><td>도로명주소 참고항목</td><td><input size="50" type="text" id="roadAddrPart2"></td></tr>
							    <tr><td>지번 정보</td><td><input size="50" type="text" id="jibunAddr"></td></tr>
							    <tr><td>도로명주소(영문)</td><td><input size="50" type="text" id="engAddr"></td></tr>
							    <tr><td>우편번호</td><td><input size="50" type="text" id="zipNo"></td></tr>
							    <tr><td>행정구역코드</td><td><input size="50" type="text" id="admCd"></td></tr>
							    <tr><td>도로명코드</td><td><input size="50" type="text" id="rnMgtSn"></td></tr>
							    <tr><td>건물관리번호</td><td><input size="50" type="text" id="bdMgtSn"></td></tr>

							    <tr><td>건물명</td><td><input size="50" type="text" id="bdNm"></td></tr>
							    <tr><td>공동주택여부</td><td><input size="50" type="text" id="bdKdcd"></td></tr>
							    <tr><td>시도명</td><td><input size="50" type="text" id="siNm"></td></tr>
							    <tr><td>시군구명</td><td><input size="50" type="text" id="sggNm"></td></tr>
							    <tr><td>읍면동명</td><td><input size="50" type="text" id="emdNm"></td></tr>
							    <tr><td>법정리명</td><td><input size="50" type="text" id="liNm"></td></tr>
							    <tr><td>도로명</td><td><input size="50" type="text" id="rn"></td></tr>
							    <tr><td>지하여부</td><td><input size="50" type="text" id="udrtYn"></td></tr>
							    <tr><td>건물본번</td><td><input size="50" type="text" id="buldMnnm"></td></tr>
							    <tr><td>건물부번</td><td><input size="50" type="text" id="buldSlno"></td></tr>
							    <tr><td>산여부</td><td><input size="50" type="text" id="mtYn"></td></tr>
							    <tr><td>지번본번(번지)</td><td><input size="50" type="text" id="lnbrMnnm"></td></tr>
							    <tr><td>지번부번(호)</td><td><input size="50" type="text" id="lnbrSlno"></td></tr>
							</table>
                        </div>
                    </div>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    Footer
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->


        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- footer include -->
    <jsp:include page="/ec4Footer.do" />

</div>
<!-- ./wrapper -->

        <div class="modal modal-center fade" id="modal-large">
            <div class="modal-dialog modal-large modal-center">
                <div class="modal-content modal-large">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->


        <div class="modal fade" id="modal-default">
            <div class="modal-dialog">
                <div class="modal-content">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

    <form name="popupForm" id="popupForm" method="post">
        <input type="hidden" name="callbackClass"/>
        <input type="hidden" name="selectStyle" value="single"/>
        <input type="hidden" name="testName" value="nameTest"/>
        <input type="hidden" name="testEmail" value="emailTest"/>
    </form>

</body>
</html>
