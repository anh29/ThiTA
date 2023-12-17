<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết từ vựng</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #3498db; /* Blue color */
            color: #fff; /* White text */
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        h3 {
            color: #fff; /* White text */
            font-size: 24px; /* Larger font size */
            margin-top: 20px;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 70%;
            background-color: #fff;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #333; /* Black text */
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        td.line {
            border-bottom: none; /* Remove bottom border for Field cells */
            white-space: nowrap; /* Prevent line break in Field content */
            width: 25%; /* 1/4 of the table width */
        }

        td.detail {
            width: 75%; /* 3/4 of the table width */
        }

        a {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h3>Chi tiết từ vựng</h3>
    <table>
        <tr>
            <th>Field</th>
            <th>Detail</th>
        </tr>
        <%-- <%
            Quizizz quizizz = (Quizizz) request.getAttribute("quizizz");
        %> --%>
        <tr>
            <td class="line">Question</td>
            <td class="detail"><%-- <%= quizizz.getQuestion() %> --%></td>
        </tr>
        <tr>
            <td class="line">Answer A</td>
            <td class="detail"><%-- <%= quizizz.getAnswer_a() %> --%></td>
        </tr>
        <tr>
            <td class="line">Answer B</td>
            <td class="detail"><%-- <%= quizizz.getAnswer_b() %> --%></td>
        </tr>
        <tr>
            <td class="line">Answer C</td>
            <td class="detail"><%-- <%= quizizz.getAnswer_c() %> --%></td>
        </tr>
        <tr>
            <td class="line">Answer D</td>
            <td class="detail"><%-- <%= quizizz.getAnswer_d() %> --%></td>
        </tr>
        <tr>
            <td class="line">Correct Answer</td>
            <td class="detail"><%-- <%= quizizz.getAnswer() %> --%></td>
        </tr>
        <tr>
            <td class="line">Explanation</td>
            <td class="detail"><%-- <%= quizizz.getExplaination() %>  --%></td>
        </tr>
    </table>
    <a href="javascript:history.back()">← Back</a>
</body>
</html>
