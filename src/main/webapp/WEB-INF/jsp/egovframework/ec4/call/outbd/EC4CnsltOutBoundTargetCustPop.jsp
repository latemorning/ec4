<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltOutBoundTargetCust.java
  * @Description : EC4CnsltOutBoundTargetCust POP 화면
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
    <title>대상고객업로드</title>
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
    
    <!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js"></script> -->


<script type="text/javaScript" language="javascript" defer="defer">
var gtListCnsltTargetCustTable;

$(document).ready(function(){
    


    $("#btnExcelCustInsertAction").click(function(){

    	frm = document.popUpTargetCustVO;
    	var chkCnt = 0;
    	
		
		
		/* chkCnt = 0;
		$('#popSearchTargetCustVO .has-warning :text').each(function(idx){
			if ("" == $(this).val() || null == $(this).val()) { 
				alert('"'+$(this).attr("alt")+'"'+" 입력은 필수입니다."); 
				chkCnt++;
				return false;
			}; 
		});
		if(chkCnt > 0){
			//alert("input박스 리턴");
			return false;
		} */
						
		
    	
    	chkCnt = 0;
		$('#popSearchTargetCustVO .has-warning :radio').each(function(idx){
			if (!$(this).is(':checked')) { 
				alert('"'+$(this).attr("alt")+'"'+" 선택은 필수입니다."); 
				chkCnt++;
				return false;
			}; 
		});
		if(chkCnt > 0){
			//alert("radio박스 리턴");
			return false;
		}
    	
		
		
		chkCnt = 0;
		$('#popSearchTargetCustVO .has-warning :checkbox').each(function(idx){
			if (!$(this).is(':checked')) { 
				alert('"'+$(this).attr("alt")+'"'+" 체크는 필수입니다."); 
				chkCnt++;
				return false;
			}; 
		});
		if(chkCnt > 0){
			//alert("check박스 리턴");
			return false;
		}

		
		
		chkCnt = 0;
		$('#popSearchTargetCustVO .has-warning select').each(function(idx){
			//if (!$(this).is('option:selected')) {
			if (null == $(this).val() || "" == $(this).val() || "undefined" == $(this).val()) {
				alert('"'+$(this).attr("alt")+'"'+" 선택은 필수입니다."); 
				chkCnt++;
				return false;
			}; 
		});
		if(chkCnt > 0){
			//alert("select박스 리턴");
			return false;
		}
		



		var formData = $("#popSearchTargetCustVO").serializeArray();

        var rowData = $('#listCnsltTargetCustTable').DataTable().rows().data(); 
        if(rowData.length < 1){
            alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
            return;
        }else{
            for(var i=0 ; i<rowData.length ; i++){
                //form 과 param을 함께 넘길경우
                formData.push({name:"listCnsltTargetCustTable["+i+"].makrCd",			value:(rowData[i].makrCd==null?"GM":rowData[i].makrCd)});
                formData.push({name:"listCnsltTargetCustTable["+i+"].cstmrCd",			value:rowData[i].cstmrCd});
                formData.push({name:"listCnsltTargetCustTable["+i+"].cstmrNm",			value:rowData[i].cstmrNm});
                formData.push({name:"listCnsltTargetCustTable["+i+"].hpno",				value:rowData[i].hpno});
                formData.push({name:"listCnsltTargetCustTable["+i+"].emailAdres",		value:rowData[i].emailAdres});
                formData.push({name:"listCnsltTargetCustTable["+i+"].adres",			value:rowData[i].adres});
                formData.push({name:"listCnsltTargetCustTable["+i+"].adresDetl",		value:rowData[i].adresDetl});
                formData.push({name:"listCnsltTargetCustTable["+i+"].bussplcCode",		value:rowData[i].bussplcCode});
                formData.push({name:"listCnsltTargetCustTable["+i+"].bussplcNm",		value:rowData[i].bussplcNm});
                formData.push({name:"listCnsltTargetCustTable["+i+"].bussplcKnd",		value:rowData[i].bussplcKnd});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appCnsltUserId",	value:rowData[i].appCnsltUserId});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appCnsltUserNm",	value:rowData[i].appCnsltUserNm});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appBussplcCode",	value:rowData[i].appBussplcCode});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appBussplcNm",		value:rowData[i].appBussplcNm});
            }
        }

        // 등록
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/outbd/insertCnsltTargetCust.do'/>",
            "data": formData,
            "success": function(result) {

                if(result.isSuccess){

                	$('#listCnsltTargetCustTable').DataTable().clear().destroy();
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
    });

	
	
	
	
	
	
	
	
	
	$("#btnDataChange").click(function(){
		//$('#listCnsltTargetCustTable .cstmrNm').find('data:eq('+4+')').val("asdfasdfgaesdrgsdfg") ;
		//$('#listCnsltTargetCustTable .cstmrNm').find('data:eq('+4+')').text("asdfasdfgaesdrgsdfg") ;
		
		/* $("#listCnsltTargetCustTable > tbody tr:eq(0) td:eq(3)").html("000"); */
		//gtListCnsltTargetCustTable.data('cstmrNm','penddddd').eq(0);
		//gtListCnsltTargetCustTable.data('cstmrNm:eq(0)','penddddd');
		//$('#listCnsltTargetCustTable').DataTable().rows().data("cstmrNm","dfdfdfdfdfd").eq(0); 
		//alert(table.rows(0).column('cstmrNm:name').index());
		//alert(table.rows(0).column('cstmrNm:name').data());
		//alert(table.column(4).data());
		//table.columns( [0, 'cstmrNm:name'] ).data('jjjjjjjjjjjjjjjjjjj');
		//table.cell.setCellValue(0,'cstmrNm','5555555555555555');
		//table.rows().data("cstmrNm","dfdfdfdfdfd").eq(0).draw();
		//gtListCnsltTargetCustTable.draw();
		//table.rows(0).data("cstmrNm","dfdfdfdfdfd").draw();
		//table.data('cstmrNm','penddddd').eq(0);
		//table.data('cstmrNm:eq(0)','penddddd');
		//alert($("#listCnsltTargetCustTable > tbody tr:eq(0)").cellIndex("cstmrNm"));
		//$("#listCnsltTargetCustTable > tbody tr:eq(0)").column("cstmrNm:name").data("llllllllllllll");
		//$("#listCnsltTargetCustTable > tbody tr:eq(0)").column().data("cstmrNm","llllllllllllll");
		//$("#listCnsltTargetCustTable > tbody tr:eq(0)").data("cstmrNm","llllllllllllll");
		
		
		var lstTable = $('#listCnsltTargetCustTable').DataTable();
		$('input[name=chk]').each(function(idx){
			if($("input[name=chk]").eq(idx).is(":checked")){
				//lstTable.cell( idx, 12 ).data( $("#popSearchTargetCustVO input[name=searchCnsltUserId]").val() ).draw(); //상담원ID
				//lstTable.cell( idx, 13 ).data( $("#popSearchTargetCustVO input[name=searchCnsltUserNm]").val() ).draw(); //상담원명
				lstTable.cell( idx, 12 ).data( $("#popSearchTargetCustVO input[name=searchCnsltUserId]").val() ); //상담원ID
				lstTable.cell( idx, 13 ).data( $("#popSearchTargetCustVO input[name=searchCnsltUserNm]").val() ); //상담원명
			}
		});
    });

	//Excel 파일첨부시 시점에 고객DB까지 읽어와서 화면에 적용하려 하였으나 해당소스를 샘플개념으로 사용하고자 분리하였다 CJJ2018024
    $("#btnExcelCustDBLoadList").click(function(){
    	
		var formData = $("#popUpTargetCustVO").serializeArray();

        var rowData = $('#listCnsltTargetCustTable').DataTable().rows().data(); 
        if(rowData.length < 1){
            alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
            return;
        }else{
            for(var i=0 ; i<rowData.length ; i++){
                //form 과 param을 함께 넘길경우
                formData.push({name:"listCnsltTargetCustTable["+i+"].makrCd",			value:(rowData[i].makrCd==null?"GM":rowData[i].makrCd)});
                formData.push({name:"listCnsltTargetCustTable["+i+"].cstmrCd",			value:rowData[i].cstmrCd});
                formData.push({name:"listCnsltTargetCustTable["+i+"].cstmrNm",			value:rowData[i].cstmrNm});
                formData.push({name:"listCnsltTargetCustTable["+i+"].hpno",				value:rowData[i].hpno});
                formData.push({name:"listCnsltTargetCustTable["+i+"].emailAdres",		value:rowData[i].emailAdres});
                formData.push({name:"listCnsltTargetCustTable["+i+"].adres",			value:rowData[i].adres});
                formData.push({name:"listCnsltTargetCustTable["+i+"].adresDetl",		value:rowData[i].adresDetl});
                formData.push({name:"listCnsltTargetCustTable["+i+"].bussplcCode",		value:rowData[i].bussplcCode});
                formData.push({name:"listCnsltTargetCustTable["+i+"].bussplcNm",		value:rowData[i].bussplcNm});
                formData.push({name:"listCnsltTargetCustTable["+i+"].bussplcKnd",		value:rowData[i].bussplcKnd});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appCnsltUserId",	value:rowData[i].appCnsltUserId});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appCnsltUserNm",	value:rowData[i].appCnsltUserNm});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appBussplcCode",	value:rowData[i].appBussplcCode});
                formData.push({name:"listCnsltTargetCustTable["+i+"].appBussplcNm",		value:rowData[i].appBussplcNm});
            }
        }
        

        // Excel 리스트 고객DB Load
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/outbd/selectCnsltTargetCustDBLoad.do'/>",
            "data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            //"data": $("#popUpTargetCustVO").serialize(),  //form 만 넘길경우
            "success": function(result) {

                
            	if(null == result.aaData || "" == result.aaData){
            		alert("고객DB Load데이터가 없습니다.");
            		return false;
            	}
                alert("고객DB Load 성공!!");
                
                var items = [];
                $.each(result.aaData, function(idx, item) {

                    var row = idx+1;
                    items.push({                                                                              
                                  rn:row, // 번호   
                                  chk:"<input type='checkbox' name='chk' id='chk' class='no_border' size='5'>",
                                  makrCd		:(item.makrCd==null?"GM":item.makrCd),
                                  cstmrCd		:item.cstmrCd,
                                  cstmrNm		:item.cstmrNm,
                                  hpno			:item.hpno,
                                  emailAdres	:item.emailAdres,
                                  adres			:item.adres,
                                  adresDetl		:item.adresDetl,
                                  bussplcCode	:item.bussplcCode,
                                  bussplcNm		:item.bussplcNm,
                                  bussplcKnd	:item.bussplcKnd,
                                  appCnsltUserId:item.appCnsltUserId,
                                  appCnsltUserNm:item.appCnsltUserNm,
                                  appBussplcCode:item.appBussplcCode,
                                  appBussplcNm	:item.appBussplcNm
                    });
                    
                });

                
                $('#listCnsltTargetCustTable').DataTable().clear().destroy();
                // 상담원 테이블
                gtListCnsltTargetCustTable = $('#listCnsltTargetCustTable').DataTable({
                    "data": items,
                    "language": lang_kor,
                    "select": {
                        "style": "single"
                    },
                    "order": [[ 1, "desc" ]],
                    "rowId": "cstmrNm",
                    "scrollY": "369px",
                    "pageLength": 10,
                    "pagingType": "full_numbers",
                    "bPaginate": true,
                    "bLengthChange": true,
                    "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                    //"responsive": true,
                    "processing": true,
                    "ordering": true,
                    "searching": false,
                    //"bServerSide": true,
                    /* "sAjaxSource": "",
                    "fnServerParams": function(aoData){
                    }, */
                    //"sServerMethod": "POST",
		             "createdRow": function ( row, data, index ) {
		                if ( data.status == 0 ) {
		                    $('td', row).eq(6).addClass('text-danger');
		                }
		                else
		                {
		                    $('td', row).eq(6).addClass('text-success');
		                }
		            },
                    "columnDefs": [
                        //{"visible": false, "targets": [1]},
                        {"orderable": false, "targets": [1]}
                    ],
                    "columns": [
                        {"data":"rn"},//순번
                        {"data":"chk", "defaultContent": ""},//선택
                        {"data":"makrCd", "defaultContent": ""},//브랜드
                        {"data":"cstmrCd", "defaultContent": ""},//고객코드
                        {"data":"cstmrNm", "defaultContent": ""},//고객명
                        {"data":"hpno", "defaultContent": ""},//핸드폰
                        {"data":"emailAdres", "defaultContent": ""},//이메일
                        {"data":"adres", "defaultContent": ""},//주소
                        {"data":"adresDetl", "defaultContent": ""},//상세주소
                        {"data":"bussplcCode", "defaultContent": ""},//사업소코드
                        {"data":"bussplcNm", "defaultContent": ""},//사업소명
                        {"data":"bussplcKnd", "defaultContent": ""},//구분
                        {"data":"appCnsltUserId", "defaultContent": ""},//적용상담원Id
                        {"data":"appCnsltUserNm", "defaultContent": ""},//적용상담원
                        {"data":"appBussplcCode", "defaultContent": ""},//적용사업소코드
                        {"data":"appBussplcNm", "defaultContent": ""} //적용사업소명
                    ]
                });
            	

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
        
    });
	
	
	



	$(document).on("click","#cnsltntPop",function() {
        var popupParams = {};

        //$("#popupForm input[name=cnsltUserNm]").val($("#searchCallCnsltForm input[name=searchCnsltUserNm]").val());
        //$("#popupForm input[name=hpno]").val($("#searchCallCnsltForm input[name=searchHpno]").val());
        //$("#popupForm input[name=emailAdres]").val($("#searchCallCnsltForm input[name=searchEmailAdres]").val());
        $("#popupForm input[name=cnsltUserNm]").val($("#searchCnsltUserNm").val());
        
        

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
	
	
	
});

