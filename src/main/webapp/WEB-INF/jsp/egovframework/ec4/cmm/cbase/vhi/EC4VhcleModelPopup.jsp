<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

    <script type="text/javascript">

		$(document).ready(function () {

		    $(".sidebar-menu").tree();


	        // 세부모델 테이블
            var vhcleDetailTable = $('#vhcleDetailTable').DataTable({
                "language": lang_kor,
                "select": {
                    "style": "single"
                },
                "rowId": "detailModelId",
                "scrollY": "369px",
                "pageLength": 10,
                "pagingType": "full_numbers",
                "bPaginate": true,
                "bLengthChange": true,
                "lengthMenu": [[ 10, 50, 100 ], [ 10, 50, 100 ]],
                "responsive": true,
                "processing": true,
                "ordering": true,
                "bServerSide": true,
                "searching": false,
                "sAjaxSource": "/ec4/cmm/cbase/vhi/selectVhcleDetailModelList.do",
                "fnServerParams": function(aoData){
                    aoData.push(
                            {"name": "searchVhcleModelId",  "value": $("#searchVhcleDetailModelForm input[name=searchVhcleModelId]").val()},
                            {"name": "searchDetailModelNm", "value": $("#searchVhcleDetailModelForm input[name=searchDetailModelNm]").val()},
                            {"name": "searchMdyrBegin",     "value": $("#searchVhcleDetailModelForm input[name=searchMdyrBegin]").val()},
                            {"name": "searchMdyrEnd",       "value": $("#searchVhcleDetailModelForm input[name=searchMdyrEnd]").val()},
                            {"name": "searchUseAt",         "value": $("#searchVhcleDetailModelForm select[name=searchUseAt] option:selected").val()}
                    );
                },
                "sServerMethod": "POST",
                "columnDefs": [
                    {"visible": false, "targets": [0]}
                ],
                "columns": [
                    {"data":"detailModelId"},
                    {"data":"vhcleModelNm"},
                    {"data":"detailModelNm"},
                    {"data":"mdyrBegin"},
                    {"data":"mdyrEnd"},
                    {"data":"useAt"}
                ]
            });





            // 세부모델 선택
            vhcleDetailTable.on("select", function (e, dt, type, indexes) {

                var vdfrm = document.vhcleDetailModelVO;
                var rowData = vhcleDetailTable.rows(indexes).data();

                vdfrm.detailModelId.value = rowData[0].detailModelId;
                vdfrm.detailModelNm.value = rowData[0].detailModelNm;
                vdfrm.mdyrBegin.value     = rowData[0].mdyrBegin;
                vdfrm.mdyrEnd.value       = rowData[0].mdyrEnd;
                vdfrm.useAt.value         = rowData[0].useAt;

            }).on("deselect", function (e, dt, type, indexes) {

                var vdfrm = document.vhcleDetailModelVO;

                vdfrm.detailModelId.value = "";
                vdfrm.detailModelNm.value = "";
                vdfrm.mdyrBegin.value     = "";
                vdfrm.mdyrEnd.value       = "";
                vdfrm.useAt.value         = "Y";
            });


		    // 세부모델 검색 input search
            $("#searchVhcleDetailModelForm input").on("keyup change", function(key){

                if(key.keyCode == 13){

                	vhcleDetailTable.search(this.value).draw();
                }
            });

		    // 세부모델 검색 select search
            $("#searchVhcleDetailModelForm select").on("change", function(key){

                vhcleDetailTable.search(this.value).draw();
            });


		});
		// end ready

    </script>

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Default Modal</h4>
            </div>
            <div class="modal-body">
                <p>111111111111</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
