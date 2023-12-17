<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.bean.Quizizz" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Do Quizizz</title>
    <script>
    	function updateStudentAnswer(questionId) {
	        var userAnswerInput = document.querySelector('input[name="userAnswers_' + questionId + '"]:checked');
	        var userAnswer = userAnswerInput ? userAnswerInput.value : 'null';
	        document.getElementById('studentAnswer_' + questionId).value = userAnswer;
	    }
        function checkAnswers(event) {
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
                resultsHTML += '<p>CorrectAnsser: ' + correctAnswer + '</p>';
                if (explanation !== 'null') {
                    resultsHTML += '<p>' + explanation + '</p>';
                }
            });
            document.getElementById("submitTestButton").style.display = "inline";
            document.getElementById("checkTestButton").style.display = "none";
            resultDiv.innerHTML = resultsHTML;
        }
    </script>
</head>
<body>
    <% 
        ArrayList<Quizizz> quizizzsArray = (ArrayList<Quizizz>) request.getAttribute("quizizzsArray"); 
    	HttpSession ss = request.getSession();
    	Integer user_id = (Integer) ss.getAttribute("user_id");
    	Object test_id = request.getAttribute("test_id");
    %>

    <h3>Thực hiện bài thi</h3>
    <form id="quizForm" action="CR_recordTest?mod1=1" method="post">
	    <input type="hidden" name="test_id" value="<% out.print(test_id); %>"/>
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
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerA() %>" onclick="updateStudentAnswer('<%= quizizz.getQuizizzId() %>')"/> <%= quizizz.getAnswerA() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerB() %>" onclick="updateStudentAnswer('<%= quizizz.getQuizizzId() %>')"/> <%= quizizz.getAnswerB() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerC() %>" onclick="updateStudentAnswer('<%= quizizz.getQuizizzId() %>')"/> <%= quizizz.getAnswerC() %></td>
                        <td><input type="radio" name="userAnswers_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswerD() %>" onclick="updateStudentAnswer('<%= quizizz.getQuizizzId() %>')"/> <%= quizizz.getAnswerD() %></td>
                        
                        <input type="hidden" name="questionIds" value="<%= quizizz.getQuizizzId() %>"/>
                        <input type="hidden" name="studentAnswers" id="studentAnswer_<%= quizizz.getQuizizzId() %>" value=""/>
                        <input type="hidden" name="questionAnswer_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getAnswer() %>"/>
                        <input type="hidden" name="questionExp_<%= quizizz.getQuizizzId() %>" value="<%= quizizz.getExplaination() %>"/>
                    </tr>
                <% } %>
            </tbody>
        </table>
        <br>
        <div id="result"></div>
		<input type="button" id="submitTestButton" value="Submit Test" onclick="submitForm()" style="display:none;" />
		<input type="button" id="checkTestButton" value="Check Answers" onclick="checkAnswers()" />
    </form>

    
</body>
<script>
    function submitForm() {
        // Add any additional logic you need before submitting the form
        document.getElementById("quizForm").submit();
    }
</script>
</html>