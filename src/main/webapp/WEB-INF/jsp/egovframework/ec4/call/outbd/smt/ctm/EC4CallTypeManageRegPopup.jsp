<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="validator"  uri="http://www.springmodules.org/tags/commons-validator"%>
<%@ taglib prefix="jwork" uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp"%>

<script src="<c:url value='/validator.do'/>"></script>
<validator:javascript formName="callTypeManageVO" staticJavascript="false" xhtml="true" cdata="false"/>

<script>

    $(document).ready(function () {

        $("#btnInsertAction").click(function(){

            frm = document.callTypeManageVO;

            if(!validateCallTypeManageVO(frm)){
                return;
            }

            // 기타 처리사항 --
            // -- 기타 처리사항

            // 등록
            var params = $("#callTypeManageVO").serialize();
            var url = "/ec4/call/outbd/smt/ctm/insertCallTypeManage.do";

            var actionObj = new AjaxActionObject(url, params);
            actionObj.submit();

            if(actionObj.isSuccess()){
            	callTypeManageTable.draw();
            }

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
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-save"></i>콜타입 등록</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <!-- form start -->
                        <form:form commandName="callTypeManageVO" name="callTypeManageVO" method="post">
                        <form:hidden path="fileId"/>
                        <div class="form-group has-warning">
                            <label for="cmpgnNm" class="control-label"><spring:message code="cmpgn.cmpgnNm"/></label>
                            <form:input path="cmpgnNm" cssClass="form-control input-sm"/>
                        </div>
                        <div class="form-group has-warning">
                            <label for="beginDe" class="control-label"><spring:message code="cmpgn.beginDe"/></label>
                            <div class="input-group date">
                                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                <form:input path="beginDe" cssClass="form-control pull-right input-sm datepicker"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="endDe" class="control-label"><spring:message code="cmpgn.endDe"/></label>
                            <div class="input-group date">
                                <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                <form:input path="endDe" cssClass="form-control input-sm datepicker"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="qustnrId" class="control-label">설문지</label>
                            <form:select path="qestnrId" cssClass="form-control input-sm">
                                <form:option value="">-- 선택 --</form:option>
                                <form:options items="${qustnrCombo}" itemValue="code" itemLabel="codeNm"/>
                            </form:select>
                        </div>
                        <div class="form-group margin-bottom-none">
                            <label for="sttusCode" class="control-label"><spring:message code="cmpgn.sttusCode"/></label>
                            <form:select path="sttusCode" cssClass="form-control input-sm">
                                <form:option value="">-- 선택 --</form:option>
                                <form:options items="${sttusCodeList}" itemValue="code" itemLabel="codeNm"/>
                            </form:select>
                        </div>
                        </form:form>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer text-right">
                        <button type="button" id="btnCallTypeManageInsertAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                    </div>
                    <!-- /.box-footer -->
                </div>
                <!-- /.box -->

                <fieldset>
                    <jwork:fileuploader
                        objectId="fileUploadObj1"
                        uploadCompletedEvent="uploadCompleted1"
                        fileType="all"
                        maxFileSize="10000"
                        maxFileCount="30"
                        usePreview="true"
                        useSecurity="false"
                        uploadMode="db"
                    />
                    <div class="pull-right">
                        <button type="button" class="btn btn-sm btn-primary" onclick="send1()">전송</button>
                    </div>
                </fieldset>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><spring:message code="button.close"/></button>
            </div>
