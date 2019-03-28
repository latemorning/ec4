<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
 /**
  * @Class Name : EC4CnsltntMng.java
  * @Description : EC4CnsltntMng POP 화면
  * @Modification Information
  * @
  * @  수정일                     수정자                    수정내용
  * @ -------       --------    ---------------------------
  * @ 2018.09.19    최재중       최초 생성
  *
  *  @author 최재중
  *  @since 2018.09.19
  *  @version 1.0
  *  @see
  *
  */
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>상담원조회</title>
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

    <!-- ################ 사용자 정의 ################################ -->
    <link rel="stylesheet" type="text/css" href="/css/egovframework/ec4/cmm/ec4common.css">

	<!-- ec4 common -->
	<script src="/js/egovframework/ec4/cmm/ec4common.js"></script>
    


<script type="text/javaScript" language="javascript" defer="defer">
var listCnsltntTable;
$(document).ready(function(){
    $(".sidebar-menu").tree();
	searchInfo();
	
	/* $('#listCnsltntTable').onDblClick(function() {
	//$('#listCnsltntTable').onCellDoubleClicked(function() {
        alert("xxxxxxxxxxxxxxxxxxxxxxxx");
    }); */
    
    
	/* $('#listCnsltntTable').dblclick(function(e, dt, type, indexes){
      alert("vvv=888888888888888======ccccvvvvvvvvvvv");
      var rowData = vhcleTable.rows(indexes).data();
      alert(rowData);
	}); */

    // 팝업조회
    $(".btnSearch").click(function(){
    	listCnsltntTable.search(this.value).draw();
    });
	

});


	function searchInfo(){

        // 테이블
        listCnsltntTable = $('#listCnsltntTable').DataTable({
            "language": lang_kor,
            "select": {
                "style": "single"
            },
            "rowId": "cnsltntCd",
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
            "sAjaxSource": "/ec4/call/cnslt/cnsltntMngList.do",
            "onCellDoubleClicked": function(){
            	alert("sssssssssssssssssssss11111111111111");
            },
            "fnServerParams": function(aoData){
                aoData.push(
                        {"name": "userNm", "value": $("#searchCnsltntForm input[name=searchCnsltUserNm]").val()},
                        {"name": "brthdy", "value": $("#searchCnsltntForm input[name=searchBirthDay]").val()},
                        {"name": "hpno", "value": $("#searchCnsltntForm input[name=searchHpNo]").val()},
                        {"name": "emailAdres", "value": $("#searchCnsltntForm input[name=searchEmail]").val()},
                        {"name": "scNm", "value": $("#searchCnsltntForm input[name=searchScNm]").val()},
                        {"name": "houseAdres", "value": $("#searchCnsltntForm input[name=searchAddr]").val()}
                );
            },
            "sServerMethod": "POST",
            "columnDefs": [
                {"visible": false, "targets": [0]},
                {"orderable": true, "targets": [1]}
            ],
            "columns": [
            	{"data":"esntlId"},
                {"data":"emplyrId"},
                {"data":"emplNo" , "defaultContent" : ""},
                {"data":"userNm" , "defaultContent" : ""},
                {"data":"mbtlnum" , "defaultContent" : ""},
                {"data":"brthdy" , "defaultContent" : ""},
                {"data":"emailAdres" , "defaultContent" : ""},
                {"data":"houseAdres" , "defaultContent" : ""},
                {"data":"detailAdres" , "defaultContent" : ""}
            ]
        });

        
        
        $('#listCnsltntTable tbody').on('dblclick', 'tr', function () {
        	var idx = $(this).index();
        	var rowData = listCnsltntTable.rows(idx).data();

        	var homeAddress = rowData[0].houseAdres;
        	if(rowData[0].detailAdres != null && rowData[0].detailAdres != "" ){
        		homeAddress += " "+rowData[0].detailAdres;
        	}


			if("" != "${cnsltntMngVO.popupNm}" && null != "${cnsltntMngVO.popupNm}"){
				opener.$("#${cnsltntMngVO.popupNm} input[name=cnsltUserId]").val(rowData[0].esntlId);
				opener.$("#${cnsltntMngVO.popupNm} input[name=cnsltUserNm]").val(rowData[0].userNm);
				opener.$("#${cnsltntMngVO.popupNm} input[name=hpno]").val(rowData[0].mbtlnum);
				opener.$("#${cnsltntMngVO.popupNm} input[name=emailAdres]").val(rowData[0].emailAdres);
				opener.$("#${cnsltntMngVO.popupNm} input[name=adres]").val(rowData[0].houseAdres);
				opener.$("#${cnsltntMngVO.popupNm} input[name=detailAdres]").val(rowData[0].detailAdres);
			}else{
	        	opener.$("#searchCnsltUserId").val(rowData[0].esntlId);
	        	opener.$("#searchCnsltUserNm").val(rowData[0].userNm);
	        	opener.$("#searchHpno").val(rowData[0].mbtlnum);
	        	
	        	opener.$("#searchEmplyrId").val(rowData[0].emplyrId);
	        	opener.$("#searchUserNm").val(rowData[0].userNm);
	        	opener.$("#searchMbtlnum").val(rowData[0].mbtlnum);
	        	opener.$("#searchEmailAdres").val(rowData[0].emailAdres);
	        	opener.$("#searchHomeAdres").val(homeAddress);
	        	opener.$("#searchHouseAdres").val(rowData[0].houseAdres);
	        	opener.$("#searchDetailAdres").val(rowData[0].detailAdres);
			}

        	//try{opener.cnsltntSearch();}catch(e){alert("Main화면을 확인하세요.");return;}
        	opener.cnsltntSearch(rowData[0].cnsltntCd);
        	self.close();
        } );



	}
