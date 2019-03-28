<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CallScriptMng.java
  * @Description : EC4CallScriptMng List 화면
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
    <title>콜스크립트설정</title>
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
    <!-- bootstrap daterangepicker -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.css">
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
    <!-- bootstrap datepicker -->
    <script src="/resource/adminLTE/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
    <!-- bootstrap daterangepicker -->
    <script src="/resource/adminLTE/bower_components/moment/moment.js"></script>
    <script src="/resource/adminLTE/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
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

var callScriptTable;
var callQuestTable;
var callAnswerTable;

var questParams = {};
var ansrParams = {};

$(document).ready(function(){

    if('${message}'){

        alert('${message}');
    }

    $(".sidebar-menu").tree();
    

    $("#btnScriptUpdate").addClass("disabled");
    $("#btnScriptDeleteAction").addClass("disabled");
    $("#btnQuestUpdate").addClass("disabled");
    $("#btnQuestDeleteAction").addClass("disabled");
    $("#btnAnswerUpdate").addClass("disabled");
    $("#btnAnswerDeleteAction").addClass("disabled");





    // 검색 input search
    $("#callScriptMngVO input").on("keyup change", function(key){
        if(key.keyCode == 13 || $(this).hasClass("datepicker")){
        	callScriptTable.search(this.value).draw();
        }
    });
    // 검색 select search
    $("#callScriptMngVO select").on("change", function(key){
    	callScriptTable.search(this.value).draw();
    });    
    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	callScriptTable.search(this.value).draw();
    });

    
    
    
    
    // 콜스크립트 테이블
    callScriptTable = $('#callScriptTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 1, "asc" ]],    // 기본 정렬
        "rowId": "scriptCd",
        "scrollY": "369px",
        //"pageLength": 10,             // 페이징 관련
        //"pagingType": "full_numbers", // 페이징 관련
        //"bPaginate": true,             // 페이징
        //"bLengthChange": true,        // 페이징 관련
        //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],   // 페이징 관련
        "responsive": true,     // 반응형 화면크기 조절시
        "processing": true,
        "ordering": true,      // 필드 정렬
        "searching": false,     // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/call/outbd/selectCallScriptList.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
            		{"name": "searchScriptKnd",   "value": $("#callScriptMngVO select[name=searchScriptKnd] option:selected").val()},
            		{"name": "searchScriptCd",   "value": $("#callScriptMngVO select[name=searchScriptCd] option:selected").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,2]}
        ],
        "aoColumns": [
        	{"data": "rn"},
        	{"data": "scriptKnd"},
        	{"data": "scriptCd"},
            {"data": "scriptTitle", "defaultContent": ""},
        	{"data": "scriptKndNm", "defaultContent": ""},
            {"data": "useYn", "defaultContent": ""},
        ]
    });


    // 질문스크립트 테이블
    callQuestTable = $('#callQuestTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 2, "asc" ]],    // 기본 정렬
        "rowId": "QuestCd",
        "scrollY": "369px",
        //"pageLength": 10,
        //"pagingType": "full_numbers",
        //"bPaginate": true,         // 페이징
        //"bLengthChange": true,
        //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
        "responsive": true,         // 반응형 화면크기 조절시
        "processing": true,
        "ordering": true,          // 필드 정렬
        "searching": false,         // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/call/outbd/selectCallQuestList.do'/>",
        "fnServerParams": function(aoData, a, b){
            aoData.push(
            		{"name": "searchScriptKnd",   "value": questParams.scriptKnd},
            		{"name": "searchScriptCd",   "value": questParams.scriptCd}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,2,3]}
        ],
        "aoColumns": [
        	{"data": "rn"},
        	{"data": "scriptKnd"},
        	{"data": "scriptCd"},
        	{"data": "questType"},
            {"data": "questCd"},
            {"data": "questDscr", "defaultContent": ""},
            {"data": "questTypeNm", "defaultContent": ""},
            {"data": "useYn", "defaultContent": ""}
        ]
    });


    // 답변스크립트 테이블
    callAnswerTable = $('#callAnswerTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 2, "asc" ]],    // 기본 정렬
        "rowId": "ansrCd",
        "scrollY": "369px",
        //"pageLength": 10,
        //"pagingType": "full_numbers",
        //"bPaginate": true,         // 페이징
        //"bLengthChange": true,
        //"lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
        "responsive": true,         // 반응형 화면크기 조절시
        "processing": true,
        "ordering": true,          // 필드 정렬
        "searching": false,         // global 검색
        "bServerSide": true,
        "sAjaxSource": "<c:url value='/ec4/call/outbd/selectCallAnswerList.do'/>",
        "fnServerParams": function(aoData, a, b){
            aoData.push(
            		{"name": "searchScriptKnd",   "value": ansrParams.scriptKnd},
            		{"name": "searchScriptCd",   "value": ansrParams.scriptCd},
            		{"name": "searchQuestCd",   "value": ansrParams.questCd}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [1,2,3]}
        ],
        "aoColumns": [
        	{"data": "rn"},
        	{"data": "scriptKnd"},
        	{"data": "scriptCd"},
            {"data": "questCd"},
            {"data": "ansrCd"},
            {"data": "ansrDscr", "defaultContent": ""},
            {"data": "scoreVal", "defaultContent": ""},
            {"data": "useYn", "defaultContent": ""}
        ]
    });


    // 콜스크립트 선택
    callScriptTable.on("select", function (e, dt, type, indexes) {

        $("#btnScriptUpdate").removeClass("disabled");
        $("#btnScriptDeleteAction").removeClass("disabled");

        $("#btnQuestUpdate").addClass("disabled");
        $("#btnQuestDeleteAction").addClass("disabled");

        $("#btnAnswerUpdate").addClass("disabled");
        $("#btnAnswerDeleteAction").addClass("disabled");
        
    	//fn_all_grid_reload();
    	var rowData = callScriptTable.rows(".selected").data();
    	questParams = {};
    	questParams.makrCd = rowData[0].makrCd;
    	questParams.scriptKnd = rowData[0].scriptKnd;
    	questParams.scriptCd = rowData[0].scriptCd;
        callQuestTable.search("").draw();
    }).on("deselect", function (e, dt, type, indexes) {

        $("#btnScriptUpdate").addClass("disabled");
        $("#btnScriptDeleteAction").addClass("disabled");
        //fn_all_grid_reload();
    	questParams = {};
    	ansrParams = {};
    	callQuestTable.search("").draw();
    	callAnswerTable.search("").draw();
    });


    // 질문스크립트 선택
    callQuestTable.on("select", function (e, dt, type, indexes) {

        $("#btnQuestUpdate").removeClass("disabled");
        $("#btnQuestDeleteAction").removeClass("disabled");

        $("#btnAnswerUpdate").addClass("disabled");
        $("#btnAnswerDeleteAction").addClass("disabled");
        
        //fn_all_grid_reload();
    	var rowData = callQuestTable.rows(".selected").data();
        if(rowData[0].questType == "1"){
            $("#btnAnswerInsert").removeClass("disabled");
        }else{
            $("#btnAnswerInsert").addClass("disabled");
        }
    	ansrParams = {};
    	ansrParams.makrCd = rowData[0].makrCd;
    	ansrParams.scriptKnd = rowData[0].scriptKnd;
    	ansrParams.scriptCd = rowData[0].scriptCd;
    	ansrParams.questCd = rowData[0].questCd;
    	callAnswerTable.search("").draw();
    }).on("deselect", function (e, dt, type, indexes) {

        $("#btnQuestUpdate").addClass("disabled");
        $("#btnQuestDeleteAction").addClass("disabled");
        //fn_all_grid_reload();
    	ansrParams = {};
    	callAnswerTable.search("").draw();
    });


    // 답변스크립트 선택
    callAnswerTable.on("select", function (e, dt, type, indexes) {

        $("#btnAnswerUpdate").removeClass("disabled");
        $("#btnAnswerDeleteAction").removeClass("disabled");
        //fn_all_grid_reload();
    }).on("deselect", function (e, dt, type, indexes) {

        $("#btnAnswerUpdate").addClass("disabled");
        $("#btnAnswerDeleteAction").addClass("disabled");
        //fn_all_grid_reload();
    });


    // 스크립트등록버튼
    $("#btnScriptInsert").click(function(){

        var params = {};

        var frm = document.callScriptMngVO;
        
        $("#callScriptMngVO input[name=codeLevel]").val("1");

        // 등록 팝업 오픈
        fn_callScript_reg_popup(params);
    });
    // 질문등록버튼
    $("#btnQuestInsert").click(function(){

        var questParams = {};

        var frm = document.callScriptMngVO;
        
        $("#callScriptMngVO input[name=codeLevel]").val("2");


    	var rowData = callScriptTable.rows(".selected").data();
        if(rowData[0]){
        	questParams.makrCd = rowData[0].makrCd;
        	questParams.scriptCd = rowData[0].scriptCd;
        	questParams.scriptKnd = rowData[0].scriptKnd;
        }else{
        	alert('<spring:message code="common.select.msg" arguments="${scriptIdText}"/>');
        	return false;
        }
        
        // 등록 팝업 오픈
        fn_callQuest_reg_popup(questParams);
    });
    // 답변등록버튼
    $("#btnAnswerInsert").click(function(){
    	
        var ansrParams = {};

        var frm = document.callQuestMngVO;
        
        $("#callScriptMngVO input[name=codeLevel]").val("3");


    	var rowData = callQuestTable.rows(".selected").data();
        if(rowData[0]){
        	ansrParams.makrCd = rowData[0].makrCd;
        	ansrParams.scriptCd = rowData[0].scriptCd;
        	ansrParams.scriptKnd = rowData[0].scriptKnd;
        	ansrParams.questCd = rowData[0].questCd;
        }else{
        	alert('<spring:message code="common.select.msg" arguments="${questIdText}"/>');
        	return false;
        }
    	if(rowData[0].questType != "1"){
    		alert("객관식 질문에만 답변등록할 수 있습니다.");
    		return false;
    	}
        
        // 등록 팝업 오픈
        fn_callAnswer_reg_popup(ansrParams);
    });

    
    
    
    

    // 스크립트수정버튼
    $("#btnScriptUpdate").click(function(){

        var params = {};

        var rowData = callScriptTable.rows(".selected").data();
        if(rowData[0]){
            params.makrCd = rowData[0].makrCd;
            params.scriptKnd = rowData[0].scriptKnd;
            params.scriptCd = rowData[0].scriptCd;
        }
        
        $("#callScriptMngVO input[name=codeLevel]").val("1");
        
        // 수정 팝업 오픈
        fn_callScript_mod_popup(params);
    });
    // 질문수정버튼
    $("#btnQuestUpdate").click(function(){

        var questParams = {};

        var rowData = callQuestTable.rows(".selected").data();
        if(rowData[0]){
        	questParams.makrCd = rowData[0].makrCd;
        	questParams.scriptKnd = rowData[0].scriptKnd;
        	questParams.scriptCd = rowData[0].scriptCd;
        	questParams.questCd = rowData[0].questCd;
        }
        
        $("#callScriptMngVO input[name=codeLevel]").val("2");
        
        // 수정 팝업 오픈
        fn_callQuest_mod_popup(questParams);
    });
    // 답변수정버튼
    $("#btnAnswerUpdate").click(function(){

        var ansrParams = {};

        var rowData = callAnswerTable.rows(".selected").data();
        if(rowData[0]){
        	ansrParams.makrCd = rowData[0].makrCd;
        	ansrParams.scriptKnd = rowData[0].scriptKnd;
        	ansrParams.scriptCd = rowData[0].scriptCd;
        	ansrParams.questCd = rowData[0].questCd;
        	ansrParams.ansrCd = rowData[0].ansrCd;
        }
        
        $("#callScriptMngVO input[name=codeLevel]").val("3");
        
        // 수정 팝업 오픈
        fn_callAnswer_mod_popup(ansrParams);
    });


    // 삭제버튼
    $("#btnScriptDeleteAction").click(function(){

        if(!$(this).hasClass("disabled")){

            if(confirm('<spring:message code="common.delete.msg"/>')){
                
                $("#callScriptMngVO input[name=codeLevel]").val("1");

                var params = {};
                var rowData = callScriptTable.rows(".selected").data();

                if(rowData[0]){
                    params.makrCd = rowData[0].makrCd;
                    params.scriptKnd = rowData[0].scriptKnd;
                    params.scriptCd = rowData[0].scriptCd;
                    //params.questCd = rowData[0].questCd;
                    //params.ansrCd = rowData[0].ansrCd;
                }

                if(!params.scriptCd){

                    alert('<spring:message code="common.delete.pre.msg" arguments="${scriptIdText}"/>');
                } else {

            // 수정
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/call/outbd/deleteCallScript.do'/>",
                "data": params,
                "success": function(result) {

                    if(result.isSuccess){

                        alert(result.message);
                        fn_all_grid_reload();
                    } else {

                        var errorMsg = "";

                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                        }

                        alert(errorMsg);
                    }
                    return;
                }
                ,error: function(xhr, status, error){

                    alert("ERROR : " +
                                 "\n Status Code : " + xhr.status +
                                 "\n Status Text : " + xhr.statusText +
                                 "\n Error Message : \n " + xhr.responseJSON.errorMessage
                    );
                    return;
                }
            });
                }//if
            }//confirm
        }//hasClass
    });
    // 삭제버튼
    $("#btnQuestDeleteAction").click(function(){

        if(!$(this).hasClass("disabled")){

            if(confirm('<spring:message code="common.delete.msg"/>')){
                
                $("#callScriptMngVO input[name=codeLevel]").val("2");

                var questParams = {};
                var rowData = callQuestTable.rows(".selected").data();

                if(rowData[0]){
                	questParams.makrCd = rowData[0].makrCd;
                	questParams.scriptKnd = rowData[0].scriptKnd;
                	questParams.scriptCd = rowData[0].scriptCd;
                	questParams.questCd = rowData[0].questCd;
                }

                if(!questParams.questCd){

                    alert('<spring:message code="common.delete.pre.msg" arguments="${questIdText}"/>');
                } else {

            // 수정
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/call/outbd/deleteCallQuest.do'/>",
                "data": questParams,
                "success": function(result) {

                    if(result.isSuccess){

                        alert(result.message);
                        fn_all_grid_reload();
                    } else {

                        var errorMsg = "";

                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                        }

                        alert(errorMsg);
                    }
                    return;
                }
                ,error: function(xhr, status, error){

                    alert("ERROR : " +
                                 "\n Status Code : " + xhr.status +
                                 "\n Status Text : " + xhr.statusText +
                                 "\n Error Message : \n " + xhr.responseJSON.errorMessage
                    );
                    return;
                }
            });
                }//if
            }//confirm
        }//hasClass
    });
    // 삭제버튼
    $("#btnAnswerDeleteAction").click(function(){

        if(!$(this).hasClass("disabled")){

            if(confirm('<spring:message code="common.delete.msg"/>')){
                
                $("#callScriptMngVO input[name=codeLevel]").val("3");

                var ansrParams = {};
                var rowData = callAnswerTable.rows(".selected").data();

                if(rowData[0]){
                	ansrParams.makrCd = rowData[0].makrCd;
                	ansrParams.scriptKnd = rowData[0].scriptKnd;
                	ansrParams.scriptCd = rowData[0].scriptCd;
                	ansrParams.questCd = rowData[0].questCd;
                	ansrParams.ansrCd = rowData[0].ansrCd;
                }

                if(!ansrParams.ansrCd){

                    alert('<spring:message code="common.delete.pre.msg" arguments="${ansrIdText}"/>');
                } else {

            // 수정
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/call/outbd/deleteCallAnswer.do'/>",
                "data": ansrParams,
                "success": function(result) {

                    if(result.isSuccess){

                        alert(result.message);
                        fn_all_grid_reload();
                    } else {

                        var errorMsg = "";

                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                        }

                        alert(errorMsg);
                    }
                    return;
                }
                ,error: function(xhr, status, error){

                    alert("ERROR : " +
                                 "\n Status Code : " + xhr.status +
                                 "\n Status Text : " + xhr.statusText +
                                 "\n Error Message : \n " + xhr.responseJSON.errorMessage
                    );
                    return;
                }
            });
                }//if
            }//confirm
        }//hasClass
    });
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

    	fn_all_grid_reload();
    });


    // 콜구분코드 select search
    $("select[name=searchScriptCd]").on("change", function(key){

        fn_all_grid_reload();
    });

});
// end ready