function cnsltntSearch(){
	
}
function rtnCnsltTypeListData(){
	
}



//이 함수는 사용하지않게되었다. 참고로 남겨두었다.  ajax를 submit으로 실행해야하나 submit처리가 되지않았다 181017
function uploadFile_test(){

    var form = $('#FILE_FORM')[0];
    var formData = new FormData(form);
    formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
    formData.append("cellInfo", JSON.stringify({
    	 useColsNumber: [0, 1, 2, 3, 4, 5, 6, 7, 9],
    	 useColsField: ["rn", "rCode", "makrCd", "cstmrNm", "bussplcCode", "bussplcNm", "bussplcKnd", "appCnsltUserNm", "appBussplcNm"], //설정된 title의값을 읽지는 않는다  excel의 useColsNumber 에 해당하는 열 값을 순차적으로 입력해야함.  해당 명으로 json 결과가 생성된다 
    	 startRow : 1  //읽을 액셀데이터의 첫번째 row 예) 5 설정하면 맨위 0번째부터 5번째 .. 즉, 6번라인부터 읽는다
    	 }
    ));
    
    gtListCnsltTargetCustTable = $('#listCnsltTargetCustTable').DataTable({
        "data": formData,
        "language": lang_kor,
        "select": {
            "style": "single"
        },
        "order": [[ 1, "desc" ]],
        "rowId": "cstmrNm",
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
        /* "sAjaxSource": "",
        "fnServerParams": function(aoData){
            aoData.push(
            );
        }, */
        //"sServerMethod": "POST",
	    "ajaxSubmit" : {
    		"url": "<c:url value='/ec4/cmm/cmfile/excelImportList.do'/>",
    		"enctype":"multipart/form-data",
            "processData": false,
            "contentType": false,
            "data": formData,
            "method": 'POST',
            "cache":false
	    },
        "columnDefs": [
            {"visible": false, "targets": [1]},
            {"orderable": false, "targets": [0]}
        ],
        "columns": [
            {"data":"rn"},//순번
            {"data":"makrCd", "defaultContent": ""},//선택
            {"data":"cstmrNm", "defaultContent": ""},//고객명
            {"data":"bussplcCode", "defaultContent": ""},//사업소코드
            {"data":"bussplcNm", "defaultContent": ""},//사업소명
            {"data":"bussplcKnd", "defaultContent": ""},//구분
            {"data":"appCnsltUserNm", "defaultContent": ""},//적용상담원
            {"data":"appBussplcCode", "defaultContent": ""},//적용사업소코드
            {"data":"appBussplcNm", "defaultContent": ""} //적용사업소명
        ]
    });
}

