<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add vocabulary</title>
    
    
        <link rel="stylesheet" href="./assets/css/reset.css">
        <link rel="stylesheet" href="./assets/css/nav.css">
        <link rel="stylesheet" href="./assets/css/addVoc.css">
        <link rel="stylesheet" href="./assets/css/modal.css">
        
       <script src="./assets/js/confirmForm.js" defer></script>
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

    <form action="CRUD_vocabulary?mod1=1" method="post" name="f1" onsubmit="return checkFormAdd(event)" class="form-container">
        <table class="custom-table">
            <tr>
                <td><label for="word" class="form-label">Word</label></td>
                <td><input type="text" name="word" id="word" class="form-input" /></td>
            </tr>
            <tr>
                <td><label for="definition" class="form-label">Definition</label></td>
                <td><input type="text" name="definition" id="definition" class="form-input" /></td>
            </tr>
            <tr>
                <td><label for="pronunciation" class="form-label">Pronunciation</label></td>
                <td><input type="text" name="pronunciation" id="pronunciation" class="form-input" /></td>
            </tr>
            <tr>
                <td><label for="speech" class="form-label">Speech</label></td>
                <td><input type="text" name="speech" id="speech" class="form-input" /></td>
            </tr>
            <tr>
                <td><label for="synonyms" class="form-label">Synonyms</label></td>
                <td><input type="text" name="synonyms" id="synonyms" class="form-input" /></td>
            </tr>
            <tr>
                <td><label for="antonyms" class="form-label">Antonyms</label></td>
                <td><input type="text" name="antonyms" id="antonyms" class="form-input" /></td>
            </tr>
            <tr>
                <td><label for="examples" class="form-label">Examples</label></td>
                <td><input type="text" name="examples" id="examples" class="form-input" /></td>
            </tr>
        </table>
            <span id="warning" class="hidden-warning">May our journey be filled with love and words!</span>
        <div class="btn-container">
            <input type="reset" value="Reset All">
            <input type="submit" value="Ok">
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
