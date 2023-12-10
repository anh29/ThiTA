package models.bean;

public class Vocabulary {
    private int word_id;
    private String word;
    private String definition;
    private String pronunciation;
    private String speech;
    private String synonyms;
    private String antonyms;
    private String examples;
    private int ID_user;
    
    // Getter and Setter for word_id
    public int getWordId() {
        return word_id;
    }

    public void setWordId(int wordId) {
        this.word_id = wordId;
    }

    // Getter and Setter for word
    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    // Getter and Setter for definition
    public String getDefinition() {
        return definition;
    }

    public void setDefinition(String definition) {
        this.definition = definition;
    }

    // Getter and Setter for pronunciation
    public String getPronunciation() {
        return pronunciation;
    }

    public void setPronunciation(String pronunciation) {
        this.pronunciation = pronunciation;
    }

    // Getter and Setter for speech
    public String getSpeech() {
        return speech;
    }

    public void setSpeech(String speech) {
        this.speech = speech;
    }

    // Getter and Setter for synonyms
    public String getSynonyms() {
        return synonyms;
    }

    public void setSynonyms(String synonyms) {
        this.synonyms = synonyms;
    }

    // Getter and Setter for antonyms
    public String getAntonyms() {
        return antonyms;
    }

    public void setAntonyms(String antonyms) {
        this.antonyms = antonyms;
    }

    // Getter and Setter for examples
    public String getExamples() {
        return examples;
    }

    public void setExamples(String examples) {
        this.examples = examples;
    }

    // Getter and Setter for ID_user
    public int getUserId() {
        return ID_user;
    }

    public void setUserId(int userId) {
        this.ID_user = userId;
    }
}
