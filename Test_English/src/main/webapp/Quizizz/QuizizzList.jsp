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
        Object user_id = null;
        if (request.getAttribute("user_id") != null) {
            user_id = request.getAttribute("user_id");
        }        
        // Kiểm tra xem user_id có tồn tại không
        if (user_id != null) {
            // Lấy hoặc tạo một phiên
            HttpSession ss = request.getSession();
            
            // Đặt giá trị user_id vào phiên
            ss.setAttribute("user_id", user_id);
            
            // In ra thông báo hoặc thực hiện các hành động khác nếu cần thiết
            getServletContext().log("Đã đặt user_id vào phiên");
        } 
    %>
    <h3>Danh sách câu hỏi</h3>
    <form action="CRUD_quizizz?mod3=1" method="post">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Question</th>
                    <th>Answer</th>
                    <th>Update</th>
                   	<th>Select</th>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (Quizizz quizizz : quizizzsArray) { %>
                    <tr>                        
                        <td><%= index++ %></td>
                        <td><a href="CRUD_quizizz?quizizz_id=<%= quizizz.getQuizizzId()%>"><%= quizizz.getQuestion() %></a></td>
                        <td><%= quizizz.getAnswer() %></td>
                        <td><a href="CRUD_quizizz?mod2=1&&quizizz_id=<%= quizizz.getQuizizzId() %>">...</a></td>
                       	<td><input type="checkbox" name="quizizzId[]" value="<%= quizizz.getQuizizzId() %>"></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <input type="submit" value="Delete"/>
    </form>
       <h3><a href="CRUD_quizizz?mod1=1">Thêm câu hỏi</a></h3>
       <h3><a href="CRUD_quizizz?mod4=1">Tìm kiếm câu hỏi</a></h3>
       <h3><a href="CR_test">Danh sach de thi</a></h3>
</body>
</html>