// 등록 팝업 오픈
function fn_callScript_reg_popup(params){

        $("div.modal-content").load("<c:url value='/ec4/call/outbd/outcall/callScriptMngRegPopup.do'/>", params, function(response, status, xhr) {

            if(status == "success"){

                $("div.modal").modal({"backdrop": "static", "keyboard": false});
            }else if(status == "error"){

            	alert("ERROR : " +
                        "\n Status Code : " + xhr.status
                        + "\n Status Text : " + xhr.statusText
                        //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
                     );
                return;
            }
        });
}
// 수정 팝업 오픈
function fn_callScript_mod_popup(params){

   	if(params.scriptCd){

        $("div.modal-content").load("<c:url value='/ec4/call/outbd/outcall/callScriptMngModPopup.do'/>", params, function(response, status, xhr) {

            if(status == "success"){

                $("div.modal").modal({"backdrop": "static", "keyboard": false});
            }else if(status == "error"){

                alert("Error: " + xhr.status + ": " + xhr.statusText);
            }
        });
   	}else{

   		alert('<spring:message code="common.select.msg" arguments="${codeIdText}"/>');
   	}
}








//질문등록 팝업 오픈
function fn_callQuest_reg_popup(params){

   $("div.modal-content").load("<c:url value='/ec4/call/outbd/outcall/callQuestMngRegPopup.do'/>", params, function(response, status, xhr) {

       if(status == "success"){

           $("div.modal").modal({"backdrop": "static", "keyboard": false});
       }else if(status == "error"){

       	alert("ERROR : " +
                   "\n Status Code : " + xhr.status
                   + "\n Status Text : " + xhr.statusText
                   //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
                );
           return;
       }
   });
}
//질문수정 팝업 오픈
function fn_callQuest_mod_popup(params){

	if(params.questCd){

   $("div.modal-content").load("<c:url value='/ec4/call/outbd/outcall/callQuestMngModPopup.do'/>", params, function(response, status, xhr) {

       if(status == "success"){

           $("div.modal").modal({"backdrop": "static", "keyboard": false});
       }else if(status == "error"){

           alert("Error: " + xhr.status + ": " + xhr.statusText);
       }
   });
	}else{

		alert('<spring:message code="common.select.msg" arguments="${codeIdText}"/>');
	}
}








