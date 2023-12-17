<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Do test</title>
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/doTest.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        <script src="./assets/js/modal.js" defer></script>
        <script src="./assets/js/doTest.js" defer></script>
        
</head>
<body>
    <% 
        ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray"); 
    %>
    
    <div id="navigation">
    	<div class = "center">
    	<a class="<%= request.getParameter("mod3") != null ? "active" : "" %>" href="CRUD_vocabulary?mod3=1">Danh sách từ vựng</a>
        <a class="<%= request.getParameter("mod1") != null ? "active" : "" %>" href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a>
        <a class="<%= request.getParameter("mod4") != null ? "active" : "" %>" href="#">Tìm kiếm từ vựng</a>
        <a class="<%= request.getParameter("mod5") != null ? "active" : "" %>" href="CR_test">Danh sách đề thi</a>
    	</div>    
    </div>
    
    <form id="quizForm" action="CR_recordTest?mod1=1" onsubmit="logData(event)">
        <ol>
            <% int index = 1; for (Quizizz quizizz : quizizzsArray) { %>
                <li>
                    <p><%= quizizz.getQuestion() %></p>
                    <ul>
                        <li>
                            <input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerA() %>" id="ans_<%= index %>A">
                            <label for="ans_<%= index %>A"><%= quizizz.getAnswerA() %></label>
                        </li>
                        <li>
                            <input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerB() %>" id="ans_<%= index %>B">
                            <label for="ans_<%= index %>B"><%= quizizz.getAnswerB() %></label>
                        </li>
                        <li>
                            <input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerC() %>" id="ans_<%= index %>C">
                            <label for="ans_<%= index %>C"><%= quizizz.getAnswerC() %></label>
                        </li>
                        <li>
                            <input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerD() %>" id="ans_<%= index %>D">
                            <label for="ans_<%= index %>D"><%= quizizz.getAnswerD() %></label>
                        </li>
                    </ul>
                </li>
                <input type="hidden" name="questionIds" value="<%= quizizz.getQuizizzId() %>"/>
                <input type="hidden" name="questionAnswer_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswer() %>"/>
                <input type="hidden" name="questionExp_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getExplaination() %>"/>
            <% index++; } %>
        </ol>
        <br>
        <input type="submit" value="Submit Test"/>
        <div id="result"></div>
    </form>
    
     
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
