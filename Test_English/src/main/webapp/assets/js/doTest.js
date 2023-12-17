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