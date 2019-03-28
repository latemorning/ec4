<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<script type="text/javascript">

	    var loginId = "${loginVO.id}";
	    var curMenuNo = "${leftMenuVO.menuNo}";

	    $(document).ready(function(){

	    	if(loginId){

		        $.ajax({
		            type: "POST",
		            url: "/ec4LeftJson.do",
		            //data: $params,
		            dataType: "json",
		            //async: true,
		            success: function(data, status) {

		            	// 정적 객체 선언
		            	var $upperMenuId2 = '';  // 상위메뉴 2레벨처리
		            	var $upperMenuId3 = '';  // 상위메뉴 3레벨처리   4레벨 있을경우 else if로 4레벨 처리만 추가해주면 됨
		            	var $angle_span = $("<span>").addClass("pull-right-container").append($("<i>").addClass("fa fa-angle-left pull-right"));

		                var $treeviewMenu = $("<ul>").addClass("treeview-menu");

		                $(data.leftMenus).each(function(listKey, listValue) {

		                	if(data.leftMenus[listKey].level == '2'){  // 2레벨 처리

		                		var $upperMenu = $("#upperMenu" + data.leftMenus[listKey].upperMenuId);

		                		// 상위메뉴가 바뀌었을때만 실행
		                		if(data.leftMenus[listKey].upperMenuId != $upperMenuId2){

		                			$upperMenu.addClass("treeview");
		                			$upperMenu.find("a").append($angle_span.clone());
		                			$upperMenu.append($treeviewMenu.clone());
		                		}

		                		var $subIcon = $("<i>").addClass("fa fa-circle-o");
		                		var $subLink = $("<a>").attr("href", data.leftMenus[listKey].chkURL+"?menuNo="+data.leftMenus[listKey].menuNo).append($subIcon);
		                		$subIcon.after(data.leftMenus[listKey].menuNm);

		                		var $subMenu = $("<li>").attr("id", "upperMenu"+data.leftMenus[listKey].menuNo).append($subLink);
		                		if(data.leftMenus[listKey].menuNo == curMenuNo){
		                			$subMenu.addClass("active");
		                		}

		                		$upperMenu.find("ul.treeview-menu:first").append($subMenu);

		                		// 이전 상위메뉴 저장
                                $upperMenuId2 = data.leftMenus[listKey].upperMenuId;

		                    }else if(data.leftMenus[listKey].level == '3'){ // 3레벨 처리

		                    	var $upperMenu = $("#upperMenu" + data.leftMenus[listKey].upperMenuId);

                                // 상위메뉴가 바뀌었을때만 실행
                                if(data.leftMenus[listKey].upperMenuId != $upperMenuId3){

                                	$upperMenu.addClass("treeview");
                                	$upperMenu.find("a").append($angle_span.clone());
                                	$upperMenu.append($treeviewMenu.clone());
                                }

                                var $subIcon = $("<i>").addClass("fa fa-circle-o");
                                var $subLink = $("<a>").attr("href", data.leftMenus[listKey].chkURL+"?menuNo="+data.leftMenus[listKey].menuNo).append($subIcon);
                                $subIcon.after(data.leftMenus[listKey].menuNm);

                                var $subMenu = $("<li>").attr("id", "upperMenu"+data.leftMenus[listKey].menuNo).append($subLink);
                                if(data.leftMenus[listKey].menuNo == curMenuNo){
                                    $subMenu.addClass("active");
                                }

                                $upperMenu.find("ul.treeview-menu:first").append($subMenu);

                                // 이전 상위메뉴 저장
                                $upperMenuId3 = data.leftMenus[listKey].upperMenuId;
		                    }

		                });
		            },
		            error: function(request, status, error) {

		                alert("error" + error);
		            },
		            complete: function() {

		            	$("li.active").parents("li.treeview").addClass("active menu-open");
		            }
		        });

	    	}

	    });
	</script>

	<!-- Left side column. contains the sidebar -->
	<aside class="main-sidebar">
	  <!-- sidebar: style can be found in sidebar.less -->
	  <section class="sidebar">
	    <!-- Sidebar user panel -->
	    <div class="user-panel">
	      <div class="pull-left image">
	        <img src="/resource/adminLTE/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
	      </div>
	      <div class="pull-left info">
	        <p>${loginVO.name}</p>
	        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
	      </div>
	    </div>
	    <!-- search form -->
	    <form action="#" method="get" class="sidebar-form">
	      <div class="input-group">
	        <input type="text" name="q" class="form-control" placeholder="Search...">
	        <span class="input-group-btn">
	              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	              </button>
	            </span>
	      </div>
	    </form>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li><c:forEach var="menuItem" items="${leftMenuVO.leftMenus}" varStatus="status"><c:if test="${menuItem.level eq '1'}">
            <li id="upperMenu${menuItem.menuNo}"><c:choose><c:when test="${empty menuItem.chkURL or menuItem.chkURL eq 'dir'}">
                <a href="#"></c:when><c:otherwise>
                        <a href="${menuItem.chkURL}?menuNo=${menuItem.menuNo}"></c:otherwise></c:choose>
                    <i class="fa fa-th"></i> <span>${menuItem.menuNm}</span>
                </a>
            </li></c:if></c:forEach>
	  </section>
	  <!-- /.sidebar -->
	</aside>
