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

import models.bean.CodeTest;
import models.bean.Quizizz;
import models.bean.CodeTest;
import models.bo.CRUD_quizizzBO;
import models.bo.CR_testBO;

/**
 * Servlet implementation class CR_test
 */
@WebServlet("/CR_test")
public class CR_test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CR_test() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void showListCodeTest(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		// // Lấy hoặc tạo session từ request
		// HttpSession session = request.getSession();
		// // Lấy giá trị từ session
		// Object user_id_ss = session.getAttribute("user_id");
		// Integer user_id = (Integer) user_id_ss;
		// System.out.println("User ID from session: " + user_id_ss);

		CR_testBO CR_TestBO = new CR_testBO();
		ArrayList<CodeTest> CodeTestsArray = CR_TestBO.getAllCodeTest();
		String destination = "/Test/CodeTestList.jsp";
		// request.setAttribute("user_id", user_id);
		request.setAttribute("CodeTestsArray", CodeTestsArray);
		RequestDispatcher rd = request.getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CR_testBO CR_TestBO = new CR_testBO();
		CRUD_quizizzBO CRUD_Quizizz_BO = new CRUD_quizizzBO();
		ArrayList<CodeTest> CodeTestsArray = null;
		ArrayList<Quizizz> quizizzsArray = null;
		String destination;
		String quizizz_id;
		RequestDispatcher rd;
		Integer generatedID;
		if (request.getParameter("mod1") != null) {
			if (request.getParameter("name_test") != null) {
				// Lấy giá trị của name_test từ form
				String nameTest = request.getParameter("name_test");
				try {
					generatedID = CR_TestBO.AddCodeTest(nameTest);
					// Lấy giá trị của các option được chọn
					String[] selectedQuestions = request.getParameterValues("selectedQuestions");
					if (selectedQuestions != null) {
						for (String selectedQuestion : selectedQuestions) {
							CR_TestBO.addListQuizizzInTest(generatedID, selectedQuestion);
						}
					}
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					this.showListCodeTest(request, response);
				} catch (SQLException | ClassNotFoundException var16) {
					var16.printStackTrace();
				}
			} else {
				// ArrayList<String> idList = CR_TestBO.getAllIdCodeTest();
				try {
					quizizzsArray = CRUD_Quizizz_BO.getQuizizzList();
					destination = "/Quizizz/QuizizzList.jsp";
					request.setAttribute("quizizzsArray", quizizzsArray);
					destination = "/Test/Form_addTest.jsp";
					rd = request.getRequestDispatcher(destination);
					rd.forward(request, response);
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// } else if (request.getParameter("mod2") != null) {
			// switch (request.getParameter("mod2")) {
			// case "update":
			// if (request.getParameter("quizizz_id") != null) {
			// quizizz_id = request.getParameter("quizizz_id");
			// String question = request.getParameter("question");
			// String answer_a = request.getParameter("answer_a");
			// String answer_b = request.getParameter("answer_b");
			// String answer_c = request.getParameter("answer_c");
			// String answer_d = request.getParameter("answer_d");
			// String answer = request.getParameter("answer");
			// String explaination = request.getParameter("explaination");

			// CR_TestBO.updateCodeTest(quizizz_id, question, answer_a, answer_b, answer_c,
			// answer_d,
			// answer, explaination);
			// }
			// try {
			// this.showListCodeTest(request, response);
			// } catch (SQLException | ClassNotFoundException var16) {
			// var16.printStackTrace();
			// }
			// break;
			// case "1":
			// if (request.getParameter("quizizz_id") != null) {
			// quizizz = CR_TestBO.getCodeTestDetail(request.getParameter("quizizz_id"));
			// request.setAttribute("quizizz", quizizz);
			// destination = "/CodeTest/Form_updateCodeTest.jsp";
			// rd = request.getRequestDispatcher(destination);
			// rd.forward(request, response);
			// }
			// }
			// } else if (request.getParameter("mod3") != null) {
			// if (request.getParameterValues("quizizzId[]") != null) {
			// String[] quizizzIds = request.getParameterValues("quizizzId[]");
			// if (quizizzIds != null) {
			// String[] var11 = quizizzIds;
			// int var25 = quizizzIds.length;

			// for (int var24 = 0; var24 < var25; ++var24) {
			// quizizz_id = var11[var24];
			// CR_TestBO.deleteCodeTest(quizizz_id);
			// }
			// }
			// }
			// try {
			// this.showListCodeTest(request, response);
			// } catch (SQLException | ClassNotFoundException var16) {
			// var16.printStackTrace();
			// }

			// } else if (request.getParameter("mod4") != null) {
			// if (request.getParameter("infor") != null) {
			// CodeTestsArray = CR_TestBO.seekingCodeTest(request.getParameter("infor"));
			// destination = "/CodeTest/CodeTestResultSeeking.jsp";

			// request.setAttribute("CodeTestsArray", CodeTestsArray);
			// rd = request.getRequestDispatcher(destination);
			// rd.forward(request, response);
			// } else {

			// destination = "/CodeTest/Form_findCodeTest.jsp";
			// rd = request.getRequestDispatcher(destination);
			// rd.forward(request, response);
			// }
		} else if (request.getParameter("ID_test") != null) {
				try {
					quizizzsArray = CR_TestBO.getQuizizzInTest(request.getParameter("ID_test"));
					destination = "/Test/FormDoTest.jsp";
					request.setAttribute("quizizzsArray", quizizzsArray);
					rd = request.getRequestDispatcher(destination);
					rd.forward(request, response);
				} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
		} else {
			try {
				this.showListCodeTest(request, response);
			} catch (SQLException | ClassNotFoundException var16) {
				var16.printStackTrace();
			}
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