function uploadFile(){
    var form = $('#FILE_FORM')[0];
    var formData = new FormData(form);
    formData.append("fileObj", $("#FILE_TAG")[0].files[0]);
    formData.append("cellInfo", JSON.stringify({
    	 useColsNumber: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    	 useColsField: ["rn", "rCode", "makrCd", "cstmrCd", "cstmrNm", "hpno", "emailAdres", "adres", "adresDetl", "bussplcCode", "bussplcNm", "bussplcKnd", "appCnsltUserId", "appCnsltUserNm", "appBussplcCode", "appBussplcNm"], //설정된 title의값을 읽지는 않는다  excel의 useColsNumber 에 해당하는 열 값을 순차적으로 입력해야함.  해당 명으로 json 결과가 생성된다
    	 startRow : 1  //읽을 액셀데이터의 첫번째 row 예) 5 설정하면 맨위 0번째부터 5번째 .. 즉, 6번라인부터 읽는다
    	 }
    ));
    
    
    $.ajax({
        		url: "<c:url value='/ec4/cmm/cmfile/excelImportList.do'/>",
        		enctype:"multipart/form-data",
                processData: false,
                contentType: false,
                data: formData,
                method: 'POST',
                cache:false,
                dataType: "json",
                success: function(result){
                	if(null == result.aaData || "" == result.aaData){
                		alert("화면에 적용할 데이터가 없습니다. 샘플액셀정보를 확인하세요.");
                		return false;
                	}
                    alert("업로드 성공!!");
                    
                    var items = [];
                    $.each(result.aaData, function(idx, item) {

                        var row = idx+1;
                        items.push({                                                                              
                                      rn:row, // 번호   
                                      chk:"<input type='checkbox' name='chk' id='chk' class='no_border' size='5'>",
                                      makrCd		:(item.makrCd==null?"GM":item.makrCd),
                                      cstmrCd		:item.cstmrCd,
                                      cstmrNm		:item.cstmrNm,
                                      hpno			:item.hpno,
                                      emailAdres	:item.emailAdres,
                                      adres			:item.adres,
                                      adresDetl		:item.adresDetl,
                                      bussplcCode	:item.bussplcCode,
                                      bussplcNm		:item.bussplcNm,
                                      bussplcKnd	:item.bussplcKnd,
                                      appCnsltUserId:item.appCnsltUserId,
                                      appCnsltUserNm:item.appCnsltUserNm,
                                      appBussplcCode:item.appBussplcCode,
                                      appBussplcNm	:item.appBussplcNm
                        });
                        
                    });

                    
                    $('#listCnsltTargetCustTable').DataTable().clear().destroy();
                    // 상담원 테이블
                    gtListCnsltTargetCustTable = $('#listCnsltTargetCustTable').DataTable({
                        "data": items,
                        "language": lang_kor,
                        "select": {
                            "style": "single"
                        },
                        "order": [[ 1, "desc" ]],
                        "rowId": "cstmrNm",
                        "scrollY": "369px",
                        "pageLength": 10,
                        "pagingType": "full_numbers",
                        "bPaginate": true,
                        "bLengthChange": true,
                        "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                        //"responsive": true,
                        "processing": true,
                        "ordering": true,
                        "searching": false,
                        //"bServerSide": true,
                        /* "sAjaxSource": "",
                        "fnServerParams": function(aoData){
                        }, */
                        //"sServerMethod": "POST",
                        "columnDefs": [
                            {"visible": false, "targets": [2]},
                            {"orderable": false, "targets": [1]}
                        ],
                        "columns": [
                            {"data":"rn"},//순번
                            {"data":"chk", "defaultContent": ""},//선택
                            {"data":"makrCd", "defaultContent": ""},//브랜드
                            {"data":"cstmrCd", "defaultContent": ""},//고객코드
                            {"data":"cstmrNm", "defaultContent": ""},//고객명
                            {"data":"hpno", "defaultContent": ""},//핸드폰
                            {"data":"emailAdres", "defaultContent": ""},//이메일
                            {"data":"adres", "defaultContent": ""},//주소
                            {"data":"adresDetl", "defaultContent": ""},//상세주소
                            {"data":"bussplcCode", "defaultContent": ""},//사업소코드
                            {"data":"bussplcNm", "defaultContent": ""},//사업소명
                            {"data":"bussplcKnd", "defaultContent": ""},//구분
                            {"data":"appCnsltUserId", "defaultContent": ""},//적용상담원Id
                            {"data":"appCnsltUserNm", "defaultContent": ""},//적용상담원
                            {"data":"appBussplcCode", "defaultContent": ""},//적용사업소코드
                            {"data":"appBussplcNm", "defaultContent": ""} //적용사업소명
                        ]
                    });
                    
                }
        });
}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">




