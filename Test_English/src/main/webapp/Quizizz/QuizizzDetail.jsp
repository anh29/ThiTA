<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chi tiết từ vựng</title>
</head>
<body>
<h3>Chi tiết từ vựng</h3>
<%
    Quizizz quizizz = (Quizizz) request.getAttribute("quizizz");
%>

    <%= quizizz.getQuizizzId() %> <br>
    Question: <%= quizizz.getQuestion() %>  <br>
    Answer A: <%= quizizz.getAnswerA() %> <br>
    Answer B: <%= quizizz.getAnswerB() %> <br>
    Answer C: <%= quizizz.getAnswerC() %> <br>
    Answer D: <%= quizizz.getAnswerD() %> <br>
    Correct Answer: <%= quizizz.getAnswer() %> <br>
    Explanation: <%= quizizz.getExplaination() %> <br>
    <br>
    <a href="javascript:history.back()">Back</a>
</body>
</html>
