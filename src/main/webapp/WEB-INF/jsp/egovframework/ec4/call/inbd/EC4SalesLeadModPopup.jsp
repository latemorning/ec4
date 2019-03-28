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


            $("#btnSalesLeadUpdateAction").click(function(){

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

                    	alert('<spring:message code="errors.size.compare" arguments="${salesLeadDateText}"/>');
                    	return;
                    }
                } */
                // -- 기타 처리사항
                

                // 수정
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/call/inbd/updateSalesLead.do'/>",
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
                                <h3 class="box-title"><i class="fa fa-fw fa-save"></i>SALES리드 판매정보 수정</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form commandName="popUpMngVO" name="popUpMngVO" method="post">
                            <form:hidden path="leadDt"/>
                            <form:hidden path="leadSeq"/>
                            <form:hidden path="cstmrCd"/>
                                <div class="box-body">
                                    <div class="form-group has-warning">
		                                <label for="cstmrNm" class="control-label">고객명</label>
		                                <form:input path="cstmrNm" cssClass="form-control input-sm" readonly="true"/>
                                    </div>
                                    <div class="form-group has-warning">
		                                <label for="leadType" class="control-label">통화유형</label>
		                                <div class="control-label">
		                                    <form:select path="leadType" class="form-control input-sm">
		                                        <form:option value="">-- 선택 --</form:option>
		                                        <form:options items="${callTypeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>	
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="hpno" class="control-label">핸드폰</label>
		                                <div class="control-label">
		                                        <form:input path="hpno" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="telno" class="control-label">일반전화</label>
		                                <div class="control-label">
		                                        <form:input path="telno" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="shopNm" class="control-label">전시장</label>
		                                <div class="control-label">
		                                        <form:input path="shopNm" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="vhcle" class="control-label">관심차종</label>
		                                <div class="control-label">
		                                    <form:select path="modelCd" class="form-control input-sm selectVhclMdl">
		                                        <c:if test="${popUpMngVO.modelNm != '' and popUpMngVO.modelNm != null}">
		                                        	<option value="${popUpMngVO.modelCd}">${popUpMngVO.modelNm}</option>
		                                        </c:if>
		                                        <c:if test="${popUpMngVO.modelNm == '' or popUpMngVO.modelNm == null}">
			                                        <form:option value="">-- 모델 --</form:option>
			                                        <form:options items="${modelList}" itemValue="id" itemLabel="text"/> <!-- itemValud 갑을 id로 설정해야하는 이유는 select2 콤보로써 return 컬럼은 id, text로 받아오기때문이다 -->
		                                        </c:if>

		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="modelCd" />
		                                </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="delvDt" class="control-label">희망출고일</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="delvDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="adres" class="control-label">고객주소</label>
		                                <div class="control-label">
		                                		<form:input path="adres" cssClass="form-control input-sm"/>
		                                		<form:input path="adresDetail" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="cstmrMemo" class="control-label">고객메모</label>
		                                <div class="control-label">
		                                        <form:input path="cstmrMemo" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-right">
                                    <button type="button" id="btnSalesLeadUpdateAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                        <!-- /.box -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            
	    <form name="salesLeadPopupForm" method="post" id="salesLeadPopupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cstmrCd" id="cstmrCd" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cstmrNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	        <input type="hidden" name="popupNm" value=""/>
	    </form>
            