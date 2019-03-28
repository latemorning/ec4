<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags"%>
<%
 /**
  * @Class Name : EC4CnsltInBoundMng.java
  * @Description : 인바운드콜 상담 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.04.16    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.04.16
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
    <title>상담화면(IN)</title>
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
var callCnsltHistTable;
var callCarRecallTable;
var callContSalesTable;
var callCarPeriodTable;
var gtListCstmrOwnerCarTable;
function SetName(strName)
{
	document.Form1.txtName.value = strName;
}
$(document).ready(function(){
	
	//$("select[name=searchVhclMdl]").trigger( "change" );
	//$( ".searchVhclMdl" ).trigger( "click" );
	//$( ".selectVhclMdl" ).trigger( "click" );
	//$(".selectVhclMdl").click();
	rtnCstmrOwnerCarList("");//기본호출
	
	
	$(document).on("click","#custPop",function() {
		fn_custPop();
    });
	$(document).on("click","#custCarPop",function() {
		fn_custCarPop();
    });
	
	
	//숫자만입력
    $("#cnsltInBoundMngVO input[name=searchHpno]").keyup(function(){
		chkStr(this,"no"); 
	});

    $("#searchCstmrNm").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custPop();
    	}
	});
    $("#searchHpno").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custPop();
    	}
	});
    $("#searchVin").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custCarPop();
    	}
	});
    $("#searchCarNo").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custCarPop();
    	}
	});
    

	$(document).on("click","#delCustNm",function() {
		$("#searchCstmrCd").val("");
		$("#searchCstmrNm").val("");
    });
	$(document).on("click","#delCustHp",function() {
		$("#searchHpno").val("");
    });
	$(document).on("click","#delCustEmail",function() {
		$("#searchEmailAdres").val("");
    });
	$(document).on("click","#delVin",function() {
		$("#searchVin").val("");
    });
	$(document).on("click","#delCarNo",function() {
		$("#searchCarNo").val("");
    });
	
    

	$(document).on("click","#cnsltRegPop",function() {
        var popupParams = {};
        
        if("" == $("input[name=searchCstmrCd]").val() || null == $("input[name=searchCstmrCd]").val()){
        	//alert('<spring:message code="cmm.cstmrNm" arguments="${mess.Test}"/>');
        	alert("상담고객을 선택하세요.");
        	return;
        }

        
        $("input[name=cstmrCd]").val($("input[name=searchCstmrCd]").val());
        $("input[name=cnsltIncallNo]").val("");
        $("input[name=cstmrNm]").val($("input[name=searchCstmrNm]").val());
        $("input[name=brthdy]").val($("input[name=searchBrthdy]").val());
        $("input[name=hpno]").val($("input[name=searchHpno]").val());
        $("input[name=emailAdres]").val($("input[name=searchEmailAdres]").val());
        //$("input[name=custVhclMdl]").val($("select[name=searchVhclMdl] option:selected").val()); //고객차량정보는 LOAD 된 그대로 보여줘야한다. 화면에서 선택한걸로 POP 호출하면 안된다.
        //$("input[name=custVhclMdlNm]").val($("select[name=searchVhclMdl] option:selected").text()); //고객차량정보는 LOAD 된 그대로 보여줘야한다. 화면에서 선택한걸로 POP 호출하면 안된다.
        var rowData = $("#listCstmrOwnerCarTable").DataTable().rows(".selected").data();
        if(rowData[0]){
            $("input[name=vin]").val(rowData[0].vin); //고객소유차량 리스트에서 선택된 차대번호
            $("input[name=vhcleNo]").val(rowData[0].vhcleNo); //고객소유차량 리스트에서 선택된 차량번호
            $("input[name=custVhclMdl]").val(rowData[0].modelCd); //고객소유차량 리스트에서 선택된 모델코드
            $("input[name=custVhclMdlNm]").val(rowData[0].modelNm); //고객소유차량 리스트에서 선택된 모델명
            $("input[name=cstmrEsntlId]").val(rowData[0].cstmrEsntlId); //고객소유차량 리스트에서 선택된 모델코드
            $("input[name=cstmrVhcleSeq]").val(rowData[0].cstmrVhcleSeq); //고객소유차량 리스트에서 선택된 모델명
        }
        
    	
        /* var params = {};

        params.callbackClass = "callback";
	    params.selectStyle = "single";
        params.cstmrCd = $("input[name=searchCstmrCd]").val();
        params.cnsltIncallNo = "";
        params.cstmrNm = "";
	    params.brthdy = "";
	    params.hpno = "";
	    params.emailAdres = "";

	    
       	if(params.cstmrCd){

            $("#popupModal div.modal-content").load("<c:url value='/ec4/call/inbd/cnsltInBoundRegPop.do'/>", params, function(response, status, xhr) {

                if(status == "success"){

                    $("#popupModal").modal({"backdrop": "static", "keyboard": false});
                	//$("#popupModal").modal('show');
                }else if(status == "error"){

                    alert("Error: " + xhr.status + ": " + xhr.statusText);
                }
            });
       	}else{

       		alert('<spring:message code="common.select.msg" arguments="${cnsltInBoundIdText}"/>');
       	}    	 */
    	
        
        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/inbd/cnsltInBoundRegPop.do'/>";

        popupParams.width = "900";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.mainPopupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);

    });
	
	
	
	$(document).on("click","#cnsltSmsPop",function() {
		var popupParams = {};
        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/cmm/csms/csmsPop.do'/>";

        popupParams.width = "500";
        popupParams.height = "800";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.mainPopupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);
	});
	
	
	
	

	//브랜드
    $("select[name=searchVmcd]").change(function(){
    	$("select[name=searchVhclMdl]").val(null).trigger('change');
    	$("select[name=searchVhclDetlMdl]").val(null).trigger('change');
    });
	//차종
    $("select[name=searchVhctCd]").change(function(){
    	$("select[name=searchVhclMdl]").val(null).trigger('change');
    	$("select[name=searchVhclDetlMdl]").val(null).trigger('change');
    });
	
	//차량 모델
    $(".selectVhclMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=searchVhctCd] option:selected").val(),/* 차종 */
   		            "cnsltSeCode": $("select[name=searchVmcd] option:selected").val(),/* 제조사 */
   		            "codeId": $("select[name=searchVhclMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    $(".selectVhclMdl").on("change", function (e) {
    	$("select[name=searchVhclDetlMdl]").val(null).trigger('change');
    });
	//차량 세부모델
    $(".selectDetlMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclDetlMdlComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=searchVhclMdl] option:selected").val(), /* 모델 */
   		            "cnsltSeCode": $("select[name=searchVmcd] option:selected").val(), /* 제조사 */
   		            "codeId": $("select[name=searchVhclDetlMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 세부모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#cnsltInBoundMngVO input[name=searchCstmrNm]").val() == ""){
			$("#cnsltInBoundMngVO input[name=searchCstmrCd]").val("");
		}
	});

	
	
	
	$(document).on("click","#histRepair",function() {
		
		window.open("https://www.gmsnet.co.kr/NewServiceLoginCS.jsp?&BoardType=viewCustHist&sysName=CALL&vinComp=KLA&vinType=YA75Y&vinCheck=D&vinMdlYear=D&vinPlan=K&vinBodyNo=145869&vinDup=&user_id=DRSAAAA","histRepairPop","width=900,height=550,top=10,left=10,scrollbars=no,location=no");
		
        /* window.addEventListener('confirm', function (e) {
        	console.log('message', e.data);
        	console.log('origin', e.origin);
        	console.log('source', e.source);
        }); */

    });	
	
	
	
    // 고객차량리스트 선택
    $('#listCstmrOwnerCarTable tbody').on('click', 'tr', function (e, dt, type, indexes) {
    	
    	if($(this).hasClass("selected")){
        	$("input[name=viewVhcleNo]").val("");
        	$("input[name=viewVin]").val("");
        	$("input[name=viewModelNm]").val("");
        	$("input[name=viewColorNm]").val("");
        	$("input[name=viewLastRcptDate]").val("");
        	$("input[name=viewLastCustNm]").val("");
        	$("input[name=viewDeliDate]").val("");
        	$("input[name=viewMfgDate]").val("");
        	$("input[name=viewLastReadKm]").val("");
        	$("input[name=viewOptionNm]").val("");
        	$("input[name=viewEnvcertYn]").val("");
        	$("input[name=viewEnvcertNo]").val("");
    	}else{
        	var idx = $(this).index();
        	var rowData = $("#listCstmrOwnerCarTable").DataTable().rows(idx).data();

        	$("input[name=viewVhcleNo]").val(rowData[0].vhcleNo);
        	$("input[name=viewVin]").val(rowData[0].vin);
        	$("input[name=viewModelNm]").val(rowData[0].modelNm);
        	$("input[name=viewColorNm]").val(rowData[0].colorNm);
        	$("input[name=viewLastRcptDate]").val(rowData[0].lastRcptDate);
        	$("input[name=viewLastCustNm]").val(rowData[0].lastCustNm);
        	$("input[name=viewDeliDate]").val(rowData[0].deliDate);
        	$("input[name=viewMfgDate]").val(rowData[0].mfgDate);
        	$("input[name=viewLastReadKm]").val(rowData[0].lastReadKm);
        	$("input[name=viewOptionNm]").val(rowData[0].optionNm);
        	$("input[name=viewEnvcertYn]").val(rowData[0].envcertYn);
        	$("input[name=viewEnvcertNo]").val(rowData[0].envcertNo);  
        	
        	//리콜내역
        	callCarRecallList(rowData[0].vin, rowData[0].vhcleNo);
        	//개인소모품교환
        	callCarPeriodList(rowData[0].vin, rowData[0].vhcleNo);
    	}
    });

	
});
$(function(){


	$('#histTab a').click(function(e){
		//탭 숨기기/보이기 
		e.preventDefault();
		$(this).tab('show');
		
		//해당 탭 테이블 숨기기
		$('#histTab li').each(function(index, item){
			//console.log(index);
			$('#tab'+index).css('display', 'none');
			if(index == 1){//이력
				//callCnsltHistTable.draw();
				var oTable = $('#callCnsltHistTable').dataTable();
				oTable.fnSort( [ [0,'asc'] ] );
			}
			if(index == 2){//리콜
				try{callCarRecallTable.draw();}catch(e){}
			}
			if(index == 3){//계약/판매
				//callContSalesTable.draw();
				var oTable = $('#callContSalesTable').dataTable();
				oTable.fnSort( [ [0,'asc'] ] );
			}
			if(index == 9){//개인소모품교환
				try{callCarPeriodTable.draw();}catch(e){}
			}
		});
		//클릭 탭 테이블 보이기
		$($(this).attr("href")).css('display', 'inline');
	});

	
});


