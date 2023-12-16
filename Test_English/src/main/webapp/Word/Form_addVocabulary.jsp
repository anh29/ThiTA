<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	Object user_id = request.getAttribute("user_id");
%>

	<form action="CRUD_vocabulary?mod1=1" method="post" name="f1" onsubmit="return checkForm()">
	    <table>
	        <th>Them từ vựng</th>
			
	        <tr>
	            <td><label for="word">Word</label></td>
	            <td><input type="text" name="word" id="word" /></td>
	        </tr>
	        <tr>
	            <td><label for="definition">Definition</label></td>
	            <td><input type="text" name="definition" id="definition" /></td>
	        </tr>
	        <tr>
	            <td><label for="pronunciation">Pronunciation</label></td>
	            <td><input type="text" name="pronunciation" id="pronunciation" /></td>
	        </tr>
	        <tr>
	            <td><label for="speech">Speech</label></td>
	            <td><input type="text" name="speech" id="speech" /></td>
	        </tr>
	        <tr>
	            <td><label for="synonyms">Synonyms</label></td>
	            <td><input type="text" name="synonyms" id="synonyms" /></td>
	        </tr>
	        <tr>
	            <td><label for="antonyms">Antonyms</label></td>
	            <td><input type="text" name="antonyms" id="antonyms" /></td>
	        </tr>
	        <tr>
	            <td><label for="examples">Examples</label></td>
	            <td><input type="text" name="examples" id="examples" /></td>
	        </tr>
	    </table>
	    <div class="btn">
	        <input type="submit" value="OK">
	        <input type="reset" value="Reset">
	    </div>
	</form>
	<span id="warning" style="display: none; color: red;"></span>
	<a href="javascript:history.back()">Back</a>
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