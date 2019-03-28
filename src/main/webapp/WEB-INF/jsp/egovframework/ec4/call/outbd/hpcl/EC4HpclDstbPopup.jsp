<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <script type="text/javascript">

        $(document).ready(function () {

            // 분배 팝업에 캠페인 테이블
            cmpgnTable = $('#cmpgnTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 1, "desc" ]],
                "rowId": "cmpgnId",
                "scrollY": "369px",
                "pageLength": 10,
                "pagingType": "full_numbers",
                "bPaginate": true,
                "bLengthChange": true,
                "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": true,
                "searching": false,
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/call/outbd/cmpgn/selectCmpgnList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchCmpgnNm",   "value": $("#searchCmpgnForm input[name=searchCmpgnNm]").val()},
                            {"name": "searchBeginDe",   "value": $("#searchCmpgnForm input[name=searchBeginDe]").val()},
                            {"name": "searchEndDe",     "value": $("#searchCmpgnForm input[name=searchEndDe]").val()},
                            {"name": "searchSttusCode", "value": $("#searchCmpgnForm select[name=searchSttusCode] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1]},
                    {"orderable": false, "targets": [0]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"cmpgnId"},
                    {"data":"cmpgnNm"},
                    {"data":"beginDe"},
                    {"data":"endDe", "defaultContent": ""},
                    {"data":"sttusCodeNm", "defaultContent": ""}
                ]
            });


            // 분배 액션
            $("#btnHpclDstbAction").click(function(){

                var params = {};

                // 기타 처리사항 --
                // 해피콜 목록 화면에서 선택한 해피콜 List
                var hpclList = JSON.parse('${hpclList}');
                var rowData = cmpgnTable.rows(".selected").data();


                if(hpclList.length < 1){

                    alert('<spring:message code="common.select.msg" arguments="${hpclText}"/>');
                }else if(rowData.length < 1){

                	alert('<spring:message code="common.select.msg" arguments="${cmpgnText}"/>');
                }else{

                	// 해피콜 목록 셋팅
                    for(var i=0 ; i<hpclList.length ; i++){

                        params['hpclList['+i+'].hpclId'] = hpclList[i].hpclId;
                        params['hpclList['+i+'].oldCmpgnId'] = hpclList[i].oldCmpgnId;
                    }

                	// 캠페인ID 셋팅
                    params.cmpgnId = rowData[0].cmpgnId;


                    // 분배
                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/call/outbd/hpcl/dstbHpcl.do'/>",
                        "data": params,
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

                }// -- else
                // -- 기타 처리사항
            });// -- 분배 액션

        });// -- end ready

    </script>

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">팝업</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-info alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                    <h4><i class="icon fa fa-info"></i> info!</h4>
                    해피콜을 분배할 캠페인을 선택 후 저장 버튼을 눌러주세요
                </div>
	            <div class="box box-primary">
	                <div class="box-header with-border">
	                    <h3 class="box-title"><i class="fa fa-fw fa-list"></i>해피콜 분배</h3>
	                    <div class="box-tools pull-right">
                            <button type="button" id="btnHpclDstbAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                        </div>
	                </div>
	                <!-- /.box-header -->

                    <div class="box-body table-responsive">
                        <table id="cmpgnTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th><spring:message code="cmm.seq"/></th>
                                    <th><spring:message code="cmpgn.cmpgnId"/></th>
                                    <th><spring:message code="cmpgn.cmpgnNm"/></th>
                                    <th><spring:message code="cmpgn.beginDe"/></th>
                                    <th><spring:message code="cmpgn.endDe"/></th>
                                    <th><spring:message code="cmpgn.sttus"/></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- /.box-body -->
	            </div>
	            <!-- /.box -->

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
