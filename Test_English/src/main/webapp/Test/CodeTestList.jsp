<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.CodeTest" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
</head>
<body>
    <% 
        ArrayList<CodeTest> CodeTestsArray = (ArrayList<CodeTest>) request.getAttribute("CodeTestsArray"); 
        Object user_id = request.getAttribute("user_id");
        
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
    <h3>Thư viện đề thi</h3>
    <form action="CRUD_vocabulary?mod3=1" method="post">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>De Thi</th>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (CodeTest codeTest : CodeTestsArray) { %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><a href="CR_test?ID_test=<%= codeTest.getId() %>"><%= codeTest.getName() %></a></td>
                        <%-- <td><a href="CRUD_vocabulary?mod2=1&&word_id=<%= vocabulary.getWordId() %>">...</a></td>
                        <td><input type="checkbox" name="vocabularyId[]" value="<%= vocabulary.getWordId() %>"></td> --%>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </form>
    <%-- <h3><a href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a></h3>
    <h3><a href="CRUD_vocabulary?mod4=1">Tìm kiếm từ vựng</a></h3>
	<h3><a href="CR_test">Danh sach de thi</a></h3> --%>
</body>
</html>
