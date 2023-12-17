<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Vocabulary" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Vocabulary</title>
    
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/detailVoc.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        <script src="./assets/js/modal.js" defer></script>
</head>
<body>
<div id="navigation">
    	<div class = "center">
    	<a class="<%= request.getParameter("mod3") != null ? "active" : "" %>" href="CRUD_vocabulary?mod3=1">Danh sách từ vựng</a>
        <a class="<%= request.getParameter("mod1") != null ? "active" : "" %>" href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a>
        <a class="<%= request.getParameter("mod4") != null ? "active" : "" %>" href="#">Tìm kiếm từ vựng</a>
        <a class="<%= request.getParameter("mod5") != null ? "active" : "" %>" href="CR_test">Danh sách đề thi</a>
    	</div>    
    </div>
    
    <div id="content">
        <%
            Vocabulary vocabulary = (Vocabulary) request.getAttribute("vocabulary");
        %>

        <label>Word:</label> <%= vocabulary.getWord() %> <br>
        <label>Definition:</label>
        <p class="long-text"><%= vocabulary.getDefinition() %></p>

        <label>Pronunciation:</label> <%= vocabulary.getPronunciation()%> <br>
        <label>Speech:</label> <%= vocabulary.getSpeech() %> <br>
        <label>Synonyms:</label> <%= vocabulary.getSynonyms() %> <br>
        <label>Antonyms:</label> <%= vocabulary.getAntonyms() %> <br>

        <label>Examples:</label>
        <p class="long-text"><%= vocabulary.getExamples() %></p>

        <hr>
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
