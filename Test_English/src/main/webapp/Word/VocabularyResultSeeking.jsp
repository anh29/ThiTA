<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="models.bean.Vocabulary" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
</head>
<body>
    <% 
        ArrayList<Vocabulary> vocabularysArray = (ArrayList<Vocabulary>) request.getAttribute("vocabularysArray"); 
    %>
    <h3>Danh sách từ vựng tìm được</h3>

    <% if (!vocabularysArray.isEmpty()) { %>
        <table border=1 width=100%>
            <thead>
                <tr>
                    <th>Word</th>
                    <th>Definition</th>
                    <th>Pronunciation</th>
                    <th>Speech</th>
                    <th>Synonyms</th>
                    <th>Antonyms</th>
                    <th>Examples</th>
                </tr>
            </thead>
            <tbody>
                <% for (Vocabulary vocabulary : vocabularysArray) { %>
                    <tr>
                        <td><%= vocabulary.getWord() %></td>
                        <td><%= vocabulary.getDefinition() %> </td>
                        <td><%= vocabulary.getPronunciation()%></td>
                        <td><%= vocabulary.getSpeech() %></td>
                        <td><%= vocabulary.getSynonyms() %></td>
                        <td><%= vocabulary.getAntonyms() %></td>
                        <td><%= vocabulary.getExamples() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <p>Không có từ vựng nào được tìm thấy</p>
    <% } %>
    <a href="javascript:history.back()">Back</a>
    <h3><a href="CRUD_vocabulary">Home page</a></h3>
</body>
</html>