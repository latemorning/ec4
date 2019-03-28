<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	    <script type="text/javascript">
		    $(document).ready(function () {
			    // 모달 닫힐때 초기화
			    $('#modal-warning').on('hidden.bs.modal', function (event) {

			        $(this).find(".modal-body p").text("");
			    });
		    });
	    </script>


        <footer class="main-footer">
            <div class="pull-right hidden-xs">
            <b>Version</b> 2.4.0
            </div>
            <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights reserved.
        </footer>
