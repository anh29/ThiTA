<%@page import="models.bean.Quizizz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Quizizz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        form {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        label {
            font-weight: bold;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            margin-bottom: 16px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }

        .btn {
            text-align: right;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #45a049;
        }

        a {
            display: inline-block;
            margin-top: 10px;
            color: #4CAF50;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<%-- <%
    Quizizz quizizz = (Quizizz) request.getAttribute("quizizz");
%> --%>
    <form action="CRUD_quizizz?mod2=update" method="post">
        <table>
            <thead>
                <tr>
                    <th colspan="2">Update Quizizz</th>
                </tr>
            </thead>
            <tbody>
            	<tr>
                    <td><label for="quizizz_id">Quizizz ID</label></td>
                    <td>
                        <input type="text" name="quizizz_id" value="<%-- <%= quizizz.getQuizizz_id()%> --%>" readonly>
                    </td>
                </tr>
            	<tr>
               	 	<td><label for="question">Question</label></td>
                	<td>
                    	<textarea name="question"><%-- <%= quizizz.getQuestion()%> --%></textarea>
                	</td>
            </tr>
            <tr>
                <td><label for="answer_a">Answer A</label></td>
                <td>
                    <input type="text" name="answer_a" value="<%-- <%= quizizz.getAnswer_a()%> --%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer_b">Answer B</label></td>
                <td>
                    <input type="text" name="answer_b" value="<%-- <%= quizizz.getAnswer_b()%> --%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer_c">Answer C</label></td>
                <td>
                    <input type="text" name="answer_c" value="<%-- <%= quizizz.getAnswer_c()%> --%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer_d">Answer D</label></td>
                <td>
                    <input type="text" name="answer_d" value="<%-- <%= quizizz.getAnswer_d()%> --%>">
                </td>
            </tr>
            <tr>
                <td><label for="answer">Correct Answer</label></td>
                <td>
                    <input type="text" name="answer" value="<%-- <%= quizizz.getAnswer()%> --%>">
                </td>
            </tr>
            <tr>
                <td><label for="explaination">Explanation</label></td>
                <td>
                    <textarea name="explaination"><%-- <%= quizizz.getExplaination()%> --%></textarea>
                </td>
            </tr>
         	</tbody>
        </table>
        <div class="btn">
            <input type="submit" value="OK">
            <input type="reset" value="Reset">
        </div>
    </form>
    <a href="javascript:history.back()">Back</a>
</body>
</html>