<!-- Main content -->
    <section class="content">
    
    
	
	<%-- <form:form commandName="popUpInsertTargetCustVO" name="popUpInsertTargetCustVO" method="post" cssClass="form-horizontal">
	<double-submit:preventer/> --%>
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
                <form:form commandName="popSearchTargetCustVO" name="popSearchTargetCustVO" method="post" cssClass="form-horizontal">
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
                    	<h3 class="box-title">적용</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             
                    <div class="box-body">
                    <form class="form-horizontal">
                            
                            <div class="form-group">
                                <label for="searchCallType" class="col-sm-2 control-label">업로드파일</label>
                                <div class="col-sm-2">
						            <form id="FILE_FORM" method="post" enctype="multipart/form-data" action="">
						            <input type="file" id="FILE_TAG" name="FILE_TAG">
						            <a class="ui-shadow ui-btn ui-corner-all" href="javascript:uploadFile();">화면에적용</a>
						        	</form>
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
                                <div class="col-sm-1">
                                </div>
                                <div class="col-sm-3">
                                	<label for="searchCallType" class="control-label"><input type="checkbox">&nbsp;지정사업소제외</label>
                                </div>
                            </div>
                    
                            <div class="form-group">
                                <label for="searchCallKnd" class="col-sm-2 control-label">상담원부서</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
	                                        <input type="text" name="text01" class="form-control" id="text01"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" name="button01" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                </div>
                                <label for="searchCnslt" class="col-sm-2 control-label">상담원</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
                                        	<input type="hidden" name="searchCnsltUserId" class="form-control" id="searchCnsltUserId"/>
	                                        <input type="text" name="searchCnsltUserNm" class="form-control" id="searchCnsltUserNm"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="cnsltntPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                </div>
                                <label for="searchCallType" class="col-sm-2 control-label">사업소</label>
                                <div class="col-sm-2">
                                        <div class="input-group">
	                                        <input type="text" name="text01" class="form-control" id="text01"/>
	                                        <div class="input-group-btn">
	                                            <button type="button" name="button01" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div>
                                </div>
                            </div>
                            
                            <div class="form-group has-warning">
                                <label for="scriptKnd" class="col-sm-2 control-label">스크립트구분</label>
                                <div class="col-sm-2">
                                    <form:select path="scriptKnd" class="form-control input-sm" alt="스크립트구분">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scriptKnd" />
                                </div>
                                <label for="scriptCd has-warning" class="col-sm-2 control-label">스크립트제목</label>
                                <div class="col-sm-2">
                                    <form:select path="scriptCd" class="form-control input-sm" alt="스크립트제목">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${scriptTitleList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scriptCd" />
                                </div>
                                <label for=callColectGbCd class="col-sm-2 control-label">콜구분</label>
                                <div class="col-sm-2">
                                    <form:select path="callColectGbCd" class="form-control input-sm" alt="콜구분">
                                        <form:option value="">-- 전체 --</form:option>
                                        <form:options items="${callColectGbList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="callColectGbCd" />
                                </div>
                            </div>
                            
                    </form>
                    </div>
                    <!-- /.box-body THE END -->

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info" id="btnExcelCustDBLoadList"> 고객DB Load</button>
                        <button type="button" class="btn btn-info" id="btnDataChange"> 상담원적용</button>
                        <button type="button" class="btn btn-info"> 사업소적용</button>
                        <button type="button" class="btn btn-primary" id="btnExcelCustInsertAction"> 등록</button>
                        <!-- <button type="button" class="btn btn-warning"> 삭제</button> -->
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
                </form:form>
            
            </div>
        </div>







	    <!-- ############################# 메인화면 ######################  -->
      	<div class="row">
        	<div class="col-xs-12"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-top:5px;padding-top:5px;float:left;">리스트</h3>
                        <div class="box-tools">
                               &nbsp;
                               <!-- <button type="button" class="btn btn-info"> 액셀</button> -->
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <form:form commandName="popUpTargetCustVO" name="popUpTargetCustVO" method="post" cssClass="form-horizontal">
                    <double-submit:preventer/>
                    <div class="box-body no-padding" style="height:750px;">
				          <table id="listCnsltTargetCustTable" class="table table-hover">
				            <thead>
				              <tr>
				                <th>순번</th>
				                <th>선택</th>
				                <th>브랜드</th>
				                <th>고객코드</th>
				                <th>고객명</th>
	                            <th>핸드폰</th>
	                            <th>이메일</th>
	                            <th>주소</th>
	                            <th>상세주소</th>
				                <th>사업소코드</th>
				                <th>사업소명</th>
				                <th>구분</th>
				                <th style="background-color:#FFFF00;">적용상담원Id</th>
				                <th style="background-color:#FFFF00;">적용상담원</th>
				                <th style="background-color:#FFFF00;">적용사업소코드</th>
				                <th style="background-color:#FFFF00;">적용사업소명</th>
				              </tr>
				            </thead>
				            <tbody>
				          	</tbody>
				          </table>
                    </div>
                    <!-- /.box-body -->
					</form:form>
                </div>
                <!-- <<<<<<<< box THE END -->
            
        	</div>
		</div>
      <!-- /.row -->
	<%-- </form:form> --%>
      
      
      
      
      
      
      
      
      	<div class="row">
        	<div class="col-md-12"> <!-- DIV 가로영역을 나누는 용도 -->
			
        	</div>
      </div>
      <!-- /.row -->








    </section>
    <!-- /.content -->




	    <form name="popupForm" method="post" id="popupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cnsltUserId" id="cnsltUserId" value="single"/>
	        <input type="hidden" name="cnsltUserNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	    </form>
</body>
</html>
