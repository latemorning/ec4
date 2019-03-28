<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4MsgTmplatList.jsp
    Description : SMS템플릿 목록 import용 화면

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2019.01.31    harry     최초 생성

    author : wizvil harry
    since : 2019.01.31
--%>

    <script type="text/javascript">

        $(document).ready(function () {

            // SMS템플릿 테이블
            smsTmplatTable = $('#smsTmplatTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                "rowId": "smsTmplatId",
                "scrollY": "190px",
                "bPaginate": true,
                "pageLength": 100,
                "pagingType": "full_numbers",
                "bLengthChange": false,
                "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": false,
                "searching": false,
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/call/outbd/smt/stm/selectMsgTmplatList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                        {"name": "searchSmsTmplatSe", "value": $("#searchSmsTmplatForm select[name=searchSmsTmplatSe] option:selected").val()},
                        {"name": "searchSmsTmplatSj", "value": $("#searchSmsTmplatForm input[name=searchSmsTmplatSj]").val()},
                        {"name": "searchReplcCode", "value": $("#searchSmsTmplatForm input[name=searchReplcCode]").val()},
                        {"name": "selectedReplcOnly", "value": $("#searchSmsTmplatForm input[name=selectedReplcOnly]").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1, 2, 5, 6, 7, 8]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"smsTmplatId"},
                    {"data":"smsTmplatSe", "defaultContent": ""},
                    {"data":"smsTmplatSeNm", "defaultContent": ""},
                    {"data":"smsTmplatSj", "defaultContent": ""},
                    {"data":"sndngCn", "defaultContent": ""},
                    {"data":"frstRegisterId", "defaultContent": ""},
                    {"data":"frstRegisterId", "defaultContent": ""},
                    {"data":"useTmplat", "defaultContent": ""}
                ],
                "createdRow": function(row, data, dataIndex){

                	if(!isEmpty(data.useTmplat)){
                        $(row).addClass("success");
                	}
                }
            });


            // 검색 input search
            $("#searchSmsTmplatForm input").on("keyup change", function(key){

                if(key.keyCode == 13 || $(this).hasClass("datepicker")){

                	fn_tmplat_grid_reload();
                }
            });

            // 검색 select search
            $("#searchSmsTmplatForm select").on("change", function(key){

            	fn_tmplat_grid_reload();
            });


            // 선택
            smsTmplatTable.on("select", function (e, dt, type, indexes) {

            	var rowData = dt.rows(indexes).data();

                $("#sndngCn").val(rowData[0].sndngCn);

            }).on("deselect", function (e, dt, type, indexes) {

            	$("#sndngCn").val('');
            });


            // 할당 버튼
            $("#btnAsgn").click(function(){

                var params = {};

                var tmplatRowData = smsTmplatTable.rows(".selected").data();
                var replcRowData = replcManageTable.rows(".selected").data();


                if(replcRowData[0] && tmplatRowData[0]){

                    params.replcCode = replcRowData[0].replcCode;
                    params.smsTmplatId = tmplatRowData[0].smsTmplatId;
                    params.smsTmplatSe = tmplatRowData[0].smsTmplatSe;


                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/call/outbd/smt/stm/asgnTmplat.do'/>",
                        "data": params,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                fn_tmplat_grid_reload();
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });

                }else{

                	alert('정비소와 템플릿을 선택해주세요');
                }

            });


            // 해제 버튼
            $("#btnRelis").click(function(){

                var params = {};

                var tmplatRowData = smsTmplatTable.rows(".selected").data();
                var replcRowData = replcManageTable.rows(".selected").data();


                if(replcRowData[0] && tmplatRowData[0]){

                    params.replcCode = replcRowData[0].replcCode;
                    params.smsTmplatId = tmplatRowData[0].smsTmplatId;
                    params.smsTmplatSe = tmplatRowData[0].smsTmplatSe;


                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/call/outbd/smt/stm/relisTmplat.do'/>",
                        "data": params,
                        "success": function(result) {

                            if(result.isSuccess){

                                alert(result.message);
                                fn_tmplat_grid_reload();
                            } else {

                                alert(result.message);
                            }
                        }
                        ,error: function(xhr, status, error){

                            alert(status);
                            return;
                        }
                    });

                }else{

                    alert('정비소와 템플릿을 선택해주세요');
                }
            });


            // 선택된정비소 체크박스
            $("#checkSelectedReplcOnly").click(function(){

            	var $isChecked = $(this).is(":checked");

            	if($isChecked){

            		$("#selectedReplcOnly").val("Y");
            	} else {

            		$("#selectedReplcOnly").val("");
            	}

            	fn_set_search_replc_code();
            	fn_tmplat_grid_reload();
            });


        });
        // end ready


        // 정비소 선택된 값을 searchSmsTmplatForm.searchReplcCode 에 넣기
        function fn_set_search_replc_code(replcCode){

        	if(isEmpty(replcCode)){

        	    if(replcManageTable.rows(".selected").nodes().length > 0){

        	        replcCode = replcManageTable.rows(".selected").data()[0].replcCode;
        	    } else {

        	    	replcCode = "";
        	    }
        	}

        	$("#searchSmsTmplatForm input[name=searchReplcCode]").val(replcCode);
        }


        // 그리드 reload
        function fn_tmplat_grid_reload(){

            smsTmplatTable.draw();
        }

    </script>

        <!-- Main content -->
        <div class="row">
            <!-- column -->
            <div class="col-md-12">

                <div class="box">
                    <div class="box-header with-border">
                        <form name="searchSmsTmplatForm" id="searchSmsTmplatForm" method="post" class="" onsubmit="return false;">
                            <input type="hidden" name="searchReplcCode" />
                            <input type="hidden" name="selectedReplcOnly" id="selectedReplcOnly" />
                            <div class="row">
	                            <div class="form-group col-md-6">
	                                 <label for="searchSmsTmplatSe"><spring:message code="msgTmplat.smsTmplatSe"/></label>
	                                 <select name="searchSmsTmplatSe" id="searchSmsTmplatSe" class="form-control input-sm">
	                                       <option value="">-- 선택 --</option><c:forEach items="${smsTmplatSeList}" var="result" varStatus="status">
	                                       <option value="${result.code}">${result.codeNm}</option></c:forEach>
	                                    </select>
	                            </div>
	                            <div class="form-group col-md-6">
	                                <label for="searchSmsTmplatSj"><spring:message code="msgTmplat.smsTmplatSj"/></label>
	                                <input type="text" name="searchSmsTmplatSj" id="searchSmsTmplatSj" placeholder="<spring:message code="msgTmplat.smsTmplatSj"/>" class="form-control input-sm"/>
	                            </div>
                            </div>
                            <div class="row">
	                            <div class="form-group col-md-12">
	                                <div class="checkbox">
	                                    <label for="checkSelectedReplcOnly">
	                                        <input type="checkbox" name="checkSelectedReplcOnly" id="checkSelectedReplcOnly" />선택된정비소
	                                    </label>
	                                </div>
	                            </div>
                            </div>
                        </form>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive">
                        <table id="smsTmplatTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th><spring:message code="cmm.seq"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatId"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatSe"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatSe"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatSj"/></th>
                                    <th><spring:message code="msgTmplat.sndngCn"/></th>
                                    <th><spring:message code="cmm.frstRegisterId"/></th>
                                    <th><spring:message code="cmm.frstRegistPnttm"/></th>
                                    <th><spring:message code="msgTmplat.smsTmplatId"/></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- /.box-body -->
                    <div class="box-footer">
                        <div class="form-group col-md-12">
                            <div class="box-tools pull-right">
                                <button type="button" id="btnAsgn" class="btn btn-xs btn-warning">할당</button>
                                <button type="button" id="btnRelis" class="btn btn-xs btn-warning">해제</button>
                            </div>
                            <label for="sndngCn"><spring:message code="msgTmplat.sndngCn"/></label>
                            <textarea name="sndngCn" id="sndngCn" cols="3" class="form-control input-sm" readonly="readonly"></textarea>
                        </div>
                    </div>
                </div>
                <!-- /.box -->

            </div>
            <!--/.col -->
        </div>
        <!-- /.row -->
