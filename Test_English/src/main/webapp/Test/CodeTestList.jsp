<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.CodeTest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CodeTest List</title>
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/codeTest.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        <script src="./assets/js/modal.js" defer></script>
</head>
<body>
    <% 
        ArrayList<CodeTest> CodeTestsArray = (ArrayList<CodeTest>) request.getAttribute("CodeTestsArray"); 
        HttpSession ss = request.getSession();
        Integer user_id = (Integer) ss.getAttribute("user_id");
    %>
    <div id="navigation">
    	<div class = "center">
    	<a class="<%= request.getParameter("mod3") != null ? "active" : "" %>" href="CRUD_vocabulary?mod3=1">Danh sách từ vựng</a>
        <a class="<%= request.getParameter("mod1") != null ? "active" : "" %>" href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a>
        <a class="<%= request.getParameter("mod4") != null ? "active" : "" %>" href="#">Tìm kiếm từ vựng</a>
        <a class="<%= request.getParameter("mod5") != null ? "active" : "" %>" href="CR_test">Danh sách đề thi</a>
    	</div>    
    </div>
    
    <main>
        <form action="CRUD_vocabulary?mod3=1" method="post">
            <table>
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>De Thi</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% int index = 1; for (CodeTest codeTest : CodeTestsArray) { %>
                        <tr>
                            <td><%= index++ %></td>
                            <td><%= codeTest.getName() %></td>
                            <td><a href="CR_test?ID_test=<%= codeTest.getId() %>">Do test</a></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </form>
    </main>

    <% if (user_id != null && user_id == 1) { %>
        <h3><a href="CR_test?mod1=1">Thêm de thi</a></h3>
    <% } %>
    
    
    	<!-- Modal -->
	<div id="searchModal" class="modal">
	  <div class="modal-content">
	    <span class="close" onclick="closeModal()">&times;</span>
	    <form name="form1" action="CRUD_vocabulary?mod4=1" id="searchForm" method="post" onsubmit="submitSearch()">
	      <label for="searchInput">Nhập từ cần tìm:</label>
	      <input type="text" id="infor" name="infor" required>
	      <input type="submit" value="Find">
	    </form>
	  </div>
	</div>
    
</body>
</html>
