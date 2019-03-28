<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <script type="text/javascript">

        $(document).ready(function () {

            // 분배 팝업에 캠페인 테이블
            cnslrTable = $('#cnslrTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "multi"
                },
                "order": [[ 2, "desc" ]],
                "rowId": "cnslrId",
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
                "sAjaxSource": "<c:url value='/ec4/call/outbd/hpcl/selectCnslrList.do'/>",
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1]},
                    {"orderable": false, "targets": [0]}
                ],
                "columns": [
                    {"data":"rn"},
                    {"data":"esntlId"},
                    {"data":"userNm"},
                    {"data":"orgnztNm", "defaultContent": ""},
                    {"data":"ofcpsNm", "defaultContent": ""}
                ]
            });


            // 상담원 분배 액션
            $("#btnCnslrDstbAction").click(function(){

                var params = {};

                // 기타 처리사항 --
                // 해피콜 목록 화면에서 선택한 해피콜 List
                var hpclList = JSON.parse('${hpclList}');
                var rowData = cnslrTable.rows(".selected").data();


                if(hpclList.length < 1){

                    alert('<spring:message code="common.select.msg" arguments="${hpclText}"/>');
                }else if(rowData.length < 1){

                    alert('<spring:message code="common.select.msg" arguments="${cnslrText}"/>');
                }else{

                    // 해피콜id, 캠페인id 목록 셋팅
                    for(var i=0 ; i<hpclList.length ; i++){

                        params['hpclList['+i+'].hpclId'] = hpclList[i].hpclId;
                        params['hpclList['+i+'].cmpgnId'] = hpclList[i].cmpgnId;
                    }

                    // 상담원 목록 셋팅
                    for(var i=0 ; i<rowData.length ; i++){

                        params['cnslrList['+i+'].cnslrId'] = rowData[i].esntlId;
                    }


                    // 분배
                    $.ajax({
                        "type": "POST",
                        "dataType": "json",
                        "async": false,
                        "contentType": "application/x-www-form-urlencoded; charset=UTF-8",
                        "url": "<c:url value='/ec4/call/outbd/hpcl/dstbCnslr.do'/>",
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
                    <h4><i class="icon fa fa-info"></i> info</h4>
                    분배할 상담원을 선택 후 저장 버튼을 눌러주세요
                </div>
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><i class="fa fa-fw fa-list"></i>상담원 분배</h3>
                        <div class="box-tools pull-right">
                            <button type="button" id="btnCnslrDstbAction" class="btn btn-sm btn-primary"><spring:message code="button.save"/></button>
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body table-responsive">
                        <table id="cnslrTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th><spring:message code="cmm.seq"/></th>
                                    <th>고유ID</th>
                                    <th>이름</th>
                                    <th>부서</th>
                                    <th>직급</th>
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
