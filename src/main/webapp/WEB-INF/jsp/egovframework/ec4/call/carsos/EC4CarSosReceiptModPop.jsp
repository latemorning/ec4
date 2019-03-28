<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="ajax" uri="http://ajaxtags.sourceforge.net/tags/ajaxtags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>
<%@ taglib prefix="double-submit" uri="http://www.egovframe.go.kr/tags/double-submit/jsp" %>
<%
 /**
  * @Class Name : EC4CarSosReceiptMng.java
  * @Description : EC4CarSosReceiptMng List 화면
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
    <title>긴급출동 접수</title>
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


<script type="text/javaScript" language="javascript" defer="defer">

$(document).ready(function(){
	$(document).on("click","#custPop",function() {
		fn_custPop();
    });
	$(document).on("click","#custCarPop",function() {
		fn_custCarPop();
    });
	
	
	
    $("#hpno").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custPop();
    	}
	});
    $("#vin").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custCarPop();
    	}
	});
    $("#vhcleNo").keyup(function(key){
        if(key.keyCode == 13){
    		fn_custCarPop();
    	}
	});
    
    
    
    

    
    
    
    
	// 긴급출동접수처리 등록
	$("#btnCarEmergencyInsUp").click(function(){

        frm = document.popUpCarSosMngVO;

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
        
    	
    	
   		
   	
        var chkCnt = 0;
        var altTxt = "";
   		chkCnt = 0;
   		$('#popUpCarSosMngVO .has-warning :text').each(function(idx){
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
   		$('#popUpCarSosMngVO .has-warning :radio').each(function(idx){
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
   		$('#popUpCarSosMngVO .has-warning :checkbox').each(function(idx){
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
   		$('#popUpCarSosMngVO .has-warning select').each(function(idx){
   			//if (!$(this).is('option:selected')) {
   			if ("" == nvl($(this).val(),"")) {
   				alert('"'+$(this).attr("alt")+'"'+" 선택은 필수입니다."); 
   				chkCnt++;
   				return false;
   			}; 
   		});
   		if(chkCnt > 0){
   			//alert("select박스 리턴");
   			return false;
   		}


        
        
        
        
		
		
        
		//console.log(formData);
		//console.log(params);


        // 저장
        $.ajax({
            "type": "POST",
            "dataType": "json",
            "async": false,
            "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
            "url": "<c:url value='/ec4/call/carsos/updateCarSosReceiptReg.do'/>",
            //"data": formData, //form + param 함께 넘길경우
            //"data": params,  //param 만 넘길경우
            "data": $("#popUpCarSosMngVO").serialize(),  //form 만 넘길경우
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

});


function fn_custPop(){

    var popupParams = {};
    
    $("#sosPopupForm input[name=popupNm]").val("popUpCarSosMngVO");
    $("#sosPopupForm input[name=cstmrNm]").val($("#cstmrNm").val());
    $("#sosPopupForm input[name=hpno]").val($("#hpno").val());
    $("#sosPopupForm input[name=emailAdres]").val($("#emailAdres").val());
    
    

    var callbackClass = "callback";
    var selectStyle = "single";
    var url = "<c:url value='/ec4/cmm/cinfo/cstmrIntgrCarSosPop.do'/>";

    popupParams.width = "800";
    popupParams.height = "700";
    popupParams.title = "popupSelectSingle";
    popupParams.form = document.sosPopupForm;


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

    $("#sosPopupForm input[name=popupNm]").val("popUpCarSosMngVO");
    $("#sosPopupForm input[name=cstmrNm]").val($("#cstmrNm").val());
    $("#sosPopupForm input[name=hpno]").val($("#hpno").val());
    $("#sosPopupForm input[name=emailAdres]").val($("#emailAdres").val());
    $("#sosPopupForm input[name=vin]").val($("#vin").val());
    $("#sosPopupForm input[name=vhcleNo]").val($("#vhcleNo").val());
    
    

    var callbackClass = "callback";
    var selectStyle = "single";
    var url = "<c:url value='/ec4/cmm/cinfo/cstmrCarPop.do'/>";

    popupParams.width = "800";
    popupParams.height = "700";
    popupParams.title = "popupSelectSingle";
    popupParams.form = document.sosPopupForm;


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


    var sCstmrCd = rCstmrCd;
    if( "" == nvl(sCstmrCd,"") )sCstmrCd = $("#cstmrCd").val();
    

    
    
    //고객정보 load
    var formData = $("#popUpCarSosMngVO").serializeArray();
    //form 과 param을 함께 넘길경우
    formData.push({name:"cstmrCd", value:$("input[name=cstmrCd]").val()});
    //formData.push({name:"cnsltIncallNo", value:$("input[name=cnsltIncallNo]").val()});
    formData.push({name:"cstmrNm", value:$("input[name=cstmrNm]").val()});
    formData.push({name:"brthdy", value:$("input[name=brthdy]").val()});
    formData.push({name:"hpno", value:$("input[name=hpno]").val()});
    formData.push({name:"emailAdres", value:$("input[name=emailAdres]").val()});
    
	$.ajax({
		type: "POST",
		dataType:"json",
		async: false,
		url: "<c:url value='/ec4/call/inbd/loadCstmrLastInfo.do'/>",
		data:formData,
		success:function(data) {
			if (data.ok) {

				$("input[name=vin]").val(nvl(data.result.vin,"")); //차대번호
				$("input[name=vhcleNo]").val(nvl(data.result.vehiNo01,"")+""+nvl(data.result.vehiNo02,"")); //차량번호
				
				if("" != nvl(data.result.lastVhclMdl,"")){
					$("select[name=vhclMdl]").val(null).trigger('change'); //최근차량정보 콤보
					$("select[name=vhclMdl]").prepend("<option value='"+data.result.lastVhclMdl+"' selected>"+data.result.lastVhclMdlNm+"</option>");
				}
				
				$("input[name=lastReadKm]").val(nvl(data.result.lastReadKm,"")); //주행거리
				$("input[name=typeYear]").val(nvl(data.result.typeYear,"")); //차량연식
				$("input[name=lastInShop]").val(nvl(data.result.lastCustNm,"")); //최근입고정비소
				$("input[name=lastInDate]").val(nvl(data.result.lastRcptDate,"")); //최근입고일자
				$("input[name=homeZip]").val(nvl(data.result.houseZip,"")); //주소
				$("input[name=homeAdres]").val(nvl(data.result.houseAdres,"")); //주소
				$("input[name=homeAdresDetl]").val(nvl(data.result.houseAdresDetail,"")); //주소
				$("input[name=lastCustMemo]").val(nvl(data.result.cnsltMemo,"")); //최근고객메모
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




/**
 * 주소 검색 화면 호출(Basic)
 */
