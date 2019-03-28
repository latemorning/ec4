<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%
 /**
  * @Class Name : EC4CstmrCmplMng.java
  * @Description : EC4CmplCdScmsPop POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.07.27    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.07.27
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
    <title>불만코드리스트</title>
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

    <!-- ################ 사용자 정의 ################################ -->
    <link rel="stylesheet" type="text/css" href="/css/egovframework/ec4/cmm/ec4common.css">

	<!-- ec4 common -->
	<script src="/js/egovframework/ec4/cmm/ec4common.js"></script>


    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">
    


<script type="text/javaScript" language="javascript" defer="defer">
var clickCnt = 0;

$(document).ready(function(){
	searchInfo();

    
    
   //행삭제
   /*  $("#btnRowDel").click (
         function (){
        	 alert("mmmmmmmmmmmmmmmmmm");
            $(this).parent("tr").remove();
         }
    ); */

    // 조회버튼
    $("button.btn-cnslt-search").click(function(){
    	searchInfo();
    });

    
	
	//대분류
    $(".selectCmpl1").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/call/cmpl/selectScmsCmplCdComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": "0",//$("select[name=vocKnd] option:selected").val(),
   		            "cnsltSeCode": "CNSE040",//$("select[name=codeId] option:selected").val()
   		            "codeNm" : $("input[name=codeNm]").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//중분류
    $(".selectCmpl2").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/call/cmpl/selectScmsCmplCdComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=codeId1] option:selected").val(),
   		            "cnsltSeCode": "CNSE040",//$("select[name=codeId] option:selected").val()
   		         	"codeNm" : $("input[name=codeNm]").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//소분류
    $(".selectCmpl3").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/call/cmpl/selectScmsCmplCdComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=codeId2] option:selected").val(),
   		            "cnsltSeCode": "CNSE040",//$("select[name=codeId] option:selected").val()
   		         	"codeNm" : $("input[name=codeNm]").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
    $("select[name=codeId1]").change(function(){
    	$("select[name=codeId2]").val(null).trigger('change');
    	$("select[name=codeId3]").val(null).trigger('change');
    });	
	
    $("select[name=codeId2]").change(function(){
    	$("select[name=codeId3]").val(null).trigger('change');
    });

});

	function fnRowDel(obj){
		$(obj).parent().parent("tr").remove();
	}


	//화면 oppen 리스트조회시작
	function searchInfo(){
		var codeLv = "";
		var codeVal = "";
		var codeId1Val = $("select[name=codeId1] option:selected").val()==undefined?"":$("select[name=codeId1] option:selected").val();
		var codeId2Val = $("select[name=codeId2] option:selected").val()==undefined?"":$("select[name=codeId2] option:selected").val();
		var codeId3Val = $("select[name=codeId3] option:selected").val()==undefined?"":$("select[name=codeId3] option:selected").val();
		var parntsCodeVal = "0";
		
		if("" != codeId2Val && "" != codeId3Val){
			codeLv = "3";
			codeVal = codeId3Val;
			parntsCodeVal = code2d1Val;
		}else if("" != codeId2Val && "" == codeId3Val){
			codeLv = "2";
			codeVal = codeId2Val;
			parntsCodeVal = codeId1Val;
		}else if("" != codeId1Val && "" == codeId2Val){
			codeLv = "1";
			codeVal = codeId1Val;
			parntsCodeVal = "0";
		}
		console.log("parntsCodeVal["+parntsCodeVal+"] codeVal["+codeVal+"] codeLv["+codeLv+"] codeId1Val["+codeId1Val+"] codeId2Val["+codeId2Val+"] codeId3Val["+codeId3Val+"] ");
		
		//데이터 테이블 초기화
		$('#listcmplCdTable').DataTable().clear().destroy();
		//$('#listcmplCdTable').DataTable().draw();

        // 테이블
        var listcmplCdTable = $('#listcmplCdTable').DataTable({
            "language": lang_kor,
            "select": {
                "style": "single"//"${cstmrCmplMngVO.selectStyle}"
            },
            "rowId": "code",
            "scrollY": "369px",
            //"scrollY": "250px",
            "pageLength": 10,
            "pagingType": "full_numbers",
            "bPaginate": true,
            "bLengthChange": true,
            "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
            "responsive": true,
            "processing": true,
            "ordering": true,
            "searching": false,
            "bServerSide": true,
            "sAjaxSource": "/ec4/call/cmpl/selectScmsCmplCdList.do",
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "searchParntsCodeId", "value": parntsCodeVal},
                        {"name": "searchCodeId", "value": codeVal},
                        {"name": "searchCnsltSeCode", "value": "CNSE040"},
                        {"name": "codeLv", "value": codeLv},
                        {"name": "codeNm", "value": $("input[name=codeNm]").val()}
                );
            },
            "sServerMethod": "POST",
            /* "columnDefs": [
                {"visible": false, "targets": [0]},
                {"orderable": false, "targets": [0]}
            ], */
            "columns": [
                {"data":"codeNm" , "defaultContent" : ""},
                {"data":"codeNmLv2" , "defaultContent" : ""},
                {"data":"codeNmLv3" , "defaultContent" : ""},
                {"data":"codeNmLv4" , "defaultContent" : ""}
            ]
        });
        
        $('#listcmplCdTable tbody').on('dblclick', 'tr', function () {
        	clickCnt++;
        	var idx = $(this).index();
        	var rowData = listcmplCdTable.rows(idx).data();

        	var txtCodeId = rowData[0].codeId+"/"+rowData[0].codeIdLv2+"/"+rowData[0].codeIdLv3+"/"+rowData[0].codeIdLv4;
        	var txtCodeNm = rowData[0].codeNm+"/"+rowData[0].codeNmLv2+"/"+rowData[0].codeNmLv3+"/"+rowData[0].codeNmLv4;
        	var cmplLevel = "";
        	if("" != rowData[0].codeNmLv4){
        		txtCodeNm = rowData[0].codeNmLv4;
        		cmplLevel = "4";
        	}else if("" != rowData[0].codeNmLv3){
        		txtCodeNm = rowData[0].codeNmLv3;
        		cmplLevel = "3";
        	}else if("" != rowData[0].codeNmLv2){
        		txtCodeNm = rowData[0].codeNmLv2;
        		cmplLevel = "2";
        	}else if("" != rowData[0].codeNmLv1){
        		txtCodeNm = rowData[0].codeNmLv1;
        		cmplLevel = "1";
        	}
        	


        	opener.$("#cmplCd1No").val(rowData[0].codeId);
        	opener.$("#cmplCd2No").val(rowData[0].codeIdLv2);
        	opener.$("#cmplCd3No").val(rowData[0].codeIdLv3);
        	opener.$("#cmplCd4No").val(rowData[0].codeIdLv4);
        	opener.$("#cmplCd1Nm").val(rowData[0].codeNm);
        	opener.$("#cmplCd2Nm").val(rowData[0].codeNmLv2);
        	opener.$("#cmplCd3Nm").val(rowData[0].codeNmLv3);
        	opener.$("#cmplCd4Nm").val(rowData[0].codeNmLv4);
        	opener.$("#cmplCdLvl").val(cmplLevel);
        	opener.$("#cmplCd").val(txtCodeId);
        	opener.$("#cmplCdNm").val(txtCodeNm);
        	
        	self.close();
        } );        
	}//화면 oppen 리스트조회 끝


	
	
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">




