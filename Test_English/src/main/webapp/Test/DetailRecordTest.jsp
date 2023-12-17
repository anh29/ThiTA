<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.RecordTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
</head>
<body>
    <% 
        ArrayList<RecordTest> recordTestsArray = (ArrayList<RecordTest>) request.getAttribute("RecordTestsArray"); 
        HttpSession ss = request.getSession();
        Integer user_id = (Integer) ss.getAttribute("user_id");
    %>
    <h3>Lịch sử bài làm</h3>

    <table border="1" width="100%">
        <thead>
            <tr>
                <th>STT</th>
                <th>Test Name</th>
                <th>Question</th>
                <th>Correct Answer</th>
                <th>Student Answer</th>
                <th>Word Day</th>
            </tr>
        </thead>
        <tbody>
            <%int index = 1; for (RecordTest recordTest : recordTestsArray) { %>
                <tr>
                    <td><%= index++ %></td>
                    <td><%= recordTest.getNameTest() %></td>
                    <td><%= recordTest.getQuestion() %></td>
                    <td><%= recordTest.getCorrectAnswer() %></td>
                    <td><%= recordTest.getStudentAnswer() %></td>
                    <td><%= recordTest.getWordDay() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <a href="javascript:history.back()">Back</a>
</body>
</html>