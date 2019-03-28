<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4VhcleModelController.java
  * @Description : EC4NewVhcleModelList POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2019.01.17    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2019.01.17
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
    <title>차량모델</title>
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

	<script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>
	<link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">
    


<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){
    $(".sidebar-menu").tree();


    // 모델 테이블
    var vhcleTable = $('#vhcleTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "rowId": "vhcleModelId",
        "scrollY": "369px",
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
        /* "ajax" : {
            "url": "/ec4/cmm/cbase/vhi/selectVhcleModelList.do",
            "type": "POST",
            "data": function(c, d){
            	//                                  tr            th        form obj
                c.searchVhctyCode    = d.nTFoot.childNodes[1].childNodes[0].children[0].value;
            	c.searchVhcleModelNm = d.nTFoot.childNodes[1].childNodes[1].children[0].value;
            	c.searchUseAt        = d.nTFoot.childNodes[1].childNodes[2].children[0].value;
            }
        }, */
        "sAjaxSource": "/ec4/cmm/cbase/vhi/selectVhcleModelList.do",
        "fnServerParams": function(aoData){
            aoData.push(
            		/* {"name": "searchVhcleMakrCode", "value": $("#searchVhcleModelForm select[name=searchVhcleMakrCode] option:selected").val()},
            		{"name": "searchVhctyCode",     "value": $("#searchVhcleModelForm select[name=searchVhctyCode] option:selected").val()}, */
            		{"name": "searchVhcleModelNm",  "value": $("#searchVhcleModelForm input[name=searchVhcleModelNm]").val()},
            		{"name": "searchUseAt",         "value": $("#searchVhcleModelForm select[name=searchUseAt] option:selected").val()},
            		{"name": "searchVhctyCode",  "value": $("#searchVhcleModelForm input[name=searchVhctyCode]").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [0]}
        ],
        "columns": [
            {"data":"vhcleModelId" , "defaultContent" : ""},
            /* {"data":"vhcleMakrCode" , "defaultContent" : ""},
            {"data":"vhcleMakrNm" , "defaultContent" : ""}, */
            {"data":"vhctyCode" , "defaultContent" : ""},
            //{"data":"vhctyNm" , "defaultContent" : ""},
            {"data":"vhcleModelNm" , "defaultContent" : ""},
            {"data":"useAt" , "defaultContent" : "", "width":"20%"}
        ]
    });

    // 모델 검색 input search
    $("#searchVhcleModelForm input").on("keyup change", function(key){

        if(key.keyCode == 13){

            vhcleTable.search(this.value).draw();
        }
    });

    // 모델 검색 select search
    $("#searchVhcleModelForm select").on("change", function(key){

        vhcleTable.search(this.value).draw();
    });


     // 모델 선택
    vhcleTable.on("select", function (e, dt, type, indexes) {

        var vfrm = document.vhcleModelVO;
        var rowData = vhcleTable.rows(indexes).data();
        vfrm.vhcleModelId.value   = rowData[0].vhcleModelId;
        /* vfrm.vhcleMakrCode.value  = rowData[0].vhcleMakrCode; */
        vfrm.vhctyCode.value      = rowData[0].vhctyCode;
        vfrm.vhcleModelNm.value   = rowData[0].vhcleModelNm;
        vfrm.useAt.value          = rowData[0].useAt;

    }).on("deselect", function (e, dt, type, indexes) {

        var vfrm = document.vhcleModelVO;
        vfrm.vhcleModelId.value  = "";
        /* vfrm.vhcleMakrCode.value = ""; */
        vfrm.vhctyCode.value     = "";
        vfrm.vhcleModelNm.value  = "";
        vfrm.useAt.value         = "Y";
    });



    // 모델 등록/수정 function
    $("#btnVhcleInsert").click(function(){

    	frm = document.vhcleModelVO;

    	/*
        if(!validateVhcleModelVO(frm)){
            return;
        }
    	*/

        var vhcleModelId = frm.vhcleModelId.value;

        /* if(!frm.vhcleMakrCode.value){

        	alert("제조사를 선택해 주세요");
        	return;
        }

        if(!frm.vhctyCode.value){

        	alert("차종을 선택해 주세요");
        	return;
        } */

        if(!frm.vhcleModelNm.value){

        	alert("모델명을 입력해 주세요");
            return;
        }


        if(!vhcleModelId){

        	// 등록
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/cmm/cbase/vhi/insertVhcleModel.do'/>",
                "data": $("#vhcleModelVO").serialize(),
                "success": function(result) {

                    if(result.isSuccess){

                    	alert(result.message);
                    	vhcleTable.search("").draw();
                    	initVhcleModelVO();
                    } else {

                    	alert(result.message);
                    }
                }
                ,error: function(xhr, status, error){

                    alert(status);
                    return;
                }
            });

        } else {

        	// 수정
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/cmm/cbase/vhi/updateVhcleModel.do'/>",
                "data": $("#vhcleModelVO").serialize(),
                "success": function(result) {

                    if(result.isSuccess){

                        alert(result.message);
                        vhcleTable.search("").draw();
                    } else {

                        alert(result.message);
                    }
                }
                ,error: function(xhr, status, error){

                    alert(status);
                    return;
                }
            });

        }

    });



    // 모델 삭제
    $("#btnVhcleDelete").click(function(){

    	frm = document.vhcleModelVO;

    	var vhcleModelId = frm.vhcleModelId.value;
		
    	if(!vhcleModelId){

    		$('#modal-warning').find(".modal-body p").text("삭제할 모델을 선택해 주세요");
    		$('#modal-warning').modal();
    	}else{

    		if(confirm('<spring:message code="common.delete.msg"/>')){
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/cmm/cbase/vhi/deleteVhcleModel.do'/>",
                    "data": $("#vhcleModelVO").serialize(),
                    "success": function(result) {

                        if(result.isSuccess){

                            alert(result.message);
                            vhcleTable.search("").draw();
                            initVhcleModelVO();
                        } else {

                            alert(result.message);
                        }
                    }
                    ,error: function(xhr, status, error){

                        alert(status);
                        return;
                    }
                });
    		}
    	}
    	
    });


    // 모델 form 신규
    $("#btnVhcleReset").click(function(){

        initVhcleModelVO();
    });



    // 모델 폼 초기화
	function initVhcleModelVO(){

		frm = document.vhcleModelVO;

        frm.vhcleModelId.value = "";
        /* frm.vhcleMakrCode.value = ""; */
        frm.vhctyCode.value = "";
        frm.vhcleModelNm.value = "";
        frm.useAt.value = "Y";
	}
    
    
    
    
    
    
    
    
	
	/* $('#listCstmrTable').onDblClick(function() {
	//$('#listCstmrTable').onCellDoubleClicked(function() {
        alert("xxxxxxxxxxxxxxxxxxxxxxxx");
    }); */
    
    
	/* $('#listCstmrTable').dblclick(function(e, dt, type, indexes){
      alert("vvv=888888888888888======ccccvvvvvvvvvvv");
      var rowData = vhcleTable.rows(indexes).data();
      alert(rowData);
	}); */

});