//답변등록 팝업 오픈
function fn_callAnswer_reg_popup(params){

   $("div.modal-content").load("<c:url value='/ec4/call/outbd/outcall/callAnswerMngRegPopup.do'/>", params, function(response, status, xhr) {

       if(status == "success"){

           $("div.modal").modal({"backdrop": "static", "keyboard": false});
       }else if(status == "error"){

       	alert("ERROR : " +
                   "\n Status Code : " + xhr.status
                   + "\n Status Text : " + xhr.statusText
                   //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
                );
           return;
       }
   });
}
//답변수정 팝업 오픈
function fn_callAnswer_mod_popup(params){

	if(params.ansrCd){

   $("div.modal-content").load("<c:url value='/ec4/call/outbd/outcall/callAnswerMngModPopup.do'/>", params, function(response, status, xhr) {

       if(status == "success"){

           $("div.modal").modal({"backdrop": "static", "keyboard": false});
       }else if(status == "error"){

           alert("Error: " + xhr.status + ": " + xhr.statusText);
       }
   });
	}else{

		alert('<spring:message code="common.select.msg" arguments="${codeIdText}"/>');
	}
}









// 그리드 reload
function fn_all_grid_reload(){

    var codeLevel = document.callScriptMngVO.codeLevel.value;

    $("#callScriptMngVO input[name=codeLevel]").val("");
    
    if(codeLevel == "1"){

    	callScriptTable.draw();
    	//callQuestTable.draw();
        //callAnswerTable.draw();
    	questParams = {};
    	ansrParams = {};
    	callQuestTable.search("").draw();
    	callAnswerTable.search("").draw();
    }else if(codeLevel == "2"){

        callQuestTable.draw();
        //callAnswerTable.draw();
    	ansrParams = {};
    	callAnswerTable.search("").draw();
    }else if(codeLevel == "3"){

        callAnswerTable.draw();
    }else{
    	/* callScriptTable.draw();
        callQuestTable.draw();
        callAnswerTable.draw(); */
    }
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
                콜스크립트설정
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리(Out)</a></li>
                <li class="active">콜스크립트설정</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="callScriptMngVO" name="callScriptMngVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>
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
							<input type="hidden" name="codeId0" value="0"/>
							<input type="hidden" name="codeId1"/>
							<input type="hidden" name="codeId2"/>
							<input type="hidden" name="codeId3"/>
							<input type="hidden" name="codeLevel"/>
                            <div class="form-group">
                                <label for="searchScriptKnd" class="col-sm-1 control-label">콜구분</label>
                                <div class="col-sm-2">
                                    <form:select path="searchScriptKnd" class="form-control input-sm">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="searchScriptKnd" />
                                </div>
                                <label for="searchScriptCd" class="col-sm-2 control-label">스크립트제목</label>
                                <div class="col-sm-3">
                                    <form:select path="searchScriptCd" class="form-control input-sm">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptTitleList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="searchScriptCd" />
                                </div>
                                <div></div>
                            </div>
                    </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
                        <!-- <button type="button" class="btn btn-primary"> 등록</button>
                        <button type="button" class="btn btn-warning"> 삭제</button> -->
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
                </form:form>
            </div>
        </div>


	    <!-- ############################# 메인화면 ######################  -->
      	<div class="row">
        	<div class="col-xs-4"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-list"></i>제목스크립트</h3>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding">
							<table id="callScriptTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th>순번</th>
					                <th>구분</th>
					                <th>코드</th>
					                <th>제목</th>
					                <th>콜구분</th>
					                <th>사용여부</th>
					              </tr>
					            </thead>
					            <tbody>
					             </tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-right">
                        <button type="button" id="btnScriptDeleteAction" class="btn btn-sm btn-warning btn-cnslt-del" data-level="1"><spring:message code="button.delete"/></button>
                        <button type="button" id="btnScriptInsert" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="1"><spring:message code="button.create"/></button>
                        <button type="button" id="btnScriptUpdate" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="1"><spring:message code="button.update"/></button>
                    </div>
                </div>
                <!-- <<<<<<<< box THE END -->
        	</div>
        	
        	
        	<div class="col-xs-4"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">질문스크립트</h3>
                        <div class="box-tools">
                               &nbsp;
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding">
							<table id="callQuestTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th>순번</th>
					                <th>구분</th>
					                <th>콜코드</th>
					                <th>질문유형</th>
					                <th>질문코드</th>
					                <th>내용</th>
					                <th>질문유형</th>
					                <th>사용여부</th>
					              </tr>
					            </thead>
					            <tbody>
					             </tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-right">
                        <button type="button" id="btnQuestDeleteAction" class="btn btn-sm btn-warning btn-cnslt-del" data-level="2"><spring:message code="button.delete"/></button>
                        <button type="button" id="btnQuestInsert" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="2"><spring:message code="button.create"/></button>
                        <button type="button" id="btnQuestUpdate" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="2"><spring:message code="button.update"/></button>
                    </div>
                </div>
                <!-- <<<<<<<< box THE END -->
        	</div>
        	
        	
        	<div class="col-xs-4"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">답변스크립트</h3>
                        <div class="box-tools">
                               &nbsp;
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding">
							<table id="callAnswerTable" class="table table-hover">
					            <thead>
					              <tr>
					                <th>순번</th>
					                <th>구분</th>
					                <th>코드</th>
					                <th>질문코드</th>
					                <th>답변코드</th>
					                <th>내용</th>
					                <th>점수</th>
					                <th>사용여부</th>
					              </tr>
					            </thead>
					            <tbody>
					            </tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-right">
                        <button type="button" id="btnAnswerDeleteAction" class="btn btn-sm btn-warning btn-cnslt-del" data-level="3"><spring:message code="button.delete"/></button>
                        <button type="button" id="btnAnswerInsert" class="btn btn-sm btn-primary btn-cnslt-reg" data-level="3"><spring:message code="button.create"/></button>
                        <button type="button" id="btnAnswerUpdate" class="btn btn-sm btn-primary btn-cnslt-mod" data-level="3"><spring:message code="button.update"/></button>
                    </div>
                </div>
                <!-- <<<<<<<< box THE END -->
        	</div>
		</div>
      <!-- /.row -->
      
      
      
      
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
