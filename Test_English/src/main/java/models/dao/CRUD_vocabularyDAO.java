package models.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.bean.Vocabulary;

public class CRUD_vocabularyDAO {
	public CRUD_vocabularyDAO() {
	}

	public PreparedStatement connectionSQL(String sql) throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cnweb12", "root", "");
		PreparedStatement pstmt = conn.prepareStatement(sql);
		return pstmt;
	}

	public ArrayList<Vocabulary> getVocabularyList(int user_id) throws ClassNotFoundException, SQLException {
		ArrayList<Vocabulary> result = new ArrayList();
		String sql = "SELECT * FROM word, user where user.user_id = word.ID_user and user_id =?";
		PreparedStatement pstmt = this.connectionSQL(sql);
		pstmt.setInt(1, user_id);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Vocabulary vocabulary = new Vocabulary();
			vocabulary.setWordId(rs.getInt("word_id"));
			vocabulary.setWord(rs.getString("word"));
			vocabulary.setDefinition(rs.getString("definition"));
			vocabulary.setPronunciation(rs.getString("pronunciation"));
			vocabulary.setSpeech(rs.getString("speech"));
			vocabulary.setSynonyms(rs.getString("synonyms"));
			vocabulary.setAntonyms(rs.getString("antonyms"));
			vocabulary.setExamples(rs.getString("examples"));
			vocabulary.setUserId(rs.getInt("ID_user"));
			result.add(vocabulary);
		}

		return result;
	}

	public void addVocabulary(String word, String definition, String pronunciation, String speech, String synonyms,
			String antonyms, String examples, int ID_user) {
		try {
			String sql = "INSERT INTO word (word, definition, pronunciation, speech, synonyms, antonyms, examples, ID_user) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setString(1, word);
			pstmt.setString(2, definition);
			pstmt.setString(3, pronunciation);
			pstmt.setString(4, speech);
			pstmt.setString(5, synonyms);
			pstmt.setString(6, antonyms);
			pstmt.setString(7, examples);
			pstmt.setInt(8, ID_user);

			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException var7) {
			var7.printStackTrace();
		}

	}

	// public ArrayList<String> getAllIdVocabulary() {
	// ArrayList<String> result = new ArrayList();

	// try {
	// String sql = "SELECT id FROM word, user where user.user_id = word.ID_user";
	// PreparedStatement pstmt = this.connectionSQL(sql);
	// ResultSet rs = pstmt.executeQuery();

	// while (rs.next()) {
	// result.add(rs.getString("id"));
	// }
	// } catch (ClassNotFoundException | SQLException var5) {
	// var5.printStackTrace();
	// }

	// return result;
	// }

	public Vocabulary getVocabularyDetail(int word_id) {
		Vocabulary vocabulary = null;

		try {
			String sql = "SELECT * FROM word WHERE word_id=?";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setInt(1, word_id);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				vocabulary = new Vocabulary();
				vocabulary.setWordId(rs.getInt("word_id"));
				vocabulary.setWord(rs.getString("word"));
				vocabulary.setDefinition(rs.getString("definition"));
				vocabulary.setPronunciation(rs.getString("pronunciation"));
				vocabulary.setSpeech(rs.getString("speech"));
				vocabulary.setSynonyms(rs.getString("synonyms"));
				vocabulary.setAntonyms(rs.getString("antonyms"));
				vocabulary.setExamples(rs.getString("examples"));
				vocabulary.setUserId(rs.getInt("ID_user"));
			}
		} catch (ClassNotFoundException | SQLException var6) {
			var6.printStackTrace();
		}

		return vocabulary;
	}

	public void updateVocabulary(int word_id, String word, String definition, String pronunciation, String speech,
			String synonyms,
			String antonyms, String examples) {
		try {
			String sql = "UPDATE word SET word=?, definition=?, pronunciation=?, speech=?, synonyms=?, antonyms=?, examples=? where word_id=?";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setString(1, word);
			pstmt.setString(2, definition);
			pstmt.setString(3, pronunciation);
			pstmt.setString(4, speech);
			pstmt.setString(5, synonyms);
			pstmt.setString(6, antonyms);
			pstmt.setString(7, examples);
			pstmt.setInt(8, word_id);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException var7) {
			var7.printStackTrace();
		}
	}

	public void deleteVocabulary(String word_id) {
		try {
			String sql = "DELETE FROM word WHERE word_id=?";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setString(1, word_id);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException var4) {
			var4.printStackTrace();
		}

	}

	public ArrayList<Vocabulary> seekingVocabulary(int user_id, String word) {
		ArrayList<Vocabulary> result = new ArrayList();

		try {
			String sql = "SELECT * FROM word, user WHERE user.user_id = word.ID_user and user.user_id=? and word LIKE CONCAT('%', ?, '%')";
			PreparedStatement pstmt = this.connectionSQL(sql);
			pstmt.setInt(1, user_id);
			pstmt.setString(2, word);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Vocabulary vocabulary = new Vocabulary();
				vocabulary.setWordId(rs.getInt("word_id"));
				vocabulary.setWord(rs.getString("Word"));
				vocabulary.setDefinition(rs.getString("definition"));
				vocabulary.setPronunciation(rs.getString("pronunciation"));
				vocabulary.setSpeech(rs.getString("speech"));
				vocabulary.setSynonyms(rs.getString("synonyms"));
				vocabulary.setAntonyms(rs.getString("antonyms"));
				vocabulary.setExamples(rs.getString("examples"));
				vocabulary.setUserId(rs.getInt("ID_user"));
				result.add(vocabulary);
			}
		} catch (ClassNotFoundException | SQLException var8) {
			var8.printStackTrace();
		}
		return result;
	}
}
