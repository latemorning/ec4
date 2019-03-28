<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%
 /**
  * @Class Name : EC4CnsltInBoundMngController.java
  * @Description : EC4CnsltInBoundRegPop POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.05.28    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.05.28
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
    <title>상담내용저장</title>
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
var gtListCnsltTypeTable;
$(document).ready(function(){
	$(".sidebar-menu").tree();
	searchInfo();
	
	window.resizeTo(1200, 800);
	


	
	//상담구분
	if($("select[name=cnsltKnd] option:selected").val() == '03'){
		$("#claimDiv").show();
	}else{
		$("#claimDiv").hide();
	}


	
	
    // 인바운드상담내용 등록
    $("#btnCnsltInsert").click(function(){
		alert("저장버튼 사용안함");
    	return; //매니처처리버튼을 사용한다  저장버튼 사용않함. 없다.
        frm = document.popUpMngVO;

        /* if(!validatePopUpMngVO(frm)){
            return;
        } */

        /* $('#listCnsltTypeTable').DataTable().rows().iterator('row', function(context, index){
            var node = $(this.row(index).node()).data(); 
            console.log("00000000000000 ["+this.row(index).data().codeId+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv2+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv3+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv4+"]");
        }); */


        
        $("#vocCnsltTitle").val($("#popUpMngVO input[name=cnsltTitle]").val());
        $("#vocRecptDscr").val($("#popUpMngVO textarea[name=recptDscr]").val());
        $("#vocRecpterOpinion").val($("#popUpMngVO textarea[name=recpterOpinion]").val());
        $("#cnsltBussplcKnd").val($("select[name=vocKnd] option:selected").val());
        $("#cnsltBussplcCd1").val($("select[name=bussplcCd1] option:selected").val());
        $("#cnsltBussplcCd2").val($("select[name=bussplcCd2] option:selected").val());
        $("#cnsltBussplcCd3").val($("select[name=bussplcCd3] option:selected").val());
        $("#cnsltBussplcCd4").val($("select[name=bussplcCd4] option:selected").val()); 
        
        if( "" != nvl($("select[name=vhclMdl] option:selected").val(),"") ){
        	$("#cnsltDscr").val($("select[name=vhclMdl] option:selected").text() +"/"+$("#cnsltDscr").val() );
    	}
        
        
        var rowData = $('#listCnsltTypeTable').DataTable().rows().data(); 
        var params = {};
		var formData = $("#popUpMngVO").serializeArray();
        

        if(rowData.length < 1){
            alert('<spring:message code="common.select.msg" arguments="${msgText}"/>');
            return;
        }else{
            for(var i=0 ; i<rowData.length ; i++){
            	//param 만 넘길경우
                params['listCnsltTypeTable['+i+'].codeId'] = rowData[i].codeId;
                params['listCnsltTypeTable['+i+'].codeIdLv2'] = rowData[i].codeIdLv2;
                params['listCnsltTypeTable['+i+'].codeIdLv3'] = rowData[i].codeIdLv3;
                params['listCnsltTypeTable['+i+'].codeIdLv4'] = rowData[i].codeIdLv4;

                //form 과 param을 함께 넘길경우
                formData.push({name:"listCnsltTypeTable["+i+"].codeId", value:rowData[i].codeId});
                formData.push({name:"listCnsltTypeTable["+i+"].codeIdLv2", value:rowData[i].codeIdLv2});
                formData.push({name:"listCnsltTypeTable["+i+"].codeIdLv3", value:rowData[i].codeIdLv3});
                formData.push({name:"listCnsltTypeTable["+i+"].codeIdLv4", value:rowData[i].codeIdLv4});
            }
        }        
        
		//console.log(formData);
		//console.log(params);


        // 저장
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/inbd/insertCnsltInBoundReg.do'/>",
            "data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            //"data": $("#popUpMngVO").serialize(),  //form 만 넘길경우
            "success": function(result) {

                if(result.isSuccess){

                    alert(result.message);
                    //self.close();
                    //$("div.modal").modal('hide');
                    //$("#popupModal div.modal-content").modal('hide');
                    $("#popupModal").modal('hide');
                } else {

                    var errorMsg = "";

                    if(null != result.errorMessages && "" != result.errorMessages){
                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                            alert(errorMsg);
                        }
                    }else{
                        errorMsg = result.errorMessages
                        alert("저장실패(오류메세지는 운영팀에 확인)");
                    }
                    
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
    
    
    
    
	// 인바운드상담매니저처리 등록
	$("#btnMgrProcInsert").click(function(){

        frm = document.popUpMngVO;

        /* if(!validatePopUpMngVO(frm)){
            return;
        } */

        /* $('#listCnsltTypeTable').DataTable().rows().iterator('row', function(context, index){
            var node = $(this.row(index).node()).data(); 
            console.log("00000000000000 ["+this.row(index).data().codeId+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv2+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv3+"]");
            console.log("00000000000000 ["+this.row(index).data().codeIdLv4+"]");
        }); */
        
        if(nvl($("#actDscr").val(),"") == ""){
        	alert("조치내용을 입력하세요.");
        	return;
        }
    	
    	
    	//상담구분
    	if($("select[name=cnsltKnd] option:selected").val() == '03'){
            var chkCnt = 0;
            var altTxt = "";
    		chkCnt = 0;
    		$('#popUpMngVO .has-warning :text').each(function(idx){
    			if ("" == $(this).val() || null == $(this).val()) { 
    				alert('"'+$(this).attr("alt")+'"'+" 입력은 필수입니다."); 
    				chkCnt++;
    				return false;
    			}; 
    		});
    		if(chkCnt > 0){
    			//alert("input박스 리턴");
    			return false;
    		}
    						
    		
        	
        	chkCnt = 0;
        	altTxt = "";
    		$('#popUpMngVO .has-warning :radio').each(function(idx){
    			altTxt = '"'+$(this).attr("alt")+'"'+" 선택은 필수입니다.";
    			if ($(this).is(':checked')) { 
    				//alert('"'+$(this).attr("alt")+'"'+" 선택은 필수입니다."); 
    				chkCnt++;
    				return false;
    			}; 
    		});
    		if(altTxt != "" && chkCnt == 0){
    			alert(altTxt);
    			return false;
    		}
        	
    		
    		
    		chkCnt = 0;
    		altTxt = "";
    		$('#popUpMngVO .has-warning :checkbox').each(function(idx){
    			altTxt = '"'+$(this).attr("alt")+'"'+" 하나이상 체크는 필수입니다.";
    			if ($(this).is(':checked')) { //체크된 항목이 있으면 빠져나간다
    				//alert('"'+$(this).attr("alt")+'"'+" 체크는 필수입니다."); 
    				chkCnt++;
    				return false;
    			}; 
    		});
    		if(altTxt != "" && chkCnt == 0){
    			alert(altTxt);
    			return false;
    		}

    		
    		
    		chkCnt = 0;
    		$('#popUpMngVO .has-warning select').each(function(idx){
    			//if (!$(this).is('option:selected')) {
    			if ("" == nvl($(this).val(),"")) {
    				alert('"'+$(this).attr("alt")+'"'+" 선택은 필수입니다."); 
    				chkCnt++;
    				return false;
    			} 
    		});
    		if(chkCnt > 0){
    			//alert("select박스 리턴");
    			return false;
    		}
    		
    	}

        
        
        
        
        
        
        
        //voc
		if("03" != $("select[name=cnsltKnd] option:selected").val()){
	    	$("select[name=recptKnd]").val(null).trigger('change');
	    	$("select[name=cnsltCategory]").val(null).trigger('change');
	    	$("select[name=recptRoot]").val(null).trigger('change');
	    	$("select[name=cstmrProtectKnd]").val(null).trigger('change');
	    	$("select[name=cstmrDemand]").val(null).trigger('change');
	    	$("select[name=cmplSittnCd]").val(null).trigger('change');
	    	$("select[name=accidentYnCd]").val(null).trigger('change');
	    	$("select[name=processSttus]").val(null).trigger('change');
	    	$("#cmplCdNm").val("");
	    	$("#cmplCd").val("");
	    	$("#cmplCd1No").val("");
	    	$("#cmplCd2No").val("");
	    	$("#cmplCd3No").val("");
	    	$("#cmplCd4No").val("");
	    	$("#cmplCdLvl").val("");
	    	$("#cmplCd1Nm").val("");
	    	$("#cmplCd2Nm").val("");
	    	$("#cmplCd3Nm").val("");
	    	$("#cmplCd4Nm").val("");
	    	//$("#oneselfAppntKnd").prop('checked', false);
	    	$("input:radio[name=oneselfAppntKnd]:radio[value='Y']").prop('checked', false);
	    	$("input:radio[name=oneselfAppntKnd]:radio[value='N']").prop('checked', true);
		}

        $("#cnsltBussplcKnd").val($("select[name=vocKnd] option:selected").val());
        $("#cnsltBussplcCd1").val($("select[name=bussplcCd1] option:selected").val());
        $("#cnsltBussplcCd2").val($("select[name=bussplcCd2] option:selected").val());
        $("#cnsltBussplcCd3").val($("select[name=bussplcCd3] option:selected").val());
        $("#cnsltBussplcCd4").val($("select[name=bussplcCd4] option:selected").val());	
        
        
        var rowData = $('#listCnsltTypeTable').DataTable().rows().data(); 
        var params = {};
		var formData = $("#popUpMngVO").serializeArray();	
		
		
        
		//console.log(formData);
		//console.log(params);


        // 저장
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/inbd/updateCnsltMgrProc.do'/>",
            "data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            //"data": $("#popUpMngVO").serialize(),  //form 만 넘길경우
            "success": function(result) {

                if(result.isSuccess){

                    alert(result.message);
                    //self.close();
                    //$("div.modal").modal('hide');
                    //$("#popupModal div.modal-content").modal('hide');
                    $("#popupModal").modal('hide');
                } else {

                    var errorMsg = "";

                    if(null != result.errorMessages && "" != result.errorMessages){
                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                            alert(errorMsg);
                        }
                    }else{
                        errorMsg = result.errorMessages
                        alert("저장실패(오류메세지는 운영팀에 확인)");
                    }
                    
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
    
    
    
    
	// CMS의뢰요청
	$("#btnMgrCmsReq").click(function(){
        // 저장
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/cmm/cmfile/EC4CmsFileWrite.do'/>",
            //"data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            "data": $("#popUpMngVO").serialize(),  //form 만 넘길경우
            "success": function(result) {

                if(result.isSuccess){

                    alert(result.message);
                    //$("#popupModal").modal('hide');
                } else {

                    var errorMsg = "";

                    if(null != result.errorMessages && "" != result.errorMessages){
                        for(var i = 0 ; i < result.errorMessages.length ; i++){

                            errorMsg = errorMsg + result.errorMessages[i] + "\n"
                            alert(errorMsg);
                        }
                    }else{
                        errorMsg = result.errorMessages
                        alert("저장실패(오류메세지는 운영팀에 확인)");
                    }
                    
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

    
    
    
	

	//이메일도메인
    $("select[name=selectEmailDomain]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if(this.value == '' || this.value == null || this.value == 'undefined'){
			$("#emailDomain").prop("readOnly",false);
			$("#emailDomain").val("");
		}else{
			$("#emailDomain").prop("readOnly",true);
			$("#emailDomain").val($("select[name=selectEmailDomain] option:selected").val());
		}
    });
	

	//상담구분
    $("select[name=cnsltKnd]").change(function(){
    	//alert("sfdsdfsdfsdf["+this.value+"]");
		if(this.value == '03'){
			$("#claimDiv").show();
		}else{
			$("#claimDiv").hide();
		}
    });
	
	
	
	$(document).on("change","#rcptKnd",function() {
		$.ajax({
			type: "POST",
			dataType:"json",
			async: false,
			url: "/nims/mileagemng/mileagemng/searchListBaseSalesMaster.json",
			data: $("#frm").serialize(),
			success:function(data) {
				if(data.ok){
					$.each(data, function(index){
	                    $('#rcptKnd').append('<option value='+data.cnsltCtId+'>' + data.cnsltCtNm + '</option>');
	                });    
				}else AXUtil.alert(data.message);
				
			},
			error:function(request, status) {
				alert("리스트 조회중 오류가 발생하였습니다.");
				return false;
			}
		});
	});
	

	//브랜드
    $("select[name=vmcd]").change(function(){
    	$("select[name=vhclMdl]").val(null).trigger('change');
    	$("select[name=vhclDetlMdl]").val(null).trigger('change');
    });
	//차종
    $("select[name=vhctCd]").change(function(){
    	$("select[name=vhclMdl]").val(null).trigger('change');
    	$("select[name=vhclDetlMdl]").val(null).trigger('change');
    });
	
	//고객차량 모델
    $(".selectCustVhclMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=vhctCd] option:selected").val(),/* 차종 */
   		            "cnsltSeCode": $("select[name=vmcd] option:selected").val(),/* 제조사 */
   		            "codeId": $("select[name=custVhclMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    
	
	//차량 모델
    $(".selectVhclMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=vhctCd] option:selected").val(),/* 차종 */
   		            "cnsltSeCode": $("select[name=vmcd] option:selected").val(),/* 제조사 */
   		            "codeId": $("select[name=vhclMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    $(".selectVhclMdl").on("change", function (e) {
    	$("select[name=vhclDetlMdl]").val(null).trigger('change');
    });
	//차량 세부모델
    $(".selectDetlMdl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclDetlMdlComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "upCodeId": $("select[name=vhclMdl] option:selected").val(), /* 모델 */
   		            "cnsltSeCode": $("select[name=vmcd] option:selected").val(), /* 제조사 */
   		            "codeId": $("select[name=vhclDetlMdl] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 세부모델 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	
	
	//CMS구분
    $("select[name=vocKnd]").change(function(){
    	$("select[name=recptKnd]").val(null).trigger('change');
    	$("select[name=cnsltCategory]").val(null).trigger('change');
    	$("select[name=recptRoot]").val(null).trigger('change');
    	$("select[name=cstmrProtectKnd]").val(null).trigger('change');
    	$("select[name=cstmrDemand]").val(null).trigger('change');
    	$("select[name=cmplSittnCd]").val(null).trigger('change');
    	$("select[name=accidentYnCd]").val(null).trigger('change');
    	$("select[name=processSttus]").val(null).trigger('change');

    	$("select[name=bussplcCd2]").val(null).trigger('change');
    	$("select[name=bussplcCd3]").val(null).trigger('change');
    	$("select[name=bussplcCd4]").val(null).trigger('change');
    });
    
    //접속구분
    $(".selectRcpt").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCRCPTKND",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=recptKnd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//상담카테고리
    $(".selectCategy").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCCTGY",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cnsltCategory] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//접속경로
    $(".selectRoot").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCROOT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=recptRoot] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//소보원
    $(".selectCstGurd").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCCPTT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cstmrProtectKnd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//고객요구
    $(".selectReq").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCDMND",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cstmrDemand] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//불만코드
	
	//불만상황
    $(".selectCmpl").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCSITT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=cmplSittnCd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//상해여부코드
    $(".selectAccu").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCADNT",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=accidentYnCd] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//처리상태
    $(".selectProcess").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/cmt/selectDetailCodeComboList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "searchUpCode": $("select[name=vocKnd] option:selected").val(),
   		            "searchCodeId": "VOCSTUS",//$("select[name=codeId] option:selected").val()
   		            "searchCode": $("select[name=processSttus] option:selected").val()
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//사업소1
    $(".selectBpc1").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   		            "upCodeId": "null",
   		            "codeId": $("select[name=bussplcCd1] option:selected").val(),
   		            "lvlCode": "1"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//사업소2
    $(".selectBpc2").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   		            "upCodeId": $("select[name=bussplcCd1] option:selected").val(),
   		            "codeId": $("select[name=bussplcCd2] option:selected").val(),
   		            "lvlCode": "2"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
	
	//사업소3
    $(".selectBpc3").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		        return {
   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   		         	"upCodeId": $("select[name=bussplcCd2] option:selected").val(),
   		            "codeId": $("select[name=bussplcCd3] option:selected").val(),
   		            "lvlCode": "3"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	
    $(".selectBpc3").on("change", function (e) {
    	$("select[name=bussplcCd4]").val(null).trigger('change');
    });
	
	//사업소4
    $(".selectBpc4").select2({
    	"ajax": {
   		    "url": "<c:url value='/ec4/cmm/cbase/bpc/selectBussplcCMSCombList.do'/>",
   		    "dataType": 'json',
   		    "delay": 250,
   		    "data": function (params) {
   		    	
   		    	var upCodeId;
   		    	var codeId;
   		    	var code;
   		    	if("SCMS" == $("select[name=vocKnd] option:selected").val()){
   		    		upCodeId = $("select[name=bussplcCd3] option:selected").val();
   		    		codeId = $("select[name=bussplcCd4] option:selected").val();
   		    		
   		    	}else if("CCMS" == $("select[name=vocKnd] option:selected").val()){
   		    		upCodeId = $("select[name=bussplcCd2] option:selected").val();
   		    		codeId = $("select[name=bussplcCd3] option:selected").val();
   		    		code = $("select[name=bussplcCd4] option:selected").val();
   		    	}
   		        return {
   	   		            "codeKnd": $("select[name=vocKnd] option:selected").val(),
   	   		            "upCodeId": upCodeId,
   	   		            "codeId": codeId,
   	   		         	"code": code,
   	   		            "lvlCode": "4"
   		        };
   		    }
   		},
    	"placeholder": "-- 선택 --",
        "width": "100%",
        "tags": false,
        "minimumResultsForSearch": 100
    });	


	
	

	$(document).on("click","#cnsltTypePopTEST",function() {
		
		/* $.ajax({
		    url:"http://152.149.66.194:8180/CustomerIssue/CounselType.jsp",
		    dataType:'jsonp',    
		    data:{resultCode:'S', resultMsg:'OK'},  
		    jsonpCallback:"returnCall",  
		    success:function(s){
		      console.log('Success', s);
		    },
		    error:function(e) {
		      console.log('Error', e);
		    }

		}); 
		return;
		alert("sdfsdfsdfsdfsdsdf"); */
		
		
		var e = document.createElement('script');
        /* e.setAttribute('src', 'http://152.149.66.194:8180/CustomerIssue/CounselType.jsp');
        e.setAttribute('class', 'svg-crowbar');
        document.body.appendChild(e); */

        e.src = "http://152.149.66.194:8180/CustomerIssue/CounselType.jsp"; //외부참조가 가능하므로...
        //document.getElementsByTagName("body")[0].appendChild(e);
        document.body.appendChild(e);
        
        
        //var ele = document.getElementsByTagName("head")[0].appendChild(e);
        //document.createTextNode(ele.replace('<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">', ""))
        
        
		
		window.open("http://152.149.66.194:8180/CustomerIssue/CounselType.jsp","cnsltTypePop","width=900,height=550,top=10,left=10,scrollbars=no,location=no");
		
        /* window.addEventListener('confirm', function (e) {
        	console.log('message', e.data);
        	console.log('origin', e.origin);
        	console.log('source', e.source);
        }); */

		
    });	
	
	
	
	
	
	$(document).on("click","#cnsltTypePop",function() {
        var popupParams = {};
        
        $("#searchCnsltTyCn").val($("#cnsltTyCn").val());
        $("#searchCnsltTyCnCode").val($("#cnsltTyCnCode").val());

        var callbackClass = "callback";
        var selectStyle = "single";
        var url = "<c:url value='/ec4/call/inbd/cnsltInBoundTypePop.do'/>";

        popupParams.width = "1000";
        popupParams.height = "900";
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
	
	
	
	
	//불만코드 팝업
	$(document).on("click","#cmplCdPop",function() {
        var popupParams = {};

        var callbackClass = "callback";
        var selectStyle = "single";
        var url;
        
        //SCMS
        url = "<c:url value='/ec4/call/cmpl/cmplCdScmsPop.do'/>";
        //CCMS
        //url = "<c:url value='/ec4/call/cmpl/cmplCdCcmsPop.do'/>";
        

        popupParams.width = "800";
        popupParams.height = "700";
        popupParams.title = "popupSelectCmplCd";
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

	$('#popupModal').on('hide.bs.modal', function (e) {
		  parent.location.reload();
	});
	
	
	
});
	function rtnCnsltTypeList(items){
		var grid = $("#listCnsltTypeTable").DataTable();
		grid.destroy();
		$("#listCnsltTypeTable tbody").remove();
		//$("#listCnsltTypeTable > tbody tr").remove();
		//$("#listCnsltTypeTable > tbody tr").empty();
		
		$('#listCnsltTypeTable').DataTable().clear().destroy();
		gtListCnsltTypeTable = $("#listCnsltTypeTable").dataTable({
	        "rowId": "code",
	        "destroy": true,
	        "data": items,
	        "select": {
	            "style": "single"
	        },
	        "deferRender": true,
	        "width" : "100%",
	        "scroller": true,
	        "scrollX" : true,
	        "scrollY" : "250px",
	        "scrollHeadInnerX" : "100%",
	        "scrollCollapse" : false,
	        "info" : false,
	        "searching" : false,
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
			                {"visible": false, "targets": [0,1,2,3] , "width" : "1%"},
			                {"orderable": true, "targets": [4], "width" : "25%"},
			                {"orderable": true, "targets": [5], "width" : "25%"},
			                {"orderable": true, "targets": [6], "width" : "25%"},
			                {"orderable": true, "targets": [7], "width" : "25%"}
	       	         	  ],    
		    "order": [ 5, 'asc' ],
		    "columns": [
		    				{"width" : "1%", "align" : "right"},
		    				{"width" : "1%", "align" : "right"},
		    				{"width" : "1%", "align" : "right"},
		    				{"width" : "1%", "align" : "right"},
		    				{"width" : "25%", "align" : "right"},
		    				{"width" : "25%", "align" : "right"},
		    				{"width" : "25%", "align" : "right"},
		    				{"width" : "25%", "align" : "right"}
		    			],
		    "language" : { "emptyTable": "데이터가 존재하지 않습니다." },
	        "initComplete": function(settings, json) {
		     }
		});	
	}
	function rtnCnsltTypeListData(items){
		//console.log(items);
		//$("#listCnsltTypeTable").DataTable().clear().draw();
		//$("#listCnsltTypeTable").empty();
		//$("#listCnsltTypeTable").DataTable().reset();
		//$("#table > tbody:last").append("<tr><td colspan=4>가입자가 없습니다.</td></tr>");
		$('#listCnsltTypeTable').DataTable().clear().destroy();

		
		gtListCnsltTypeTable = $("#listCnsltTypeTable").dataTable({
            "language": lang_kor,
            "destroy": true,
	        "data": items,
	        "deferRender": true,
            "select": {
                "style": "single"
            },
            "rowId": "code",
            //"scrollY": "369px",
            "scrollY": "250px",
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
            //"ajaxSource" : items,
            "columnDefs": [
                {"visible": false, "targets": [0,1,2,3]},
                {"orderable": false, "targets": [4]},
                {"orderable": false, "targets": [5]},
                {"orderable": false, "targets": [6]},
                {"orderable": false, "targets": [7]}
            ],
            "columns": [
				{"data":"codeId" , "defaultContent" : ""},
				{"data":"codeIdLv2" , "defaultContent" : ""},
				{"data":"codeIdLv3" , "defaultContent" : ""},
				{"data":"codeIdLv4" , "defaultContent" : ""},
				{"data":"codeNm" , "defaultContent" : ""},
				{"data":"codeNmLv2" , "defaultContent" : ""},
				{"data":"codeNmLv3" , "defaultContent" : ""},
				{"data":"codeNmLv4" , "defaultContent" : ""}
            ],
	        "initComplete": function(settings, json) {
	        	//console.log("1>>>>>>>>>>>>>"+settings);
	        	//console.log("2>>>>>>>>>>>>>"+json);
		     }
		});	
	}

	function searchInfo(){

        // 테이블
        gtListCnsltTypeTable = $('#listCnsltTypeTable').DataTable({
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
            "sAjaxSource": "/ec4/call/inbd/selectInCallCnsltTypeList.do", //"/ec4/cmm/cinfo/cstmrIntgrMngList.do",
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "searchParntsCodeId", "value": "0"},
                        {"name": "searchCnsltSeCode", "value": "CNSE020"},
                        {"name": "searchCnsltIncallNo", "value": $("#cnsltIncallNo").val()},
                        {"name": "searchCnsltUserId", "value": $("#cnsltUserId").val()},
                        {"name": "searchCstmrCd", "value": $("#cstmrCd").val()}
                );
            },
            "sServerMethod": "POST",
            "columnDefs": [
                {"visible": false, "targets": [0,1,2,3]},
                {"orderable": true, "targets": [4]},
                {"orderable": true, "targets": [5]},
                {"orderable": true, "targets": [6]},
                {"orderable": true, "targets": [7]}
            ],
            "columns": [
                {"data":"codeId" , "defaultContent" : ""},
                {"data":"codeIdLv2" , "defaultContent" : ""},
                {"data":"codeIdLv3" , "defaultContent" : ""},
                {"data":"codeIdLv4" , "defaultContent" : ""},
                {"data":"codeNm" , "defaultContent" : ""},
                {"data":"codeNmLv2" , "defaultContent" : ""},
                {"data":"codeNmLv3" , "defaultContent" : ""},
                {"data":"codeNmLv4" , "defaultContent" : ""}
            ],
	        "initComplete": function(settings, json) {
	        	//console.log(settings);
	        	//console.log(json);
		     }
        });
	}
	

	
    /**
     * 주소 검색 화면 호출(Basic)
     */
    var JusoPop; 
    function fn_openUrlJusoSearchBasic() {
        JusoPop = window.open("/ec4/cmm/zip/rdnmadrSearchPopup.do", "pop_basic",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }
    function fn_setJuso(rtnData){
    	$("#searchHomeZip").val(rtnData.zipNo);
    	$("#searchHomeAdres").val(rtnData.roadAddrPart1);
    	$("#searchHomeAdresDetl").val(rtnData.roadAddrPart2);
    	JusoPop.close();
    }

</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">



<!-- Main content -->
    <section class="content">
    

    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                	<div>
                		&nbsp;
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
                	</div>
                    <div class="box-header with-border bg-info">
                    	<h3 class="box-title">상담내용</h3>
                    </div>
                    <!-- /.box-header -->

                    <form:form commandName="popUpMngVO" name="popUpMngVO" method="post" cssClass="form-horizontal">
                    <double-submit:preventer/>
                    <div class="box-body">
                    <form class="form-horizontal" name="frm" id="frm">
                    <form:hidden path="cnsltBussplcKnd" value="${popUpMngVO.cnsltBussplcKnd}"/>
                    <form:hidden path="cnsltBussplcCd1" value="${popUpMngVO.cnsltBussplcCd1}"/>
                    <form:hidden path="cnsltBussplcCd2" value="${popUpMngVO.cnsltBussplcCd2}"/>
                    <form:hidden path="cnsltBussplcCd3" value="${popUpMngVO.cnsltBussplcCd3}"/>
                    <form:hidden path="cnsltBussplcCd4" value="${popUpMngVO.cnsltBussplcCd4}"/>
                    <form:hidden path="cnsltUserId" value="${popUpMngVO.frstRegisterId}"/>
                    <form:hidden path="cstmrCd" value="${popUpMngVO.cstmrCd}"/>
                    <form:hidden path="cnsltIncallNo" value="${popUpMngVO.cnsltIncallNo}"/>
                    <form:hidden path="cmplMngNo" value="${popUpMngVO.cmplMngNo}"/>
                    <form:hidden path="cmplRecptDt" value="${popUpMngVO.cmplRecptDt}"/>
                    <form:hidden path="cmplRecptSeq" value="${popUpMngVO.cmplRecptSeq}"/>
                    <form:hidden path="mgrProcModeYn" value="Y"/>
                    <form:hidden path="vin" value="${popUpMngVO.custVin}"/>
                    <form:hidden path="vhcleNo" value="${popUpMngVO.custVhcleNo}"/>
                    <form:hidden path="custVin" value="${popUpMngVO.custVin}"/>
                    <form:hidden path="custVhcleNo" value="${popUpMngVO.custVhcleNo}"/>
                    <form:hidden path="cstmrEsntlId" value="${popUpMngVO.cstmrEsntlId}"/>
                    <form:hidden path="cstmrVhcleSeq" value="${popUpMngVO.cstmrVhcleSeq}"/>
                    
                    
                            <div class="form-group">
                                <label for="cstmrNm" class="col-sm-2 control-label">고객명</label>
                                <div class="col-sm-4">
	                                <input type="text" name="cstmrNm" class="form-control" id="callerNm" value="${popUpMngVO.cstmrNm}" readOnly/>
                                </div>
	                            <label for="cnsltCarKnd" class="col-sm-2 control-label">고객차량</label>
                                <div class="col-sm-4 dstick" style="padding-bottom:0px">
                                   <div class="col-sm-12">
	                                    <div class="col-sm-12 dstick">
		                                    <form:select path="custVhclMdl" class="form-control input-sm selectCustVhclMdl">
		                                        <c:if test="${popUpMngVO.custVhclMdlNm != '' and popUpMngVO.custVhclMdlNm != null}">
		                                        	<option value="${popUpMngVO.custVhclMdl}">${popUpMngVO.custVhclMdlNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.custVhclMdlNm == '' or popUpMngVO.custVhclMdlNm == null}">
			                                        <form:option value="">-- 모델 --</form:option>
			                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="custVhclMdl" />
	                                    </div>
	                                    <%-- <div class="col-sm-6 dstick">
		                                    <form:select path="vhclDetlMdl" class="form-control input-sm selectDetlMdl">
		                                        <c:if test="${popUpMngVO.vhclDetlMdlNm != '' and popUpMngVO.vhclDetlMdlNm != null}">
		                                        	<option value="${popUpMngVO.vhclDetlMdl}">${popUpMngVO.vhclDetlMdlNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.vhclDetlMdlNm == '' or popUpMngVO.vhclDetlMdlNm == null}">
			                                        <form:option value="">-- 세부모델 --</form:option>
			                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclDetlMdl" />
	                                    </div> --%>
                                   </div>
                             	</div>
						  	</div>
                    
                            <div class="form-group">
                                <label for="callerNm" class="col-sm-2 control-label">통화자명</label>
                                <div class="col-sm-4">
	                                <input type="text" name="callerNm" class="form-control" id="callerNm" value="${popUpMngVO.callerNm}" readOnly/>
                                </div>
                                <label for="callerHpno" class="col-sm-2 control-label">핸드폰</label>
                                <div class="col-sm-4">
	                                <input type="text" name="callerHpno" class="form-control" id="callerHpno" value="${popUpMngVO.callerHpno}" readOnly/>
                                </div>
						  	</div>
                    
                            <div class="form-group">
                                <label for="emailAdres" class="col-sm-2 control-label">이메일</label>
                                <div class="col-sm-10">
	                                <input type="text" name="emailAdres" class="form-control-nowd w200" id="emailAdres" value="${popUpMngVO.emailAdres}" readOnly/>
	                                <input type="text" name="emailDomain" class="form-control-nowd w150" id="emailDomain" value="${popUpMngVO.emailDomain}" readOnly/>
                                    <%-- <form:select path="selectEmailDomain" class="form-control-nowd w150 input-sm" disabled="true">
                                        <form:option value="">-- 직접입력 --</form:option>
                                        <form:options items="${selectEmailDomainList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select> --%>	
                                </div>
						  	</div>
                    
                            <div class="form-group">
                                <label for="searchHome" class="col-sm-2 control-label">주소</label>
                                <div class="col-sm-3">
                                	<div class="input-group">
		                                <input type="text" name="searchHomeZip" class="form-control" id="searchHomeZip" value="${popUpMngVO.houseZip}" readOnly/>
	                                    <div class="input-group-btn">
	                                        <!-- <button type="button" id="homeAdres" class="btn btn-info btn-flat" onClick="javascript:fn_openUrlJusoSearchBasic()">
	                                        <i class="fa fa-search"></i></button> -->
	                                    </div>
                                	</div>
                                </div>
						  	</div>
                    
                            <div class="form-group">
                                <label for="searchBlank" class="col-sm-2 control-label"></label>
                                <div class="col-sm-10">
	                                <input type="text" name="searchHomeAdres" class="form-control" id="searchHomeAdres" value="${popUpMngVO.houseAdres}" readOnly/>
	                                <input type="text" name="searchHomeAdresDetl" class="form-control" id="searchHomeAdresDetl" value="${popUpMngVO.houseAdresDetail}"/>
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="cstmrRel" class="col-sm-2 control-label">고객관계</label>
                                <div class="col-sm-4">
                                    <form:select path="cstmrRel" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cstmrRelList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control">
                                		<option>배우자</option>
                                		<option>형제</option>
                                		<option>부모</option>
                                	</select> -->
                                </div>
                                <label for="callType" class="col-sm-2 control-label">통화유형</label>
                                <div class="col-sm-4">
                                    <form:select path="callType" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${callTypeList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control">
                                		<option>유선통화</option>
                                		<option>WebVoc</option>
                                		<option>WebChat</option>
                                		<option>대화형검색</option>
                                	</select> -->
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="cnsltRslt" class="col-sm-2 control-label">상담결과</label>
                                <div class="col-sm-4">
                                    <form:select path="cnsltRslt" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltRsltList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control">
                                		<option>통화종료</option>
                                		<option>호전환</option>
                                		<option>상담사연결</option>
                                		<option>상담사답변</option>
                                		<option>협의답변</option>
                                		<option>담당자연결</option>
                                		<option>전화번호안내</option>
                                	</select> -->
                                </div>
                                <label for="cnsltKnd" class="col-sm-2 control-label">상담구분</label>
                                <div class="col-sm-4">
                                    <form:select path="cnsltKnd" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltKndList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                	<!-- <select class="form-control" id="cnsltKnd">
                                		<option value="N">일반접수</option>
                                		<option value="C">클레임접수</option>
                                		<option value="V">VOC</option>
                                	</select> -->
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="cnsltCustKnd" class="col-sm-2 control-label">고객구분</label>
                                <div class="col-sm-4">
                                    <form:select path="cnsltCustKnd" class="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${cnsltCustKndList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>	
                                </div>
                                <label for="partNoReason" class="col-sm-2 control-label">원인품번</label>
                                <div class="col-sm-4">
                                	<input type="text" name="partNoReason" class="form-control" id="partNoReason" value="${popUpMngVO.partNoReason}"/>
                                </div>
						  	</div>
		                    

                            <div class="form-group">
	                            <label for="cnsltCarKnd" class="col-sm-2 control-label">상담차종</label>
                                <div class="col-sm-4 dstick" style="padding-bottom:0px">
                                   <div class="col-sm-12">
	                                    <div class="col-sm-12 dstick">
		                                    <form:select path="vhclMdl" class="form-control input-sm selectVhclMdl">
		                                        <c:if test="${popUpMngVO.vhclMdlNm != '' and popUpMngVO.vhclMdlNm != null}">
		                                        	<option value="${popUpMngVO.vhclMdl}">${popUpMngVO.vhclMdlNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.vhclMdlNm == '' or popUpMngVO.vhclMdlNm == null}">
			                                        <form:option value="">-- 모델 --</form:option>
			                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclMdl" />
	                                    </div>
	                                    <%-- <div class="col-sm-6 dstick">
		                                    <form:select path="vhclDetlMdl" class="form-control input-sm selectDetlMdl">
		                                        <c:if test="${popUpMngVO.vhclDetlMdlNm != '' and popUpMngVO.vhclDetlMdlNm != null}">
		                                        	<option value="${popUpMngVO.vhclDetlMdl}">${popUpMngVO.vhclDetlMdlNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.vhclDetlMdlNm == '' or popUpMngVO.vhclDetlMdlNm == null}">
			                                        <form:option value="">-- 세부모델 --</form:option>
			                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhclDetlMdl" />
	                                    </div> --%>
                                   </div>
                             	</div>
                                <label for="cnsltCheckItem" class="col-sm-2 control-label">체크항목</label>
                                <div class="col-sm-4 checkbox dstick">
			  						<label><input type="checkbox" name="bndryTrgtCstmrYn" id="bndryTrgtCstmrYn" disabled value="${popUpMngVO.bndryTrgtCstmrYn}"  <c:if test="${'Y' eq popUpMngVO.bndryTrgtCstmrYn}">checked</c:if> />경계대상고객여부</label>
			  						<label><input type="checkbox" name="mgrCnfmReqFlag" id="mgrCnfmReqFlag" disabled value="${popUpMngVO.mgrCnfmReqFlag}"  <c:if test="${'Y' eq popUpMngVO.mgrCnfmReqFlag}">checked</c:if> />매니저확인요청</label>
			  						<label><input type="checkbox" name="salesLeadFlag" id="salesLeadFlag" disabled value="${popUpMngVO.salesLeadFlag}"  <c:if test="${'Y' eq popUpMngVO.salesLeadFlag}">checked</c:if> />Sales Lead</label>
			  						<label><input type="checkbox" name="smsFileAttachFlag" id="smsFileAttachFlag" disabled value="${popUpMngVO.smsFileAttachFlag}"  <c:if test="${'Y' eq popUpMngVO.smsFileAttachFlag}">checked</c:if> />고객SMS첨부파일</label>
			  						<label><input type="checkbox" name="cstmrMktAgreeFlag" id="cstmrMktAgreeFlag" disabled value="${popUpMngVO.cstmrMktAgreeFlag}"  <c:if test="${'Y' eq popUpMngVO.cstmrMktAgreeFlag}">checked</c:if> />마케팅활용동의</label>
                                </div>
                            </div>
						  	

                            <div class="form-group">
                                <label for="cnsltMemo" class="col-sm-2 control-label">상담사메모</label>
                                <div class="col-sm-10">
	                                <textarea name="cnsltMemo" class="form-control" rows="3" id="cnsltMemo" placeholder="Enter ..." readonly>${popUpMngVO.cnsltMemo}</textarea>
                                </div>
						  	</div>
						  	
						  	
                            <div class="form-group">
	                                <label for="cnsltTyCn" class="col-sm-2 control-label">상담유형</label>
	                                <div class="col-sm-4">
	                                	<input type="text" name="cnsltTyCn" class="form-control" id="cnsltTyCn" value="${popUpMngVO.cnsltTyCn}" readOnly/>
	                                	<input type="hidden" name="cnsltTyCnCode" class="form-control" id="cnsltTyCnCode" value="${popUpMngVO.cnsltTyCnCode}" readOnly/>
                                        <%-- <div class="input-group">
                                        	<input type="text" name="cnsltTyCn" class="form-control" id="cnsltTyCn" value="${popUpMngVO.cnsltTyCn}" readOnly/>
	                                        <div class="input-group-btn">
	                                            <button type="button" id="cnsltTypePop" class="btn btn-info btn-flat">
	                                            <i class="fa fa-search"></i></button>
	                                        </div>
	                                    </div> --%>
	                                </div>
						  	</div>
						  	
						  	
		                    <div class="form-group">
		                    	<div class="col-sm-1"></div>
		                    	<div class="col-sm-11">
							          <table id="listCnsltTypeTable" name="listCnsltTypeTable" class="table table-hover">
							            <thead>
							              <tr>
							                <th>상담분류유형코드1</th>
							                <th>상담분류유형코드2</th>
							                <th>상담분류유형코드3</th>
							                <th>상담분류유형코드4</th>
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
		                    </div>	
                            
                            
                            <div class="form-group">
                                <label for="cnsltDscr" class="col-sm-2 control-label">상담내용</label>
                                <div class="col-sm-10">
	                                <textarea name="cnsltDscr" class="form-control" rows="3" id="cnsltDscr" placeholder="Enter ..." readonly>${popUpMngVO.cnsltDscr}</textarea>
                                </div>
						  	</div>
                            
                            
                            <div class="form-group" style="display:none;">
                                <label for="cnsltSttDscr" class="col-sm-2 control-label">문의내용<br>(STT내용)</label>
                                <div class="col-sm-10">
	                                <textarea name="cnsltSttDscr" class="form-control" rows="3" id="cnsltSttDscr" placeholder="Enter ...">${popUpMngVO.cnsltSttDscr}</textarea>
                                </div>
						  	</div>
                            
                            
                            <div class="form-group">
                                <label for="actDscrBefore" class="col-sm-2 control-label">이전조치내용</label>
                                <div class="col-sm-10">
	                                <textarea name="actDscrBefore" class="form-control" rows="3" id="actDscrBefore" placeholder="Enter ..." readonly>${popUpMngVO.actDscrBefore}</textarea>
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="actDscr" class="col-sm-2 control-label">조치내용</label>
                                <div class="col-sm-10">
	                                <textarea name="actDscr" class="form-control" rows="3" id="actDscr" placeholder="Enter ...">${popUpMngVO.actDscr}</textarea>
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="vocKnd" class="col-sm-2 control-label">사업소구분</label>
                                <div class="col-sm-4">
                                       <form:select path="vocKnd" class="form-control input-sm" >
                                           <form:option value="">-- 선택 --</form:option>
                                           <form:options items="${vocKndList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>		                                
                                	<!-- <select class="form-control" id="vocKnd" name="vocKnd">
                                		<option value="">선택</option>
                                		<option value="SCMS">SCMS</option>
                                		<option value="CCMS">CCMS</option>
                                	</select> -->
                                </div>
						  	</div>
                            <div class="form-group">
                                <label for="bussplc" class="col-sm-2 control-label">사업소</label>
                                <div class="col-sm-2">
                                       <%-- <form:select path="bussplcCd1" cssClass="form-control input-sm selectBpc1">
                                           <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd1" /> --%>
                                       <select class="form-control" name="bussplcCd1" id="bussplcCd1">
                                       	<option value="N">네트워크</option>
                                       </select>
                                </div>
                                <div class="col-sm-2">
                                       <form:select path="bussplcCd2" cssClass="form-control input-sm selectBpc2">
	                                        <c:if test="${popUpMngVO.bussplcCd2Nm != '' and popUpMngVO.bussplcCd2Nm != null}">
	                                        	<option value="${popUpMngVO.bussplcCd2}">${popUpMngVO.bussplcCd2Nm}</option>
	                                        </c:if>
	                                        <c:if test="${popUpMngVO.bussplcCd2Nm == '' or popUpMngVO.bussplcCd2Nm == null}">
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </c:if>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd2" />
                                </div>
                                <div class="col-sm-3">
                                       <form:select path="bussplcCd3" cssClass="form-control input-sm selectBpc3">
	                                        <c:if test="${popUpMngVO.bussplcCd3Nm != '' and popUpMngVO.bussplcCd3Nm != null}">
	                                        	<option value="${popUpMngVO.bussplcCd3}">${popUpMngVO.bussplcCd3Nm}</option>
	                                        </c:if>
	                                        <c:if test="${popUpMngVO.bussplcCd3Nm == '' or popUpMngVO.bussplcCd3Nm == null}">
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </c:if>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd3" />
                                </div>
                                <div class="col-sm-3">
                                       <form:select path="bussplcCd4" cssClass="form-control input-sm selectBpc4">
	                                        <c:if test="${popUpMngVO.bussplcCd4Nm != '' and popUpMngVO.bussplcCd4Nm != null}">
	                                        	<option value="${popUpMngVO.bussplcCd4}">${popUpMngVO.bussplcCd4Nm}</option>
	                                        </c:if>
	                                        <c:if test="${popUpMngVO.bussplcCd4Nm == '' or popUpMngVO.bussplcCd4Nm == null}">
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
	                                        </c:if>
                                       </form:select>
                                       <form:errors cssClass="help-block" path="bussplcCd4" />
                                </div>
						  	</div>
						  	
						  	
						  	
						  	<div class="row" id="claimDiv" style="display:none;">
						  	
				                    <div class="box-header with-border bg-info">
				                    	<h3 class="box-title">불만내용</h3>
				                    </div>
		                            <div class="form-group has-warning">
		                                <label for="recptKnd" class="col-sm-2 control-label">접수구분</label>
		                                <div class="col-sm-4">
	                                        <form:select path="recptKnd" cssClass="form-control input-sm selectRcpt" alt="접수구분">
		                                        <c:if test="${popUpMngVO.recptKndNm != '' and popUpMngVO.recptKndNm != null}">
		                                        	<option value="${popUpMngVO.recptKnd}">${popUpMngVO.recptKndNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.recptKndNm == '' or popUpMngVO.recptKndNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="recptKnd" />
		                                </div>
		                                
		                                <label for="cnsltCategory" class="col-sm-2 control-label">상담카테고리</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cnsltCategory" cssClass="form-control input-sm selectCategy" alt="상담카테고리">
		                                        <c:if test="${popUpMngVO.cnsltCategoryNm != '' and popUpMngVO.cnsltCategoryNm != null}">
		                                        	<option value="${popUpMngVO.cnsltCategory}">${popUpMngVO.cnsltCategoryNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.cnsltCategoryNm == '' or popUpMngVO.cnsltCategoryNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cnsltCategory" />
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="recptRoot" class="col-sm-2 control-label">접수경로</label>
		                                <div class="col-sm-4">
	                                        <form:select path="recptRoot" cssClass="form-control input-sm selectRoot" alt="접수경로">
		                                        <c:if test="${popUpMngVO.recptRootNm != '' and popUpMngVO.recptRootNm != null}">
		                                        	<option value="${popUpMngVO.recptRoot}">${popUpMngVO.recptRootNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.recptRootNm == '' or popUpMngVO.recptRootNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="recptRoot" />
		                                </div>
		                                
		                                <label for="cstmrProtectKnd" class="col-sm-2 control-label">소보원구분</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cstmrProtectKnd" cssClass="form-control input-sm selectCstGurd" alt="소보원구분">
		                                        <c:if test="${popUpMngVO.cstmrProtectKndNm != '' and popUpMngVO.cstmrProtectKndNm != null}">
		                                        	<option value="${popUpMngVO.cstmrProtectKnd}">${popUpMngVO.cstmrProtectKndNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.cstmrProtectKndNm == '' or popUpMngVO.cstmrProtectKndNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cstmrProtectKnd" />
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="cstmrDemand" class="col-sm-2 control-label">고객요구</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cstmrDemand" cssClass="form-control input-sm selectReq" alt="고객요구">
		                                        <c:if test="${popUpMngVO.cstmrDemandNm != '' and popUpMngVO.cstmrDemandNm != null}">
		                                        	<option value="${popUpMngVO.cstmrDemand}">${popUpMngVO.cstmrDemandNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.cstmrDemandNm == '' or popUpMngVO.cstmrDemandNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cstmrDemand" />
		                                </div>
		                                
		                                <label for="cmplCdNm" class="col-sm-2 control-label">불만코드</label>
		                                <div class="col-sm-4">
	                                        <div class="input-group">
	                                        	<input type="text" name="cmplCdNm" class="form-control" id="cmplCdNm" value="${popUpMngVO.cmplCdNm}" readOnly alt="불만코드"/>
	                                        	<input type="hidden" name="cmplCd" class="form-control" id="cmplCd" value="${popUpMngVO.cmplCd}" readOnly/>
												<input type="hidden" name="cmplCd1No" id="cmplCd1No" value="${popUpMngVO.cmplCd1No}" readOnly/>
												<input type="hidden" name="cmplCd2No" id="cmplCd2No" value="${popUpMngVO.cmplCd2No}" readOnly/>
												<input type="hidden" name="cmplCd3No" id="cmplCd3No" value="${popUpMngVO.cmplCd3No}" readOnly/>
												<input type="hidden" name="cmplCd4No" id="cmplCd4No" value="${popUpMngVO.cmplCd4No}" readOnly/>
												<input type="hidden" name="cmplCdLvl" id="cmplCdLvl" value="${popUpMngVO.cmplCdLvl}" readOnly/>
												<input type="hidden" name="cmplCd1Nm" id="cmplCd1Nm" value="${popUpMngVO.cmplCd1Nm}" readOnly/>
												<input type="hidden" name="cmplCd2Nm" id="cmplCd2Nm" value="${popUpMngVO.cmplCd2Nm}" readOnly/>
												<input type="hidden" name="cmplCd3Nm" id="cmplCd3Nm" value="${popUpMngVO.cmplCd3Nm}" readOnly/>
												<input type="hidden" name="cmplCd4Nm" id="cmplCd4Nm" value="${popUpMngVO.cmplCd4Nm}" readOnly/>
		                                        <div class="input-group-btn">
		                                            <button type="button" id="cmplCdPop" class="btn btn-info btn-flat">
		                                            <!-- <button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#custInfoModal"> -->
		                                            <i class="fa fa-search"></i></button>
		                                        </div>
		                                    </div>
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="oneselfAppntKnd" class="col-sm-2 control-label">담당본인지정</label>
		                                <div class="col-sm-4">
			                                <input type="radio" name="oneselfAppntKnd" class="radio2" id="oneselfAppntKnd" value="Y"  <c:if test="${'Y' eq popUpMngVO.oneselfAppntKnd}">checked</c:if>  alt="담당본인지정"/>본인
			                                <input type="radio" name="oneselfAppntKnd" class="radio2" id="oneselfAppntKnd" value="N"  <c:if test="${'N' eq popUpMngVO.oneselfAppntKnd}">checked</c:if>  alt="담당본인지정"/>미지정
		                                </div>
		                                
		                                <label for="cmplSittnCd" class="col-sm-2 control-label">불만상황</label>
		                                <div class="col-sm-4">
	                                        <form:select path="cmplSittnCd" cssClass="form-control input-sm selectCmpl" alt="불만상황">
		                                        <c:if test="${popUpMngVO.cmplSittnCdNm != '' and popUpMngVO.cmplSittnCdNm != null}">
		                                        	<option value="${popUpMngVO.cmplSittnCd}">${popUpMngVO.cmplSittnCdNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.cmplSittnCdNm == '' or popUpMngVO.cmplSittnCdNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="cmplSittnCd" />
		                                </div>
								  	</div>
		                            <div class="form-group">
		                                <label for="accidentYnCd" class="col-sm-2 control-label">상해여부코드</label>
		                                <div class="col-sm-4">
	                                        <form:select path="accidentYnCd" cssClass="form-control input-sm selectAccu">
		                                        <c:if test="${popUpMngVO.accidentYnCdNm != '' and popUpMngVO.accidentYnCdNm != null}">
		                                        	<option value="${popUpMngVO.accidentYnCd}">${popUpMngVO.accidentYnCdNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.accidentYnCdNm == '' or popUpMngVO.accidentYnCdNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="accidentYnCd" />
		                                </div>
		                                
		                                <label for="processSttus" class="col-sm-2 control-label">처리상태</label>
		                                <div class="col-sm-4">
	                                        <form:select path="processSttus" cssClass="form-control input-sm selectProcess" disabled="true">
		                                        <c:if test="${popUpMngVO.processSttusNm != '' and popUpMngVO.processSttusNm != null}">
		                                        	<option value="${popUpMngVO.processSttus}">${popUpMngVO.processSttusNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.processSttusNm == '' or popUpMngVO.processSttusNm == null}">
	                                            	<form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </c:if>
	                                        </form:select>
	                                        <form:errors cssClass="help-block" path="processSttus" />
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="cnsltTitle" class="col-sm-2 control-label">접수제목</label>
		                                <div class="col-sm-10">
			                                <input type="text" name="cnsltTitle" class="form-control" id="cnsltTitle" value="${popUpMngVO.cnsltTitle}" readonly/>
		                                </div>
								  	</div>
		                            <div class="form-group has-warning">
		                                <label for="recptDscr" class="col-sm-2 control-label">접수내용</label>
		                                <div class="col-sm-10">
			                                <textarea name="recptDscr" class="form-control" rows="3" id="recptDscr" placeholder="Enter ..." readonly>${popUpMngVO.recptDscr}</textarea>
		                                </div>
								  	</div>
		                            <div class="form-group">
		                                <label for="recpterOpinion" class="col-sm-2 control-label">접수자의견</label>
		                                <div class="col-sm-10">
			                                <textarea name="recpterOpinion" class="form-control" rows="3" id="recpterOpinion" placeholder="Enter ..." readonly>${popUpMngVO.recpterOpinion}</textarea>
		                                </div>
								  	</div>
						  	</div>
                        
				  		  <div align='right' class="form-group">
				  		  <button type="button" class="btn btn-default">마케팅활용동의거절</button>
				  		  <!-- <button type="button" class="btn btn-default">취소</button> -->
				  		  <!-- <button type="button" class="btn btn-default" id="">상담저장</button> -->
				  		  <button type="button" class="btn btn-sm btn-primary" id="btnMgrProcInsert">매니저확인처리</button>
				  		  <button type="button" class="btn btn-default">상담완료</button>
				  		  <button type="button" class="btn btn-default">긴급출동접수</button>
				  		  <button type="button" class="btn btn-default">정비예약</button>
				  		  <button type="button" class="btn btn-default">DB변경</button>
				  		  <button type="button" class="btn btn-sm btn-primary" id="btnMgrCmsReq">의뢰요청<BR>(파일전송)</button> <!-- FTP파일전송용 파일로 다빈치 판매에서 제공되었던 샘플에 맞춰서 파일생성한다.  -->
				  		  <button type="button" class="btn btn-default">KMS연결</button>
				  		  <button type="button" class="btn btn-default">SMS발송</button>
				  		  <button type="button" class="btn btn-default">이메일발송</button>
				  		  </div>

                    </form>
                    </div>
                    <!-- /.box-body THE END -->
					</form:form>
                    
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
	        <input type="hidden" name="searchCnsltSeCode" id="searchCnsltSeCode" value="CNSE020"/>
	        <input type="hidden" name="searchCnsltTyCn" id="searchCnsltTyCn" value=""/>
	        <input type="hidden" name="searchCnsltTyCnCode" id="searchCnsltTyCnCode" value=""/>
	    </form>

</body>
</html>