function fn_custPop(){

    var popupParams = {};

    //$("#mainPopupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
    //$("#mainPopupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
    //$("#mainPopupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
    $("#mainPopupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
    $("#mainPopupForm input[name=hpno]").val($("#searchHpno").val());
    $("#mainPopupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
    
    

    var callbackClass = "callback";
    var selectStyle = "single";
    var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrPop.do'/>";

    popupParams.width = "800";
    popupParams.height = "700";
    popupParams.title = "popupSelectSingle";
    popupParams.form = document.mainPopupForm;


    popupParams.form.action = url;
    popupParams.form.target = popupParams.title;
    popupParams.form.selectStyle.value = selectStyle;
    popupParams.form.callbackClass.value = callbackClass;

    fn_open_popup(popupParams);	
    /* return false;
	
	var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
	//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
	pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
}


function fn_custCarPop(){

    var popupParams = {};

    //$("#mainPopupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
    //$("#mainPopupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
    //$("#mainPopupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
    $("#mainPopupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
    $("#mainPopupForm input[name=hpno]").val($("#searchHpno").val());
    $("#mainPopupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
    $("#mainPopupForm input[name=vin]").val($("#searchVin").val());
    $("#mainPopupForm input[name=vhcleNo]").val($("#searchCarNo").val());
    
    

    var callbackClass = "callback";
    var selectStyle = "single";
    var url = "<c:url value='/ec4/cmm/cinfo/cstmrCarPop.do'/>";

    popupParams.width = "800";
    popupParams.height = "700";
    popupParams.title = "popupSelectSingle";
    popupParams.form = document.mainPopupForm;


    popupParams.form.action = url;
    popupParams.form.target = popupParams.title;
    popupParams.form.selectStyle.value = selectStyle;
    popupParams.form.callbackClass.value = callbackClass;

    fn_open_popup(popupParams);	
    /* return false;
	
	var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
	//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
	pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
}



function cstmrSearch(rCstmrCd){
    /* if(key.keyCode == 13 || $(this).hasClass("datepicker")){
    	callCnsltHistTable.search(this.value).draw();
    } */
    
    rtnCstmrOwnerCarList(rCstmrCd);//고객소유차량리스트조회

    var sCstmrCd = rCstmrCd;
    //if(null == sCstmrCd || "" == sCstmrCd || undefined == sCstmrCd)sCstmrCd = $("#searchCallCnsltForm input[name=searchCstmrCd]").val();
    if( "" == nvl(sCstmrCd,"") )sCstmrCd = $("#searchCstmrCd").val();

    /* 고객상세정보 초기화 */
    cstmrDetailInfoClear();
    
    
    
    
    
    
    
    /* 상담이력 */
    //$('#callCnsltHistTable').DataTable().clear().destroy(); 에러발생(dataTable 다시쓰기가 안됨)
    //try{callCnsltHistTable.draw();}catch(e){} 에러발생(dataTable 다시쓰기가 안됨)
    // 콜상담 테이블
    callCnsltHistTable = $('#callCnsltHistTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "destroy": true, //dataTable을 다시 쓸때 꼭 필요하다.
        //"order": [[ 1, "desc" ]],
        "rowId": "hpclId",
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
        //"sAjaxSource": "<c:url value='/ec4/call/inbd/selectCallCnsltHistList.do'/>",
        "sAjaxSource": "/ec4/call/inbd/selectCallCnsltHistList.do",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": sCstmrCd},
                    /* {"name": "searchCstmrNm",   "value": $("#searchCallCnsltForm input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno", 		"value": $("#searchCallCnsltForm input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres","value": $("#searchCallCnsltForm input[name=searchEmailAdres]").val()} */
                    {"name": "searchCstmrNm",   "value": $("#searchCstmrNm").val()},
                    {"name": "searchHpno", 		"value": $("#searchHpno").val()},
                    {"name": "searchEmailAdres","value": $("#searchEmailAdres").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            //{"visible": false, "targets": [0]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 0
            {"data":"cstmrNm" , "defaultContent" : ""},                                 // 1   1
            {"data":"cnsltDt" , "defaultContent" : ""},                               // 2   1
            {"data":"cnsltNm" , "defaultContent" : ""},                                   // 3
            {"data":"cnsltTyCn" , "defaultContent" : ""},                                     // 4
            {"data":"cnsltKndNm" , "defaultContent" : ""},                             // 5
            {"data":"cnsltRsltNm" , "defaultContent" : ""},                           // 6   4   1
            {"data":"cnsltDscr" , "defaultContent" : ""},                                // 7   5
            {"data":"actDscr" , "defaultContent" : ""},                                     // 8   5
            {"data":"cnsltMemo" , "defaultContent" : ""}                                      // 9   6
        ]
    });
    
    
    
    
    

    
    /* 계약/판매이력 */
    //$('#callContSalesTable').DataTable().clear().destroy(); 에러발생(dataTable 다시쓰기가 안됨)
    //try{callContSalesTable.draw();}catch(e){}  에러발생(dataTable 다시쓰기가 안됨)
    // 계약/판매이력 테이블
    callContSalesTable = $('#callContSalesTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "destroy": true, //dataTable을 다시 쓸때 꼭 필요하다.
        //"order": [[ 1, "desc" ]],
        "rowId": "hpclId",
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
        //"sAjaxSource": "<c:url value='/ec4/call/inbd/selectCallContSalesList.do'/>",
        "sAjaxSource": "/ec4/call/inbd/selectCallContSalesList.do",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": sCstmrCd},
                    /* {"name": "searchCstmrNm",   "value": $("#searchCallCnsltForm input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno", 		"value": $("#searchCallCnsltForm input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres","value": $("#searchCallCnsltForm input[name=searchEmailAdres]").val()} */
                    {"name": "searchCstmrNm",   "value": $("#searchCstmrNm").val()},
                    {"name": "searchHpno", 		"value": $("#searchHpno").val()},
                    {"name": "searchEmailAdres","value": $("#searchEmailAdres").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            //{"visible": false, "targets": [0]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 순번
            {"data":"residentNm" , "defaultContent" : ""},                                 // 고객명
            {"data":"residentNm" , "defaultContent" : ""},                               // 계약자명
            {"data":"contDt" , "defaultContent" : ""},                                   // 계약일자
            {"data":"contractNo" , "defaultContent" : ""},                                     // 계약번호
            {"data":"outDt" , "defaultContent" : ""},                             // 판매일자
            {"data":"chassisNo" , "defaultContent" : ""},                           // 차대번호
            {"data":"챠량번호" , "defaultContent" : ""},                                // 차량번호
            {"data":"saleManNm" , "defaultContent" : ""}, //담당영업사원
            {"data":"remark" , "defaultContent" : ""} //비고
        ]
    });
    
    

    
    
    //고객정보 load
    var formData = $("#cnsltInBoundMngVO").serializeArray();
    //form 과 param을 함께 넘길경우
    formData.push({name:"cstmrCd", value:$("input[name=searchCstmrCd]").val()});
    //formData.push({name:"cnsltIncallNo", value:$("input[name=cnsltIncallNo]").val()});
    formData.push({name:"cstmrNm", value:$("input[name=searchCstmrNm]").val()});
    formData.push({name:"brthdy", value:$("input[name=searchBrthdy]").val()});
    formData.push({name:"hpno", value:$("input[name=searchHpno]").val()});
    formData.push({name:"emailAdres", value:$("input[name=searchEmailAdres]").val()});
    
	$.ajax({
		type: "POST",
		dataType:"json",
		async: false,
		url: "<c:url value='/ec4/call/inbd/loadCstmrLastInfo.do'/>",
		data:formData,
		success:function(data) {
			if (data.ok) {

				$("input[name=searchVin]").val(nvl(data.result.vin,"")); //차대번호
				$("input[name=searchCarNo]").val(nvl(data.result.vehiNo01,"")+""+nvl(data.result.vehiNo02,"")); //차량번호
				
				if( "" != nvl(data.result.lastVhclMdl,"") ){
					$("select[name=searchVhclMdl]").val(null).trigger('change'); //최근차량정보 콤보
					$("select[name=searchVhclMdl]").prepend("<option value='"+data.result.lastVhclMdl+"' selected>"+data.result.lastVhclMdlNm+"</option>");
				}
				
				$("input[name=searchLastReadKm]").val(nvl(data.result.lastReadKm,"")); //주행거리
				$("input[name=searchTypeYear]").val(nvl(data.result.typeYear,"")); //차량연식
				$("input[name=searchLastInShop]").val(nvl(data.result.lastCustNm,"")); //최근입고정비소
				$("input[name=searchLastInDate]").val(nvl(data.result.lastRcptDate,"")); //최근입고일자
				$("input[name=searchCustAdres]").val(nvl(data.result.houseAdres,"")+" "+nvl(data.result.houseAdresDetail,"")); //주소
				$("input[name=searchLastCustMemo]").val(nvl(data.result.cnsltMemo,"")); //최근고객메모
				//$('input[name="searchCustClass"]:radio[value="3"].prop('checked',true)'); //원하는 라디오박스값 체크
				//$('input[name="searchCustClass"]'.removeAttr('checked'));  //체크되어있는 모든 체크박스 해제
				//$('input[name="searchCustClass"]:checked').val(); //체크되어있는 라디오박스 값 추출
				//$('input[name="searchCustClass"]:checked').length; //체크되어있는 라디오박스 갯수 추출
			}
		},
		error:function(request, status) {
			alert("error["+request+"]");
		    return;
		}
	});
}



