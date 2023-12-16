<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
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

    <% if (user_id != null && user_id.equals(1)) { %>
    	<h3>1. <a href="CRUD_quizizz?mod3=1">Danh sách câu hỏi</a></h3>
        <h3>2. <a href="CRUD_quizizz?mod1=1">Thêm câu hỏi</a></h3>
        <h3>3. <a href="CRUD_quizizz?mod4=1">Tìm kiếm câu hỏi</a></h3>
    <% } %>
</body>
</html>
