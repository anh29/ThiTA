<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Vocabulary" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>Chi tiet tu vung</h3>
<%
    Vocabulary vocabulary = (Vocabulary) request.getAttribute("vocabulary");
%>

    <%= vocabulary.getWord() %> <br>
    Definition: <%= vocabulary.getDefinition() %>  <br>
    pronunciation: <%= vocabulary.getPronunciation()%> <br>
    Speech: <%= vocabulary.getSpeech() %> <br>
    Synonyms:	<%= vocabulary.getSynonyms() %> <br>
    Antonyms:	<%= vocabulary.getAntonyms() %> <br>
    Examples:	<%= vocabulary.getExamples() %> <br>
    <br>
    <a href="javascript:history.back()">Back</a>
</body>
</html>