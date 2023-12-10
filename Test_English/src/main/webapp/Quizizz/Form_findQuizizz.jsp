<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form name="form1" action="CRUD_quizizz?mod4=1" onsubmit="return checkInput()" method="post">
        <input type="text" name="infor" id="infor">
        <input type="submit" value="FIND">
        <span id="warning" style="display: none; color: red;">Hãy nhập thông tin</span>
    </form>
    <a href="javascript:history.back()">Back</a>

    <script>
        function checkInput() {
            var inputValue = document.getElementById("infor").value;
            if (inputValue === "") {
                document.getElementById("warning").style.display = "block";
                return false;
            }
            return true;
        }
    </script>
</body>
</html>