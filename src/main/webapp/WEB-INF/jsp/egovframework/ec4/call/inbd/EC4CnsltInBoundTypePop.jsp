<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CstmrIntgrMng.java
  * @Description : EC4CnsltInBoundTypePop POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.07.12    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.07.12
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
    <title>상담유형리스트</title>
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
var clickCnt = 0;
var cnsltTypeTable1;
var cnsltTypeTable2;
var cnsltTypeTable3;
var cnsltTypeTable4;

$(document).ready(function(){
	searchInfo();


    // 상담유형 테이블
    cnsltTypeTable1 = $('#cnsltTypeTable1').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 1, "asc" ]],    // 기본 정렬
        "rowId": "codeId",
        "scrollY": "369px",
        //"pageLength": 10,             // 페이징 관련
        //"pagingType": "full_numbers", // 페이징 관련
        "bPaginate": false,             // 페이징
        //"bLengthChange": true,        // 페이징 관련
        //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],   // 페이징 관련
        "responsive": true,     // 반응형 화면크기 조절시
        "processing": true,
        "ordering": false,      // 필드 정렬
        "searching": false,     // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchParntsCodeId", "value": "0"},
                    {"name": "searchCnsltSeCode", "value": "CNSE020"}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": []}
        ],
        "aoColumns": [
        	{"data": "codeId"},
            {"data": "codeNm"},
            {"data": "sortOrdr", "defaultContent": ""},
            {"data": "useAt"} 
        ]
    });


    // 상담유형 테이블2
    cnsltTypeTable2 = $('#cnsltTypeTable2').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 2, "asc" ]],    // 기본 정렬
        "rowId": "codeId",
        "scrollY": "369px",
        "bPaginate": false,         // 페이징
        "responsive": true,         // 반응형 화면크기 조절시
        "processing": true,
        "ordering": false,          // 필드 정렬
        "searching": false,         // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
        "fnServerParams": function(aoData, a, b){
            aoData.push(
                    {"name": "searchParntsCodeId", "value": document.actionForm.codeId1.value},
                    {"name": "searchCnsltSeCode",   "value": "CNSE020"}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": []}
        ],
        "aoColumns": [
            {"data": "codeId"},
            {"data": "codeNm"},
            {"data": "sortOrdr", "defaultContent": ""},
            {"data": "useAt"}
        ]
    });


    // 상담유형 테이블3
    cnsltTypeTable3 = $('#cnsltTypeTable3').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 2, "asc" ]],    // 기본 정렬
        "rowId": "codeId",
        "scrollY": "369px",
        "bPaginate": false,         // 페이징
        "responsive": true,         // 반응형 화면크기 조절시
        "processing": true,
        "ordering": false,          // 필드 정렬
        "searching": false,         // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
        "fnServerParams": function(aoData, a, b){
            aoData.push(
                    {"name": "searchParntsCodeId", "value": document.actionForm.codeId2.value},
                    {"name": "searchCnsltSeCode",   "value": "CNSE020"}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": []}
        ],
        "aoColumns": [
            {"data": "codeId"},
            {"data": "codeNm"},
            {"data": "sortOrdr", "defaultContent": ""},
            {"data": "useAt"}
        ]
    });


    // 상담유형 테이블4
    cnsltTypeTable4 = $('#cnsltTypeTable4').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 2, "asc" ]],    // 기본 정렬
        "rowId": "codeId",
        "scrollY": "369px",
        "bPaginate": false,         // 페이징
        "responsive": true,         // 반응형 화면크기 조절시
        "processing": true,
        "ordering": false,          // 필드 정렬
        "searching": false,         // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/cmm/cbase/ctm/selectCnsltTypeList.do'/>",
        "fnServerParams": function(aoData, a, b){
            aoData.push(
                    {"name": "searchParntsCodeId", "value": document.actionForm.codeId3.value},
                    {"name": "searchCnsltSeCode",   "value": "CNSE020"}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": []}
        ],
        "aoColumns": [
            {"data": "codeId"},
            {"data": "codeNm"},
            {"data": "sortOrdr", "defaultContent": ""},
            {"data": "useAt"}
        ]
    });


    // 상담유형 선택1
    var rowDataType1;
    cnsltTypeTable1.on("select", function (e, dt, type, indexes) {
    	rowDataType1 = dt.rows(indexes).data();
    	var rowData = dt.rows(indexes).data();
    	document.actionForm.codeId1.value = rowData[0].codeId;
    	document.actionForm.codeId2.value = "";
    	document.actionForm.codeId3.value = "";
    	document.actionForm.codeLevel.value = "2";
    	document.actionForm.codeNm1.value = rowData[0].codeNm;
    	document.actionForm.codeNm2.value = "";
    	document.actionForm.codeNm3.value = "";
    	fn_all_grid_reload();
    }).on("deselect", function (e, dt, type, indexes) {

        document.actionForm.codeId1.value = "";
        document.actionForm.codeId2.value = "";
        document.actionForm.codeId3.value = "";
        document.actionForm.codeLevel.value = "2";
    	document.actionForm.codeNm1.value = "";
    	document.actionForm.codeNm2.value = "";
    	document.actionForm.codeNm3.value = "";
        fn_all_grid_reload();
    }).on("dblclick", function (e, dt, type, indexes) {//dblclick 해당 부분은 rowDataType 번호만 다를뿐 유형LV 모두 적용되어있다 
		var rowData = rowDataType1;
        var codeId1 = rowData[0].codeId;
        var codeId2 = "";
        var codeId3 = "";
        var codeId4 = "";

        var codeNm1 = rowData[0].codeNm;
        var codeNm2 = "";
        var codeNm3 = "";
        var codeNm4 = "";
        
	
    	clickCnt++;

    	var txtCodeId = codeId1;//체크용
    	var txtCodeNm = codeNm1;//화면표시용
    	//alert(txtCodeId+"/"+txtCodeNm);
    	var addChkCnt = 0;
		$('#popTypeForm input[name=codeId]').each(function(idx){
			var chkTxt = "";
		    chkTxt = $("#popTypeForm input[name=codeId]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
		    //$("[name=arrGroupId]").eq(index).val();
		    
		    //console.log(txtCodeId+"/"+chkTxt);
		    if(txtCodeId == chkTxt){
		    	alert("이미 선택된 항목입니다.");
		    	addChkCnt++;
		    	return;
		    }
		});


		if(addChkCnt==0){
			var txtTrHtml = '<tr>'+
								'<input type="hidden" name="codeId" id="codeId" value="'+codeId1+'" />'+
								'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+codeId2+'" />'+
								'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+codeId3+'" />'+
								'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+codeId4+'" />'+
								'<input type="hidden" name="codeNm" id="codeNm" value="'+codeNm1+'" />'+
								'<input type="hidden" name="codeNmLv2" id="codeNmLv2" value="'+codeNm2+'" />'+
								'<input type="hidden" name="codeNmLv3" id="codeNmLv3" value="'+codeNm3+'" />'+
								'<input type="hidden" name="codeNmLv4" id="codeNmLv4" value="'+codeNm4+'" />';
				txtTrHtml += 	'<td>'+txtCodeNm+'</td>';
				txtTrHtml += 	'<td><input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/></td>';
				txtTrHtml += '</tr>'
			$("#listSelectCnsltTypeTable > tbody:last").append(txtTrHtml);
		}
	});


    // 상담유형 선택2
    var rowDataType2;
    cnsltTypeTable2.on("select", function (e, dt, type, indexes) {
    	rowDataType2 = dt.rows(indexes).data();
        var rowData = dt.rows(indexes).data();
        document.actionForm.codeId2.value = rowData[0].codeId;
        document.actionForm.codeId3.value = "";
        document.actionForm.codeLevel.value = "3";
        document.actionForm.codeNm2.value = rowData[0].codeNm;
        document.actionForm.codeNm3.value = "";
        fn_all_grid_reload();
    }).on("deselect", function (e, dt, type, indexes) {

        document.actionForm.codeId2.value = "";
        document.actionForm.codeId3.value = "";
        document.actionForm.codeLevel.value = "3";
        document.actionForm.codeNm2.value = "";
        document.actionForm.codeNm3.value = "";
        fn_all_grid_reload();
    }).on("dblclick", function (e, dt, type, indexes) {
		var rowData = rowDataType2;
        var codeId1 = document.actionForm.codeId1.value;
        var codeId2 = rowData[0].codeId;
        var codeId3 = "";
        var codeId4 = "";

        var codeNm1 = document.actionForm.codeNm1.value;
        var codeNm2 = rowData[0].codeNm;
        var codeNm3 = "";
        var codeNm4 = "";
        
	
    	clickCnt++;

    	var txtCodeId = codeId1+codeId2;//체크용 
    	var txtCodeNm = codeNm1+" - "+codeNm2;//화면표시용
    	//alert(txtCodeId+"/"+txtCodeNm);
    	var addChkCnt = 0;
		$('#popTypeForm input[name=codeId]').each(function(idx){
			var chkTxt = "";
		    chkTxt = $("#popTypeForm input[name=codeId]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
		    //$("[name=arrGroupId]").eq(index).val();
		    
		    //console.log(txtCodeId+"/"+chkTxt);
		    if(txtCodeId == chkTxt){
		    	alert("이미 선택된 항목입니다.");
		    	addChkCnt++;
		    	return;
		    }
		});


		if(addChkCnt==0){
			var txtTrHtml = '<tr>'+
								'<input type="hidden" name="codeId" id="codeId" value="'+codeId1+'" />'+
								'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+codeId2+'" />'+
								'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+codeId3+'" />'+
								'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+codeId4+'" />'+
								'<input type="hidden" name="codeNm" id="codeNm" value="'+codeNm1+'" />'+
								'<input type="hidden" name="codeNmLv2" id="codeNmLv2" value="'+codeNm2+'" />'+
								'<input type="hidden" name="codeNmLv3" id="codeNmLv3" value="'+codeNm3+'" />'+
								'<input type="hidden" name="codeNmLv4" id="codeNmLv4" value="'+codeNm4+'" />';
				txtTrHtml += 	'<td>'+txtCodeNm+'</td>';
				txtTrHtml += 	'<td><input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/></td>';
				txtTrHtml += '</tr>'
			$("#listSelectCnsltTypeTable > tbody:last").append(txtTrHtml);
		}
	});


    // 상담유형 선택3
    var rowDataType3;
    cnsltTypeTable3.on("select", function (e, dt, type, indexes) {
    	rowDataType3 = dt.rows(indexes).data();
        var rowData = dt.rows(indexes).data();
        document.actionForm.codeId3.value = rowData[0].codeId;
        document.actionForm.codeLevel.value = "4";
        document.actionForm.codeNm3.value = rowData[0].codeNm;
        fn_all_grid_reload();
    }).on("deselect", function (e, dt, type, indexes) {

        document.actionForm.codeId3.value = "";
        document.actionForm.codeLevel.value = "4";
        document.actionForm.codeNm3.value = "";
        fn_all_grid_reload();
    }).on("dblclick", function (e, dt, type, indexes) {
		var rowData = rowDataType3;
        var codeId1 = document.actionForm.codeId1.value;
        var codeId2 = document.actionForm.codeId2.value;
        var codeId3 = rowData[0].codeId;
        var codeId4 = "";

        var codeNm1 = document.actionForm.codeNm1.value;
        var codeNm2 = document.actionForm.codeNm2.value;
        var codeNm3 = rowData[0].codeNm;
        var codeNm4 = "";
        
	
    	clickCnt++;

    	var txtCodeId = codeId1+codeId2+codeId3;//체크용
    	var txtCodeNm = codeNm1+" - "+codeNm2+" - "+codeNm3;//화면표시용
    	//alert(txtCodeId+"/"+txtCodeNm);
    	var addChkCnt = 0;
		$('#popTypeForm input[name=codeId]').each(function(idx){
			var chkTxt = "";
		    chkTxt = $("#popTypeForm input[name=codeId]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
		    chkTxt += $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
		    //$("[name=arrGroupId]").eq(index).val();
		    
		    //console.log(txtCodeId+"/"+chkTxt);
		    if(txtCodeId == chkTxt){
		    	alert("이미 선택된 항목입니다.");
		    	addChkCnt++;
		    	return;
		    }
		});


		if(addChkCnt==0){
			var txtTrHtml = '<tr>'+
								'<input type="hidden" name="codeId" id="codeId" value="'+codeId1+'" />'+
								'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+codeId2+'" />'+
								'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+codeId3+'" />'+
								'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+codeId4+'" />'+
								'<input type="hidden" name="codeNm" id="codeNm" value="'+codeNm1+'" />'+
								'<input type="hidden" name="codeNmLv2" id="codeNmLv2" value="'+codeNm2+'" />'+
								'<input type="hidden" name="codeNmLv3" id="codeNmLv3" value="'+codeNm3+'" />'+
								'<input type="hidden" name="codeNmLv4" id="codeNmLv4" value="'+codeNm4+'" />';
				txtTrHtml += 	'<td>'+txtCodeNm+'</td>';
				txtTrHtml += 	'<td><input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/></td>';
				txtTrHtml += '</tr>'
			$("#listSelectCnsltTypeTable > tbody:last").append(txtTrHtml);
		}
	});


    // 상담유형 선택4
    var rowDataType4;
    cnsltTypeTable4.on("select", function (e, dt, type, indexes) {
    	rowDataType4 = dt.rows(indexes).data();
    }).on("dblclick", function (e, dt, type, indexes) {
			var rowData = rowDataType4;
	        var codeId1 = document.actionForm.codeId1.value;
	        var codeId2 = document.actionForm.codeId2.value;
	        var codeId3 = document.actionForm.codeId3.value;
	        var codeId4 = rowData[0].codeId;

	        var codeNm1 = document.actionForm.codeNm1.value;
	        var codeNm2 = document.actionForm.codeNm2.value;
	        var codeNm3 = document.actionForm.codeNm3.value;
	        var codeNm4 = rowData[0].codeNm;
	        
    	
        	clickCnt++;

        	var txtCodeId = codeId1+codeId2+codeId3+codeId4;//체크용
        	var txtCodeNm = codeNm1+" - "+codeNm2+" - "+codeNm3+" - "+codeNm4;//화면표시용
        	//alert(txtCodeId+"/"+txtCodeNm);
        	var addChkCnt = 0;
			$('#popTypeForm input[name=codeId]').each(function(idx){
				var chkTxt = "";
			    chkTxt = $("#popTypeForm input[name=codeId]").eq(idx).val();
			    chkTxt += $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
			    chkTxt += $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
			    chkTxt += $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
			    //$("[name=arrGroupId]").eq(index).val();
			    
			    //console.log(txtCodeId+"/"+chkTxt);
			    if(txtCodeId == chkTxt){
			    	alert("이미 선택된 항목입니다.");
			    	addChkCnt++;
			    	return;
			    }
			});


			if(addChkCnt==0){
				var txtTrHtml = '<tr>'+
									'<input type="hidden" name="codeId" id="codeId" value="'+codeId1+'" />'+
									'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+codeId2+'" />'+
									'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+codeId3+'" />'+
									'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+codeId4+'" />'+
									'<input type="hidden" name="codeNm" id="codeNm" value="'+codeNm1+'" />'+
									'<input type="hidden" name="codeNmLv2" id="codeNmLv2" value="'+codeNm2+'" />'+
									'<input type="hidden" name="codeNmLv3" id="codeNmLv3" value="'+codeNm3+'" />'+
									'<input type="hidden" name="codeNmLv4" id="codeNmLv4" value="'+codeNm4+'" />';
					txtTrHtml += 	'<td>'+txtCodeNm+'</td>';
					txtTrHtml += 	'<td><input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/></td>';
					txtTrHtml += '</tr>'
				$("#listSelectCnsltTypeTable > tbody:last").append(txtTrHtml);
			}
			/* if(addChkCnt==0){
            	var grid;
            	if(clickCnt == 1){
        			grid = $("#listSelectCnsltTypeTable").DataTable({
        	            "language": lang_kor,
        	            //"rowId": "code",
        	            //"scrollY": "250px",
        	            //"pageLength": 10,
        	            //"pagingType": "full_numbers",
        	            "bPaginate": false,
        	            "bLengthChange": false,
        	            //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
        	            "responsive": false,
        	            //"processing": true,
        	            "ordering": false,
        	            "searching": false,
        	            "bServerSide": false
        			});
            	}else{
        			grid = $("#listSelectCnsltTypeTable").DataTable();
            	}
    			//grid.rows().remove().draw();
    			grid.row.add([
    								'<input type="hidden" name="codeId" id="codeId" value="'+codeId1+'" />'+
    								'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+codeId2+'" />'+
    								'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+codeId3+'" />'+
    								'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+codeId4+'" />'+
    			    				txtCodeNm,
    			    				'<input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/>'
    			    				]).draw();
        	} */
        	
    });
    
    
   //행삭제
   /*  $("#btnRowDel").click (
         function (){
        	 alert("mmmmmmmmmmmmmmmmmm");
            $(this).parent("tr").remove();
         }
    ); */


    // 적용버튼
    $("button.btn-cnslt-apply2").click(function(){

        if(confirm('<spring:message code="common.apply.msg"/>')){
			var chkTxt = "";
			var chkTxtCode = "";
			var chkCnt = 0;
			var items = [];
			var rtnItems = new Array();
			$('#popTypeForm input[name=codeId]').each(function(idx){
		       	items.push(
		       		[
		    		$("#popTypeForm input[name=codeId]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeIdLv2]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeIdLv3]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeIdLv4]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeNm]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeNmLv2]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeNmLv3]").eq(idx).val(),
			    	$("#popTypeForm input[name=codeNmLv4]").eq(idx).val()
			    	]
		       	);
		       	
		       	if("" == $("#popTypeForm input[name=codeNmLv4]").eq(idx).val()){
		       		if("" == $("#popTypeForm input[name=codeNmLv3]").eq(idx).val()){
		       			if("" == $("#popTypeForm input[name=codeNmLv2]").eq(idx).val()){
		       				if("" == $("#popTypeForm input[name=codeNm]").eq(idx).val()){
		       				}else{
		       					if(chkCnt == 0){
		       					    chkTxt = $("#popTypeForm input[name=codeNm]").eq(idx).val();
		       					 	chkTxtCode = $("#popTypeForm input[name=codeId]").eq(idx).val();
		       					}else{
		       					    chkTxt += "/" + $("#popTypeForm input[name=codeNm]").eq(idx).val();
		       					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeId]").eq(idx).val();
		       					}
		       				}
		       			}else{
		    				if(chkCnt == 0){
		    				    chkTxt = $("#popTypeForm input[name=codeNmLv2]").eq(idx).val();
	       					 	chkTxtCode = $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    				}else{
		    				    chkTxt += "/" + $("#popTypeForm input[name=codeNmLv2]").eq(idx).val();
	       					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    				}
		       			}
		       		}else{
						if(chkCnt == 0){
						    chkTxt = $("#popTypeForm input[name=codeNmLv3]").eq(idx).val();
       					 	chkTxtCode = $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
						}else{
						    chkTxt += "/" + $("#popTypeForm input[name=codeNmLv3]").eq(idx).val();
       					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
						}
		       		}
		       	}else{
					if(chkCnt == 0){
					    chkTxt = $("#popTypeForm input[name=codeNmLv4]").eq(idx).val();
   					 	chkTxtCode = $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
					}else{
					    chkTxt += "/" + $("#popTypeForm input[name=codeNmLv4]").eq(idx).val();
   					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
					}
		       	}
		       	
			    chkCnt++;
			});
			opener.rtnCnsltTypeList(items);
        	opener.$("#cnsltTyCn").val(chkTxt);
        	opener.$("#cnsltTyCnCode").val(chkTxtCode);
        	
        	
        	self.close();
        }
    });
    $("button.btn-cnslt-apply").click(function(){

        if(confirm('<spring:message code="common.apply.msg"/>')){
			var chkTxt = "";
			var chkTxtCode = "";
			var chkCnt = 0;
			var items = [];
			var rtnItems = new Array();
			$('#popTypeForm input[name=codeId]').each(function(idx){
		       	items.push(
			    	{
		    		"codeId" : $("#popTypeForm input[name=codeId]").eq(idx).val(),
			    	"codeIdLv2" : $("#popTypeForm input[name=codeIdLv2]").eq(idx).val(),
			    	"codeIdLv3" : $("#popTypeForm input[name=codeIdLv3]").eq(idx).val(),
			    	"codeIdLv4" : $("#popTypeForm input[name=codeIdLv4]").eq(idx).val(),
			    	"codeNm" : $("#popTypeForm input[name=codeNm]").eq(idx).val(),
			    	"codeNmLv2" : $("#popTypeForm input[name=codeNmLv2]").eq(idx).val(),
			    	"codeNmLv3" : $("#popTypeForm input[name=codeNmLv3]").eq(idx).val(),
			    	"codeNmLv4" : $("#popTypeForm input[name=codeNmLv4]").eq(idx).val(),
			    	"sortOrdr" : 20,
			    	"useAt" : "N"
			    	}
		       	);
		       	
		       	if("" == $("#popTypeForm input[name=codeNmLv4]").eq(idx).val()){
		       		if("" == $("#popTypeForm input[name=codeNmLv3]").eq(idx).val()){
		       			if("" == $("#popTypeForm input[name=codeNmLv2]").eq(idx).val()){
		       				if("" == $("#popTypeForm input[name=codeNm]").eq(idx).val()){
		       				}else{
		       					if(chkCnt == 0){
		       					    chkTxt = $("#popTypeForm input[name=codeNm]").eq(idx).val();
		       					 	chkTxtCode = $("#popTypeForm input[name=codeId]").eq(idx).val();
		       					}else{
		       					    chkTxt += "/" + $("#popTypeForm input[name=codeNm]").eq(idx).val();
		       					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeId]").eq(idx).val();
		       					}
		       				}
		       			}else{
		    				if(chkCnt == 0){
		    				    chkTxt = $("#popTypeForm input[name=codeNmLv2]").eq(idx).val();
	       					 	chkTxtCode = $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    				}else{
		    				    chkTxt += "/" + $("#popTypeForm input[name=codeNmLv2]").eq(idx).val();
	       					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
		    				}
		       			}
		       		}else{
						if(chkCnt == 0){
						    chkTxt = $("#popTypeForm input[name=codeNmLv3]").eq(idx).val();
       					 	chkTxtCode = $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
						}else{
						    chkTxt += "/" + $("#popTypeForm input[name=codeNmLv3]").eq(idx).val();
       					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
						}
		       		}
		       	}else{
					if(chkCnt == 0){
					    chkTxt = $("#popTypeForm input[name=codeNmLv4]").eq(idx).val();
   					 	chkTxtCode = $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
					}else{
					    chkTxt += "/" + $("#popTypeForm input[name=codeNmLv4]").eq(idx).val();
   					 	chkTxtCode += "/" + $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
					}
		       	}
		       	
			    chkCnt++;
			});
			rtnItems = {"aaData" : items, "iTotalRecords" : chkCnt, "iTotalDisplayRecords" : chkCnt, "sEcho" : "1"};
			//opener.rtnCnsltTypeListData(rtnItems);
			opener.rtnCnsltTypeListData(items);
        	opener.$("#cnsltTyCn").val(chkTxt);
        	opener.$("#cnsltTyCnCode").val(chkTxtCode);
        	
        	
        	self.close();
        }
    });

});

	function fnRowDel(obj){
		$(obj).parent().parent("tr").remove();
	}


	//화면 oppen 리스트조회시작
	function searchInfo(){

        // 테이블
        var listCnsltTypeTable = $('#listCnsltTypeTable').DataTable({
            "language": lang_kor,
            "select": {
                "style": "${cnsltTypeVO.selectStyle}"
            },
            "rowId": "code",
            //"scrollY": "369px",
            "scrollY": "250px",
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
            "sAjaxSource": "/ec4/cmm/cbase/ctm/selectCallCnsltTypeList.do",
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "searchParntsCodeId", "value": "0"},
                        {"name": "searchCnsltSeCode", "value": "CNSE020"}
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
        
        $('#listCnsltTypeTable tbody').on('dblclick', 'tr', function () {
        	clickCnt++;
        	var idx = $(this).index();
        	var rowData = listCnsltTypeTable.rows(idx).data();
        	//opener.$("#searchCstmrCd").val(rowData[0].cstmrCd);
        	//opener.$("#searchCstmrNm").val(rowData[0].cstmrNm);
        	//opener.$("#searchHpno").val(rowData[0].hpno);

        	var txtCodeId = rowData[0].codeId+rowData[0].codeIdLv2+rowData[0].codeIdLv3+rowData[0].codeIdLv4;//체크용
        	var txtCodeNm = rowData[0].codeNm+" - "+rowData[0].codeNmLv2+" - "+rowData[0].codeNmLv3+" - "+rowData[0].codeNmLv4;//화면표시용
        	
        	/* //$('#listSelectCnsltTypeTable').append('<tr><td>'+txtCodeNm+'</td><td><button>삭제</button></td></tr>');
        	var txtAddTr = '<tr>';
        		txtAddTr += '	<input type="text" name="" id="" value="sdasdagggggggggggg" />';
        		txtAddTr += '	<td>'+txtCodeNm+'</td>';
        		txtAddTr += '	<td><button>삭제</button></td>';
        		txtAddTr += '</tr>';
        		console.log(txtAddTr);
        	//$('#listSelectCnsltTypeTable > tbody:last').append(txtAddTr);
        	//$('#listSelectCnsltTypeTable').append(txtAddTr); */
        	
        	
			//$("input[name=arr2ApprEmpNm]", opener.document).eq(rownum).val(arrUserName);
        	
        	var addChkCnt = 0;
			$('#popTypeForm input[name=codeId]').each(function(idx){
				var chkTxt = "";
			    chkTxt = $("#popTypeForm input[name=codeId]").eq(idx).val();
			    chkTxt += $("#popTypeForm input[name=codeIdLv2]").eq(idx).val();
			    chkTxt += $("#popTypeForm input[name=codeIdLv3]").eq(idx).val();
			    chkTxt += $("#popTypeForm input[name=codeIdLv4]").eq(idx).val();
			    //$("[name=arrGroupId]").eq(index).val();
			    
			    //console.log(txtCodeId+"/"+chkTxt);
			    if(txtCodeId == chkTxt){
			    	alert("이미 선택된 항목입니다.");
			    	addChkCnt++;
			    	return;
			    }
			});        	

			if(addChkCnt==0){
				var txtTrHtml = '<tr>'+
									'<input type="hidden" name="codeId" id="codeId" value="'+rowData[0].codeId+'" />'+
									'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+rowData[0].codeIdLv2+'" />'+
									'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+rowData[0].codeIdLv3+'" />'+
									'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+rowData[0].codeIdLv4+'" />'+
									'<input type="hidden" name="codeNm" id="codeNm" value="'+rowData[0].codeNm+'" />'+
									'<input type="hidden" name="codeNmLv2" id="codeNmLv2" value="'+rowData[0].codeNmLv2+'" />'+
									'<input type="hidden" name="codeNmLv3" id="codeNmLv3" value="'+rowData[0].codeNmLv3+'" />'+
									'<input type="hidden" name="codeNmLv4" id="codeNmLv4" value="'+rowData[0].codeNmLv4+'" />';
					txtTrHtml += 	'<td>'+txtCodeNm+'</td>';
					txtTrHtml += 	'<td><input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/></td>';
					txtTrHtml += '</tr>'
				$("#listSelectCnsltTypeTable > tbody:last").append(txtTrHtml);
			}

			/* return;
        	if(addChkCnt==0){
            	var grid;
            	if(clickCnt == 1){
        			grid = $("#listSelectCnsltTypeTable").DataTable({
        	            "language": lang_kor,
        	            //"rowId": "code",
        	            //"scrollY": "250px",
        	            //"pageLength": 10,
        	            //"pagingType": "full_numbers",
        	            "bPaginate": false,
        	            "bLengthChange": false,
        	            //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
        	            "responsive": false,
        	            //"processing": true,
        	            "ordering": false,
        	            "searching": false,
        	            "bServerSide": false
        			});
            	}else{
        			grid = $("#listSelectCnsltTypeTable").DataTable();
            	}
    			//grid.rows().remove().draw();
    			grid.row.add([
    								'<input type="hidden" name="codeId" id="codeId" value="'+rowData[0].codeId+'" />'+
    								'<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="'+rowData[0].codeIdLv2+'" />'+
    								'<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="'+rowData[0].codeIdLv3+'" />'+
    								'<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="'+rowData[0].codeIdLv4+'" />'+
    			    				txtCodeNm,
    			    				'<input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/>'
    			    				]).draw();
        	} */
        	
        } );        
	}//화면 oppen 리스트조회 끝


    // 그리드 reload
    function fn_all_grid_reload(){

        var codeLevel = document.actionForm.codeLevel.value;

        if(codeLevel == "1"){

        	cnsltTypeTable1.draw();
        	cnsltTypeTable2.draw();
            cnsltTypeTable3.draw();
            cnsltTypeTable4.draw();
        }else if(codeLevel == "2"){

            cnsltTypeTable2.draw();
            cnsltTypeTable3.draw();
            cnsltTypeTable4.draw();
        }else if(codeLevel == "3"){

            cnsltTypeTable3.draw();
            cnsltTypeTable4.draw();
        }else if(codeLevel == "4"){

            cnsltTypeTable4.draw();
        }else{

        	cnsltTypeTable1.draw();
            cnsltTypeTable2.draw();
            cnsltTypeTable3.draw();
            cnsltTypeTable4.draw();
        }
    }
	
	
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">




<!-- Main content -->
    <section class="content">
    
	
		<form name="actionForm" method="post" >
			<input type="hidden" name="codeId0" value="0"/>
			<input type="hidden" name="codeId1"/>
			<input type="hidden" name="codeId2"/>
			<input type="hidden" name="codeId3"/>
			<input type="hidden" name="codeLevel"/>
			<input type="hidden" name="codeNm1"/>
			<input type="hidden" name="codeNm2"/>
			<input type="hidden" name="codeNm3"/>
		</form>
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border bg-info">
                    	<h3 class="box-title">상담유형리스트</h3>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal" name="popTypeForm" id="popTypeForm">
						  	
		                    <div class="form-group">
		                    	<div class="col-sm-8 dstick">
							          <table id="listCnsltTypeTable" class="table table-hover">
							            <thead>
							              <tr>
							                <th>상담분류1</th>
							                <th>상담분류2</th>
							                <th>상담분류3</th>
							                <th>상담분류4</th>
							              </tr>
							            </thead>
							            <tbody>
							          	</tbody>
							          </table>
		                    	</div>
		                    	<div class="col-sm-4 dstick">
			                        <div class="text-right">
			                            <button type="button" id="btnApply" class="btn btn-sm btn-primary btn-cnslt-apply" data-level="4"><spring:message code="button.apply"/></button>
			                        </div>

							          <table id="listSelectCnsltTypeTable" class="table table-hover">
							            <thead>
							              <tr>
							                <th>선택분류</th>
							                <th>삭제</th>
							              </tr>
							            </thead>
							            <tbody>
											<c:forEach var="typeList" items="${cnsltTypeLoad}">
											<tr>
												<input type="hidden" name="codeId" id="codeId" value="${typeList.codeId}" />
												<input type="hidden" name="codeIdLv2" id="codeIdLv2" value="${typeList.codeIdLv2}" />
												<input type="hidden" name="codeIdLv3" id="codeIdLv3" value="${typeList.codeIdLv3}" />
												<input type="hidden" name="codeIdLv4" id="codeIdLv4" value="${typeList.codeIdLv4}" />
												<input type="hidden" name="codeNm" id="codeNm" value="${typeList.codeNm}" />
												<input type="hidden" name="codeNmLv2" id="codeNmLv2" value="${typeList.codeNmLv2}" />
												<input type="hidden" name="codeNmLv3" id="codeNmLv3" value="${typeList.codeNmLv3}" />
												<input type="hidden" name="codeNmLv4" id="codeNmLv4" value="${typeList.codeNmLv4}" />
												<td><c:out value="${typeList.codeNm}" />
														<c:if test="${typeList.codeNmLv2 != '' and typeList.codeNmLv2 != null}">
															- <c:out value="${typeList.codeNmLv2}" />
														</c:if>
														<c:if test="${typeList.codeNmLv3 != '' and typeList.codeNmLv3 != null}">
															- <c:out value="${typeList.codeNmLv3}" />
														</c:if>
														<c:if test="${typeList.codeNmLv4 != '' and typeList.codeNmLv4 != null}">
															- <c:out value="${typeList.codeNmLv4}" />
														</c:if>
												 </td>
												<td><input type="button" name="btnRowDel" id="btnRowDel" onClick="fnRowDel(this)" value="삭제"/></td>
											</tr>					
											</c:forEach>
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

                <!-- left 1 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV1</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="cnsltTypeTable1" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

                <!-- left 2 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV2</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">

                            <table id="cnsltTypeTable2" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

                <!-- left 3 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV3</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">

                            <table id="cnsltTypeTable3" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

                <!-- left 4 column -->
                <div class="col-md-3">

                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담유형 LV4</h3>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive">

                            <table id="cnsltTypeTable4" class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>코드</th>
                                        <th>코드명</th>
                                        <th>순서</th>
                                        <th>사용</th>
                                    </tr>
                                </thead>
                            </table>

                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer text-right">
                        </div>
                        <!-- /.box-footer -->
                    </div>
                    <!-- /.box -->

                </div>
                <!--/.col -->

            </div>
            <!-- /.row -->
      
      
      
      
      
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