</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">


			<!-- Main content -->
		    <section class="content">
		    
		    
		    
		    
				<!-- ############################# 검색조건 ######################  -->
				<div class="row">
		            <div class="col-md-12">
		            
		            	<!-- >>>>>>>>>>>> box START -->
		                    <div class="box box-default collapsed-box">
		                        <div class="box-header with-border">
		                            <h3 class="box-title">모델 검색</h3>
		                            <div class="box-tools pull-right">
		                                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
		                            </div>
		                        </div>
		                        <!-- /.box-header -->
		                        <div class="box-body">
			                        <form name="searchVhcleModelForm" id="searchVhcleModelForm" method="post" class="form-horizontal" onsubmit="return false;">
			                            <%-- <div class="form-group">
			                                <label for="searchVhcleMakrCode" class="col-sm-3 control-label">제조사</label>
			                                <div class="col-sm-9">
			                                       <select name="searchVhcleMakrCode" id="searchVhcleMakrCode" class="form-control input-sm">
			                                           <option value="">-- 차종선택 --</option><c:forEach items="${makrCodeList}" var="result" varStatus="status">
			                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
			                                       </select>
			                                </div>
			                            </div>
			                            <div class="form-group">
			                                <label for="searchVhctyCode" class="col-sm-3 control-label">차종</label>
			                                <div class="col-sm-9">
			                                       <select name="searchVhctyCode" id="searchVhctyCode" class="form-control input-sm">
			                                           <option value="">-- 차종선택 --</option><c:forEach items="${modelCodeList}" var="result" varStatus="status">
			                                           <option value="${result.code}">${result.codeNm}</option></c:forEach>
			                                       </select>
			                                </div>
			                            </div> --%>
			                            <div class="form-group">
			                                <label for="searchVhctyCode" class="col-sm-3 control-label">코드</label>
			                                <div class="col-sm-9">
			                                    <input type="text" name="searchVhctyCode" id="searchVhctyCode" placeholder="코드" class="form-control input-sm"/>
			                                </div>
			                            </div>
			                            <div class="form-group">
			                                <label for="searchVhcleModelNm" class="col-sm-3 control-label">모델명</label>
			                                <div class="col-sm-9">
			                                    <input type="text" name="searchVhcleModelNm" id="searchVhcleModelNm" placeholder="모델명" class="form-control input-sm"/>
			                                </div>
			                            </div>
			                            <div class="form-group margin-bottom-none">
			                                <label class="col-sm-3 control-label">사용여부</label>
			                                <div class="col-sm-9">
			                                    <select name="searchUseAt" class="form-control input-sm">
			                                        <option value="">-- 사용여부선택 --</option>
			                                        <option value="Y">사용</option>
			                                        <option value="N">미사용</option>
			                                    </select>
			                                </div>
			                            </div>
			                        </form>
		                        </div>
		                        <!-- /.box-body -->
		                    </div>
		                    <!-- /.box -->
		
		
			                <div class="box">
			                    <div class="box-header with-border">
			                        <h3 class="box-title">모델 목록</h3>
			                    </div>
					            <!-- /.box-header -->
					            <div class="box-body table-responsive">
			                        <table id="vhcleTable" class="table table-hover">
					                    <thead>
					                        <tr>
					                            <th>ID</th>
					                            <!-- <th>제조사코드</th>
					                            <th>제조사</th> -->
					                            <th>코드</th>
					                            <!-- <th>차종</th> -->
					                            <th>모델명</th>
					                            <th>사용여부</th>
					                        </tr>
					                    </thead>
					                </table>
					            </div>
					            <!-- /.box-body -->
			                </div>
			                <!-- /.box -->
		
		
			                <!-- Horizontal Form -->
			                <div class="box box-primary">
			                    <div class="box-header with-border">
			                        <h3 class="box-title">모델</h3>
			                    </div>
			                    <!-- /.box-header -->
			                    <!-- form start -->
			                    <form:form commandName="vhcleModelVO" name="vhcleModelVO" method="post" cssClass="form-horizontal">
			                        <double-submit:preventer/>
				                    <form:hidden path="vhcleModelId"/>
				                    <form:hidden path="vhcleMakrCode" value="MAKER"/>
				                    <div class="box-body">
				                        <%-- <div class="form-group">
				                            <label for="vhcleMakrCode" class="col-sm-3 control-label">제조사</label>
				                            <div class="col-sm-9">
				                                <form:select path="vhcleMakrCode" cssClass="form-control input-sm">
					                                <form:option value="">-- 선택 --</form:option>
				                                    <form:options items="${makrCodeList}" itemValue="code" itemLabel="codeNm"/>
				                                </form:select>
				                                <form:errors path="vhcleMakrCode" />
				                            </div>
				                        </div>
				                        <div class="form-group">
				                            <label for="vhctyCode" class="col-sm-3 control-label">차종</label>
				                            <div class="col-sm-9">
				                                <form:select path="vhctyCode" cssClass="form-control input-sm">
					                                <form:option value="">-- 선택 --</form:option>
				                                    <form:options items="${modelCodeList}" itemValue="code" itemLabel="codeNm"/>
				                                </form:select>
				                                <form:errors path="vhctyCode" />
				                            </div>
				                        </div> --%>
				                        <div class="form-group">
				                            <label for="vhctyCode" class="col-sm-3 control-label">코드</label>
				                            <div class="col-sm-9">
				                                <form:input path="vhctyCode" cssClass="form-control input-sm" maxlength="50"/>
				                                <form:errors path="vhctyCode" />
				                                <!-- 엔터 눌렀을때 submit 방지용 -->
				                                <input type="text" name="dummy01" style="display: none;"/>
				                            </div>
				                        </div>
				                        <div class="form-group">
				                            <label for="vhcleModelNm" class="col-sm-3 control-label">모델명</label>
				                            <div class="col-sm-9">
				                                <form:input path="vhcleModelNm" cssClass="form-control input-sm" maxlength="50"/>
				                                <form:errors path="vhcleModelNm" />
				                                <!-- 엔터 눌렀을때 submit 방지용 -->
				                                <input type="text" name="dummy01" style="display: none;"/>
				                            </div>
				                        </div>
				                        <div class="form-group margin-bottom-none">
				                            <label class="col-sm-3 control-label">사용여부</label>
				                            <div class="col-sm-9">
				                                <form:select path="useAt" cssClass="form-control input-sm">
				                                    <form:option value="Y">사용</form:option>
				                                    <form:option value="N">미사용</form:option>
				                                </form:select>
				                            </div>
				                        </div>
				                    </div>
				                    <!-- /.box-body -->
				                    <div class="box-footer text-right">
				                        <button type="button" id="btnVhcleReset" class="btn btn-sm btn-default">신규</button>
				                        <button type="button" id="btnVhcleInsert" class="btn btn-sm btn-primary">저장</button>
				                        <button type="button" id="btnVhcleDelete" class="btn btn-sm btn-warning">삭제</button>
				                    </div>
				                    <!-- /.box-footer -->
				                </form:form>
				            </div>
				            <!-- /.box -->
		                <!-- <<<<<<<< box THE END -->
		            
		            </div>
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
