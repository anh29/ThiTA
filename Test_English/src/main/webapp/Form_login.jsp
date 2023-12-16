<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
    function checkError(event) {
        var username = document.login.username.value;
        var password = document.login.password.value;
        var errorInfor = document.login.errorInfor;

        if (username === "" && password === "") {
            errorInfor.value = "Bạn hãy nhập đầy đủ thông tin";
            return false;
        } else if (username === "") {
            errorInfor.value = "Bạn hãy nhập username";
            return false;
        } else if (password === "") {
            errorInfor.value = "Bạn hãy nhập password";
            return false;
        } else {
            errorInfor.value = "";
        }
        return true;
    }
</script>

<body>
    <form class="loginForm" name="login" action="Check_login" method="post"
        onsubmit="return checkError(event)">
        <h3>Đăng nhập hệ thống</h3>
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
        </table>
        <div class="btn_form">
            <button type="submit" class="btn_submit" name="b1">OK</button>
            <button type="reset" class="btn_reset">Huỷ</button>
        </div>
        <input disabled style="border: 0; color:red;" class="label" name="errorInfor" value="" />
        <a href="Check_login?mod='register'" >Dang ki</a>
    </form>
</body>

</html>