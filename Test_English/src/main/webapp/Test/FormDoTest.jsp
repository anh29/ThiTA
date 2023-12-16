<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quizizz List</title>
</head>
<body>
    <% 
        ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray"); 
        // Object user_id = null;
        // if (request.getAttribute("user_id") != null) {
        //     user_id = request.getAttribute("user_id");
        // }        
        // // Kiểm tra xem user_id có tồn tại không
        // if (user_id != null) {
        //     // Lấy hoặc tạo một phiên
        //     HttpSession ss = request.getSession();
            
        //     // Đặt giá trị user_id vào phiên
        //     ss.setAttribute("user_id", user_id);
            
        //     // In ra thông báo hoặc thực hiện các hành động khác nếu cần thiết
        //     getServletContext().log("Đã đặt user_id vào phiên");
        // } 
    %>
    <h3>Danh sách câu hỏi</h3>
    <form action="CRUD_quizizz?mod3=1" method="post">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Question</th>
                    <th>AnswerA</th>
                    <th>AnswerB</th>
                    <th>AnswerC</th>
                    <th>AnswerD</th>
                    <th>Answer</th>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (Quizizz quizizz : quizizzsArray) { %>
                    <tr>                        
                        <td><%= index++ %></td>
                        <td><%= quizizz.getQuestion() %></td>
                        <td><%= quizizz.getAnswerA() %></td>
                        <td><%= quizizz.getAnswerB() %></td>
                        <td><%= quizizz.getAnswerC() %></td>
                        <td><%= quizizz.getAnswerD() %></td>
                        <td><%= quizizz.getAnswer() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <%-- <% if (user_id != null && user_id.equals(1)) { %> --%>
        <%-- <input type="submit" value="Delete"/> --%>
        <%-- <% } %> --%>
    </form>
    <%-- <% if (user_id != null && user_id.equals(1)) { %>
        <h3>2. <a href="CRUD_quizizz?mod1=1">Thêm câu hỏi</a></h3>
        <h3>3. <a href="CRUD_quizizz?mod4=1">Tìm kiếm câu hỏi</a></h3>
    <% } %> --%>
</body>
</html>
