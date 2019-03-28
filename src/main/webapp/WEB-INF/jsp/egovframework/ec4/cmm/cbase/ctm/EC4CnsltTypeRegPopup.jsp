<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator" %>

    <script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
    <validator:javascript formName="cnsltTypeVO" staticJavascript="false" xhtml="true" cdata="false"/>

    <script type="text/javascript">

        $(document).ready(function () {

            /* 상담코드 등록 function */
            $("#btnCnsltTypeInsert").click(function(){

                frm = document.cnsltTypeVO;

                /* if(!validateCnsltTypeVO(frm)){
                    return;
                } */

                // 등록
                $.ajax({
                    "type": "POST",
                    "dataType": "json",
                    "async": false,
                    "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                    "url": "<c:url value='/ec4/cmm/cbase/ctm/insertCnsltType.do'/>",
                    "data": $("#cnsltTypeVO").serialize(),
                    "success": function(result) {

                        if(result.isSuccess){

                            alert(result.message);
                            $("div.modal").modal('hide');
                        } else {

                        	var errorMsg = "";

                            for(var i = 0 ; i < result.errorMessages.length ; i++){

                            	errorMsg = errorMsg + result.errorMessages[i] + "\n"
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
            // end click
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
	                            <h3 class="box-title"><i class="fa fa-fw fa-save"></i>상담코드 등록</h3>
	                        </div>
	                        <!-- /.box-header -->
	                        <!-- form start -->
	                        <form:form commandName="cnsltTypeVO" name="cnsltTypeVO" method="post" cssClass="form-horizontal">
	                            <form:hidden path="parntsCodeId" />
	                            <div class="box-body">
	                                <div class="form-group has-warning">
	                                    <label for="codeId" class="col-sm-3 control-label"><spring:message code="cnsltType.codeId"/></label>
	                                    <div class="col-sm-9">
	                                        <form:input path="codeId" cssClass="form-control input-sm" maxlength="15"/>
	                                    </div>
	                                </div>
	                                <div class="form-group has-warning">
	                                    <label for="codeNm" class="col-sm-3 control-label"><spring:message code="cnsltType.codeNm"/></label>
	                                    <div class="col-sm-9">
	                                        <form:input path="codeNm" cssClass="form-control input-sm" maxlength="60"/>
	                                    </div>
	                                </div>
	                                <div class="form-group has-warning">
                                        <label for="sortOrdr" class="col-sm-3 control-label"><spring:message code="cmm.sortOrdr"/></label>
                                        <div class="col-sm-9">
                                            <form:input path="sortOrdr" cssClass="form-control input-sm" maxlength="5"/>
                                        </div>
                                    </div>
	                                <div class="form-group has-warning">
                                        <label for="cnsltSeCode" class="col-sm-3 control-label"><spring:message code="cnsltType.cnsltSeCode"/></label>
                                        <div class="col-sm-9">
                                            <form:select path="cnsltSeCode" cssClass="form-control input-sm">
                                                <form:options items="${cnsltSeList}" itemValue="code" itemLabel="codeNm"/>
                                            </form:select>
                                        </div>
                                    </div>
	                                <div class="form-group margin-bottom-none">
	                                    <label class="col-sm-3 control-label"><spring:message code="cmm.useAt"/></label>
	                                    <div class="col-sm-9">
	                                        <form:select path="useAt" cssClass="form-control input-sm">
	                                            <form:option value="Y">사용</form:option>
	                                            <form:option value="N">미사용</form:option>
	                                        </form:select>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- /.box-body -->
	                            <div class="box-footer text-right">
	                                <button type="button" id="btnCnsltTypeInsert" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
	                            </div>
	                            <!-- /.box-footer -->
	                        </form:form>
	                    </div>
	                    <!-- /.box -->



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