function callCarRecallList(paramVin, paramVhcleNo){
    /* 리콜내역 */
    try{$('#callCarRecallTable').DataTable().clear().destroy();}catch(e){}
    // 콜상담 테이블
    callCarRecallTable = $('#callCarRecallTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        //"order": [[ 1, "desc" ]],
        "rowId": "campNo",
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
        "sAjaxSource": "/ec4/call/inbd/selectCallCarRecallList.do",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchVin",   "value": paramVin},
                    {"name": "searchVhcleNo","value": paramVhcleNo}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            //{"visible": false, "targets": [0]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 0
            {"data":"campNo" , "defaultContent" : ""},                                 // 캠페인번호
            {"data":"rmrk" , "defaultContent" : ""},                               // 캠페인명
            {"data":"fromDate" , "defaultContent" : ""},                                   // 캠페인시작일
            {"data":"toDate" , "defaultContent" : ""},                                     // 캠페인종료일
            {"data":"causPartNo" , "defaultContent" : ""},                             // 보증부품번호
            {"data":"chngPartNo" , "defaultContent" : ""},                           // 변경부품번호
            {"data":"carDfct" , "defaultContent" : ""},                                // 차량상황
            {"data":"partDfct" , "defaultContent" : ""},                                     // 부품결함
            {"data":"campGubnt" , "defaultContent" : ""},                                      // 보증구분
            {"data":"campCheck" , "defaultContent" : ""},                                      // 캠패인확인
            {"data":"dfctResn" , "defaultContent" : ""}                                      // 결함원인
        ]
    });
}




