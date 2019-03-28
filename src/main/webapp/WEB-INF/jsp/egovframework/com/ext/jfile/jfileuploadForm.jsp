<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.egovframe.go.kr/tags/ext/jfile/jsp" prefix="jwork"%>
<!DOCTYPE html>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<input type="hidden" id="totalFileSize" value="0" />
<div id="swfupload-control" class="swfupload-control">

    <div class="box box-default">
        <div class="box-header with-border">
            <h3 class="box-title"><i class="fa fa-fw fa-upload"></i>파일 업로드</h3>
        </div>
        <!-- /.box-header -->
        
        <div class="box-body">
            <div class="row">
				<div class="col-md-3">&nbsp;</div>
				<div class="col-md-6">
					파일총 사이즈 : <span id="totalFileSizeDisplay">0 Byte</span> 
				</div>
				<div class="col-md-3 text-right">
				    <span id="spanButtonAllDown" class="allDown"><button type="button" class="btn btn-sm btn-primary" onclick="return false;">전체 다운로드</button></span>
                </div>
			</div>
			<!-- /. end row -->
			
			<div class="row">
				<div class="col-md-3 text-right">
					<span id="spanButtonPlaceHolder" class="swfupload"></span>
					<span id="spanThumbnail" class="thumbnail pull-right"><img src="${ctx}/resource/jfile/swfupload/images/preview_img.gif" /></span> 		
				</div>
				<div class="col-md-9">
					<table id="fileAreaTable" class="table">
                        <thead>
                            <tr>
                                <th class="text-center">파일명</th>
                                <th class="text-center">사이즈</th>
                                <th class="text-center">업로드바</th>
                                <th class="text-center">다운로드</th>
                                <th class="text-center">삭제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr id="noDataRow">
                                <td class="all_txt" colspan="5">첨부된 파일이 없습니다.</td>
                            </tr>
                        </tbody>
					</table>
				</div>
			</div>
			<!-- /. end row -->
        </div>
        <!-- /. end box-body -->
	</div>
	<!-- /.end box -->
</div>
