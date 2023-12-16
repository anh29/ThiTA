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

import models.bean.Quizizz;
import models.bean.User;
import models.bean.Vocabulary;
import models.bo.CRUD_quizizzBO;
import models.bo.CRUD_vocabularyBO;
import models.bo.UserBO;

/**
 * Servlet implementation class Check_login
 */
@WebServlet("/Check_login")
public class Check_login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Check_login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination;
		RequestDispatcher rd;
		UserBO userBO = new UserBO();
		if (request.getParameter("username") != null && request.getParameter("password") != null) {
			try {
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				User user = userBO.findUser(username, password);
				if (user == null) {
					destination = "/Form_login.jsp";
					rd = request.getRequestDispatcher(destination);
					rd.forward(request, response);
				} else if (user.getUserId() == 1) {
					CRUD_quizizzBO CRUD_Quizizz_BO = new CRUD_quizizzBO();
					ArrayList<Quizizz> quizizzsArray = CRUD_Quizizz_BO.getQuizizzList();
					destination = "/Quizizz/QuizizzList.jsp";
					request.setAttribute("user_id", user.getUserId());
					request.setAttribute("quizizzsArray", quizizzsArray);
					rd = request.getRequestDispatcher(destination);
					rd.forward(request, response);
				} else {
					CRUD_vocabularyBO CRUD_Vocabulary_BO = new CRUD_vocabularyBO();
					ArrayList<Vocabulary> vocabularysArray = CRUD_Vocabulary_BO
							.getVocabularyList(user.getUserId());
					destination = "/Word/VocabularyList.jsp";
					request.setAttribute("vocabularysArray", vocabularysArray);
					request.setAttribute("user_id", user.getUserId());
					rd = request.getRequestDispatcher(destination);
					rd.forward(request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} else {
			// ArrayList<String> idList = CRUD_Vocabulary_BO.getAllIdVocabulary();
			// request.setAttribute("idList", idList);
			String str = "Tai khoan hoac mat khau khong chinh xac";
			destination = "/Form_login.jsp";
			request.setAttribute("warning", str);
			rd = request.getRequestDispatcher(destination);
			rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
