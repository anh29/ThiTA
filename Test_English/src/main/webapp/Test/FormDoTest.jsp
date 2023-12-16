<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Do Quizizz</title>
    <script>
        function logData(event) {
            var formData = new FormData(document.getElementById("quizForm"));
            var questionIds = document.querySelectorAll('input[name^="questionIds"]');
            var resultDiv = document.getElementById("result");
            var resultsHTML = "";

            questionIds.forEach(function (questionIdInput) {
                var questionId = questionIdInput.value;
                var userAnswer = formData.get('userAnswers_' + questionId);
                var correctAnswer = formData.get('questionAnswer_' + questionId);
                var explanation = formData.get('questionExp_' + questionId);
                
                formData.set('userAnswers_' + questionId, userAnswer || 'null');

                var result = (userAnswer === correctAnswer) ? 'Correct' : 'Incorrect';
                resultsHTML += '<p>Question ' + questionId + ': ' + result + '</p>';
                if (explanation !== 'null') {
                    resultsHTML += '<p>' + explanation + '</p>';
                }
            });

            resultDiv.innerHTML = resultsHTML;
            event.preventDefault;
        }
    </script>
</head>
<body>
    <% 
        ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray"); 
    %>
    <h3>Thực hiện bài thi</h3>
    <form id="quizForm" onsubmit="logData(event); return false;">

        <table border="1" width="100%">
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Question</th>
                    <th>AnswerA</th>
                    <th>AnswerB</th>
                    <th>AnswerC</th>
                    <th>AnswerD</th>
                </tr>
            </thead>
            <tbody>
                <%int index = 1; for (Quizizz quizizz : quizizzsArray) { %>
                    <tr>                        
                        <td><%= index++ %></td>
                        <td><%= quizizz.getQuestion() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerA() %>" /> <%= quizizz.getAnswerA() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerB() %>" /> <%= quizizz.getAnswerB() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerC() %>" /> <%= quizizz.getAnswerC() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerD() %>" /> <%= quizizz.getAnswerD() %></td>
                        
                        <input type="hidden" name="questionIds" value="<%= quizizz.getQuizizzId() %>"/>
                        <input type="hidden" name="questionAnswer_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswer() %>"/>
                        <input type="hidden" name="questionExp_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getExplaination() %>"/>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <br>
        <input type="submit" value="Submit Test"/>
        <div id="result"></div>
    </form>
</body>
</html>