function callCarPeriodList(paramVin, paramVhcleNo){
    /* 리콜내역 */
    try{$('#callCarPeriodTable').DataTable().clear().destroy();}catch(e){}
    // 콜상담 테이블
    callCarPeriodTable = $('#callCarPeriodTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        //"order": [[ 1, "desc" ]],
        "rowId": "campNo",
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
        "sAjaxSource": "/ec4/call/inbd/selectCallCarPeriodList.do",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchVin",   "value": paramVin},
                    {"name": "searchVhcleNo","value": paramVhcleNo}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            //{"visible": false, "targets": [0]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},                                          // 0
            {"data":"jobCode" , "defaultContent" : ""},                                 // 1   1
            {"data":"expRcptDate" , "defaultContent" : ""},                               // 2   1
            {"data":"expReadKm" , "defaultContent" : ""},                                   // 3
            {"data":"lstReadKm" , "defaultContent" : ""},                                     // 4
            {"data":"histDate" , "defaultContent" : ""},                             // 5
            {"data":"histDistance" , "defaultContent" : ""},                           // 6   4   1
            {"data":"jobPeriod" , "defaultContent" : ""}                                // 7   5
        ]
    });
}

function rtnCstmrOwnerCarList(rCstmrCd){
	//var grid = $("#listCstmrOwnerCarTable").DataTable();
	//grid.destroy();
	//$("#listCstmrOwnerCarTable tbody").remove();
	$('#listCstmrOwnerCarTable').DataTable().clear().destroy();
	gtListCstmrOwnerCarTable = $("#listCstmrOwnerCarTable").dataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 8, "ASC" ]],
        "rowId": "cstmrEsntlId",
        "scrollY": "369px",
        "pageLength": 10,
        "pagingType": "full_numbers", //전체건수중 몇건 표시
        "paginate": true, //페이지 표시
        "lengthChange": false,// 10개씩보기, 50개씩보기, 100개씩보기
        "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
        "responsive": true,
        "processing": true,
        "ordering": true,
        "searching": false,
        "serverSide": true,
        "sAjaxSource": "/ec4/cmm/cinfo/cstmrOwnerCarList.do",
        "fnServerParams": function(aoData){
            aoData.push(
                    {"name": "searchCstmrCd",   "value": rCstmrCd},
                    /* {"name": "searchCstmrNm",   "value": $("#searchCallCnsltForm input[name=searchCstmrNm]").val()},
                    {"name": "searchHpno",         "value": $("#searchCallCnsltForm input[name=searchHpno]").val()},
                    {"name": "searchEmailAdres","value": $("#searchCallCnsltForm input[name=searchEmailAdres]").val()} */
                    {"name": "searchCstmrNm",   "value": $("#searchCstmrNm").val()},
                    {"name": "searchHpno",         "value": $("#searchHpno").val()},
                    {"name": "searchEmailAdres","value": $("#searchEmailAdres").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [ 
			        	//{
			        	//    "targets"String: 0,
			        	//    "data"String: "download_link"String,
			        	//    "render"String: function ( data, type, row, meta ) {
			        	//      return '<a href="'String+data+'">Download</a>'String;
			        	//    }
			        	//}
			        	//{
			        	//    "targets"String: 4,
			        	//    "data"String: "description"String,
			        	//    "render"String: function ( data, type, row, meta ) {
			        	//      return type === 'display'String && data.length > 40 ?
			        	//        '<span title="'String+data+'">'String+data.substr( 0, 38 )+'...</span>'String :
			        	//        data;
			        	//    }
			        	//}
		                {"visible": false, "targets": [0,1,2,11,12,13,14,15,16] , "width" : "1%"},
		                {"orderable": true, "targets": [3], "width" : "10%"},
		                {"orderable": true, "targets": [4], "width" : "10%"},
		                {"orderable": true, "targets": [5], "width" : "10%"},
		                {"orderable": true, "targets": [6], "width" : "10%"},
		                {"orderable": true, "targets": [7], "width" : "10%"},
		                {"orderable": true, "targets": [8], "width" : "10%"},
		                {"orderable": true, "targets": [9], "width" : "10%"},
		                {"orderable": true, "targets": [10], "width" : "10%"}
       	         	  ],    
	    //"order": [ 5, 'asc' ],
	    "columns": [
            			{"data":"rn"},
			            {"data":"cstmrEsntlId" , "defaultContent" : ""},//ACQS번호
			            {"data":"cstmrVhcleSeq" , "defaultContent" : ""},//ACQS순번
			            {"data":"ifKndNm" , "defaultContent" : ""},//구분 정비/판매
			            {"data":"vhcleNo" , "defaultContent" : ""},//차량번호
			            {"data":"vin" , "defaultContent" : ""},//차대번호
			            {"data":"modelNm" , "defaultContent" : ""},//모델
			            {"data":"colorNm" , "defaultContent" : ""},//색상
			            {"data":"lastRcptDate" , "defaultContent" : ""},//최근방문일자
			            {"data":"lastCustNm" , "defaultContent" : ""},//최근정비소
			            {"data":"adviserNm" , "defaultContent" : ""},//담당어드바이저
			            {"data":"deliDate" , "defaultContent" : ""},//출고일자
			            {"data":"mfgDate" , "defaultContent" : ""},//생산일자
			            {"data":"lastReadKm" , "defaultContent" : ""},//최종주행거리
			            {"data":"optionNm" , "defaultContent" : ""},//옵션명
			            {"data":"envcertYn" , "defaultContent" : ""},//저공해유무
			            {"data":"envcertNo" , "defaultContent" : ""}//저공해모델인증번호
	    			],
        "initComplete": function(settings, json) {

	     }
	});	
}


