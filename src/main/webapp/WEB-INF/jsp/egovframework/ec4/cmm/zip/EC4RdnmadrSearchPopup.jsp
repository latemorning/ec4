<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script type="text/javascript" src="http://10.83.1.119:8983/app/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="http://10.83.1.119:8983/app/js/jquery-ui-1.12.1.min.js"></script>
<script type="text/javascript" src="http://10.83.1.119:8983/app/js/rns.search-1.0.min.js"></script>

<title>Juso Search Sample - Basic</title>

<script>
var rnsSearch = new rnsSearch({
    searchServerUrl : "http://10.83.1.119:8983",
    width : 500,
    height : 500,
    oncomplete : function(data) {
        $(opener.location).attr("href", "javascript:fn_setJuso(" + JSON.stringify(data) + ");");
    },
}).open({
});
</script>
</head>
<body>
</body>
</html>