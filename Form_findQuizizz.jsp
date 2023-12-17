<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Find Information</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px; /* Adjust the width as needed */
        }

        label {
            font-size: 18px;
            color: #333;
            margin-bottom: 6px;
            display: block;
            text-align: left;
        }

        .input-container {
            position: relative;
            margin-bottom: 12px;
        }

        .icon {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            font-size: 18px;
            color: #ccc;
            padding: 0 10px;
        }

        .icon-left {
            left: 10px;
        }

        .icon-right {
            right: 10px;
        }

        input[type="text"] {
            width: calc(100% - 32px);
            padding: 10px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
            font-size: 16px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        #warning {
            color: red;
            display: none;
            margin-top: 10px;
            font-size: 16px;
        }

        a {
            display: block;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s;
        }

        a:hover {
            color: #4CAF50;
        }
    </style>
</head>
<body>
    <form name="form1" action="CRUD_quizizz?mod4=1" onsubmit="return checkInput()" method="post">
        <label for="infor">Enter Information:</label>
        <div class="input-container">
            <span class="icon icon-left">&#128269;</span>
            <input type="text" name="infor" id="infor" placeholder="E.g., Quiz Name, ID, etc." required>
            <span class="icon icon-right">&#128247;</span>
        </div>
        <input type="submit" value="FIND">
        <span id="warning">Please enter information</span>
    </form>
    <a href="javascript:history.back()" class="back-link">&#9664; Go Back</a>
    
    <script>
        function checkInput() {
            var input = document.getElementById('infor').value.trim();
            if (input === '') {
                document.getElementById('warning').style.display = 'block';
                return false;
            } else {
                document.getElementById('warning').style.display = 'none';
                return true;
            }
        }
    </script>
</body>
</html>
