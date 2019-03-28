<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%--
    Class Name : EC4CntrctManageList.jsp
    Description : 계약 목록 import용 화면

    Modification Information
    수정일        수정자    수정내용
    ----------    ------    ---------------------------
    2019.02.12    harry     최초 생성

    author : wizvil harry
    since : 2019.02.12
--%>

    <script type="text/javascript">

        $(document).ready(function () {

            // 계약목록 테이블
            cntrctManageTable = $('#cntrctManageTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "order": [[ 4, "desc" ]],
                "rowId": ["replcCode", "goodsCode", "cntrctEndde"],
                "scrollY": "190px",
                "bPaginate": true,
                "pageLength": 10,
                "pagingType": "full_numbers",
                "bLengthChange": false,
                "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": true,
                "searching": false,
                "bServerSide": true,
                "sAjaxSource": "<c:url value='/ec4/call/outbd/smt/cmt/selectCntrctManageList.do'/>",
                "fnServerParams": function(aoData){
                    aoData.push(
                        {"name": "searchReplcCode", "value": $("#searchCntrctManageForm input[name=searchReplcCode]").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [1, 3, 4, 5, 6, 7, 8, 9, 13, 14]},
                    {"orderable": false, "targets": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 13, 14]}
                ],
                "columns": [
                   {"data":"rn"},
                   {"data":"goodsCode"},
                   {"data":"goodsNm", "defaultContent": ""},
                   {"data":"callOccnd", "defaultContent": ""},
                   {"data":"smsOccnd", "defaultContent": ""},
                   {"data":"callUntpc", "defaultContent": ""},
                   {"data":"smsUntpc", "defaultContent": ""},
                   {"data":"smsBasscnt", "defaultContent": ""},
                   {"data":"goodsRemark", "defaultContent": ""},
                   {"data":"replcCode", "defaultContent": ""},
                   {"data":"cntrctEndde", "defaultContent": ""},
                   {"data":"chargerNm", "defaultContent": ""},
                   {"data":"chargerTelno", "defaultContent": ""},
                   {"data":"chargerEmail", "defaultContent": ""},
                   {"data":"cntrctRemark", "defaultContent": ""}
                ]
            });


            // 선택
            cntrctManageTable.on("select", function (e, dt, type, indexes) {

            	var rowData = dt.rows(indexes).data();

            	for(i=0 ; i<rowData.context[0].aoColumns.length ; i++){

            		var key = rowData.context[0].aoColumns[i].data;
            		var value = rowData[0][key];

            	    $("#cntrctManageVO").find(":input[name='" + key + "']").val(value);
            	}

            }).on("deselect", function (e, dt, type, indexes) {

            	$("#cntrctManageVO").find(":input").val("");
            });

        });
        // end ready


        // 그리드 reload
        function fn_cntrct_grid_reload(){

        	cntrctManageTable.draw();
        }


        // 선택된 정비소 코드 값을 searchCntrctManageForm.searchReplcCode 에 넣기
        function fn_set_cntrct_search_replc_code(replcCode){

            if(isEmpty(replcCode)){

                if(replcManageTable.rows(".selected").nodes().length > 0){

                    replcCode = replcManageTable.rows(".selected").data()[0].replcCode;
                } else {

                    replcCode = "";
                }
            }

            $("#searchCntrctManageForm input[name=searchReplcCode]").val(replcCode);
        }


    </script>

        <!-- Main content -->
        <div class="row">
            <!-- column -->
            <div class="col-md-12">
                <div class="box box-solid box-default">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-fw fa-list"></i>계약 목록</h3>
                        <form name="searchCntrctManageForm" id="searchCntrctManageForm" method="post" onsubmit="return false;">
                            <input type="hidden" name="searchReplcCode" value="${searchReplcCode}"/>
                        </form>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <table id="cntrctManageTable" class="table table-hover">
                            <thead>
                                <tr>
                                    <th><spring:message code="cmm.seq"/></th>
                                    <th><spring:message code="cntrctManage.goodsCode"/></th>
                                    <th><spring:message code="cntrctManage.goodsNm"/></th>
                                    <th><spring:message code="cntrctManage.callOccnd"/></th>
                                    <th><spring:message code="cntrctManage.smsOccnd"/></th>
                                    <th><spring:message code="cntrctManage.callUntpc"/></th>
                                    <th><spring:message code="cntrctManage.smsUntpc"/></th>
                                    <th><spring:message code="cntrctManage.smsBasscnt"/></th>
                                    <th><spring:message code="cntrctManage.goodsRemark"/></th>
                                    <th><spring:message code="replcManage.replcCode"/></th>
                                    <th><spring:message code="cntrctManage.cntrctEndde"/></th>
                                    <th><spring:message code="cntrctManage.chargerNm"/></th>
                                    <th><spring:message code="cntrctManage.chargerTelno"/></th>
                                    <th><spring:message code="cntrctManage.chargerEmail"/></th>
                                    <th><spring:message code="cntrctManage.cntrctRemark"/></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!--/.col -->
        </div>
        <!-- /.row -->

        <div class="row">
            <!-- column -->
            <div class="col-md-12">
                <div class="box box-solid box-default">
                    <div class="box-header">
                        <h3 class="box-title"><i class="fa fa-fw fa-info"></i>계약 상세</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <!-- form start -->
                        <form id="cntrctManageVO">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.goodsNm"/></label>
                                    <input type="text" name="goodsNm" class="form-control input-sm" readonly="readonly" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.smsBasscnt"/></label>
                                    <input type="text" name="smsBasscnt" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.callOccnd"/></label>
                                    <input type="text" name="callOccnd" class="form-control input-sm" readonly="readonly" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.smsOccnd"/></label>
                                    <input type="text" name="smsOccnd" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.callUntpc"/></label>
                                    <input type="text" name="callUntpc" class="form-control input-sm" readonly="readonly" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.smsUntpc"/></label>
                                    <input type="text" name="smsUntpc" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label><spring:message code="cntrctManage.goodsRemark"/></label>
                                    <textarea name=goodsRemark cols="3" class="form-control input-sm" readonly="readonly"></textarea>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.cntrctEndde"/></label>
                                    <input type="text" name="cntrctEndde" class="form-control input-sm" readonly="readonly" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.chargerNm"/></label>
                                    <input type="text" name="chargerNm" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.chargerTelno"/></label>
                                    <input type="text" name="chargerTelno" class="form-control input-sm" readonly="readonly" />
                                </div>
                                <div class="form-group col-md-6">
                                    <label><spring:message code="cntrctManage.chargerEmail"/></label>
                                    <input type="text" name="chargerEmail" class="form-control input-sm" readonly="readonly" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label><spring:message code="cntrctManage.cntrctRemark"/></label>
                                    <textarea name="cntrctRemark" cols="3" class="form-control input-sm" readonly="readonly"></textarea>
                                </div>
                            </div>
                        </form>

                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!--/.col -->
        </div>
        <!-- /.row -->