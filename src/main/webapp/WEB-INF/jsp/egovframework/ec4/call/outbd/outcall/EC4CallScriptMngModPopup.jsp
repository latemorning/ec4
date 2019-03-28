<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>

    <script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
    <validator:javascript formName="popUpScriptMngVO" staticJavascript="false" xhtml="true" cdata="false"/>

    <script type="text/javascript">

        $(document).ready(function () {

        	//Date picker
            $(".datepicker").datepicker({
              autoclose: true,
              format: "yyyy-mm-dd"
            })
            $("#scriptBeginDt").val(moment().format('YYYY-MM-DD'));
            $("#scriptEndDt").val((moment().subtract(-1, 'month')).format('YYYY-MM-DD'));
            
            


            $("#btnCallScriptUpdateAction").click(function(){

            	frm = document.popUpScriptMngVO;

            	//validate를 사용하기위해서는 validate폴더 내에 체크항목을 기재해놓는 .xml파일을 생성해야한다.
            	/* if(!validatePopUpMngVO(frm)){
                    return;
                } */

            	// 기타 처리사항 --
            	/* var beginDe = frm.beginDe.value;
                var endDe = frm.endDe.value;

                if(beginDe && endDe){
                    if(endDe < beginDe){

                    	alert('<spring:message code="errors.size.compare" arguments="${callScriptDateText}"/>');
                    	return;
                    }
                } */
                // -- 기타 처리사항
                

                // 등록
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/call/outbd/updateCallScript.do'/>",
                    "data": $("#popUpScriptMngVO").serialize(),
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
                });//등록
            });//등록버튼


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
                                <h3 class="box-title"><i class="fa fa-fw fa-save"></i>콜스크립트 수정</h3>
                            </div>
                            <!-- /.box-header -->
                            <!-- form start -->
                            <form:form commandName="popUpScriptMngVO" name="popUpScriptMngVO" method="post">
                            <form:hidden path="makrCd"/>
                            <form:hidden path="scriptKnd"/>
                            <form:hidden path="scriptCd"/>
                                <div class="box-body">
                                    <div class="form-group">
		                                <label for="scriptKnd" class="control-label">콜구분</label>
		                                <div class="control-label">
		                                        <form:input path="scriptKndNm" cssClass="form-control input-sm" readonly="true"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
		                                <label for="scriptTitle" class="control-label">스크립트제목</label>
		                                <div class="control-label">
		                                        <form:input path="scriptTitle" cssClass="form-control input-sm"/>
		                                </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="scriptBeginDt" class="control-label">사용 시작일</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="scriptBeginDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="scriptEndDt" class="control-label">사용 종료일</label>
                                        <div class="input-group date">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <form:input path="scriptEndDt" cssClass="form-control pull-right input-sm datepicker"/>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer text-right">
                                    <button type="button" id="btnCallScriptUpdateAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                                </div>
                                <!-- /.box-footer -->
                            </form:form>
                        </div>
                        <!-- /.box -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>

            
	    <form name="callScriptPopupForm" method="post" id="callScriptPopupForm">
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
            