<!-- Main content -->
    <section class="content">
    
	
		<form name="actionForm" method="post" >
			<input type="hidden" name="cmplCd1No"/>
			<input type="hidden" name="cmplCd2No"/>
			<input type="hidden" name="cmplCd3No"/>
			<input type="hidden" name="cmplCd4No"/>
			<input type="hidden" name="cmplCdLvl"/>
			<input type="hidden" name="cmplCd1Nm"/>
			<input type="hidden" name="cmplCd2Nm"/>
			<input type="hidden" name="cmplCd3Nm"/>
			<input type="hidden" name="cmplCd4Nm"/>
		</form>
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
                    <div class="text-right">
                        <button type="button" id="btnSearch" class="btn btn-sm btn-primary btn-cnslt-search" data-level="4"><spring:message code="button.search"/></button>
                        <%-- <button type="button" id="btnApply" class="btn btn-sm btn-primary btn-cnslt-apply" data-level="4"><spring:message code="button.apply"/></button> --%>
                    </div>
                    <div class="box box-default collapsed-box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-search"></i>분류별 검색</h3>
                            <div class="box-tools pull-right">
                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
                            </div>
                        </div>
                        <!-- /.box-header -->
                        <form:form commandName="cnsltTypeVO" name="cnsltTypeVO" method="post" cssClass="form-horizontal">
                        <double-submit:preventer/>
                        <div class="box-body">
                            <form name="searchCmplCodeForm" id="searchCmplCodeForm" method="post" class="form-horizontal" onsubmit="return false;">
                                <div class="form-group">
                                    <label for="codeId1" class="col-sm-2 control-label">대분류</label>
                                    <div class="col-sm-10">
                                        <form:select path="codeId1" cssClass="form-control input-sm selectCmpl1">
                                            <form:options items="${codeList}" itemValue="codeId" itemLabel="codeNm"/>
                                        </form:select>
                                        <form:errors cssClass="help-block" path="codeId" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="codeId2" class="col-sm-2 control-label">중분류</label>
                                    <div class="col-sm-10">
                                        <form:select path="codeId2" cssClass="form-control input-sm selectCmpl2">
                                            <form:options items="${codeList}" itemValue="codeId" itemLabel="codeNm"/>
                                        </form:select>
                                        <form:errors cssClass="help-block" path="codeId" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="codeId3" class="col-sm-2 control-label">소분류</label>
                                    <div class="col-sm-10">
                                        <form:select path="codeId3" cssClass="form-control input-sm selectCmpl3">
                                            <form:options items="${codeList}" itemValue="codeId" itemLabel="codeNm"/>
                                        </form:select>
                                        <form:errors cssClass="help-block" path="codeId" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="codeNm" class="col-sm-2 control-label">불만코드명</label>
                                    <div class="col-sm-10">
                                        <input type="text" name="codeNm" id="codeNm" placeholder="불만코드명" class="form-control input-sm"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                        </form:form>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border bg-info">
                    	<h3 class="box-title">불만코드리스트</h3>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal">
						  	
		                    <div class="form-group">
		                    	<div class="col-sm-12 dstick">
							          <table id="listcmplCdTable" class="table table-hover">
							            <thead>
							              <tr>
							                <th>대분류</th>
							                <th>중분류</th>
							                <th>소분류</th>
							                <th>불만코드명</th>
							              </tr>
							            </thead>
							            <tbody>
							          	</tbody>
							          </table>
		                    	</div>
		                    </div>	
		                    


                    </form>
                    </div>
                    <!-- /.box-body THE END -->

                    
                </div>
                <!-- <<<<<<<< box THE END -->
            
            </div>
        </div>


      
      
      
      
      
      
      
      
      	<div class="row">
        	<div class="col-md-12"> <!-- DIV 가로영역을 나누는 용도 -->
			
        	</div>
      </div>
      <!-- /.row -->








    </section>
    <!-- /.content -->


	    <form name="popupForm" method="post">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	    </form>

</body>
</html>
