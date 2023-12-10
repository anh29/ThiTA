<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quizizz List</title>
</head>
<body>
    <% 
        ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray"); 
        Object user_id = null;
        if (request.getAttribute("user_id") != null) {
            user_id = request.getAttribute("user_id");
        }
    %>
    <h3>Danh sách câu hỏi</h3>
    <form action="CRUD_quizizz?mod3=1" method="post">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Question</th>
                    <th>Answer</th>
                    <% if (user_id != null && user_id.equals(1)) { %>
                        <th>Update</th>
                    	<th>Select</th>
                    <% } %>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (Quizizz quizizz : quizizzsArray) { %>
                    <tr>
                        
                        <td><%= index++ %></td>
                        <td><a href="CRUD_quizizz?quizizz_id=<%= quizizz.getQuizizzId()%>"><%= quizizz.getQuestion() %></a></td>
                        <td><%= quizizz.getAnswer() %></td>
                        <% if (user_id != null && user_id.equals(1)) { %>
                            <td><a href="CRUD_quizizz?mod2=1&&quizizz_id=<%= quizizz.getQuizizzId() %>">...</a></td>
                        	<td><input type="checkbox" name="quizizzId[]" value="<%= quizizz.getQuizizzId() %>"></td>
                        <% } %>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <% if (user_id != null && user_id.equals(1)) { %>
        <input type="submit" value="Delete"/>
        <% } %>
    </form>
    <% if (user_id != null && user_id.equals(1)) { %>
        <h3>2. <a href="CRUD_quizizz?mod1=1">Thêm câu hỏi</a></h3>
        <h3>3. <a href="CRUD_quizizz?mod4=1">Tìm kiếm câu hỏi</a></h3>
    <% } %>
</body>
</html>