<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.CodeTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
</head>
<body>
    <% 
        ArrayList<CodeTest> CodeTestsArray = (ArrayList<CodeTest>) request.getAttribute("CodeTestsArray"); 
        HttpSession ss = request.getSession();
        Integer user_id = (Integer) ss.getAttribute("user_id");
    %>
    <h3>Thư viện đề thi</h3>
    <form action="CRUD_vocabulary?mod3=1" method="post">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>De Thi</th>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (CodeTest codeTest : CodeTestsArray) { %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= codeTest.getName() %></td>
                        <td><a href="CR_test?ID_test=<%= codeTest.getId() %>">Do test</a></td>
                        <%-- <td><a href="CRUD_vocabulary?mod2=1&&word_id=<%= vocabulary.getWordId() %>">...</a></td>
                        <td><input type="checkbox" name="vocabularyId[]" value="<%= vocabulary.getWordId() %>"></td> --%>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </form>
    <a href="javascript:history.back()">Back</a>
    <%-- Kiểm tra giá trị session và hiển thị phần của trang web nếu cần --%>
    <% if (user_id != null && user_id == 1) { %>
        <h3><a href="CR_test?mod1=1">Thêm de thi</a></h3>
    <% } %>
    
</body>
</html>
