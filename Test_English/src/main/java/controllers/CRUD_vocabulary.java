package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.bean.Vocabulary;
import models.bo.CRUD_vocabularyBO;

/**
 * Servlet implementation class CRUD_vocabulary
 */
@WebServlet("/CRUD_vocabulary")
public class CRUD_vocabulary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CRUD_vocabulary() {
	}

	protected void showListVocabulary(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		// Lấy hoặc tạo session từ request
		HttpSession session = request.getSession();
		// Lấy giá trị từ session
		Object user_id_ss = session.getAttribute("user_id");
		Integer user_id = (Integer) user_id_ss;
		System.out.println("User ID from session: " + user_id_ss);

		CRUD_vocabularyBO CRUD_Vocabulary_BO = new CRUD_vocabularyBO();
		ArrayList<Vocabulary> vocabularysArray = CRUD_Vocabulary_BO.getVocabularyList(user_id);
		String destination = "/home.jsp";
		request.setAttribute("vocabularysArray", vocabularysArray);
		RequestDispatcher rd = request.getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy hoặc tạo session từ request
		HttpSession session = request.getSession();
		// Lấy giá trị từ session
		Object user_id_ss = session.getAttribute("user_id");
		Integer user_id = (Integer) user_id_ss;
		System.out.println("User ID from session: " + user_id_ss);

		CRUD_vocabularyBO CRUD_Vocabulary_BO = new CRUD_vocabularyBO();
		ArrayList<Vocabulary> vocabularysArray = null;
		String destination;
		String word_id;
		RequestDispatcher rd;
		Vocabulary vocabulary;
		if (request.getParameter("mod1") != null) {
			if (user_id != null && request.getParameter("word") != null) {
				String word = request.getParameter("word");
				String definition = request.getParameter("definition");
				String pronunciation = request.getParameter("pronunciation");
				String speech = request.getParameter("speech");
				String synonyms = request.getParameter("word");
				String antonyms = request.getParameter("antonyms");
				String examples = request.getParameter("examples");
				CRUD_Vocabulary_BO.addVocabulary(word, definition, pronunciation, speech, synonyms,
						antonyms, examples, user_id);
				try {
					this.showListVocabulary(request, response);
				} catch (SQLException | ClassNotFoundException var16) {
					var16.printStackTrace();
				}
			} else {
				destination = "/Word/Form_addVocabulary.jsp";
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		} else if (request.getParameter("mod2") != null) {
			switch (request.getParameter("mod2")) {
				case "update":
					if (request.getParameter("word_id") != null) {
						word_id = request.getParameter("word_id");
						String word = request.getParameter("word");
						String definition = request.getParameter("definition");
						String pronunciation = request.getParameter("pronunciation");
						String speech = request.getParameter("speech");
						String synonyms = request.getParameter("word");
						String antonyms = request.getParameter("antonyms");
						String examples = request.getParameter("examples");
						CRUD_Vocabulary_BO.updateVocabulary(word_id, word, definition, pronunciation,
								speech, synonyms, antonyms, examples);
					}
					try {
						this.showListVocabulary(request, response);
					} catch (SQLException | ClassNotFoundException var16) {
						var16.printStackTrace();
					}
					break;
				case "1":
					if (request.getParameter("word_id") != null) {
						vocabulary = CRUD_Vocabulary_BO.getVocabularyDetail(request.getParameter("word_id"));
						request.setAttribute("vocabulary", vocabulary);
						destination = "/Word/Form_updateVocabulary.jsp";
						rd = request.getRequestDispatcher(destination);
						rd.forward(request, response);
					}
			}
		} else if (request.getParameter("mod3") != null) {
			if (request.getParameterValues("vocabularyId[]") != null) {
				String[] vocabularyIds = request.getParameterValues("vocabularyId[]");
				if (vocabularyIds != null) {
					String[] var11 = vocabularyIds;
					int var25 = vocabularyIds.length;

					for (int var24 = 0; var24 < var25; ++var24) {
						word_id = var11[var24];
						CRUD_Vocabulary_BO.deleteVocabulary(word_id);
					}
				}
			}
			try {
				this.showListVocabulary(request, response);
			} catch (SQLException | ClassNotFoundException var16) {
				var16.printStackTrace();
			}

		} else if (request.getParameter("mod4") != null) {

			if (request.getParameter("infor") != null) {
				vocabularysArray = CRUD_Vocabulary_BO.seekingVocabulary(user_id,
						request.getParameter("infor"));
				destination = "/Word/VocabularyResultSeeking.jsp";
				request.setAttribute("user_id", user_id);
				request.setAttribute("vocabularysArray", vocabularysArray);
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				request.setAttribute("user_id", user_id);
				destination = "/Word/Form_findVocabulary.jsp";
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		} else if (request.getParameter("word_id") != null) {
			vocabulary = CRUD_Vocabulary_BO.getVocabularyDetail(request.getParameter("word_id"));
			destination = "/Word/VocabularyDetail.jsp";
			request.setAttribute("vocabulary", vocabulary);
			rd = request.getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			try {
				this.showListVocabulary(request, response);
			} catch (SQLException | ClassNotFoundException var16) {
				var16.printStackTrace();
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
