<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Vocabulary" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vocabulary List</title>
    

        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/home.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        
        <script src="./assets/js/home.js" defer></script>
        <script src="./assets/js/modal.js" defer></script>
        
</head>
<body>
	<% 
        ArrayList<Vocabulary> vocabularysArray = (ArrayList<Vocabulary>) request.getAttribute("vocabularysArray"); 
        Object user_id = request.getAttribute("user_id");
        
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
    <div id="navigation">
    	<div class = "center">
    	<a class="<%= request.getParameter("mod3") != null ? "active" : "" %>" href="CRUD_vocabulary?mod3=1">Danh sách từ vựng</a>
        <a class="<%= request.getParameter("mod1") != null ? "active" : "" %>" href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a>
        <a class="<%= request.getParameter("mod4") != null ? "active" : "" %>" href="#">Tìm kiếm từ vựng</a>
        <a class="<%= request.getParameter("mod5") != null ? "active" : "" %>" href="CR_test">Danh sách đề thi</a>
    	</div>    
    </div>

    <div id="content" >
        <div class="head">
        	<h3>Danh sách từ vựng</h3>
	        <input type="submit" value="Delete"/>	
        </div>
        
        <% if (vocabularysArray.size() > 1) {%>
        
	        <div class="wrapper">
        <form action="CRUD_vocabulary?mod3=1" method="post">
			    <i id="left" class="fa-solid fa-angle-left"></i>
			    <ul class="carousel">
		             <%int index = 1; for (Vocabulary vocabulary : vocabularysArray) { %>
		             <li class="card">
				        <input type="checkbox" name="vocabularyId[]" value="<%= vocabulary.getWordId() %>">
				        <div class="img">
				            <div class="word"><%= vocabulary.getWord() %></div>
				            <div class="word"><%= vocabulary.getPronunciation() %></div>
				        </div>
				        <h2 class="desc"><%= vocabulary.getDefinition() %></h2>
				        <div class="opt">
				            <span><a href="CRUD_vocabulary?mod2=1&&word_id=<%= vocabulary.getWordId() %>">Update</a></span>
				            <span><a href="CRUD_vocabulary?word_id=<%= vocabulary.getWordId()%>">View</a></span>
				        </div>
				    </li>
		             <% } %>
		        </ul>
				<i id="right" class="fa-solid fa-angle-right"></i>
        </form>
			</div>
        <% } %>
    </div>

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
