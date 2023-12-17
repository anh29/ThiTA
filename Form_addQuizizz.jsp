<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
            max-width: 500px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 15px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
            font-size: 14px;
        }

        th {
            background-color: #4CAF50;
            color: white;
            font-size: 16px;
            font-weight: bold;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        input[type="text"], textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 16px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
            font-size: 14px;
        }

        .btn {
            text-align: right;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 5px;
            font-size: 14px;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #45a049;
        }

        #warning {
            color: red;
            display: none;
        }
    </style>
</head>
<body>

<form action="CRUD_quizizz?mod1=1" method="post" name="f1" onsubmit="return checkForm()">
    <table>
        <thead>
            <tr>
                <th>Thêm câu hỏi</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><label for="question">Question</label></td>
                <td><textarea type="text" name="question" id="question" required></textarea></td>
            </tr>
            <tr>
                <td><label for="answer_a">Answer A</label></td>
                <td><input type="text" name="answer_a" id="answer_a" required /></td>
            </tr>
            <tr>
                <td><label for="answer_b">Answer B</label></td>
                <td><input type="text" name="answer_b" id="answer_b" required /></td>
            </tr>
            <tr>
                <td><label for="answer_c">Answer C</label></td>
                <td><input type="text" name="answer_c" id="answer_c" required /></td>
            </tr>
            <tr>
                <td><label for="answer_d">Answer D</label></td>
                <td><input type="text" name="answer_d" id="answer_d" required /></td>
            </tr>
            <tr>
                <td><label for="answer">Correct Answer</label></td>
                <td><input type="text" name="answer" id="answer" required /></td>
            </tr>
            <tr>
                <td><label for="explaination">Explanation</label></td>
                <td><textarea type="text" name="explaination" id="explaination" required ></textarea></td>
            </tr>
        </tbody>
    </table>
    <div class="btn">
        <input type="submit" value="OK">
        <input type="reset" value="Reset">
    </div>
</form>
    <span id="warning" style="display: none; color: red;"></span>
</body>
	<script>
		<%-- var idList = <%= (idList) %>;
		console.log(idList);
		function checkId() {
		    var idInput = document.forms.f1.id.value;
		    var warningInfo = document.getElementById("warning");
		    
		    for (var i = 0; i < idList.length; i++) {
		        if (idList[i].toString() === idInput) {
		            warningInfo.innerText = "ID đã tồn tại";
		            warningInfo.style.display = "block";
		            return false;
		        }
		    }
		    
		    warningInfo.style.display = "none";
		    return true;
		} --%>
	
	    function checkForm() {
	        var idInput = document.forms.f1.id.value;
	        var nameInput = document.forms.f1.name.value;
	        var ageInput = document.forms.f1.age.value;
	        var universityInput = document.forms.f1.university.value;
	        var warningInfo = document.getElementById("warning");
	
	        if (idInput === "" || nameInput === "" || ageInput === "" || universityInput === "") {
	            warningInfo.innerText = "Vui lòng điền đầy đủ thông tin";
	            warningInfo.style.display = "block";
	            return false;
	        } else {
	            warningInfo.style.display = "none";
	            return true;
	        }
	    }
	</script>
</html>