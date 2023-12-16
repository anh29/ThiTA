<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	ArrayList<String> listUsername = (ArrayList<String>) request.getAttribute("listUsername");
    ArrayList<String> listEmail = (ArrayList<String>) request.getAttribute("listEmail");
    String jsonListUsername = "[\"" + String.join("\",\"", listUsername) + "\"]";
    String jsonListEmail = "[\"" + String.join("\",\"", listEmail) + "\"]";
%>

<body>
    <form class="loginForm" name="register" action="Check_login" method="post"
        onsubmit="return checkError(event) && checkInfor()">
        <h3>Đăng kí thông tin</h3>
        <table>
            <tr>
                <td><label>Tên đăng nhập</label></td>
                <td>
                    <input class="inputInfor" name="username" type="text" placeholder="Please type username" value="" />
                </td>
            </tr>
            <tr>
                <td><label>Mật khẩu</label></td>
                <td>
                    <input class="inputInfor" name="password" type="password" placeholder="Please type password"
                        value="" />
                </td>
            </tr>
            <tr>
                <td><label>Xác nhận mật khẩu</label></td>
                <td>
                    <input class="inputInfor" name="confirm_password" type="password" placeholder="Please type password"
                        value="" />
                </td>
            </tr>
            <tr>
                <td><label>Email</label></td>
                <td>
                    <input class="inputInfor" name="email" type="email" placeholder="Please type email"
                        value="" />
                </td>
            </tr>
        </table>
        <div class="btn_form">
            <button type="submit" class="btn_submit" name="b1">OK</button>
            <button type="reset" class="btn_reset">Huỷ</button>
        </div>
        <input disabled style="border: 0; color:red; width:200px;" class="label" name="errorInfor" value="" />
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
	        }
	    }
        for (var i = 0; i < listEmail.length; i++) {
	        if (listEmail[i].toString() === email) {
	            errorInfor.value = "Email đã tồn tại";
	            return false;
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
            return false;
        } else if (username === "") {
            errorInfor.value = "Bạn hãy nhập tên đăng nhập";
            return false;
        } else if (password === "") {
            errorInfor.value = "Bạn hãy nhập mật khẩu";
            return false;
        } else if (confirm_password === "") {
            errorInfor.value = "Bạn hãy xác nhận mật khẩu";
            return false;
        } else if (email === "") {
            errorInfor.value = "Bạn hãy nhập email";
            return false;
        } else {
            errorInfor.value = "";
        }
        if(username.length < 6) {
           	errorInfor.value = "Tên đăng nhập phải nhiều hơn 6 kí tự";
           	return false;
        }
        if(password.length < 6) {
           	errorInfor.value = "Mật khẩu phải nhiều hơn 6 kí tự";
           	return false;
        }
       	if (password !== confirm_password) {
           	errorInfor.value = "Xác nhận mật khẩu chưa trùng";
           	return false;
       	}       
       
        return true;
    }
</script>

</html>