function cstmrDetailInfoClear(){
    $("input[name=viewVhcleNo]").val("");
    $("input[name=viewVin]").val("");
    $("input[name=viewModelNm]").val("");
    $("input[name=viewColorNm]").val("");
    $("input[name=viewLastRcptDate]").val("");
    $("input[name=viewLastCustNm]").val("");
    $("input[name=viewDeliDate]").val("");
    $("input[name=viewMfgDate]").val("");
    $("input[name=viewLastReadKm]").val("");
    $("input[name=viewOptionNm]").val("");
    $("input[name=viewEnvcertYn]").val("");
    $("input[name=viewEnvcertNo]").val("");
    

	/* 리콜내역 */
    try{$('#callCarRecallTable').DataTable().clear().destroy();}catch(e){}      
	/* 개인소모품교환 */
    try{$('#callCarPeriodTable').DataTable().clear().destroy();}catch(e){}           
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
                인바운드
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리(In)</a></li>
                <li class="active">인바운드</li>
            </ol>
        </section>

<!-- Main content -->
    <section class="content">
      <div id="cnsltMainDiv" class="row">


		<!-- ############################# 메인화면 ######################  -->
        	<div id="custDiv" class="col-md-11"> <!-- DIV 가로영역을 나누는 용도 -->
        		  <div id="callBtn">
	        		  <button type="button" class="btn btn-default">ON</button>
	        		  <button type="button" class="btn btn-default">대기</button>
	        		  <button type="button" class="btn btn-default">이석</button>
	        		  <button type="button" class="btn btn-default">보류</button>
	        		  <button type="button" class="btn btn-default">협의</button>
	        		  <button type="button" class="btn btn-default">호전환</button>
	        		  <button type="button" class="btn btn-default">3자</button>
	        		  <button type="button" class="btn btn-default">걸기</button>
	        		  <button type="button" class="btn btn-default">끊기</button>
	        		  <button type="button" class="btn btn-default">전화번호조회</button>
	        		  <button type="button" class="btn btn-default">대화형검색0</button>
	        		  <button type="button" class="btn btn-default">고객등급관리</button>
	        		  <button type="button" class="btn btn-default" id="cnsltRegPop">상담내용저장화면</button>
	        		  <button type="button" class="btn btn-default" id="cnsltSmsPop">상담SMS전송</button>
        		  </div>
        		  	<form:form commandName="cnsltInBoundMngVO" name="cnsltInBoundMngVO" method="post" cssClass="form-horizontal">
        		  	<!-- <double-submit:preventer/> -->
	        		<p class="bg-info toggle-list">○ 고객정보</p>
                    <!-- /.box-header -->
					<div id="postnTable" class="row">
			            <%-- <div class="col-md-3">
			            <form class="form-horizontal">
		                    <div class="form-group dstick" align="center">
						    <a href="#" class="" align="center">
						      <img src="/images/egovframework/ec4/call/callTimeSample1.png" alt="..." border="0" align="center" style="float:left;width:100%;">
						    </a>
						    </div>
						    
		                    <div class="form-group dstick" align="center">
						    <a href="#" class="" align="center">
						      <img src="/images/egovframework/ec4/call/callTimeSample2.png" alt="..." border="0" align="center" style="float:right;">
						    </a>
						    </div>
						</form>
			            </div> --%>
			            <div class="col-md-12">
			            <form name="searchCallCnsltForm" id="searchCallCnsltForm" method="post" onsubmit="return false;">
			            	<!-- 검색항목 -->
		                    <div class="row">
				                    <form class="form-horizontal">
				                    	<div class="form-group dstick">
			                                <label for="searchCustNm" class="col-sm-2 control-label">고객명</label>
			                                <div class="col-sm-2 dstick">
		                                        <div class="input-group">
			                                        <input type="hidden" name="searchCstmrCd" class="form-control" id="searchCstmrCd"/>
			                                        <input type="text" name="searchCstmrNm" class="form-control" id="searchCstmrNm"/>
			                                        <div class="input-group-btn">
			                                            <button type="button" id="custPop" class="btn btn-info btn-flat">
			                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
			                                            <i class="fa fa-search"></i></button>
			                                        </div>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCustNm">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                    </div>
			                                </div>
			                                <label for="searchHpno" class="col-sm-2 control-label">핸드폰</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
				                                	<input type="text" name="searchHpno" class="form-control" id="searchHpno"/>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCustHp">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
			                                <label for="searchEmailAdres" class="col-sm-2 control-label">이메일</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
				                                	<input type="text" name="searchEmailAdres" class="form-control" id="searchEmailAdres"/>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCustEmail">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="searchVin" class="col-sm-2 control-label">차대번호</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
				                                	<input type="text" class="form-control" id="searchVin" name="searchVin"/>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delVin">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
			                                <label for="searchCarNo" class="col-sm-2 control-label">차량번호</label>
			                                <div class="col-sm-2 dstick">
			                                	<div class="input-group">
			                                		<input type="text" class="form-control" id="searchCarNo" name="searchCarNo"/>
			                                		<div class="input-group-btn">
				                                		<!-- <button type="button" class="btn btn-info" data-toggle="modal" data-target="#vehicInfoModal"> -->
				                                		<button type="button" id="custCarPop" class="btn btn-info btn-flat">
				                                			<i class="fa fa-search"></i>
				                                		</button>
			                                		</div>
				                                	<div class="input-group-btn">
										                <button type="button" class="close" aria-label="Close" id="delCarNo">
										                    <span aria-hidden="true">&times;</span>
										                </button>
				                                	</div>
			                                	</div>
			                                </div>
			                                <div> 
			                                </div>
				                    	</div>
				                    </form>
		                    </div>
		                    <!-- 검색항목  END <<<<<<<<<<<<<-->
		                    
							<!-- 고객정보항목 -->
		                    <div class="row">
				                    <form class="form-horizontal">

		                                <div class="form-group dstick">
		                                    <label for="agreeLbl" class="col-sm-2 control-label">동의여부</label>
		                                    <div class="col-sm-10 checkbox dstick">
									  			<label><input type="checkbox">마케팅활용동의</label>
		                                    </div>
										</div>
		                                <div class="form-group dstick">
		                                    <label for="lastVhcleInfo" class="col-sm-2 control-label">최근차량정보</label>
		                                    <div class="col-sm-2 dstick" style="padding-bottom:0px">
				                                    <div class="col-sm-12 dstick">
					                                    <form:select path="searchVhclMdl" class="form-control input-sm selectVhclMdl">
					                                        <form:option value="">-- 모델 --</form:option>
					                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
					                                    </form:select>
					                                    <form:errors cssClass="help-block" path="searchVhclMdl" />
				                                    </div>
				                                    <%-- <div class="col-sm-6 dstick">
					                                    <form:select path="searchVhclDetlMdl" class="form-control input-sm selectDetlMdl">
					                                        <form:option value="">-- 세부모델 --</form:option>
					                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
					                                    </form:select>
					                                    <form:errors cssClass="help-block" path="searchVhclDetlMdl" />
				                                    </div> --%>
			                                </div>
		                                </div>
				                    	<div class="form-group dstick">
			                                <label for="searchLastReadKm" class="col-sm-2 control-label">주행거리</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="searchLastReadKm" name="searchLastReadKm"/>
			                                </div>
			                                <label for="searchTypeYear" class="col-sm-2 control-label">차량연식</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="searchTypeYear" name="searchTypeYear"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="searchLastInShop" class="col-sm-2 control-label">최근입고정비소</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="searchLastInShop" name="searchLastInShop"/>
			                                </div>
			                                <label for="searchLastInDate" class="col-sm-2 control-label">최근입고일자</label>
			                                <div class="col-sm-2 dstick">
			                                	<input type="text" class="form-control" readonly id="searchLastInDate" name="searchLastInDate"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group dstick">
			                                <label for="searchCustAdres" class="col-sm-2 control-label">주소</label>
			                                <div class="col-sm-10 dstick">
			                                	<input type="text" class="form-control" readonly id="searchCustAdres" name="searchCustAdres"/>
			                                </div>
				                    	</div>
		                                <div class="form-group dstick">
		                                    <label for="text01" class="col-sm-2 control-label">웹회원정보</label>
		                                    <div class="col-sm-10 checkbox dstick">
			                                	<label>등급<input type="text" class="form-control-nowd w40" readonly id="searchCustClass"/></label>
			                                	<label>&nbsp;</label>
									  			<label><input type="checkbox" disabled>쉐보레멤버</label>
									  			<label><input type="checkbox" disabled>웹멤버</label>
									  			<label><input type="checkbox" disabled>오토멤버</label>
		                                    </div>
										</div>
				                    	<div class="form-group dstick">
			                                <label for="searchLastCustMemo" class="col-sm-2 control-label">최근고객메모</label>
			                                <div class="col-sm-10 dstick">
			                                	<input type="text" class="form-control" id="searchLastCustMemo" name="searchLastCustMemo" readonly/>
			                                </div>
				                    	</div>
			
					                    <div class="form-group">
					                    	<div class="col-sm-1"></div>
					                    	<div class="col-sm-11">
										          <table id="listCstmrOwnerCarTable" name="listCstmrOwnerCarTable" class="table table-hover">
										            <thead>
										              <tr>
                                        				<th><spring:message code="cmm.seq"/></th>
										                <th>ACQS번호</th>
										                <th>ACQS순번</th>
										                <th>구분</th>
										                <th>차량번호</th>
										                <th>차대번호</th>
										                <th>차량모델</th>
										                <th>색상</th>
										                <th>최근방문일자</th>
										                <th>최근방문정비소</th>
										                <th>담당어드바이저</th>
										                <th>출고일자</th>
										                <th>생산일자</th>
										                <th>최종주행거리</th>
										                <th>옵션명</th>
										                <th>저공해유무</th>
										                <th>저공해모델인증번호</th>
										              </tr>
										            </thead>
										            <tbody>
										          	</tbody>
										          </table>
					                    	</div>
					                    </div>	
					                    				                    	
				                    </form>
				            </div>
							<!-- 고객정보항목 THE END <<<<<<<<<<<  -->
			            </form>
			            </div>
                    	<!-- /.box-body THE END -->
			        </div>
			        </form:form>


        	</div>
		</div>
		<!-- row 상단 THE END -->

	      <div class="row">
		      <div class="col-md-12">
		        		<p class="bg-info toggle-list">○ 이력정보</p>
				        <div id="postnList">
								<ul class="nav nav-pills" id="histTab">
								  <li id="bottomTab0" role="presentation" class="active"><a href="#tab0">상담이력</a></li>
								  <li id="bottomTab1" role="presentation"><a href="#tab1">차량상세</a></li>
								  <li id="bottomTab2" role="presentation"><a href="#tab2">리콜내역</a></li>
								  <li id="bottomTab3" role="presentation"><a href="#tab3">계약/판매이력</a></li>
								  <li id="bottomTab4" role="presentation"><a href="#tab4" id="histRepair">정비이력</a></li>
								  <li id="bottomTab5" role="presentation"><a href="#tab5">KMS이력</a></li>
								  <li id="bottomTab6" role="presentation"><a href="#tab6">AUTO포인트</a></li>
								  <li id="bottomTab7" role="presentation"><a href="#tab7">캠페인자료실</a></li>
								  <li id="bottomTab8" role="presentation"><a href="#tab8">예상정비조회</a></li>
								  <li id="bottomTab9" role="presentation"><a href="#tab9">정기소모품</a></li>
								</ul>
								<!-- 상담이력  -->
								<div id="tab0" style="width: 100%; padding: 0px; display:inline;">
						          <table id="callCnsltHistTable" class="table table-hover">
						            <thead>
						              <tr>
                                        <th><spring:message code="cmm.seq"/></th>
						                <th>고객명</th>
						                <th>상담일자</th>
						                <th>상담원</th>
						                <th>상담유형</th>
						                <th>상담구분</th>
						                <th>상담결과</th>
						                <th>상담내용</th>
						                <th>조치내용</th>
						                <th>상담원메모</th>
						              </tr>
						            </thead>
						            <tbody>
						            </tbody>
						          </table>
						        </div>
								<!-- 차량상세  -->
						        <div id="tab1" style="width: 100%; padding: 0px; display:none;" cssClass="form-horizontal">
		                            <div class="form-group">
		                                <label for="cstmrNm" class="col-sm-2 control-label">차량번호</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewVhcleNo" class="form-control" id="viewVhcleNo" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">차대번호</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewVin" class="form-control" id="viewVin" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">모델명</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewModelNm" class="form-control" id="viewModelNm" readonly/>
		                                </div>
								  	</div>
		                            <div class="form-group">
		                                <label for="cstmrNm" class="col-sm-2 control-label">색상</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewColorNm" class="form-control" id="viewColorNm" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">최근방문일자</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewLastRcptDate" class="form-control" id="viewLastRcptDate" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">최근방문정비소</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewLastCustNm" class="form-control" id="viewLastCustNm" readonly/>
		                                </div>
								  	</div>
		                            <div class="form-group">
		                                <label for="cstmrNm" class="col-sm-2 control-label">출고일자</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewDeliDate" class="form-control" id="viewDeliDate" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">생산일자</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewMfgDate" class="form-control" id="viewMfgDate" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">최종주행거리</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewLastReadKm" class="form-control" id="viewLastReadKm" readonly/>
		                                </div>
								  	</div>
		                            <div class="form-group">
		                                <label for="cstmrNm" class="col-sm-2 control-label">옵션</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewOptionNm" class="form-control" id="viewOptionNm" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">저공해유무</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewEnvcertYn" class="form-control" id="viewEnvcertYn" readonly/>
		                                </div>
		                                <label for="hpno" class="col-sm-2 control-label">저공해모델인증번호</label>
		                                <div class="col-sm-2">
			                                <input type="text" name="viewEnvcertNo" class="form-control" id="viewEnvcertNo" readonly/>
		                                </div>
								  	</div>
						        </div>
								<!-- 리콜내역  -->
								<div id="tab2" style="width: 100%; padding: 0px; display:none;">
						          <table id="callCarRecallTable" class="table table-hover">
						            <thead>
						              <tr>
                                        <th><spring:message code="cmm.seq"/></th>
							            <th>캠페인번호</th>
							            <th>캠페인명</th>
							            <th>캠페인시작일</th>
							            <th>캠페인종료일</th>
							            <th>보증부품번호</th>
							            <th>변경부품번호</th>
							            <th>차량상황</th>
							            <th>부품결함</th>
							            <th>보증구분</th>
							            <th>캠패인확인</th>
							            <th>결함원인</th>
						              </tr>
						            </thead>
						            <tbody>
						            </tbody>
						          </table>
						        </div>
								<!-- 계약/판매이력  -->
								<div id="tab3" style="width: 100%; padding: 0px; display:none;">
						          <table id="callContSalesTable" class="table table-hover">
						            <thead>
						              <tr>
						                <th><spring:message code="cmm.seq"/></th>
						                <th>고객명</th>
						                <th>계약자명</th>
						                <th>계약일자</th>
						                <th>계약번호</th>
						                <th>판매일자</th>
						                <th>차대번호</th>
						                <th>차량번호</th>
						                <th>담당영업사원</th>
						                <th>비고</th>
						              </tr>
						            </thead>
						            <tbody>
						            </tbody>
						          </table>
						        </div>
								<!-- 정기소모품  -->
								<div id="tab9" style="width: 100%; padding: 0px; display:none;">
						          <table id="callCarPeriodTable" class="table table-hover">
						            <thead>
						              <tr>
						                <th><spring:message code="cmm.seq"/></th>
						                <th>작업코드</th>
						                <th>예상입고일자</th>
						                <th>예상주행거리</th>
						                <th>마지막주행거리</th>
						                <th>최근교환일자</th>
						                <th>최근교환주행거리</th>
						                <th>JOB_PERIOD</th>
						              </tr>
						            </thead>
						            <tbody>
						            </tbody>
						          </table>
						        </div>
				        </div>
		        </div>
	      </div>


      <!-- /.row -->
    </section>
    <!-- /.content -->


    </div>
    <!-- /.content-wrapper -->


	<!-- 고객정보 Modal -->
	<div class="modal fade" id="custInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">고객검색</h4>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 차량정보 Modal -->
	<div class="modal fade" id="vehicInfoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">차량검색</h4>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>



    <footer class="main-footer">
        <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

</div>
<!-- ./wrapper -->

        <div class="modal modal-center fade" id="popupModal">
            <div class="modal-dialog modal-large modal-center">
                <div class="modal-content modal-large">

                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
<!-- /.modal -->

	    <form name="mainPopupForm" method="post" id="mainPopupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" value=""/>
	        <input type="hidden" name="cnsltIncallNo" value=""/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	        <input type="hidden" name="vin" value=""/>
	        <input type="hidden" name="vhcleNo" value=""/>
	        <input type="hidden" name="custVhclMdl" value=""/>
	        <input type="hidden" name="custVhclMdlNm" value=""/>
	        <input type="hidden" name="cstmrEsntlId" value=""/>
	        <input type="hidden" name="cstmrVhcleSeq" value=""/>
	    </form>

</body>
</html>