var JusoPop; 
function fn_openUrlJusoSearchBasic() {
    JusoPop = window.open("/ec4/cmm/zip/rdnmadrSearchPopup.do", "pop_basic",
            "width=450,height=550,scrollbars=yes,resizable=yes");
}
function fn_setJuso(rtnData){
	$("#homeZip").val(rtnData.zipNo);
	$("#homeAdres").val(rtnData.roadAddrPart1);
	$("#homeAdresDetl").val(rtnData.roadAddrPart2);
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
                    	<h3 class="box-title">긴급출동접수처리</h3>
                    </div>
                    <!-- /.box-header -->
            
        		  	<form:form commandName="popUpCarSosMngVO" name="popUpCarSosMngVO" method="post" cssClass="form-horizontal">
        		  	<double-submit:preventer/>
        		  	<div class="box-body">
	        		<p class="bg-info toggle-list">○ 고객정보</p>
                    <!-- /.box-header -->
				                    	<div class="form-group">
			                                <label for="custNm" class="col-sm-2 control-label">고객명</label>
			                                <div class="col-sm-2">
		                                        <div class="input-group">
			                                        <input type="hidden" name="cstmrCd" class="form-control" id="cstmrCd" value="${popUpCarSosMngVO.cstmrCd}"/>
			                                        <input type="text" name="cstmrNm" class="form-control" id="cstmrNm" readOnly value="${popUpCarSosMngVO.cstmrNm}"/>
			                                        <!-- <div class="input-group-btn">
			                                            <button type="button" id="custPop" class="btn btn-info btn-flat">
			                                            <i class="fa fa-search"></i></button>
			                                        </div> -->
			                                    </div>
			                                </div>
			                                <label for="hpno" class="col-sm-2 control-label">핸드폰</label>
			                                <div class="col-sm-2">
			                                	<input type="text" name="hpno" class="form-control" id="hpno" readOnly value="${popUpCarSosMngVO.hpno}"/>
			                                </div>
			                                <label for="emailAdres" class="col-sm-2 control-label">이메일</label>
			                                <div class="col-sm-2">
			                                	<input type="text" name="emailAdres" class="form-control" id="emailAdres" readOnly value="${popUpCarSosMngVO.emailAddress}"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="vin" class="col-sm-2 control-label">차대번호</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="vin" name="vin" readOnly value="${popUpCarSosMngVO.vin}"/>
			                                </div>
			                                <label for="vhcleNo" class="col-sm-2 control-label">차량번호</label>
			                                <div class="col-sm-2">
				                                <div class="input-group">
				                                	<input type="text" class="form-control" id="vhcleNo" name="vhcleNo" readOnly value="${popUpCarSosMngVO.vhcleNo}"/>
			                                		<!-- <div class="input-group-btn">
				                                		<button type="button" id="custCarPop" class="btn btn-info btn-flat">
				                                			<i class="fa fa-search"></i>
				                                		</button>
			                                		</div> -->
			                                	</div>
			                                </div>
			                                <label for="lastReadKm" class="col-sm-2 control-label">주행거리</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="lastReadKm" name="lastReadKm" readOnly value="${popUpCarSosMngVO.lastReadKm}"/>
			                                </div>
				                    	</div>
		                                <div class="form-group">
		                                    <label for="agreeLbl" class="col-sm-2 control-label">동의여부</label>
		                                    <div class="col-sm-10 checkbox">
									  			<label><input type="checkbox">마케팅활용동의</label>
		                                    </div>
										</div>
		                                <div class="form-group">
		                                    <label for="lastVhcleInfo" class="col-sm-2 control-label">차량정보</label>
		                                    <div class="col-sm-2" style="padding-bottom:0px">
				                                    <%-- <div class="col-sm-2">
					                                    <form:select path="vmcd" class="form-control input-sm">
					                                        <form:option value="">-- 브랜드 --</form:option>
					                                        <form:options items="${vmcdList}" itemValue="code" itemLabel="codeNm"/>
					                                    </form:select>
					                                    <form:errors cssClass="help-block" path="vmcd" />
				                                    </div>
				                                    <div class="col-sm-2">
				                                        <form:select path="vhctCd" cssClass="form-control input-sm">
				                                        	<form:option value="">-- 차종 --</form:option>
				                                            <form:options items="${vhctList}" itemValue="code" itemLabel="codeNm"/>
				                                        </form:select>
				                                        <form:errors cssClass="help-block" path="vhctCd" />
				                                    </div> --%>
				                                    <!-- <div class="col-sm-12"> -->
					                                    <form:select path="vhclMdl" class="form-control input-sm selectVhclMdl">
					                                        <form:option value="">-- 모델 --</form:option>
					                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
					                                    </form:select>
					                                    <form:errors cssClass="help-block" path="vhclMdl" />
				                                    <!-- </div> -->
				                                    <%-- <div class="col-sm-4">
					                                    <form:select path="vhclDetlMdl" class="form-control input-sm selectDetlMdl">
					                                        <form:option value="">-- 세부모델 --</form:option>
					                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
					                                    </form:select>
					                                    <form:errors cssClass="help-block" path="vhclDetlMdl" />
				                                    </div> --%>
			                                </div>
		                                </div>
				                    	<div class="form-group">
			                                <label for="lastInShop" class="col-sm-2 control-label">최근입고정비소</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" readOnly id="lastInShop" name="lastInShop" value="${popUpCarSosMngVO.lastInShop}"/>
			                                </div>
			                                <label for="lastInDate" class="col-sm-2 control-label">최근입고일자</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" readOnly id="lastInDate" name="lastInDate" value="${popUpCarSosMngVO.lastInDate}"/>
			                                </div>
				                    	</div>
			                            <div class="form-group">
			                                <label for="homeAdres" class="col-sm-2 control-label">주소</label>
			                                <div class="col-sm-2">
			                                	<div class="input-group">
					                                <input type="text" name="zip" class="form-control" id="zip" readOnly value="${popUpCarSosMngVO.zip}"/>
				                                    <!-- <div class="input-group-btn">
				                                        <button type="button" class="btn btn-info btn-flat" onClick="javascript:fn_openUrlJusoSearchBasic()">
				                                        <i class="fa fa-search"></i></button>
				                                    </div> -->
			                                	</div>
			                                </div>
									  	</div>
			                    
			                            <div class="form-group">
			                                <label for="searchBlank" class="col-sm-2 control-label"></label>
			                                <div class="col-sm-10">
				                                <input type="text" name="adres" class="form-control" id="adres" readOnly value="${popUpCarSosMngVO.adres}"/>
				                                <input type="text" name="adresDetail" class="form-control" id="adresDetail" readOnly value="${popUpCarSosMngVO.adresDetail}"/>
			                                </div>
									  	</div>
		                                <div class="form-group">
		                                    <label for="membInfo" class="col-sm-2 control-label">웹회원정보</label>
		                                    <div class="col-sm-10 checkbox">
			                                	<label>등급<input type="text" class="form-control-nowd w40" readOnly id="webClass"/></label>
			                                	<label>&nbsp;</label>
									  			<label><input type="checkbox" disabled>쉐보레멤버</label>
									  			<label><input type="checkbox" disabled>웹멤버</label>
									  			<label><input type="checkbox" disabled>오토멤버</label>
		                                    </div>
										</div>
				                    	<div class="form-group">
			                                <label for="reqCstmrNm" class="col-sm-2 control-label">의뢰인</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="reqCstmrNm" name="reqCstmrNm" value="${popUpCarSosMngVO.reqCstmrNm}"/>
			                                </div>
			                                <label for="reqCstmrHpno" class="col-sm-2 control-label">연락처</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="reqCstmrHpno" name="reqCstmrHpno" value="${popUpCarSosMngVO.reqCstmrHpno}"/>
			                                </div>
				                    	</div>
							<!-- 고객정보항목 THE END <<<<<<<<<<<  -->
							<!-- 조회, 등록, 삭제 버튼 -->
		                    <!-- <div class="box-footer text-right">
		                        <button type="button" class="btn btn-info" id="btnCustInsUp"> 고객정보등록/수정</button>
		                    </div> -->
                    	<!-- /.box-body THE END -->
			        
			        
			        
			        
			        
	        		<p class="bg-info toggle-list">○ 긴출정보</p>
                    <!-- /.box-header -->
			            	<!-- 검색항목 -->
				                    	<div class="form-group">
			                                <label for="vocKnd" class="col-sm-2 control-label">VOC구분</label>
			                                <div class="col-sm-4">
		                                        <form:select path="vocKnd" class="form-control input-sm">
		                                            <form:option value="">-- 선택 --</form:option>
		                                            <form:options items="${vocKndList}" itemValue="code" itemLabel="codeNm"/>
		                                        </form:select>		                                
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="cmplSittnCd" class="col-sm-2 control-label">상황분류</label>
			                                <div class="col-sm-4">
		                                        <form:select path="cmplSittnCd" cssClass="form-control input-sm selectCmpl">
		                                            <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                        </form:select>
		                                        <form:errors cssClass="help-block" path="cmplSittnCd" />
			                                </div>
			                                <div class="col-sm-2">
			                                	<select class="form-control" id="vocKnd" name="vocKnd">
			                                		<option value="일반">일반</option>
			                                	</select>
			                                </div>
			                                <div class="col-sm-2">
			                                	<select class="form-control" id="vocKnd" name="vocKnd">
			                                		<option value="유상">유상</option>
			                                	</select>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="cstmrCarSttusNm" class="col-sm-2 control-label">차량상태</label>
			                                <div class="col-sm-10">
												<input type="text" class="form-control" id="cstmrCarSttusNm" name="cstmrCarSttusNm" value="${popUpCarSosMngVO.cstmrCarSttusNm}"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="cstmrPlc" class="col-sm-2 control-label">위치</label>
			                                <div class="col-sm-10">
			                                	<input type="text" class="form-control" id="cstmrPlc" name="cstmrPlc" value="${popUpCarSosMngVO.cstmrPlc}"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="postInfo" class="col-sm-2 control-label">POST배정</label>
			                                <div class="col-sm-2">
			                                	<select class="form-control" id="postId" name="postId">
			                                		<option value="긴급출동 호출">긴급출동 호출</option>
			                                	</select>
			                                </div>
			                                <div class="col-sm-2">
		                                        <div class="input-group">
			                                        <input type="hidden" name="searchPostCd" class="form-control" id="searchPostCd"/>
			                                        <input type="text" name="searchPostNm" class="form-control" id="searchPostNm"/>
			                                        <div class="input-group-btn">
			                                            <button type="button" id="postPop" class="btn btn-info btn-flat">
			                                            <i class="fa fa-search"></i></button>
			                                        </div>
			                                    </div>
			                                </div>
				                    	</div>
							<!-- 고객정보항목 THE END <<<<<<<<<<<  -->
                    	<!-- /.box-body THE END -->
			        
			        
			        
	        		<p class="bg-info toggle-list">○ 조치결과</p>
                    <!-- /.box-header -->
				                    	<div class="form-group has-warning">
			                                <label for="emergencyRcptNo" class="col-sm-2 control-label">접수번호</label>
			                                <div class="col-sm-2">
			                                	<input type="text" name="emergencyRcptNo" class="form-control" readOnly id="emergencyRcptNo" value="${popUpCarSosMngVO.emergencyRcptNo}"/>
			                                </div>
			                                <label for="serviceId" class="col-sm-2 control-label">조치코드</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="serviceId" name="serviceId" value="${popUpCarSosMngVO.serviceId}" alt="조치코드"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="emergencyTime" class="col-sm-2 control-label">출동시간</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="emergencyTime" name="emergencyTime" value="${popUpCarSosMngVO.emergencyTime}" alt="출동시간"/>
			                                </div>
			                                <label for="arrivalTime" class="col-sm-2 control-label">도착시간</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="arrivalTime" name="arrivalTime" value="${popUpCarSosMngVO.arrivalTime}" alt="도착시간"/>
			                                </div>
			                                <label for="endTime" class="col-sm-2 control-label">완료시간</label>
			                                <div class="col-sm-2">
			                                	<input type="text" class="form-control" id="endTime" name="endTime" value="${popUpCarSosMngVO.endTime}" alt="완료시간"/>
			                                </div>
				                    	</div>
				                    	<div class="form-group">
			                                <label for="etcMemo" class="col-sm-2 control-label">기타정보</label>
			                                <div class="col-sm-10">
			                                	<input type="text" class="form-control" id="etcMemo" name="etcMemo" value="${popUpCarSosMngVO.etcMemo}"/>
			                                </div>
				                    	</div>
							<!-- 고객정보항목 THE END <<<<<<<<<<<  -->
							<!-- 조회, 등록, 삭제 버튼 -->
		                    <div class="box-footer text-right">
		                        <button type="button" class="btn btn-info" id="btnCarEmergencyInsUp"> 처리</button>
		                        <!-- <button type="button" class="btn btn-info" id="btnCustInsUp"> 취소</button> -->
		                        <!-- <button type="button" class="btn btn-info" id="btnCustInsUp"> 종결</button> -->
		                    </div>
                    	<!-- /.box-body THE END -->
                    </div>
			        </form:form>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
            </div>
        </div>










    </section>
    <!-- /.content -->



    <footer class="main-footer">
        <div class="pull-right hidden-xs">
        <b>Version</b> 2.4.0
        </div>
        <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
    </footer>

	    <form name="sosPopupForm" method="post" id="sosPopupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="popupNm"/>
	        <input type="hidden" name="cstmrCd"/>
	        <input type="hidden" name="cnsltIncallNo"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	        <input type="hidden" name="vin" value=""/>
	        <input type="hidden" name="vhcleNo" value=""/>
	        <!-- <input type="hidden" name="custVhclMdl" value=""/>
	        <input type="hidden" name="custVhclMdlNm" value=""/> -->
	    </form>
<!-- ./wrapper -->
</body>
</html>
