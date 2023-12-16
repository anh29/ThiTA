package models.bean;

public class RecordTest {
    private int record_id;
    private int test_id;
    private int student_id;
    private int quizizz_id;
    private String student_answer;
    private String word_day;

    // Constructors
    public RecordTest() {
    }

    // public RecordTest(int record_id, int test_id, int student_id, int quizizz_id, String student_answer, String word_day) {
    //     this.record_id = record_id;
    //     this.test_id = test_id;
    //     this.student_id = student_id;
    //     this.quizizz_id = quizizz_id;
    //     this.student_answer = student_answer;
    //     this.word_day = word_day;
    // }

    // Getter and Setter methods
    public int getRecord_id() {
        return record_id;
    }

    public void setRecord_id(int record_id) {
        this.record_id = record_id;
    }

    public int getTest_id() {
        return test_id;
    }

    public void setTest_id(int test_id) {
        this.test_id = test_id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getQuizizz_id() {
        return quizizz_id;
    }

    public void setQuizizz_id(int quizizz_id) {
        this.quizizz_id = quizizz_id;
    }

    public String getStudent_answer() {
        return student_answer;
    }

    public void setStudent_answer(String student_answer) {
        this.student_answer = student_answer;
    }

    public String getWord_day() {
        return word_day;
    }

    public void setWord_day(String word_day) {
        this.word_day = word_day;
    }
}
