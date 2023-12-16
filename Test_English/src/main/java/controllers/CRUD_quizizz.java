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

import models.bean.Quizizz;
import models.bo.CRUD_quizizzBO;

/**
 * Servlet implementation class CRUD_quizizz
 */
@WebServlet("/CRUD_quizizz")
public class CRUD_quizizz extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CRUD_quizizz() {
	}

	protected void showListQuizizz(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		// Lấy hoặc tạo session từ request
		HttpSession session = request.getSession();
		// Lấy giá trị từ session
		Object user_id_ss = session.getAttribute("user_id");
		Integer user_id = (Integer) user_id_ss;
		System.out.println("User ID from session: " + user_id_ss);
		
		CRUD_quizizzBO CRUD_Quizizz_BO = new CRUD_quizizzBO();
		ArrayList<Quizizz> quizizzsArray = CRUD_Quizizz_BO.getQuizizzList();
		String destination = "/Quizizz/QuizizzList.jsp";
		request.setAttribute("user_id", user_id);
		request.setAttribute("quizizzsArray", quizizzsArray);
		RequestDispatcher rd = request.getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CRUD_quizizzBO CRUD_Quizizz_BO = new CRUD_quizizzBO();
		ArrayList<Quizizz> quizizzsArray = null;
		String destination;
		String quizizz_id;
		RequestDispatcher rd;
		Quizizz quizizz;
		if (request.getParameter("mod1") != null) {
			if (request.getParameter("question") != null) {
				String question = request.getParameter("question");
				String answer_a = request.getParameter("answer_a");
				String answer_b = request.getParameter("answer_b");
				String answer_c = request.getParameter("answer_c");
				String answer_d = request.getParameter("answer_d");
				String answer = request.getParameter("answer");
				String explaination = request.getParameter("explaination");

				CRUD_Quizizz_BO.addQuizizz(question, answer_a, answer_b, answer_c, answer_d, answer, explaination);
				try {
					this.showListQuizizz(request, response);
				} catch (SQLException | ClassNotFoundException var16) {
					var16.printStackTrace();
				}
			} else {
				// ArrayList<String> idList = CRUD_Quizizz_BO.getAllIdQuizizz();
				destination = "/Quizizz/Form_addQuizizz.jsp";
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		} else if (request.getParameter("mod2") != null) {
			switch (request.getParameter("mod2")) {
				case "update":
					if (request.getParameter("quizizz_id") != null) {
						quizizz_id = request.getParameter("quizizz_id");
						String question = request.getParameter("question");
						String answer_a = request.getParameter("answer_a");
						String answer_b = request.getParameter("answer_b");
						String answer_c = request.getParameter("answer_c");
						String answer_d = request.getParameter("answer_d");
						String answer = request.getParameter("answer");
						String explaination = request.getParameter("explaination");

						CRUD_Quizizz_BO.updateQuizizz(quizizz_id, question, answer_a, answer_b, answer_c, answer_d,
								answer, explaination);
					}
					try {
						this.showListQuizizz(request, response);
					} catch (SQLException | ClassNotFoundException var16) {
						var16.printStackTrace();
					}
					break;
				case "1":
					if (request.getParameter("quizizz_id") != null) {
						quizizz = CRUD_Quizizz_BO.getQuizizzDetail(request.getParameter("quizizz_id"));
						request.setAttribute("quizizz", quizizz);
						destination = "/Quizizz/Form_updateQuizizz.jsp";
						rd = request.getRequestDispatcher(destination);
						rd.forward(request, response);
					}
			}
		} else if (request.getParameter("mod3") != null) {
			if (request.getParameterValues("quizizzId[]") != null) {
				String[] quizizzIds = request.getParameterValues("quizizzId[]");
				if (quizizzIds != null) {
					String[] var11 = quizizzIds;
					int var25 = quizizzIds.length;

					for (int var24 = 0; var24 < var25; ++var24) {
						quizizz_id = var11[var24];
						CRUD_Quizizz_BO.deleteQuizizz(quizizz_id);
					}
				}
			}
			try {
				this.showListQuizizz(request, response);
			} catch (SQLException | ClassNotFoundException var16) {
				var16.printStackTrace();
			}

		} else if (request.getParameter("mod4") != null) {
			if (request.getParameter("infor") != null) {
				quizizzsArray = CRUD_Quizizz_BO.seekingQuizizz(request.getParameter("infor"));
				destination = "/Quizizz/QuizizzResultSeeking.jsp";

				request.setAttribute("quizizzsArray", quizizzsArray);
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {

				destination = "/Quizizz/Form_findQuizizz.jsp";
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			}
		} else if (request.getParameter("quizizz_id") != null) {
			quizizz = CRUD_Quizizz_BO.getQuizizzDetail(request.getParameter("quizizz_id"));
			destination = "/Quizizz/QuizizzDetail.jsp";
			request.setAttribute("quizizz", quizizz);
			rd = request.getRequestDispatcher(destination);
			rd.forward(request, response);
		} else {
			try {
				this.showListQuizizz(request, response);
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
