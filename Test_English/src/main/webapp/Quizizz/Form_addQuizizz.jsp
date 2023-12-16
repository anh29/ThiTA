<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<form action="CRUD_quizizz?mod1=1" method="post" name="f1" onsubmit="return checkForm()">
        <table>
            <th>Thêm câu hỏi</th>

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
                <td><label for="explaination">Explaination</label></td>
                <td><textarea type="text" name="explaination" id="explaination" required ></textarea></td>
            </tr>
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