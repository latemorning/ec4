<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="jwork" uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp"%>

<script type="text/javascript" src="<c:url value='/validator.do'/>"></script>
<validator:javascript formName="goodsManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script type="text/javascript">

    $(document).ready(function () {

        $("#btnUpdateAction").click(function(){

            frm = document.goodsManageVO;

            if(!validateGoodsManageVO(frm)){
                return;
            }

            var params = $("#goodsManageVO").serialize();
            var url = "/ec4/call/outbd/smt/cgm/updateGoodsManage.do";

            let actionObj = new AjaxActionObject(url, params);
            actionObj.submit();

            if(actionObj.success){
            	goodsManageTable.draw();
            }
        });

    });
    // end ready
</script>

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">캠페인 등록</h4>
            </div>
            <div class="modal-body">
                <div class="box box-solid box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-save"></i>캠페인 등록</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <!-- form start -->
                        <form:form commandName="goodsManageVO" name="goodsManageVO" method="post">
                            <form:hidden path="goodsCode"/>
                            <div class="row">
		                        <div class="form-group has-warning col-md-6">
		                            <label for="goodsNm" class="control-label"><spring:message code="goodsManage.goodsNm"/></label>
		                            <form:input path="goodsNm" cssClass="form-control input-sm"/>
		                            <form:errors cssClass="help-block" path="goodsNm"/>
		                        </div>
		                        <div class="form-group col-md-6">
		                            <label for="callOccnd" class="control-label"><spring:message code="goodsManage.callOccnd"/></label>
                                    <form:input path="callOccnd" cssClass="form-control input-sm"/>
		                        </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="smsOccnd" class="control-label"><spring:message code="goodsManage.smsOccnd"/></label>
                                    <form:input path="smsOccnd" cssClass="form-control input-sm"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="callUntpc" class="control-label"><spring:message code="goodsManage.callUntpc"/></label>
                                    <form:input path="callUntpc" cssClass="form-control input-sm"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="smsUntpc" class="control-label"><spring:message code="goodsManage.smsUntpc"/></label>
                                    <form:input path="smsUntpc" cssClass="form-control input-sm"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="smsBasscnt" class="control-label"><spring:message code="goodsManage.smsBasscnt"/></label>
                                    <form:input path="smsBasscnt" cssClass="form-control input-sm"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="sortOrdr" class="control-label"><spring:message code="cmm.sortOrdr"/></label>
                                    <form:input path="sortOrdr" cssClass="form-control input-sm"/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="useAt" class="control-label"><spring:message code="cmm.useAt"/></label>
                                    <form:select path="useAt" cssClass="form-control input-sm">
                                        <form:option value="Y">사용</form:option>
                                        <form:option value="N">미사용</form:option>
                                    </form:select>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="remark" class="control-label"><spring:message code="cmm.remark"/></label>
                                    <form:textarea path="remark" cols="3" cssClass="form-control input-sm"></form:textarea>
                                </div>
                            </div>
                        </form:form>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-right">
                        <button type="button" id="btnUpdateAction" class="btn btn-sm btn-primary"><spring:message code="button.update"/></button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->

            </div>
