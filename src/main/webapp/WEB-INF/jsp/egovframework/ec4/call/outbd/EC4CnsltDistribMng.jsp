<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltDistribMng.java
  * @Description : EC4CnsltDistribMng List 화면
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
    <title>상담원 고객분배</title>
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

    
<!-- 아래 STYLE은 멀티 SELECT박스용도이며 공통 CSS에 넣고 사용해봤더니 적용이 안되기에 필요한 페이지에만 기입 적용한다. --> 
<style>
.dropdownBox{
	display: inline-block;
}
.dropdownBox *{
	vertical-align: middle;
	padding: 0;
	margin: 0;
    font-family:'Nanum Gothic',dotum,verdana,Geneva,sans-serif!important;
    font-size: 11px;
    text-decoration: none;
    color: #424242;
    border: 1px solid #bfbfbf; 
}
.dropdownBox dt{
	cursor: pointer;
}
.dropdownBox dt,
.dropdownBox dd{
	width: 155px;
}
.dropdownBox dt{
	display: inline-block;
	vertical-align: middle;
	line-height: 30px;
	padding: 0em 0em;
	border: 0px solid #424242;
}
.dropdownBox dt>span{
	display: inline-block;
	vertical-align: middle;
	border-color : #e6e6e6;
	border : 1px;
}
.dropdownBox dt>span.multiCheckValues{
	width: 125px;
	background-color: #FFFFFF;
    font-family:'Nanum Gothic',dotum,verdana,Geneva,sans-serif!important;
    font-size: 11px;
    text-decoration: none;
    color: #888;	
}
.dropdownBox dt>span.dropBtn{
	width: 25px;
	text-align : center;
	background-color: #00ACD6;
}
.dropdownBox dd{
	display: none;
	position: absolute;
	overflow-x: hidden;
	overflow-y: auto;
	word-break; break-all;
	z-index: 100;
	border: 0px solid #424242; 
	background-color: #FFFFFF;
	max-height: 200px;
	padding: 0em 0em;
}
.dropdownBox ul,
.dropdownBox li{
	list-style: none;
	border: 0px solid #bfbfbf; 
	padding: 0em 0em;
}
.dropdownBox dd>ul li{
	display: block;
	line-height: 20px;
    font-family:'Nanum Gothic',dotum,verdana,Geneva,sans-serif!important;
    font-size: 11px;
    text-decoration: none;
    color: #888;
    background: #fff;
	border: 0px solid #bfbfbf; 
	border-bottom : 1px solid #d8d9db;
	border-right : 1px solid #d8d9db;
	border-left : 1px solid #d8d9db;
	padding: 3px 8px;
}
</style>
<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){

    if('${message}'){

        alert('${message}');
    }

    $(".sidebar-menu").tree();

    
    //Date picker
    /* $(".datepicker").datepicker({
      autoclose: true,
      format: "yyyy-mm-dd"
    }); */
	$("#searchBeginDe").val((moment().subtract(1, 'month')).format('YYYY-MM-DD'));
	$("#searchEndDe").val(moment().format('YYYY-MM-DD'));
    $("#callColectDt").daterangepicker({ //참조: http://www.daterangepicker.com/
        //dateFormat: 'YYYY-MM-DD',
        startDate: moment().subtract(1, 'month'), //1개월전
        //startDate: moment().subtract(30, 'days'), //30일전
        locale: {
        	format : 'YYYY-MM-DD'
        }
    }, function(start, end, label) {
    	//console.log("start["+start.format('YYYY-MM-DD')+"]");
    	//console.log("end["+end.format('YYYY-MM-DD')+"]");
    });
    $('#callColectDt').on('apply.daterangepicker', function(ev, picker) { 
    	//console.log(picker.startDate.format('YYYY-MM-DD')); 
    	//console.log(picker.endDate.format('YYYY-MM-DD')); 
    	$("#searchBeginDe").val(picker.startDate.format('YYYY-MM-DD'));
    	$("#searchEndDe").val(picker.endDate.format('YYYY-MM-DD'));
    }); 
    $('#callColectDt').on('cancel.daterangepicker', function(ev, picker) {
    	//취소눌러도 검색기본조건으로 사용되도록 초기화하지 않는다
    	//$('#callColectDt').val(''); 
    }); 

    

    
    


    // 대상고객 테이블
    listCnsltDistribTable = $('#listCnsltDistribTable').DataTable({
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 3, "desc" ]],
        "rowId": "cstmrCd",
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
        "sAjaxSource": "<c:url value='/ec4/call/outbd/selectEC4CnsltDistribMng.do'/>",
        "fnServerParams": function(aoData){
            aoData.push(
            		{"name": "searchCstmrCd",   "value": $("#searchCnsltDistribMngVO input[name=searchCstmrCd]").val()},
            		{"name": "searchCstmrNm",   "value": $("#searchCnsltDistribMngVO input[name=searchCstmrNm]").val()},
            		{"name": "searchCnsltUserId",   "value": $("#searchCnsltDistribMngVO input[name=searchCnsltUserId]").val()},
            		{"name": "searchCnsltUserNm",   "value": $("#searchCnsltDistribMngVO input[name=searchCnsltUserNm]").val()},
            		{"name": "scriptKnd",   "value": $("#searchCnsltDistribMngVO select[name=scriptKnd] option:selected").val()},
            		{"name": "scriptCd",       "value": $("#searchCnsltDistribMngVO select[name=scriptCd] option:selected").val()},
            		{"name": "searchBeginDe",   "value": $("#searchCnsltDistribMngVO input[name=searchBeginDe]").val()},
            		{"name": "searchEndDe",     "value": $("#searchCnsltDistribMngVO input[name=searchEndDe]").val()},
            		{"name": "searchHpno",       "value": $("#searchCnsltDistribMngVO input[name=searchHpno]").val()},
            		{"name": "callState",       "value": $("#searchCnsltDistribMngVO select[name=callState] option:selected").val()},
            		{"name": "callAsign",       "value": $("#searchCnsltDistribMngVO select[name=callAsign] option:selected").val()},
            		{"name": "searchCnsltTyCn",   "value": $("#searchCnsltDistribMngVO input[name=cnsltTyCn]").val()},
            		{"name": "searchCnsltTyCnCode",   "value": $("#searchCnsltDistribMngVO input[name=cnsltTyCnCode]").val()},
            		{"name": "instAsignKnd",   "value": $("#searchCnsltDistribMngVO select[name=instAsignKnd] option:selected").val()}
            );
        },
        "sServerMethod": "POST",
        "columnDefs": [
            {"visible": false, "targets": [2,4,5,6]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},//순번
            {"data":"vChk",
			 render:function(data,type,row,meta){
				 return '<input type="checkbox" name="chk" id="chk" class="no_border" size="5">';
			 }
            },
            {"data":"makrCd", "defaultContent": ""},//브랜드
            {"data":"callCd", "defaultContent": ""},//콜번호
            {"data":"callColectGbCd", "defaultContent": ""},//수집구분
            {"data":"cstmrCd", "defaultContent": ""},//고객코드
            {"data":"callCstmrCdSeq", "defaultContent": ""},//고객순번
            {"data":"callColectGbNm", "defaultContent": ""},//수집구분명
            {"data":"scriptKndNm", "defaultContent": ""},//스크립트구분
            {"data":"scriptCdNm", "defaultContent": ""},//스크립트제목
            {"data":"recvNo", "defaultContent": ""},//접수번호
            {"data":"hdqrtrsNm", "defaultContent": ""}, //본부명
            {"data":"replcSeCode", "defaultContent": ""}, //사업소코드
            {"data":"replcNm", "defaultContent": ""}, //사업소명
            {"data":"asignCnsltUserId", "defaultContent": ""},//배분상담원id
            {"data":"asignCnsltUserNm", "defaultContent": ""},//배분상담원명
            {"data":"asignDt", "defaultContent": ""},//배분일자
            {"data":"cstmrNm", "defaultContent": ""},//고객명
            {"data":"carNo", "defaultContent": ""},//차량번호
            {"data":"carNm", "defaultContent": ""},//차량명
            {"data":"hpno", "defaultContent": ""},//핸드폰
        ]
    });


    // 검색 input search
    $("#searchCnsltDistribMngVO input").on("keyup change", function(key){

        if(key.keyCode == 13 || $(this).hasClass("datepicker")){

        	listCnsltDistribTable.search(this.value).draw();
        }

    });


    // 검색 select search
    $("#searchCnsltDistribMngVO select").on("change", function(key){

    	listCnsltDistribTable.search(this.value).draw();
    });


    
    



    
	$(document).on("click","#custUpload",function() {
		var txtUrl = "/ec4/call/outbd/cnsltOutBoundTargetCustPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '1200', '900', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top
    });
	
	
	$(function(){
		$("#multiCheckbox").dropdownMultiCheckbox();
	});



	$.extend($.fn,{
		//////////////////멀티체크셀렉트박스 세팅및 click이벤트 세팅
		dropdownMultiCheckbox : function(){
			/*드롭다운 selectbox*/
			var topParent = this;
			
			//전체 선택 input셍성
			$("[id=multiCheckbox]").find("dd>ul").prepend("<li>&nbsp;&nbsp;<input type='checkbox' name='mallchk' class='allmultichk'>&nbsp;전체선택</li>");
			
			this.setCheckedCnt();
			
			//multi select box 클릭 시 dropdownBox 열기/닫기
			$("[id=multiCheckbox]").find("dt").on('click',function(){
				//다른 셀렉트 박스가 열려있는 경우 닫기
				$(".dropdownBox dt").not(this).nextAll().filter("dd").hide();
				
				$(this).nextAll().filter("dd").slideToggle('fast');
			});
			
			//전체 선택 체크/해제 시
			$("[id=multiCheckbox]").find(".allmultichk").on('click',function(e){
				var selectChk=$(this).is(':checked');
 				if(selectChk){
					$("[name = mchk]").prop("checked",true);
				}else{
					$("[name = mchk]").prop("checked",false);
				}
				/* topParent.setCheckedCnt(); */ 
				var ichk_cnt = $("[name=mchk]:checked").length;
				var iall_cnt = $("[name=mchk]").length;
 				if(ichk_cnt == iall_cnt){
 					$("[id=multiCheckbox]").find(".multiCheckValues").html("&nbsp;전체 선택");
 				}else{
 					$("[id=multiCheckbox]").find(".multiCheckValues").html("&nbsp;선택 "+ichk_cnt+"개/총 "+iall_cnt+"개");
 				}
			});
			
			//항목 체크박스 체크 시 선택된 개수 update
			$("[id=multiCheckbox]").find("dd input[type='checkbox'][class!='allmultichk']").on('click',function(e){
				topParent.setCheckedCnt();
			});
			
			//dropbox에 포커스가 나간경우 닫기
			$('body').mousedown(function(e){
				$(".dropdownBox").each(function(){
					if($(this).find("dd").css('display') == 'block'){
						if(!$(this).has(e.target).length){
							$(this).find("dd").hide();
						}
					}
				});
			});
		},
		//////////////////checked 된 cnt 세팅
		setCheckedCnt : function(){
			var chk_cnt = $("[name=mchk]:checked").length;
			var all_cnt = $("[name=mchk]").length;
			if(chk_cnt == all_cnt){
				$("[id=multiCheckbox]").find(".multiCheckValues").html("&nbsp;전체 선택");
				$("[name = mallchk]").prop("checked",true);
			}else{
				$("[id=multiCheckbox]").find(".multiCheckValues").html("&nbsp;선택 "+chk_cnt+"개/총 "+all_cnt+"개");
				$("[name = mallchk]").prop("checked",false);
			}
		}
	});
	

	
	

    
    
    //조회버튼
    $("#btnSearch").click(function(){
    	listCnsltDistribTable.search(this.value).draw();
    });
    
    //입력된값 지우면 ID값 초기화
    $("#searchCstmrNm").keyup(function(){
		if($("#searchCnsltDistribMngVO input[name=searchCstmrNm]").val() == ""){
			$("#searchCnsltDistribMngVO input[name=searchCstmrCd]").val("");
		}
	});


	$(document).on("click","#custPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cstmrNm]").val($("#searchCallCnsltForm input[name=searchCstmrNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cstmrNm]").val($("#searchCstmrNm").val());
        $("#popupForm input[name=hpno]").val($("#searchHpno").val());
        $("#popupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrPop.do'/>";

        popupParams.width = "800";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });
	
	

	$(document).on("click","#cnsltTypePop",function() {
        var popupParams = {};

        $("#searchCnsltTyCn").val($("#cnsltTyCn").val());
        $("#searchCnsltTyCnCode").val($("#cnsltTyCnCode").val());

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/inbd/cnsltInBoundTypePop.do'/>";

        popupParams.width = "1000";
        popupParams.height = "700";
        popupParams.title = "popupSelectCnsltType";
        popupParams.form = document.searchCnsltDistribMngVO;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/cmm/cinfo/cstmrIntgrPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });	


	$(document).on("click","#cnsltntPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cnsltUserNm]").val($("#searchCallCnsltForm input[name=searchCnsltUserNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cnsltUserNm]").val($("#searchCnsltUserNm").val());
        $("#popupForm input[name=hpno]").val($("#searchHpno").val());
        $("#popupForm input[name=emailAdres]").val($("#searchEmailAdres").val());
        
        

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/cnslt/cnsltntPop.do'/>";

        popupParams.width = "1250";
        popupParams.height = "700";
        popupParams.title = "popupSelectSingle";
        popupParams.form = document.popupForm;


        popupParams.form.action = url;
        popupParams.form.target = popupParams.title;
        popupParams.form.selectStyle.value = selectStyle;
        popupParams.form.callbackClass.value = callbackClass;

        fn_open_popup(popupParams);	
        /* return false;
		
		var txtUrl = "/ec4/call/cnslt/cnsltntPop.do";
		//NewWindow(txtUrl, "win_popup", "900", "600", "NO", "NO");
		pop_winmodal(txtUrl, 'mda_popup', '900', '600', 'YES', 'NO', '10');//url, 팝업창이름, width, height, scroll, resize, 장제 top */
    });
	
	
	
	



	/*변경SC*/
	$(document).on('change', "#dealerCodeAlter", function(){
		var frm = document.frm;
		var index = $("[name=searchDealerAlter]").index(this);
		var dealerCode = $("[name=searchDealerAlter]").eq(index).val();

		$.ajax({
			type: "POST",
			dataType:"json",
			async: false,
			url: "/venis/crm/custmaster/custsearch/getScCode.do",
			data:"dealerCode=" + dealerCode,
			success:function(data) {
				if(data.resutValueFg == 'N'){
				}else{
					
					var dropdownHtml = "";
					dropdownHtml += "<dl>                                                                          ";
					dropdownHtml += "	<dt>	                                                                   ";
					dropdownHtml += "		<span class='multiCheckValues'></span>                                 ";
					dropdownHtml += "		<span class='dropBtn'>▼</span>                                         ";
					dropdownHtml += "	</dt>                                                                      ";
					dropdownHtml += "	<dd>                                                                       ";
					dropdownHtml += "		<ul>                                                                   ";
					for(var i = 0; i < data.scCodeListSize ; i++){
						dropdownHtml += "			<li>&nbsp;&nbsp;<input type='checkbox' name='mchk' value='" + data.scCodeList[i].code +"' title='"+ data.scCodeList[i].codeNm + "'/>"+ " ["+data.scCodeList[i].emplNo+"] "+ data.scCodeList[i].codeNm + "</li>      ";
					}
					dropdownHtml += "		</ul>                                                                  ";
					dropdownHtml += "	</dd>                                                                      ";
					dropdownHtml += "</dl>                                                                         ";
					
					$(".dropdownBox").html("");
					$(".dropdownBox").html(dropdownHtml);
					$("#multiCheckbox").dropdownMultiCheckbox(); //멀티체크셀렉트박스 재 설정
				}
			},
			error:function(request, status) {
			    return;
			}
		});
	});


	// 모의 배정
	$("#btnScreenAsign").click(function(){

        var frm = document.frm;
        var $nmpr = $("#nmpr").val();

        // 숫자체크
        /* if(!isInteger($nmpr)){

        	alert('일괄 배정 인원에 숫자를 입력해 주십시오');
        	return;
        } */

        
        var $dealerCode = $("#searchCnsltDistribMngVO select[name=dealerCode] option:selected").val();//배정할딜러 선택
        var $custCnt = $("#listCnsltDistribTable input[name=chk]").length;//총 고객수
		var iNmpr = Number($("input[name=nmpr]").val()); //일괄배정할 고객 기준 수

		
		//배정할 사원 멀티선택 값 정리
		var chk_cnt = $("[name=mchk]:checked").length;  //sc선택체크 인원수
		var all_cnt = $("[name=mchk]").length;//sc 총 인원수
		var mChkListId = Array();
		var mChkListNm = Array();
		var iScCnt = 0; //배정할사원 체크선택 건수
		$("#multiCheckbox input[name=mchk]:checked").each(function(){
			mChkListId[iScCnt] = $(this).val();
			mChkListNm[iScCnt] = $(this).attr('title');
			iScCnt++;
		});
			
		//배정 받을 대상 체크 고객
        var iCustCnt = 0;//리스트에서 체크선택된 고객 건수
		var lstTable = $('#listCnsltDistribTable').DataTable();
     	$("#listCnsltDistribTable tbody>tr").each(function(idx){
     		//console.log(lstTable.cell( idx, 14 ).data());//배정사원id
     		//console.log(lstTable.cell( idx, 15 ).data());//배정사원명
			if($("input[name=chk]").eq(idx).is(":checked")){
				if(lstTable.cell( idx, 14 ).data() == null || lstTable.cell( idx, 14 ).data() == ""){ //이미 배정된 고객은 제외
				 	iCustCnt++;
				}
			}
     	});
     	
		
		if(iScCnt == 0){
        	alert('배정할 사원을 선택해주세요.');
        	return;
		}
		

		//iNmpr		:일괄배정할 기준 건수
		//iScCnt	:배정할사원 체크선택 건수
		//iCustCnt	:리스트에서 체크선택된 고객 건수
		var iCnt = 0;
		var iAry = 0;
		var iCalc = 1;
     	$("#listCnsltDistribTable tbody>tr").each(function(idx){
    		if($(this).find("input[name=chk]").is(":checked")){//리스트에 체크되어있는 고객만 배정 
    			 if(lstTable.cell( idx, 14 ).data() == null || lstTable.cell( idx, 14 ).data() == ""){ //이미 배정된 고객은 제외
						lstTable.cell( idx, 14 ).data( mChkListId[iAry] ); //상담원ID
						lstTable.cell( idx, 15 ).data( mChkListNm[iAry] ); //상담원명
		        		iCnt++;
		                if(iCnt == iNmpr){ //배정 기준 갯수만큼 세팅된 경우
		                	iAry++; //다음 SC 세팅을위해 Array 증가한다.
		                	iCnt = 0;//다음 SC 배정 기준갯수 비교를위해 초기화
		                	iCalc++;//배정할 건수가 남아있는지 체크
		                }
		                if(iAry >= iScCnt) iAry = 0; //Array 증가값이  배정할 sc갯수 이상이면 배열값 초기화해서 처음부터 새팅한다

		                if((iCalc * iNmpr) > iCustCnt){
		                	return false;
		                }
    			 }
    		}
    	});
	});


    /*일괄배분 저장*/
    $("#btnAsignSave").click(function(){
    	fn_AsignSave();
    });
    /*상담원이관저장*/
    $("#btnTransSave").click(function(){
    	fn_AsignSave();
    });
	

	//저장구분
    $("select[name=instAsignKnd]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if(this.value == 'T'){
			$("#T_insAsingBtn").show();
			$("#A_insAsingBtn").hide();
			$("#asingClearBtn").show();
		}else{
			$("#T_insAsingBtn").hide();
			$("#A_insAsingBtn").show();
			$("#asingClearBtn").hide();
		}
    });
	

    /*배분초기화*/
    $("#btnAsignClear").click(function(){
    	var lstTable = $('#listCnsltDistribTable').DataTable();
     	$("#listCnsltDistribTable tbody>tr").each(function(idx){
			lstTable.cell( idx, 14 ).data( "" ); //상담원ID
			lstTable.cell( idx, 15 ).data( "" ); //상담원명
    	});
    });
	
	

	
	
	
	
	
	
	


    // modal close event
    $("div.modal").on('hide.bs.modal', function (event) {

        fn_all_grid_reload();
    });
		
	
});

