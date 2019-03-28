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
            $("#workInDt").val(moment().format('YYYY-MM-DD'));
            $("#workOutDt").val(moment().format('YYYY-MM-DD'));
            
            $("#workInTimeHour").val(moment().format('kk'));
            $("#workInTimeMinute").val(moment().format('mm'));
            
            $("#workOutTimeHour").val(moment().format('kk'));
            $("#workOutTimeMinute").val(moment().format('mm'));
            


            $("#btnCnsltDclzInsertAction").click(function(){

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

                    	alert('<spring:message code="errors.size.compare" arguments="${cnsltDclzDateText}"/>');
                    	return;
                    }
                } */
                
                
                $("#popUpMngVO input[name=attendDt]").val(moment().format('YYYY-MM-DD'))   //20180906 SQL에서 SYSDATE로 처리한다
                $("#popUpMngVO input[name=workInTime]").val($("select[name=workInTimeHour]").val()+":"+$("select[name=workInTimeMinute]").val());
                $("#popUpMngVO input[name=workOutTime]").val($("select[name=workOutTimeHour]").val()+":"+$("select[name=workOutTimeMinute]").val());
                // -- 기타 처리사항
                

                // 등록
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/call/cnslt/insertCnsltDclz.do'/>",
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


        	$(document).on("click","#regCnsltPop",function() {
                var popupParams = {};

                $("#cnsltDclzPopupForm input[name=cnsltUserNm]").val($("#popUpMngVO input[name=cnsltUserNm]").val());
                $("#cnsltDclzPopupForm input[name=popupNm]").val("popUpMngVO");
                

                var callbackClass = "callback";
                var selectStyle = "single";
                var url = "<c:url value='/ec4/call/cnslt/cnsltntPop.do'/>";

                popupParams.width = "1300";
                popupParams.height = "700";
                popupParams.title = "popupSelectSingle";
                popupParams.form = document.cnsltDclzPopupForm;


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
                                <h3 class="box-title"><i class="fa fa-fw fa-save"></i>상담원근태 등록</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form commandName="popUpMngVO" name="popUpMngVO" method="post">
                            <form:hidden path="makrCd"/>
                            <form:hidden path="attendDt"/>
                            <form:hidden path="workInTime"/>
                            <form:hidden path="workOutTime"/>
                                <div class="box-body">
                                    <div class="form-group has-warning">
		                                <label for="cnsltUserNm" class="control-label">상담원명</label>
		                                <div class="control-label">
		                                        <div class="input-group">
		                                        	<form:hidden path="cnsltUserId"/>
		                                        	<form:input path="cnsltUserNm" cssClass="form-control input-sm"/>
			                                        <div class="input-group-btn">
			                                            <button type="button" id="regCnsltPop" class="btn btn-info btn-flat"><i class="fa fa-search"></i></button>
			                                        </div>
			                                    </div>
		                                </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="workInDt" class="control-label">출근일자</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="workInDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="workInDt" class="control-label">출근시간</label>
                                        <div class="control-label">
		                                    <form:select path="workInTimeHour" class="form-control input-sm">
		                                        <form:option value="">-- 선택 --</form:option>
		                                        <form:options items="${hourList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>	
		                                    <form:select path="workInTimeMinute" class="form-control input-sm">
		                                        <form:option value="">-- 선택 --</form:option>
		                                        <form:options items="${minuteList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>	
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="workOutDt" class="control-label">퇴근일자</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="workOutDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="workOutDt" class="control-label">퇴근시간</label>
                                        <div class="control-label">
		                                    <form:select path="workOutTimeHour" class="form-control input-sm">
		                                        <form:option value="">-- 선택 --</form:option>
		                                        <form:options items="${hourList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>	
		                                    <form:select path="workOutTimeMinute" class="form-control input-sm">
		                                        <form:option value="">-- 선택 --</form:option>
		                                        <form:options items="${minuteList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>	
                                        </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="workGroup" class="control-label">업무그룹</label>
		                                <div class="control-label">
		                                        <form:input path="workGroup" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="eduTime" class="control-label">교육시간</label>
		                                <div class="control-label">
		                                        <form:input path="eduTime" cssClass="form-control input-sm" type="number"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="extndTime" class="control-label">연장근무시간</label>
		                                <div class="control-label">
		                                        <form:input path="extndTime" cssClass="form-control input-sm" type="number"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="holiWorkYn" class="control-label">휴일특근여부</label>
		                                <div class="control-label">
		                                    <form:select path="holiWorkYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="vacatnYn" class="control-label">휴가여부</label>
		                                <div class="control-label">
		                                    <form:select path="vacatnYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="alterVacatnYn" class="control-label">대체휴가여부</label>
		                                <div class="control-label">
		                                    <form:select path="alterVacatnYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="satOffYn" class="control-label">토요휴무여부</label>
		                                <div class="control-label">
		                                    <form:select path="satOffYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="realWorkTime" class="control-label">실근무시간</label>
		                                <div class="control-label">
		                                        <form:input path="realWorkTime" cssClass="form-control input-sm" type="number"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="lateYn" class="control-label">지각여부</label>
		                                <div class="control-label">
		                                    <form:select path="lateYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="earlyLeavYn" class="control-label">조퇴여부</label>
		                                <div class="control-label">
		                                    <form:select path="earlyLeavYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="outWorkTime" class="control-label">외근시간</label>
		                                <div class="control-label">
		                                        <form:input path="outWorkTime" cssClass="form-control input-sm" type="number"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="workBreakTime" class="control-label">근무이탈시간</label>
		                                <div class="control-label">
		                                        <form:input path="workBreakTime" cssClass="form-control input-sm" type="number"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="offWorkYn" class="control-label">결근여부</label>
		                                <div class="control-label">
		                                    <form:select path="offWorkYn" class="form-control input-sm">
		                                        <%-- <form:option value="">-- 선택 --</form:option> --%>
		                                        <form:options items="${ynList}" itemValue="code" itemLabel="codeNm"/>
		                                    </form:select>
		                                </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-right">
                                    <button type="button" id="btnCnsltDclzInsertAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                        <!-- /.box -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            
	    <form name="cnsltDclzPopupForm" method="post" id="cnsltDclzPopupForm">
	        <input type="hidden" name="callbackClass"/>
	        <input type="hidden" name="selectStyle" value="single"/>
	        <input type="hidden" name="cnsltUserId" id="cnsltUserId" value="single"/>
	        <input type="hidden" name="cnsltIncallNo" id="cnsltIncallNo" value="single"/>
	        <input type="hidden" name="cnsltUserNm" value=""/>
	        <input type="hidden" name="brthdy" value=""/>
	        <input type="hidden" name="hpno" value=""/>
	        <input type="hidden" name="emailAdres" value=""/>
	        <input type="hidden" name="popupNm" value=""/>
	    </form>
            