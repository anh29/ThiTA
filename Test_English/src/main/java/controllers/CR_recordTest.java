package controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.bean.RecordTest;
import models.bo.CR_recordTestBO;

/**
 * Servlet implementation class CR_recordTest
 */
@WebServlet("/CR_recordTest")
public class CR_recordTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CR_recordTest() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void showListRecordTest(HttpServletRequest request, HttpServletResponse response)
			throws ClassNotFoundException, SQLException, ServletException, IOException {
		// Lấy hoặc tạo session từ request
		HttpSession session = request.getSession();
		// Lấy giá trị từ session
		Object user_id_ss = session.getAttribute("user_id");
		System.out.println("User ID from session: " + user_id_ss);
		Integer student_id = (Integer) user_id_ss;

		CR_recordTestBO CR_recordTestBO = new CR_recordTestBO();
		ArrayList<RecordTest> RecordTestsArray = CR_recordTestBO.getAllRecordTestsFollowingDateAndTestId(student_id);
		String destination = "/Test/RecordTest.jsp";
		// request.setAttribute("user_id", user_id);
		request.setAttribute("RecordTestsArray", RecordTestsArray);
		RequestDispatcher rd = request.getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CR_recordTestBO CR_recordTestBO = new CR_recordTestBO();
		ArrayList<RecordTest> RecordTestsArray = null;
		String destination;
		RequestDispatcher rd;
		LocalDateTime currentTime = LocalDateTime.now();
		// Định dạng ngày giờ thành chuỗi
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDateTime = currentTime.format(formatter);
		// Lấy hoặc tạo session từ request
		HttpSession session = request.getSession();
		// Lấy giá trị từ session
		Object user_id_ss = session.getAttribute("user_id");
		String student_id = user_id_ss.toString();
		System.out.println("User ID from session: " + user_id_ss);
		if (request.getParameter("mod1") != null && request.getParameter("test_id") != null) {
			String test_id = request.getParameter("test_id");
			String[] questionIds = request.getParameterValues("questionIds");
			String[] studentAnswers = request.getParameterValues("studentAnswers");
			// Bạn có thể lặp qua các phần tử trong mảng để xử lý dữ liệu
			for (int i = 0; i < questionIds.length; i++) {
				String quizizzId = questionIds[i];
				String studentAnswer = studentAnswers[i];
				try {
					CR_recordTestBO.addRecordTest(test_id, student_id, quizizzId, studentAnswer, formattedDateTime);
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
			try {
				this.showListRecordTest(request, response);
			} catch (SQLException | ClassNotFoundException var16) {
				var16.printStackTrace();
			}
		} else if (request.getParameter("day") != null) {
			try {
				RecordTestsArray = CR_recordTestBO.getRecordTests(student_id, request.getParameter("day"));
				destination = "/Test/DetailRecordTest.jsp";
				// request.setAttribute("user_id", user_id);
				request.setAttribute("RecordTestsArray", RecordTestsArray);
				rd = request.getRequestDispatcher(destination);
				rd.forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			try {
				this.showListRecordTest(request, response);
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
