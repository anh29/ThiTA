<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quizizz List</title>
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
            width: 90%; /* Adjusted width */
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

        td a {
            color: #3498db; /* Blue color for links */
            text-decoration: none;
            font-weight: bold;
        }

        td a:hover {
            color: #21618c; /* Darker blue on hover */
        }

        input[type="submit"] {
            margin: 20px 0;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h3>Danh sách câu hỏi</h3>
    <form action="CRUD_quizizz?mod3=1" method="post">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Question</th>
                    <th>Answer</th>
                    <th>Update</th>
                    <th>Select</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td><a href="CRUD_quizizz?quizizz_id=1">Sample Question 1</a></td>
                    <td>Sample Answer</td>
                    <td><a href="CRUD_quizizz?mod2=1&&quizizz_id=1">...</a></td>
                    <td><input type="checkbox" name="quizizzId[]" value="1"></td>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>

        <input type="submit" value="Delete"/>

    </form>

    <h3>2. <a href="CRUD_quizizz?mod1=1">Thêm câu hỏi</a></h3>
    <h3>3. <a href="CRUD_quizizz?mod4=1">Tìm kiếm câu hỏi</a></h3>
</body>
</html>