</script>
</head>
<body class="hold-transition skin-blue sidebar-mini">




<!-- Main content -->
    <section class="content">
    
    
    
    
		<!-- ############################# 검색조건 ######################  -->
		<div class="row">
            <div class="col-md-12">
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                    	<h3 class="box-title">검색</h3>
		                <div class="box-tools pull-right">
		                	<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
		                </div>
                    </div>
                    <!-- /.box-header -->
             

					<form name="searchCnsltntForm" id="searchCnsltntForm" method="post" onsubmit="return false;">
                    <div class="box-body">
                    <form class="form-horizontal">
                            <div class="form-group">
                                <label for="searchCnsltUserNm" class="col-sm-2 control-label">상담원명</label>
                                <div class="col-sm-2">
	                                <input type="text" name="searchCnsltUserNm" class="form-control" id="searchCnsltUserNm" value="${cnsltntMngVO.cnsltUserNm}"/>
                                </div>
                                
                                <label for="searchBirthDay" class="col-sm-2 control-label">생년월일</label>
                                <div class="col-sm-2">
	                                <input type="text" name="searchBirthDay" class="form-control" id="searchBirthDay" value="${cnsltntMngVO.brthdy}"/>
                                </div>
                                
                                <label for="searchHpNo" class="col-sm-2 control-label">핸드폰</label>
                                <div class="col-sm-2">
	                                <input type="text" name="searchHpNo" class="form-control" id="searchHpNo" value="${cnsltntMngVO.hpno}"/>
                                </div>
						  	</div>
                            
                            <div class="form-group">
                                <label for="searchCallType" class="col-sm-2 control-label">애메일</label>
                                <div class="col-sm-2">
                                    <input type="text" name="searchEmail" class="form-control" id="searchEmail" value="${cnsltntMngVO.emailAdres}"/>
                                </div>
                                <label for="searchCallKnd" class="col-sm-2 control-label">담당SC</label>
                                <div class="col-sm-2">
                                	<select class="form-control">
                                		<option>홍길동</option>
                                		<option>이승기</option>
                                		<option>만수르</option>
                                	</select>
                                </div>
                                <label for="searchCallType" class="col-sm-2 control-label">주소</label>
                                <div class="col-sm-2">
                                    <input type="text" name="searchAddr" class="form-control" id="searchAddr"/>
                                </div>
						  	</div>
                    </form>
                    </div>
                    <!-- /.box-body THE END -->
                    </form>
                    

					<!-- 조회, 등록, 삭제 버튼 -->
                    <div class="box-footer text-right">
                        <button type="button" class="btn btn-info btnSearch"> 조회</button>
                        <!-- <button type="button" class="btn btn-primary"> 등록</button>
                        <button type="button" class="btn btn-warning"> 삭제</button> -->
                    </div>
                    
                </div>
                <!-- <<<<<<<< box THE END -->
            
            </div>
        </div>


	    <!-- ############################# 메인화면 ######################  -->
      	<div class="row">
        	<div class="col-xs-12"> <!-- DIV 가로영역을 나누는 용도 -->
            
            	<!-- >>>>>>>>>>>> box START -->
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title" style="margin-top:5px;padding-top:5px;float:left;">리스트</h3>
                        <div class="box-tools">
                               &nbsp;
                               <!-- <button type="button" class="btn btn-info"> 액셀</button> -->
                        </div>
                    </div>
                    <!-- /.box-header -->

                    <div class="box-body no-padding" style="height:750px;">
				          <table id="listCnsltntTable" class="table table-hover">
				            <thead>
				              <tr>
				                <th>상담원PK</th>
				                <th>상담원ID</th>
				                <th>사번</th>
				                <th>상담원명</th>
				                <th>핸드폰번호</th>
				                <th>생년월일</th>
				                <th>이메일</th>
				                <th>주소</th>
				                <th>상세주소</th>
				              </tr>
				            </thead>
				          </table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- <<<<<<<< box THE END -->
            
        	</div>
		</div>
      <!-- /.row -->
      
      
      
      
      
      
      
      
      	<div class="row">
        	<div class="col-md-12"> <!-- DIV 가로영역을 나누는 용도 -->
			
        	</div>
      </div>
      <!-- /.row -->








    </section>
    <!-- /.content -->




</body>
</html>
