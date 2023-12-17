<%@page import="models.bean.Vocabulary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update vocabulary</title>


        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/addVoc.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
       <script src="./assets/js/confirmForm.js" defer></script>
        <script src="./assets/js/model.js" defer></script>
</head>
<body>
<%
    Vocabulary vocabulary = (Vocabulary) request.getAttribute("vocabulary");
%>
<div id="navigation">
    	<div class = "center">
    	<a class="<%= request.getParameter("mod3") != null ? "active" : "" %>" href="CRUD_vocabulary?mod3=1">Danh sách từ vựng</a>
        <a class="<%= request.getParameter("mod1") != null ? "active" : "" %>" href="CRUD_vocabulary?mod1=1">Thêm từ vựng</a>
        <a class="<%= request.getParameter("mod4") != null ? "active" : "" %>" href="#">Tìm kiếm từ vựng</a>
        <a class="<%= request.getParameter("mod5") != null ? "active" : "" %>" href="CR_test">Danh sách đề thi</a>
    	</div>    
    </div>
    <form action="CRUD_vocabulary?mod2=update" method="post" name="f1" onsubmit="return checkFormAdd(event)" class="form-container">
        <table class="custom-table">
            <tr>
                <td><label for=""  class="form-label">Word_id</label></td>
                <td>
                    <input type="text" name="word_id"  class="form-input" value="<%= vocabulary.getWordId()%>" readonly >
                </td>
            </tr>
            <tr>
                <td><label for="" class="form-label">Word</label></td>
                <td>
                <input type="text" name="word" class="form-input"  value= "<%= vocabulary.getWord()%>">
                </td>
            </tr>
            <tr>
                <td><label for="" class="form-label">Definition</label></td>
                <td>
                <input type="text" name="definition"  class="form-input" value= "<%= vocabulary.getDefinition()%>">
                </td>
            </tr>
            <tr>
                <td><label for="" class="form-label">Pronunciation</label></td>
                <td>
                <input type="text" name="pronunciation" class="form-input"  value="<%= vocabulary.getPronunciation() %>">

                </td>
            </tr>
            <tr>
                <td><label for="" class="form-label">Speech</label></td>
                <td>
                <input type="text" name="speech" class="form-input"  value="<%= vocabulary.getSpeech()%>">
                </td>
            </tr>
                        <tr>
                <td><label for="" class="form-label">Synonyms</label></td>
                <td>
                <input type="text" name="Synonyms" class="form-input"  value="<%= vocabulary.getSynonyms()%>">
                </td>
            </tr>
                        <tr>
                <td><label for="" class="form-label">Antonyms</label></td>
                <td>
                <input type="text" name="antonyms" class="form-input"  value="<%= vocabulary.getAntonyms()%>">
                </td>
            </tr>
                        <tr>
                <td><label for="" class="form-label">Examples</label></td>
                <td>
                <input type="text" name="examples" class="form-input"  value="<%= vocabulary.getExamples()%>">
                </td>
                <input type="text" name="user_id" value="<%= vocabulary.getUserId()%>" hidden>
               
            </tr>
        </table>
            <span id="warning" class="hidden-warning">May our journey be filled with love and words!</span>
        <div class="btn-container">
            <input type="reset" value="Reset">
            <input type="submit" value="OK">
        </div>
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