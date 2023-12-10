package models.bean;

public class Quizizz {
    private int quizizz_id;
    private String question;
    private String answer_a;
    private String answer_b;
    private String answer_c;
    private String answer_d;
    private String answer;
    private String explaination;

    // Getter methods
    public int getQuizizzId() {
        return quizizz_id;
    }

    public String getQuestion() {
        return question;
    }

    public String getAnswerA() {
        return answer_a;
    }

    public String getAnswerB() {
        return answer_b;
    }

    public String getAnswerC() {
        return answer_c;
    }

    public String getAnswerD() {
        return answer_d;
    }

    public String getAnswer() {
        return answer;
    }

    public String getExplaination() {
        return explaination;
    }

    // Setter methods
    public void setQuizizzId(int quizizzId) {
        this.quizizz_id = quizizzId;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public void setAnswerA(String answer_a) {
        this.answer_a = answer_a;
    }

    public void setAnswerB(String answer_b) {
        this.answer_b = answer_b;
    }

    public void setAnswerC(String answer_c) {
        this.answer_c = answer_c;
    }

    public void setAnswerD(String answer_d) {
        this.answer_d = answer_d;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public void setExplaination(String explaination) {
        this.explaination = explaination;
    }
}
