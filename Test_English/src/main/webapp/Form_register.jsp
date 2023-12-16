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
                                    onsubmit="checkError(event) && checkInfor()">
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
                                    <div id="errorInfor" class="label"></div>
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
                                        event.preventDefault();
                                        errorInfor.value = "Tên đăng nhập đã tồn tại";

                                    }
                                }
                                for (var i = 0; i < listEmail.length; i++) {
                                    if (listEmail[i].toString() === email) {
                                        event.preventDefault();
                                        errorInfor.value = "Email đã tồn tại";

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
                                    event.preventDefault();
                                    errorInfor.value = "Bạn hãy nhập đầy đủ thông tin";

                                } else if (username === "") {
                                    event.preventDefault();
                                    errorInfor.value = "Bạn hãy nhập tên đăng nhập";

                                } else if (password === "") {
                                    event.preventDefault();
                                    errorInfor.value = "Bạn hãy nhập mật khẩu";

                                } else if (confirm_password === "") {
                                    event.preventDefault();
                                    errorInfor.value = "Bạn hãy xác nhận mật khẩu";

                                } else if (email === "") {
                                    event.preventDefault();
                                    errorInfor.value = "Bạn hãy nhập email";

                                } else {
                                    errorInfor.value = "";
                                }
                                if (username.length < 6) {
                                    event.preventDefault();
                                    errorInfor.value = "Tên đăng nhập phải nhiều hơn 6 kí tự";

                                }
                                if (password.length < 6) {
                                    event.preventDefault();
                                    errorInfor.value = "Mật khẩu phải nhiều hơn 6 kí tự";

                                }
                                if (password !== confirm_password) {
                                    event.preventDefault();
                                    errorInfor.value = "Xác nhận mật khẩu chưa trùng";

                                }

                                return true;
                            }
                        </script>

        </html>