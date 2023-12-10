<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <% 
        Object user_id = request.getAttribute("user_id");
    %>
    <form name="form1" action="CRUD_vocabulary?mod4=1&&user_id=<%= user_id.toString() %>" onsubmit="return checkInput()" method="post">
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