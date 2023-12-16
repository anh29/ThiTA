<%@page import="models.bean.Vocabulary"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Vocabulary vocabulary = (Vocabulary) request.getAttribute("vocabulary");
%>
    <form action="CRUD_vocabulary?mod2=update" method="post">
        <table>
            <th>Cap nhat Sinh Vien</th>
            <tr>
                <td><label for="">Word_id</label></td>
                <td>
                    <input type="text" name="word_id" value="<%= vocabulary.getWordId()%>" readonly >
                </td>
            </tr>
            <tr>
                <td><label for="">Word</label></td>
                <td>
                <input type="text" name="word" value= "<%= vocabulary.getWord()%>">
                </td>
            </tr>
            <tr>
                <td><label for="">Definition</label></td>
                <td>
                <input type="text" name="definition" value= "<%= vocabulary.getDefinition()%>">
                </td>
            </tr>
            <tr>
                <td><label for="">Pronunciation</label></td>
                <td>
                <input type="text" name="pronunciation" value="<%= vocabulary.getPronunciation() %>">

                </td>
            </tr>
            <tr>
                <td><label for="">Speech</label></td>
                <td>
                <input type="text" name="speech" value="<%= vocabulary.getSpeech()%>">
                </td>
            </tr>
                        <tr>
                <td><label for="">Synonyms</label></td>
                <td>
                <input type="text" name="Synonyms" value="<%= vocabulary.getSynonyms()%>">
                </td>
            </tr>
                        <tr>
                <td><label for="">Antonyms</label></td>
                <td>
                <input type="text" name="antonyms" value="<%= vocabulary.getAntonyms()%>">
                </td>
            </tr>
                        <tr>
                <td><label for="">Examples</label></td>
                <td>
                <input type="text" name="examples" value="<%= vocabulary.getExamples()%>">
                </td>
                <td>
                <input type="text" name="user_id" value="<%= vocabulary.getUserId()%>" hidden>
                </td>
            </tr>
        </table>
        <div class="btn">
            <input type="submit" value="OK">
            <input type="reset" value="Reset">
        </div>
    </form>
    <a href="javascript:history.back()">Back</a>
</body>
</html>