function fn_AsignSave(){


	var chkFlag = true;

	var iCnt = 0;
	var lstTable = $('#listCnsltDistribTable').DataTable();
 	$("#listCnsltDistribTable tbody>tr").each(function(idx){
			 if(lstTable.cell( idx, 14 ).data() != null && lstTable.cell( idx, 14 ).data() != ""){ //배정된 고객
				iCnt++;
			 }
 	});
 	if(iCnt == 0)chkFlag = false;
	
	
	/* $("#listCnsltDistribTable .span_mng_sc_id").each(function(){

		var $mngScId = $(this).find("input[name=asignCnsltUserId]").val();

		if(removeNull($mngScId) == ""){

			chkFlag = false;
		}
	}); */


	if(chkFlag){

        /* if(confirm("일괄 배정처리를 하시겠습니까?")){

            showLoading();
            $("#selectGroup").val($("#dealerCode").val());
        	$("form[name=frm]").prop("action","/venis/crm/custmaster/custassign/updateBtcScCust.do").submit();
        } else {

        	return;
        } */
		if(!confirm("일괄 배정처리를 하시겠습니까?")) return false;
        
        
        

		var formData = $("#cnsltDistribMngVO").serializeArray();

        var rowData = $('#listCnsltDistribTable').DataTable().rows().data(); 
        if(rowData.length < 1){
            alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
            return;
        }else{
            for(var i=0 ; i<rowData.length ; i++){
                //form 과 param을 함께 넘길경우
                formData.push({name:"listCnsltDistribTable["+i+"].chk",					value:($("input[name=chk]").eq(i).is(":checked")==true?"1":"")});
                formData.push({name:"listCnsltDistribTable["+i+"].makrCd",				value:(rowData[i].makrCd==null?"GM":rowData[i].makrCd)});
                formData.push({name:"listCnsltDistribTable["+i+"].callCd",				value:rowData[i].callCd});
                formData.push({name:"listCnsltDistribTable["+i+"].callColectGbCd",		value:rowData[i].callColectGbCd});
                formData.push({name:"listCnsltDistribTable["+i+"].cstmrCd",				value:rowData[i].cstmrCd});
                formData.push({name:"listCnsltDistribTable["+i+"].callCstmrCdSeq",		value:rowData[i].callCstmrCdSeq});
                formData.push({name:"listCnsltDistribTable["+i+"].asignCnsltUserId",	value:rowData[i].asignCnsltUserId});
                formData.push({name:"listCnsltDistribTable["+i+"].asignCnsltUserNm",	value:rowData[i].asignCnsltUserNm});
                formData.push({name:"listCnsltDistribTable["+i+"].asignDt",				value:rowData[i].asignDt});
            }
        }            
        
     	$("#listCnsltDistribTable tbody>tr").each(function(idx){
     		//console.log(lstTable.cell( idx, 14 ).data());//배정사원id
     		//console.log(lstTable.cell( idx, 15 ).data());//배정사원명
     	});
        
		$.ajax({
			"type": "POST",
			"dataType":"json",
			"async": false,
			"contentType": "application/x-www-form-urlencoded; charset=UTF-8",
			"url": "/ec4/call/outbd/updateCnsltAsign.do",
			"data": formData,
			"success":function(result) {

                if(result.isSuccess){

                	listCnsltDistribTable.search(this.value).draw();
                    alert(result.message);
                    $("div.modal").modal('hide');
                } else {

                    var errorMsg = "";

                    if(result.message){
                        for(var i = 0 ; i < result.message.length ; i++){

                            errorMsg = errorMsg + result.message[i]
                        }
                    	
                    }else{
                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                        }
                    	
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
	} else {

		alert("임의 배정을 실행해 주십시오");
		return;
	}

}










//그리드 reload
function fn_all_grid_reload(){

	listCnsltDistribTable.draw();
}


function cstmrSearch(){
	
}
function rtnCnsltTypeList(){
	
}
function rtnCnsltTypeListData(){
	
}
function cnsltntSearch(){
	
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
                상담원 고객분배
                <small>&nbsp;</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="#">상담관리(Out)</a></li>
                <li class="active">상담원 고객분배</li>
            </ol>
        </section>

	<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
      	<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="searchCnsltDistribMngVO" name="searchCnsltDistribMngVO" method="post" cssClass="form-horizontal">
                <double-submit:preventer/>
                <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
                <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
                <input type="hidden" name="searchCnsltTyCnCode" id="searchCnsltTyCnCode" value=""/>
                <input type="hidden" name="searchBeginDe" id="searchBeginDe" value=""/>
                <input type="hidden" name="searchEndDe" id="searchEndDe" value=""/>
		        <input type="hidden" name="callbackClass"/>
		        <input type="hidden" name="selectStyle" value="single"/>
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
                                <label for="searchCallColectDt" class="col-sm-2 control-label">생성일자</label>
                                <div class="col-sm-4">
					                <div class="input-group">
					                  <div class="input-group-addon">
					                    <i class="fa fa-calendar"></i>
					                  </div>
	                                  <input type="text" class="form-control pull-right" name="callColectDt" id="callColectDt">
	                                </div>
                                </div>
                                <div class="col-sm-2"></div>
                                <label for="searchInstAsignKnd" class="col-sm-2 control-label">저장구분</label>
                                <div class="col-sm-2">
                                    <form:select path="instAsignKnd" class="form-control input-sm" alt="저장구분">
                                        <form:options items="${instAsignKndList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="instAsignKnd" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCallKnd" class="col-sm-2 control-label">스크립트구분</label>
                                <div class="col-sm-2">
                                    <form:select path="scriptKnd" class="form-control input-sm" alt="스크립트구분">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scriptKnd" />
                                </div>
                                <label for="searchScriptCd" class="col-sm-2 control-label">스크립트제목</label>
                                <div class="col-sm-2">
                                    <form:select path="scriptCd" class="form-control input-sm" alt="스크립트제목">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptTitleList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scriptCd" />
                                </div>
                                <label for="searchCallState" class="col-sm-2 control-label">콜진행상태</label>
                                <div class="col-sm-2">
                                    <form:select path="callState" class="form-control input-sm" alt="콜진행상태">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${callStateList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="callState" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="searchCustNm" class="col-sm-2 control-label">고객명</label>
                                <div class="col-sm-2">
                                    <div class="input-group">
                                       	<input type="hidden" name="searchCstmrCd" class="form-control" id="searchCstmrCd"/>
                                        <input type="text" name="searchCstmrNm" class="form-control" id="searchCstmrNm"/>
                                        <div class="input-group-btn">
                                            <button type="button" id="custPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                                    	</div>
                                   	</div>
                                </div>
                                <label for="searchCnsltnt" class="col-sm-2 control-label">담당상담원</label>
                                <div class="col-sm-2">
                                   	<div class="input-group">
                                       	<input type="hidden" name="searchCnsltUserId" class="form-control" id="searchCnsltUserId"/>
                                        <input type="text" name="searchCnsltUserNm" class="form-control" id="searchCnsltUserNm"/>
                                        <div class="input-group-btn">
                                            <button type="button" id="cnsltntPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <label for="cnsltTyCn" class="col-sm-2 control-label">상담유형</label>
                                <div class="col-sm-2">
                                   	<div class="input-group">
	                                    <input type="text" name="cnsltTyCn" class="form-control" id="cnsltTyCn" readOnly/>
	                                    <input type="hidden" name="cnsltTyCnCode" class="form-control" id="cnsltTyCnCode" readOnly/>
	                                    <div class="input-group-btn">
	                                         <button type="button" id="cnsltTypePop" class="btn btn-info btn-flat">
	                                         <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
	                                         <i class="fa fa-search"></i></button>
	                                    </div>
                                    </div>
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="searchCarNo" class="col-sm-2 control-label">차량번호</label>
                                <div class="col-sm-2">
                                    <input type="text" name="searchCarNo" class="form-control" id="searchCarNo"/>
                                </div>
                                <label for="searchHpno" class="col-sm-2 control-label">핸드폰번호</label>
                                <div class="col-sm-2">
                                    <input type="text" name="searchHpno" class="form-control" id="searchHpno"/>
                                </div>
                                <label for="searchCallAsign" class="col-sm-2 control-label">배정상태</label>
                                <div class="col-sm-2">
                                    <form:select path="callAsign" class="form-control input-sm" alt="배정상태">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${callAsignList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="callAsign" />
                                </div>
						  	</div>
                    </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnSearch"> 조회</button>
                        <button type="button" class="btn btn-primary" id="custUpload"> 대상고객업로드</button>
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
                </form:form>
            </div>
        </div>
        
      	<div class="row">
        	<div class="col-xs-12"> <!-- DIV 가로영역을 나누는 용도 -->
                <div class="box">
		        	<div class="box-body" style="float:right;">
		        		<label for="searchCallType" class="div-form-label">배분받을부서</label>
	                    <div class="div-line-form">
	                            <div class="input-group">
	                             <input type="text" name="text01" class="form-control-nowd w70" id="text01"/>
	                             <div class="input-group-btn w50">
	                                 <button type="button" name="button01" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                             </div>
	                         </div>
	                    </div>
		        		<label for="searchCallType" class="div-form-label">배분받을상담원</label>
		        		<label for="searchCallType" class="div-form-label">1/</label>
		        		<div class="div-line-form">
		        			<input type="text" name="nmpr" class="form-control-nowd w60 text-right" id="nmpr" value="1,000"/>
		        		</div>
		        		<label for="searchCallType" class="div-form-label">명</label>
	                    <div class="div-line-form">
 								<div class="dropdownBox" id="multiCheckbox">
									<dl>
										<dt>	
											<span class="multiCheckValues"></span>
											<span class="dropBtn">▼</span>
										</dt>
										<dd>
											<ul>
											<c:forEach var="scCodeList" items="${callCnsltList}">
												<li>&nbsp;&nbsp;<input type="checkbox" name="mchk" value="${scCodeList.code}" title="${scCodeList.codeNm}"/>[${scCodeList.code}] ${scCodeList.codeNm}</li>
											</c:forEach>
											</ul>
										</dd>
									</dl>
								</div> 
								&nbsp;&nbsp;
	                    </div>
	                    <div class="div-form-btn" id="asingClearBtn" style="display:none;">
	                    	<button type="button" class="btn btn-info" id="btnAsignClear"> 배분초기화</button>
	                    </div>
	                    <div class="div-form-btn">
	                    	<button type="button" class="btn btn-info" id="btnScreenAsign"> 화면 임의배정</button>
	                    </div>
	                    <div class="div-form-btn" id="A_insAsingBtn">
	                    	<button type="button" class="btn btn-info" id="btnAsignSave"> 일괄배분저장</button>
	                    </div>
	                    <div class="div-form-btn" id="T_insAsingBtn" style="display:none;">
	                    	<button type="button" class="btn btn-info" id="btnTransSave"> 상담원이관저장</button>
	                    </div>
		        	</div>
	        	</div>
        	</div>
        </div>


	    <!-- ############################# 메인화면 ######################  -->
      	<div class="row">
        	<div class="col-xs-12"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-top:5px;padding-top:5px;float:left;">리스트</h3>
                        <div class="box-body" style="float:left;margin-top:0px;padding-top:0px;vertical-align:top;">(총고객수:<input type="text" readOnly value="35,600" style="border:0px;width:60px;text-align:right;"/>건 / 선택고객수:<input type="text" value="1,230" class="form-control-nowd text-right w80" />건)</div>
                        <div class="box-tools">
                               &nbsp;
                               <button type="button" class="btn btn-info"> 액셀</button>
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding" style="height:750px;">
				          <table id="listCnsltDistribTable" class="table table-hover">
				            <thead>
				              <tr>
				                <th>순번</th>
				                <th>선택</th>
				                <th>브랜드</th>
				                <th>콜번호</th>
				                <th>수집구분코드</th>
				                <th>고객코드</th>
				                <th>고객순번</th>
				                <th>수집구분</th>
				                <th>스크립트구분</th>
				                <th>스크립트제목</th>
				                <th>접수번호</th>
				                <th>본부명</th>
				                <th>사업소코드</th>
				                <th>사업소명</th>
				                <th>배분상담원ID</th>
				                <th style="background-color:#FFFF00;">배분상담원</th>
				                <th style="background-color:#EBF1FB;">배분일자</th>
				                <th>고객명</th>
				                <th>차량번호</th>
				                <th>차량명</th>
				                <th>휴대폰</th>
				              </tr>
				            </thead>
				            <tbody>
				          	</tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- <<<<<<<< box THE END -->
        	</div>
		</div>
      <!-- /.row -->
      
      
      
      
      
      
      
      
    </section>
    <!-- /.content -->

    </div>
    <!-- /.content-wrapper -->

    <footer class="main-footer">
        <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

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
	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	    </form>
</body>
</html>
