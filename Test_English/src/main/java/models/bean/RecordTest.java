package models.bean;

public class RecordTest {
    private int recordId;
    private int testId;
    private int studentId;
    private int quizizzId;
    private String studentAnswer;
    private String wordDay;

    // thuộc tính thêm này dùng để show
    private String question;
    private String correctAnswer;
    private String nameTest;

    public int getRecordId() {
        return recordId;
    }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public int getTestId() {
        return testId;
    }

    public void setTestId(int testId) {
        this.testId = testId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getQuizizzId() {
        return quizizzId;
    }

    public void setQuizizzId(int quizizzId) {
        this.quizizzId = quizizzId;
    }

    public String getStudentAnswer() {
        return studentAnswer;
    }

    public void setStudentAnswer(String studentAnswer) {
        this.studentAnswer = studentAnswer;
    }

    public String getWordDay() {
        return wordDay;
    }

    public void setWordDay(String wordDay) {
        this.wordDay = wordDay;
    }

    // Getter for 'question'
    public String getQuestion() {
        return question;
    }

    // Setter for 'question'
    public void setQuestion(String question) {
        this.question = question;
    }

    // Getter for 'correctAnswer'
    public String getCorrectAnswer() {
        return correctAnswer;
    }

    // Setter for 'correctAnswer'
    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public String getNameTest() {
        return nameTest;
    }

    public void setNameTest(String nameTest) {
        this.nameTest = nameTest;
    }
}
