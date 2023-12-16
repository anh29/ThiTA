<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>
    <% 
        ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray"); 
    %>
    <h3>Danh sách từ vựng tìm được</h3>

    <% if (!quizizzsArray.isEmpty()) { %>
        <table border=1 width=100%>
            <thead>
                <tr>
                    <th>Question</th>
                    <th>Answer A</th>
                    <th>Answer B</th>
                    <th>Answer C</th>
                    <th>Answer D</th>
                    <th>Answer </th>
                    <th>Explanation</th>
                </tr>
            </thead>
            <tbody>
                <% for (Quizizz quizizz : quizizzsArray) { %>
                    <tr>
                        <td><%= quizizz.getQuestion() %></td>
                        <td><%= quizizz.getAnswerA() %> </td>
                        <td><%= quizizz.getAnswerB()%></td>
                        <td><%= quizizz.getAnswerC() %></td>
                        <td><%= quizizz.getAnswerD() %></td>
                        <td><%= quizizz.getAnswer() %></td>
                        <td><%= quizizz.getExplaination() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p>Không có cau hoi nào được tìm thấy</p>
    <% } %>
    <a href="javascript:history.back()">Back</a>
    <h3><a href="CRUD_quizizz">Home page</a></h3>
</body>
</html>
