package models.bo;

import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.Vocabulary;
import models.dao.CRUD_vocabularyDAO;

public class CRUD_vocabularyBO {
	CRUD_vocabularyDAO vocabularyDAO = new CRUD_vocabularyDAO();

	public CRUD_vocabularyBO() {
	}

	public ArrayList<Vocabulary> getVocabularyList(String user_id) throws ClassNotFoundException, SQLException {
		return this.vocabularyDAO.getVocabularyList(Integer.parseInt(user_id));
	}

	public void addVocabulary(String word, String definition, String pronunciation, String speech, String synonyms,
			String antonyms, String examples, String ID_user) {
		this.vocabularyDAO.addVocabulary(word, definition, pronunciation, speech, synonyms,
				antonyms, examples, Integer.parseInt(ID_user));
	}

	// public ArrayList<String> getAllIdVocabulary() {
	// 	return this.vocabularyDAO.getAllIdVocabulary();
	// }

	public Vocabulary getVocabularyDetail(String word_id) {
		return this.vocabularyDAO.getVocabularyDetail(Integer.parseInt(word_id));
	}

	public void updateVocabulary(String word_id, String word, String definition, String pronunciation, String speech, String synonyms,
			String antonyms, String examples) {
		this.vocabularyDAO.updateVocabulary(Integer.parseInt(word_id), word, definition, pronunciation, speech, synonyms,
				antonyms, examples);
	}

	public void deleteVocabulary(String id) {
		this.vocabularyDAO.deleteVocabulary(id);
	}

	public ArrayList<Vocabulary> seekingVocabulary(String user_id, String word) {
		return this.vocabularyDAO.seekingVocabulary(Integer.parseInt(user_id), word);
	}
}
