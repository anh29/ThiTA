<%@page import="models.bean.Quizizz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Quizizz</title>
</head>
<body>
<%
    Quizizz quizizz = (Quizizz) request.getAttribute("quizizz");
%>
    <form action="CRUD_quizizz?mod2=update" method="post">
        <table>
            <th>Update Quizizz</th>
            <tr>
                <td><label for="quizizz_id">Quizizz ID</label></td>
                <td>
                    <input type="text" name="quizizz_id" value="<%= quizizz.getQuizizzId()%>" readonly>
                </td>
            </tr>
            <tr>
                <td><label for="question">Question</label></td>
                <td>
                    <textarea name="question"><%= quizizz.getQuestion()%></textarea>
                </td>
            </tr>
            <tr>
                <td><label for="answer_a">Answer A</label></td>
                <td>
                    <input type="text" name="answer_a" value="<%= quizizz.getAnswerA()%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer_b">Answer B</label></td>
                <td>
                    <input type="text" name="answer_b" value="<%= quizizz.getAnswerB()%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer_c">Answer C</label></td>
                <td>
                    <input type="text" name="answer_c" value="<%= quizizz.getAnswerC()%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer_d">Answer D</label></td>
                <td>
                    <input type="text" name="answer_d" value="<%= quizizz.getAnswerD()%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer">Correct Answer</label></td>
                <td>
                    <input type="text" name="answer" value="<%= quizizz.getAnswer()%>">
                </td>
            </tr>
            <tr>
                <td><label for="explaination">Explanation</label></td>
                <td>
                    <textarea name="explaination"><%= quizizz.getExplaination()%></textarea>
                </td>
            </tr>
         
        </table>
        <div class="btn">
            <input type="submit" value="OK">
            <input type="reset" value="Reset">
        </div>
    </form>
    <a href="javascript:history.back()">Back</a>
</body>
</html>
