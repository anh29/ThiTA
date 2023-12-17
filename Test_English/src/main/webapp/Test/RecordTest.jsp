
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.RecordTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
</head>
<body>
    <% 
        ArrayList<RecordTest> RecordTestsArray = (ArrayList<RecordTest>) request.getAttribute("RecordTestsArray"); 
        HttpSession ss = request.getSession();
        Integer user_id = (Integer) ss.getAttribute("user_id");
    %>
    <h3>Lịch sử bài làm</h3>

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Thời gian</th>
                    <th>Đề</th>
                    <th>Chi tiết</th>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (RecordTest recordTest : RecordTestsArray) { %>
                    <tr>
                        <td><%= index++ %></td>
                        <td><%= recordTest.getWordDay() %></td>
                        <td><%= recordTest.getNameTest() %></td>
                        <td><a href="CR_recordTest?day=<%= recordTest.getWordDay() %>">...</a></td>
                        <%-- <td><a href="CRUD_vocabulary?mod2=1&&word_id=<%= vocabulary.getWordId() %>">...</a></td>
                        <td><input type="checkbox" name="vocabularyId[]" value="<%= vocabulary.getWordId() %>"></td> --%>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <a href="javascript:history.back()">Back</a>
    <%-- Kiểm tra giá trị session và hiển thị phần của trang web nếu cần --%>
    <% if (user_id != null && user_id == 1) { %>
        <h3><a href="CR_test?mod1=1">Thêm de thi</a></h3>
    <% } %>
    <h3><a href="CR_recordTest">Ket qua bai lam</a></h3>
</body>
</html>
