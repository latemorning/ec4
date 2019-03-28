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
            //$("#workBeginDt").val(moment().format('YYYY-MM-DD'));
            


            $("#btnCnsltCareerUpdateAction").click(function(){

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

                    	alert('<spring:message code="errors.size.compare" arguments="${cnsltCareerDateText}"/>');
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
                    "url": "<c:url value='/ec4/call/cnslt/updateCnsltCareer.do'/>",
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

                $("#cnsltCareerPopupForm input[name=cnsltUserNm]").val($("#popUpMngVO input[name=cnsltUserNm]").val());
                $("#cnsltCareerPopupForm input[name=popupNm]").val("popUpMngVO");
                

                var callbackClass = "callback";
                var selectStyle = "single";
                var url = "<c:url value='/ec4/call/cnslt/cnsltntPop.do'/>";

                popupParams.width = "1300";
                popupParams.height = "700";
                popupParams.title = "popupSelectSingle";
                popupParams.form = document.cnsltCareerPopupForm;


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
                                <h3 class="box-title"><i class="fa fa-fw fa-save"></i>상담원경력 수정</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form commandName="popUpMngVO" name="popUpMngVO" method="post">
                            <form:hidden path="makrCd"/>
                                <div class="box-body">
                                    <div class="form-group has-warning">
		                                <label for="cnsltUserNm" class="control-label">상담원명</label>
		                                <div class="control-label">
		                                        <div class="input-group">
		                                        	<form:hidden path="cnsltUserId"/>
		                                        	<form:input path="cnsltUserNm" cssClass="form-control input-sm" readonly="true"/>
			                                    </div>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="workComp" class="control-label">근무회사</label>
		                                <div class="control-label">
		                                        <form:input path="workComp" cssClass="form-control input-sm" readonly="true"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="workPart" class="control-label">업무역할</label>
		                                <div class="control-label">
		                                        <form:input path="workPart" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="workBeginDt" class="control-label">입사일자</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="workBeginDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="resignedDt" class="control-label">퇴사일자</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="resignedDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-right">
                                    <button type="button" id="btnCnsltCareerUpdateAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                        <!-- /.box -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            
	    <form name="cnsltCareerPopupForm" method="post" id="cnsltCareerPopupForm">
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
            