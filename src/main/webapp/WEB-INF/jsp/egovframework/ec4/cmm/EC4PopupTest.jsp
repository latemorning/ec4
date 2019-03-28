<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Popup Test</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/Ionicons/css/ionicons.min.css">

    <!-- DataTables -->
    <link rel="stylesheet" href="/resource/adminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

    <!-- Theme style -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="/resource/adminLTE/dist/css/skins/_all-skins.min.css">
    <!-- dataTable select -->
    <link href="https://cdn.datatables.net/select/1.2.1/css/select.dataTables.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">

    <!-- jQuery 3 -->
    <script src="/resource/adminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="/resource/adminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- DataTables -->
    <script src="/resource/adminLTE/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="/resource/adminLTE/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <!-- SlimScroll -->
    <script src="/resource/adminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="/resource/adminLTE/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="/resource/adminLTE/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="/resource/adminLTE/dist/js/demo.js"></script>
    <!-- dataTable select -->
    <script src="https://cdn.datatables.net/select/1.2.1/js/dataTables.select.min.js"></script>

    <!-- ec4 common -->
    <script src="/js/egovframework/ec4/cmm/ec4common.js"></script>

    <script>

    $(document).ready(function () {

        // 테이블
        var testTable = $('#testTable').DataTable({
            "language": lang_kor,
            "select": {
                "style": "${searchVO.selectStyle}"
            },
            "rowId": "code",
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
            "sAjaxSource": "/ec4/cmm/ec4PopupTestList.do",
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "searchCodeNm", "value": $("#searchTestForm input[name=searchCodeNm]").val()}
                );
            },
            "sServerMethod": "POST",
            "columnDefs": [
                {"visible": false, "targets": [0]},
                {"orderable": false, "targets": [0]}
            ],
            "columns": [
                {"data":"codeId"},
                {"data":"code"},
                {"data":"codeNm"}
            ]
        });


        // 모델 선택
        testTable.on("select", function (e, dt, type, indexes) {

        	//var rowData = testTable.rows(indexes).data();

        	//var rowData = testTable.rows(".selected").data();


        	//alert(rowData.length);

        	//populateForm(rowData);


        }).on("deselect", function (e, dt, type, indexes) {


        });




        // 선택버튼
        $("#btnSelectDetail").click(function(){

        	var rowData = testTable.rows(".selected").data();

        	populateForm(rowData);
        });




    });
    // end ready



    function populateForm(rowData){

    	var oResult = [];

    	for(var i=0 ; i<rowData.length ; i++){

    		oResult.push({
    			value: rowData[i].code,
    			label: rowData[i].codeNm
    		});
    	}

        callbackToMainWindow(oResult);

        return false;
    }


    function callbackToMainWindow(oResult)
    {
        var path, callback;

        path = "${searchVO.callbackClass}";

        callbackOpener = window.opener;

        callback = callbackOpener[path];

        var value = JSON.stringify(oResult);


        if(callback){

            callback(value);
        }

        window.close();
    }


    </script>
</head>

<body>

    <div class="row">
        <div class="col-xs-12">

            <!-- Default box -->
            <div class="box box-solid">
                <div class="box-header with-border">
                    <h3 class="box-title">차종선택팝업</h3>
                </div>
                <div class="box-body">

                            <table id="testTable" class="table table-bordered table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th>코드ID</th>
                                        <th>코드</th>
                                        <th>코드명</th>
                                    </tr>
                                </thead>
                            </table>

                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    <button type="button" id="btnSelectDetail" class="btn btn-primary btn-sm pull-right">선택</button>
                </div>
                <!-- /.box-footer-->
            </div>
            <!-- /.box -->

        </div>
    </div>

</body>
</html>
