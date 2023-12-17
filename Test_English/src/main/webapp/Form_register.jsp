<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>DoTest</title>

    <link rel="stylesheet" href="./assets/css/reset.css">
    <link rel="stylesheet" href="./assets/css/Form_login.css">
</head>
<% ArrayList<String> listUsername = (ArrayList<String>) request.getAttribute("listUsername");
    ArrayList<String> listEmail = (ArrayList<String>) request.getAttribute("listEmail");
String jsonListUsername = "[\"" + String.join("\",\"", listUsername) + "\"]";
String jsonListEmail = "[\"" + String.join("\",\"", listEmail) + "\"]";
%>

<body>
<div>
    <p class="title-login">Welcome you to DoTest!</p>
</div>
<div class="login-box">
    <h2>Register</h2>
<form class="loginForm" name="register" action="Check_login" method="post"
    onsubmit="return checkError(event) && checkInfor()">
    <div class="user-box">
        <input class="inputInfor" name="username" type="text"
            placeholder="Please type username" value="" />
        <label>Username</label>
    </div>
    <div class="user-box">
        <input class="inputInfor" name="password" type="password"
            placeholder="Please type password" value="" />
        <label>Password</label>
    </div>
    <div class="user-box">
        <input class="inputInfor" name="confirm_password" type="password"
            placeholder="Please type password again" value="" />
        <label>Confirm password</label>
    </div>
    <div class="user-box">
        <input class="inputInfor" name="email" type="email"
            placeholder="Please type email" value="" />
        <label>Email</label>
    </div>
    <div class="btn_form user-box">
        <button type="submit" class="btn_submit btnSubmit" name="b1">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            Submit
        </button>
    </div>  
        
    <p class="message">You already had account? <a href="Form_login.jsp" class="link">Login here.</a></p>
   
    <input id="errorInfor" class="label" name="errorInfor" value="" />
</form>
     
                
</body>           
<script>
	// Convert JSON-like strings to JavaScript arrays
	var listUsername = <%= jsonListUsername %>;
	console.log("List of Usernames:", listUsername);
	
	var listEmail = <%= jsonListEmail %>;
	console.log("List of Emails:", listEmail);
	function checkInfor() {
        var username = document.register.username.value;
        var email = document.register.email.value;
        var errorInfor = document.register.errorInfor;
	    
	    for (var i = 0; i < listUsername.length; i++) {
	        if (listUsername[i].toString() === username) {
	            errorInfor.value = "Tên đăng nhập đã tồn tại";
	            return false;
event.preventDefault(); 
	        }
	    }
        for (var i = 0; i < listEmail.length; i++) {
	        if (listEmail[i].toString() === email) {
	            errorInfor.value = "Email đã tồn tại";
	            return false;
event.preventDefault(); 
	        }
	    }
	    return true;
	}
    function checkError(event) {
        var username = document.register.username.value;
        var password = document.register.password.value;
        var confirm_password = document.register.confirm_password.value;
        var email = document.register.email.value;
        var errorInfor = document.register.errorInfor;
		
     
        if (username === "" && password === "" && confirm_password === "" && email === "") {
            errorInfor.value = "Bạn hãy nhập đầy đủ thông tin";
			event.preventDefault(); 
            return false;
        } else if (username === "") {
            errorInfor.value = "Bạn hãy nhập tên đăng nhập";
			event.preventDefault(); 
            return false;
        } else if (password === "") {
            errorInfor.value = "Bạn hãy nhập mật khẩu";
			event.preventDefault(); 
            return false;
        } else if (confirm_password === "") {
            errorInfor.value = "Bạn hãy xác nhận mật khẩu";
			event.preventDefault(); 
            return false;
        } else if (email === "") {
            errorInfor.value = "Bạn hãy nhập email";
			event.preventDefault(); 
            return false;
        } else {
            errorInfor.value = "";
        }
        if(username.length < 6) {
           	errorInfor.value = "Tên đăng nhập phải nhiều hơn 6 kí tự";
			event.preventDefault(); 
           	return false;
        }
        if(password.length < 6) {
           	errorInfor.value = "Mật khẩu phải nhiều hơn 6 kí tự";
			event.preventDefault(); 
           	return false;
        }
       	if (password !== confirm_password) {
           	errorInfor.value = "Xác nhận mật khẩu chưa trùng";
			event.preventDefault(); 
           	return false;
       	}       
       
        return true;
    }
</script>

        
</html>