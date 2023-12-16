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
		if (request.getParameter("mod") != null) {
			try {
				ArrayList<String> listUsername = userBO.getAllUsername();
				ArrayList<String> listEmail = userBO.getAllEmail();
				request.setAttribute("listUsername", listUsername);
				request.setAttribute("listEmail", listEmail);
				destination = "/Form_register.jsp";
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		} else if (request.getParameter("username") != null && request.getParameter("password") != null) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if (request.getParameter("email") == null) {
				try {
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
						request.setAttribute("username", user.getUsername());
						rd = request.getRequestDispatcher(destination);
						rd.forward(request, response);
					}
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			} else {
				String email = request.getParameter("email");
				try {
					userBO.createUser(username, password, email);
					destination = "/Form_login.jsp";
					rd = request.getRequestDispatcher(destination);
					rd.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
			// } else {
			// destination = "/Form_login.jsp";
			// rd = request.getRequestDispatcher(destination);
			// rd.forward(request, response);
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
