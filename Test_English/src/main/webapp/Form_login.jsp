<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>DoTest</title>

        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/Form_login.css">
        
        
       <script src="./assets/js/confirmForm.js" defer></script>
    </head>

    <body>
        <div>
            <p class="title-login">Welcome you to DoTest!</p>
        </div>
        <div class="login-box">
            <h2>Login</h2>
            <form class="loginForm" name="login" action="Check_login" method="post" onsubmit="checkErrorLogin(event)">
                <div class="user-box">
                    <input class="inputInfor" name="username" type="text" placeholder="Please type username" value="" />
                    <label>Username</label>
                </div>

                <div class="user-box">
                    <input class="inputInfor" name="password" type="password" placeholder="Please type password"
                        value="" />
                    <label>Password</label>
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
                <p class="message">Not registered? <a href="Check_login?mod='register'" class="link">Create new
                        account.</a></p>
                <div id="errorInfor" class="label"></div>
            </form>
        </div>
    </body>

    </html>