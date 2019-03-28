<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>

    <script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
    <validator:javascript formName="popUpMngVO" staticJavascript="false" xhtml="true" cdata="false"/>

    <script type="text/javascript">

        $(document).ready(function () {

        	//Date picker
            $(".datepicker").datepicker({
              autoclose: true,
              format: "yyyy-mm-dd"
            })

            
			//숫자만입력
		    $("#popUpMngVO input[name=hpno]").keyup(function(){
				chkStr(this,"no");
			});

            
			//숫자만입력
		    $("#popUpMngVO input[name=telno]").keyup(function(){
				chkStr(this,"no");
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
            

            $("#btnCstmrIntgrUpdateAction").click(function(){

            	frm = document.popUpMngVO;

            	//validate를 사용하기위해서는 validate폴더 내에 체크항목을 기재해놓는 .xml파일을 생성해야한다.
            	/* if(!validatePopUpMngVO(frm)){
                    return;
                } */

            	// 기타 처리사항 --
            	/* var beginDe = frm.beginDe.value;
                var endDe = frm.endDe.value;

                if(beginDe && endDe){
                    if(endDe < beginDe){

                    	alert('<spring:message code="errors.size.compare" arguments="${cstmrIntgrDateText}"/>');
                    	return;
                    }
                } */
                if(nvl($("#cstmrNm").val(),"") == ""){
                	alert("고객명을 입력하세요.");
                	return;
                }
                if(nvl($("#hpno").val(),"") == ""){
                	alert("고객 핸드폰번호를 입력하세요.");
                	return;
                }
                if(nvl($("#emailAdres").val(),"") != "" && nvl($("#emailDomain").val(),"") == ""){
                	alert("이메일 도메인을 입력하세요.");
                	return;
                }
                
                
                

                // 수정
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/cmm/cinfo/updateCstmrIntgrMng.do'/>",
                    "data": $("#popUpMngVO").serialize(),
                    "success": function(result) {

                        if(result.isSuccess){

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


        	

        	//브랜드
            $("select[name=brandCd]").change(function(){
            	$("select[name=vhcty]").val(null).trigger('change');
            	$("select[name=modelCd]").val(null).trigger('change');
            });
        	//차종
            $("select[name=vhctCd]").change(function(){
            	$("select[name=modelCd]").val(null).trigger('change');
            });
        	
        	//차량 모델
            $(".selectVhclMdl").select2({
            	"ajax": {
           		    "url": "<c:url value='/ec4/cmm/cbase/vhi/selectVhclMdlComboList.do'/>", 
           		    "dataType": 'json',
           		    "delay": 250,
           		    "data": function (params) {
           		        return {
           		            "upCodeId": $("select[name=vhcty] option:selected").val(),/* 차종 */
           		            "cnsltSeCode": $("select[name=brandCd] option:selected").val(),/* 제조사 */
           		            "codeId": $("select[name=modelCd] option:selected").val()
           		        };
           		    }
           		},
            	"placeholder": "-- 모델 --",
                "width": "100%",
                "tags": false,
                "minimumResultsForSearch": 100
            });	
            $(".selectVhclMdl").on("change", function (e) {
            	//$("select[name=vhclDetlMdl]").val(null).trigger('change');
            });


        });
        // end ready

	
	
	
	
	
	

	
    /**
     * 주소 검색 화면 호출(Basic)
     */
    var HomeJusoPop;
    function fn_openUrlHomeJusoSearchBasic() {
    	HomeJusoPop = window.open("/ec4/cmm/zip/rdnmadrSearchPopup.do", "pop_basic",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }

    var OfficeJusoPop;
    function fn_openUrlOfficeJusoSearchBasic() {
    	OfficeJusoPop = window.open("/ec4/cmm/zip/rdnmadrSearchPopup.do", "pop_basic",
                "width=450,height=550,scrollbars=yes,resizable=yes");
    }
    function fn_setJuso(rtnData){
    	if(HomeJusoPop){
        	$("#houseZip").val(rtnData.zipNo);
        	$("#houseAdres").val(rtnData.roadAddrPart1);
        	$("#houseAdresDetail").val(rtnData.roadAddrPart2);
        	HomeJusoPop.close();
        	HomeJusoPop=null;
    	}else if(OfficeJusoPop){
        	$("#officeZip").val(rtnData.zipNo);
        	$("#officeAdres").val(rtnData.roadAddrPart1);
        	$("#officeAdresDetail").val(rtnData.roadAddrPart2);
        	OfficeJusoPop.close();
        	OfficeJusoPop=null;
    	}
    }
    </script>

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">팝업</h4>
            </div>
            <div class="modal-body">
                        <!-- Horizontal Form -->
                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <h3 class="box-title"><i class="fa fa-fw fa-save"></i>고객통합정보 수정</h3>
                                <!-- 고객 마케팅활용동의를 팝업으로 보일지 본 화면에 표시할지 추후에 작업예정, 다빈치 인터페이스테이블에 동의 컬럼을 추가하여 받기로 하였다. 20190228 판매:DCM_OUT_BEF / 정비:TB_ASM413 --> 
                                <!-- 다빈치 판매/정비의 각 인터페이스 테이블에 동의컬럼이 추가되면 인터페이스받을때   CSTMR_INFO_LINK_MNG 테이블에  판매/정비 동의컬럼을 동일하게 추가하여 인터페이스 받도록 한다 -->
                                <button type="button" class="btn btn-sm btn-primary">고객동의정보</button>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form commandName="popUpMngVO" name="popUpMngVO" method="post" >
                            	<form:hidden path="relKnd"/>
                            	<form:hidden path="relSeq"/>
								<form:hidden path="dealerCd"/>
                            	
                                <div class="box-body">
	                                    <div class="row">
	                                    	<div class="form-group has-warning col-sm-3">
				                                <label for="cstmrNm" class="control-label">고객명</label>
			                                	<form:hidden path="cstmrCd" cssClass="form-control input-sm"/>
			                                	<form:input path="cstmrNm" cssClass="form-control input-sm"/>
			                                </div>
			                                <div class="form-group has-warning col-sm-3">
				                                <label for="hpno" class="control-label">핸드폰</label>
			                                	<form:input path="hpno" cssClass="form-control input-sm"/>
			                                </div>
			                                <div class="form-group col-sm-3">
			                                	<label for="telno" class="control-label">일반전화</label>
			                                	<form:input path="telno" cssClass="form-control input-sm"/>
			                                </div>
	                                    </div>
	                                    
	                                    <div class="row">
		                                    <div class="form-group col-sm-3">
				                                <label for=sexKnd class="control-label">성별</label>
			                                    <form:select path="sexKnd" class="form-control input-sm">
			                                        <form:option value="">선택</form:option>
			                                        <form:option value="1">남자</form:option>
			                                        <form:option value="2">여자</form:option>
			                                    </form:select>
				                            </div>
		                                    <div class="form-group col-sm-3">
				                                <label for="brthdy" class="control-label">생년월일</label>
		                                        <div class="input-group date">
		                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
		                                            <form:input path="brthdy" cssClass="form-control pull-right input-sm datepicker"/>
		                                        </div>
				                            </div>
		                                    <%-- <div class="form-group col-sm-3">
				                                <label for="vhcleNo" class="control-label">차량번호</label>
				                                <form:input path="vhcleNo" cssClass="form-control input-sm"/>
		                                    </div>
	                                    	<div class="form-group col-sm-3">
			                                	<label for="vin" class="control-label">차대번호</label>
			                                	<form:input path="vin" cssClass="form-control input-sm"/>
	                                    	</div> --%>
	                                    	<div class="form-group col-sm-3">
			                                	<label for="mberGrad" class="control-label">회원등급</label>
		                                		<form:input path="mberGrad" cssClass="form-control input-sm" readonly="true"/>
	                                    	</div>
	                                    </div>
	                                    
	                                    <div class="row">
	                                    	<div class="form-group col-sm-8">
			                                	<label for="email" class="control-label">이메일</label>
			                                	<div class="form-group">
				                                	<form:input path="emailAdres" cssClass="form-control-nowd w200 input-sm"/>
				                                	<form:input path="emailDomain" cssClass="form-control-nowd w150 input-sm"/>
				                                    <form:select path="selectEmailDomain" class="form-control-nowd w150 input-sm">
				                                        <form:option value="">-- 직접입력 --</form:option>
				                                        <form:options items="${selectEmailDomainList}" itemValue="code" itemLabel="codeNm"/>
				                                    </form:select>	
			                                	</div>
			                                </div>
	                                    </div>
	                                    
	                                    <div class="row">
	                                    	<div class="form-group col-sm-6">
			                                	<label for="vin" class="control-label">수신동의</label>
			                                	<div class="form-group">
				                                	<label for="telRecvYn" class="">전화</label>
			                                		<form:checkbox path="telRecvYn" cssClass="" value="Y"/>
			                                		&nbsp;
				                                	<label for="smsRecvYn" class="">SMS</label>
			                                		<form:checkbox path="smsRecvYn" cssClass="" value="Y"/>
			                                		&nbsp;
				                                	<label for="emailRecvYn" class="">이메일</label>
			                                		<form:checkbox path="emailRecvYn" cssClass="" value="Y"/>
			                                		&nbsp;
				                                	<label for="faxRecvYn" class="">팩스수신동의</label>
			                                		<form:checkbox path="faxRecvYn" cssClass="" value="Y"/>
			                                		&nbsp;
				                                	<label for="dmRecvYn" class="">우편수신동의</label>
			                                		<form:checkbox path="dmRecvYn" cssClass="" value="Y"/>
			                                	</div>
	                                    	</div>
	                                    	<div class="form-group col-sm-6">
			                                	<label for="vin" class="control-label">멤버여부</label>
			                                	<div class="form-group">
				                                	<label for="chevMembYn" class="">쉐보레멤버</label>
			                                		<form:checkbox path="chevMembYn" cssClass="" value="Y"/>
			                                		&nbsp;
				                                	<label for="webMembYn" class="">웹멤버여부</label>
			                                		<form:checkbox path="webMembYn" cssClass="" value="Y"/>
			                                		&nbsp;
				                                	<label for="wutoMembYn" class="">오토멤버여부</label>
			                                		<form:checkbox path="wutoMembYn" cssClass="" value="Y"/>
			                                	</div>
	                                    	</div>
	                                    </div>
	                                    
	                                    <div class="row">
	                                    	<div class="form-group col-sm-2">
			                                	<label for="houseZip" class="control-label">우편번호</label>
			                                	<div class="input-group">
					                                <form:input path="houseZip" cssClass="form-control input-sm" readonly="true"/>
				                                    <div class="input-group-btn">
				                                        <button type="button" id="btnHomeAdres" class="btn btn-info btn-flat" onClick="javascript:fn_openUrlHomeJusoSearchBasic()">
				                                        <i class="fa fa-search"></i></button>
				                                    </div>
			                                	</div>
	                                    	</div>
	                                    	<div class="form-group col-sm-5">
			                                	<label for="houseAdres" class="control-label">집주소</label>
			                                	<form:input path="houseAdres" cssClass="form-control input-sm"/>
	                                    	</div>
	                                    	<div class="form-group col-sm-5">
			                                	<label for="houseAdresDetail" class="control-label">상세집주조</label>
			                                	<form:input path="houseAdresDetail" cssClass="form-control input-sm"/>
	                                    	</div>
	                                    </div>
	                                    
	                                    <div class="row">
	                                    	<div class="form-group col-sm-2">
			                                	<label for="officeZip" class="control-label">우편번호</label>
			                                	<div class="input-group">
					                                <form:input path="officeZip" cssClass="form-control input-sm" readonly="true"/>
				                                    <div class="input-group-btn">
				                                        <button type="button" id="btnOfficeAdres" class="btn btn-info btn-flat" onClick="javascript:fn_openUrlOfficeJusoSearchBasic()">
				                                        <i class="fa fa-search"></i></button>
				                                    </div>
			                                	</div>
	                                    	</div>
	                                    	<div class="form-group col-sm-5">
			                                	<label for="officeAdres" class="control-label">직장주소</label>
			                                	<form:input path="officeAdres" cssClass="form-control input-sm"/>
	                                    	</div>
	                                    	<div class="form-group col-sm-5">
			                                	<label for="officeAdresDetail" class="control-label">상세직장주조</label>
			                                	<form:input path="officeAdresDetail" cssClass="form-control input-sm"/>
	                                    	</div>
	                                    </div>
	                                    
	                                    <div class="row">
	                                    	<div class="form-group col-sm-12">
			                                	<label for="cstmrMemo" class="control-label">고객메모</label>
			                                	<form:input path="cstmrMemo" cssClass="form-control input-sm"/>
	                                    	</div>
	                                    </div>
                                    
                                    
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-right">
                                    <button type="button" id="btnCstmrIntgrUpdateAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                        <!-- /.box -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            
	    <form name="cstmrIntgrPopupForm" method="post" id="cstmrIntgrPopupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	        <input type="hidden" name="popupNm" value=""/>
	    </form>
            