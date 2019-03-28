<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="jwork" uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp"%>

<script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
<validator:javascript formName="replcManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">

    $(document).ready(function () {

        //Date picker
        $(".datepicker").datepicker({
            autoclose: true,
            format: "yyyy-mm-dd"
        });


        $("#btnReplcManageInsertAction").click(function(){

            frm = document.replcManageVO;

            if(!validateReplcManageVO(frm)){
                return;
            }

            // 기타 처리사항 --

            // -- 기타 처리사항

            // 등록
            $.ajax({
                "type": "POST",
                "dataType": "json",
                "async": false,
                "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                "url": "<c:url value='/ec4/call/outbd/smt/prm/insertReplcManage.do'/>",
                "data": $("#replcManageVO").serialize(),
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
                            "\n Status Code : " + xhr.status
                          + "\n Status Text : " + xhr.statusText
                          //+ "\n Error Message : \n " + xhr.responseJSON.errorMessage
                    );
                    return;
                }
            });
        });


    });
    // end ready
</script>

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title"><spring:message code="replcManage.replc"/> <spring:message code="text.create"/> <spring:message code="text.popup"/></h4>
            </div>
            <div class="modal-body">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-save"></i><spring:message code="replcManage.replc"/> <spring:message code="text.create"/></h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <!-- form start -->
                        <form:form commandName="replcManageVO" name="replcManageVO" method="post">
                            <div class="row">
                                <div class="form-group has-warning col-md-6">
                                    <label for="replcCode"><spring:message code="replcManage.replcCode"/></label>
                                    <form:input path="replcCode" cssClass="form-control input-sm"/>
                                </div>
                                <div class="form-group has-warning col-md-6">
                                    <label for="replcTy"><spring:message code="replcManage.replcTy"/></label>
                                    <form:select path="replcTy" cssClass="form-control input-sm">
                                        <form:option value="">-- 선택 --</form:option>
                                        <form:options items="${replcTyList}" itemValue="code" itemLabel="codeNm"/>
                                    </form:select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group has-warning col-md-6">
                                    <label for="replcNm"><spring:message code="replcManage.replcNm"/></label>
                                    <form:input path="replcNm" cssClass="form-control input-sm"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="hdqrtrsCode"><spring:message code="replcManage.hdqrtrsCode"/></label>
                                    <form:input path="hdqrtrsCode" cssClass="form-control input-sm"/>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group has-warning col-md-6">
                                    <label for=""><spring:message code="replcManage.smsDsptchNo"/></label>
                                    <form:input path="smsDsptchNo" cssClass="form-control input-sm"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="replcEmail"><spring:message code="replcManage.replcEmail"/></label>
                                    <form:input path="replcEmail" cssClass="form-control input-sm"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="useAt" class="control-label"><spring:message code="cmm.useAt"/></label>
                                    <form:select path="useAt" class="form-control input-sm">
                                        <form:option value="Y" itemLabel="사용"/>
                                        <form:option value="N" itemLabel="미사용"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="useAt" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="scdCallUseAt" class="control-label"><spring:message code="replcManage.scdCallUseAt"/></label>
                                    <form:select path="scdCallUseAt" class="form-control input-sm">
                                        <form:option value="Y" itemLabel="사용"/>
                                        <form:option value="N" itemLabel="미사용"/>
                                    </form:select>
                                    <form:errors cssClass="help-block" path="scdCallUseAt" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="replcGdcc"><spring:message code="replcManage.replcGdcc"/></label>
                                    <form:textarea path="replcGdcc" cols="3" cssClass="form-control input-sm"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="replcExcpGdcc"><spring:message code="replcManage.replcExcpGdcc"/></label>
                                    <form:textarea path="replcExcpGdcc" cols="3" cssClass="form-control input-sm"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="remark"><spring:message code="cmm.remark"/></label>
                                    <form:textarea path="remark" cols="3" cssClass="form-control input-sm"/>
                                </div>
                            </div>
                        </form:form>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-right">
                        <button type="button" id="btnReplcManageInsertAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
