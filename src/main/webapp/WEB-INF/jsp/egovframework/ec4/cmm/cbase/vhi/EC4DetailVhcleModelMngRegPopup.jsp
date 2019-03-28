<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>

    <script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
    <validator:javascript formName="popUpMngVO" staticJavascript="false" xhtml="true" cdata="false"/>

    <script type="text/javascript">

        $(document).ready(function () {



            $("#btnVhcleDetailModelInsertAction").click(function(){

            	frm = document.popUpMngVO;

            	//validate를 사용하기위해서는 validate폴더 내에 체크항목을 기재해놓는 .xml파일을 생성해야한다.
            	/* if(!validatePopUpMngVO(frm)){
                    return;
                } */

                

                // 등록
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/cmm/cbase/vhi/insertVhcleDetailModel.do'/>",
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
           		            "codeId": $("select[name=vhcleModelId] option:selected").val()
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
                                <h3 class="box-title"><i class="fa fa-fw fa-save"></i>상세모델 등록</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form commandName="popUpMngVO" name="popUpMngVO" method="post">
                            
                                <div class="box-body">
                                    <div class="form-group has-warning">
		                                <label for="vhcleModelId" class="control-label">차량모델</label>
		                                <div class="control-label">
		                                    <form:select path="vhcleModelId" class="form-control input-sm selectVhclMdl">
		                                        <form:option value="">-- 모델 --</form:option>
		                                        <form:options items="${codeList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                    <form:errors cssClass="help-block" path="vhcleModelId" />
		                                </div>
                                    </div>
                                    <div class="form-group has-warning">
		                                <label for="detailModelNm" class="control-label">상세모델명</label>
		                                <div class="control-label">
		                                        <form:input path="detailModelNm" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="mdyrBegin" class="control-label">연식시작</label>
		                                <div class="control-label">
		                                        <form:input path="mdyrBegin" cssClass="form-control input-sm" maxlength="4"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="mdyrEnd" class="control-label">연식종료</label>
		                                <div class="control-label">
		                                        <form:input path="mdyrEnd" cssClass="form-control input-sm" maxlength="4"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="useAt" class="control-label">사용여부</label>
		                                <div class="control-label">
			                                    <!-- <select name="useAt" class="form-control input-sm">
			                                        <option value="">-- 사용여부선택 --</option>
			                                        <option value="Y">사용</option>
			                                        <option value="N">미사용</option>
			                                    </select> -->
			                                    <form:select path="useAt" class="form-control input-sm">
				                                        <form:option value="Y" itemLabel="사용"/>
				                                        <form:option value="N" itemLabel="미사용"/>
			                                    </form:select>
			                                    <form:errors cssClass="help-block" path="useAt" />
		                                </div>
	                                </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-right">
                                    <button type="button" id="btnVhcleDetailModelInsertAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                        <!-- /.box -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            
	    <form name="vhcleDetailModelPopupForm" method="post" id="vhcleDetailModelPopupForm">
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
            