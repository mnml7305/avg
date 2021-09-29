
test
package request;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.Servlet;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RequestInput
 */
@WebServlet("/Request")
public class RequestServlet extends HttpServlet implements Servlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    private String user_id;
    private String request_type;
   // private int int_id;
    private int int_type;
    private String company_name;
    private String mode;
    private String user_title;
    private String reson_mode;
    private String shipping_mode;

	 @Override
	 protected void doGet(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException {
			// 処理クラスをインスタンス化
			RequestModel model = new RequestModel();

			// すべてのデータを beanList として取得
			ArrayList<RequestBean> beanList = model.getCarrierList();

			// フォワードの準備
			request.setAttribute("beanList", beanList); 
	
			/*user_id = request.getParameter("user_id");
			request_type = request.getParameter("request_type");
			int_type = Integer.parseInt(request_type);
			company_name = request.getParameter("company_name");*/
	
			//int_id = 001;
			//request_type = "request_type";
			//int_type = 2;
			//company_name = "会社名＿＿テスト";
			
			 String para = request.getParameter("type");
			 int_type = Integer.parseInt(para);
			if (int_type == 1) {
				//新規
				mode="新規";
				user_title = "③";
				reson_mode = "style='display:none'";
				shipping_mode = "style='display:block'";
				
			} else if(int_type == 2){
				//故障
				mode="故障";
				user_title = "③";
				reson_mode = "display:block";
				shipping_mode = "display:block";
				
			} else if(int_type == 3){
				//紛失
				mode="紛失";
				user_title = "②";
				reson_mode = "display:none";
				shipping_mode = "display:none";
			}else {
				response.sendRedirect("/Testproject/Request");
			}
			
		
		request.setAttribute("user_id", user_id);
		request.setAttribute("request_type", request_type);
		request.setAttribute("company_name", company_name);
		request.setAttribute("mode", mode);
		request.setAttribute("user_title", user_title);
		request.setAttribute("reson_mode", reson_mode);
		request.setAttribute("shipping_mode", shipping_mode);
		request.setAttribute("shipping_mode", int_type);
		
		
		ServletContext context = this.getServletContext();
		RequestDispatcher dispatcher = context.getRequestDispatcher("/WEB-INF/jsp/request/request_input.jsp");
		
		dispatcher.forward(request, response);
	   }
			/**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
		 */
		@Override
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// TODO Auto-generated method stub
			//doGet(request, response);
			
			//ServletContext context = this.getServletContext();
			//RequestDispatcher dispatcher = context.getRequestDispatcher("/Confirm");
			
			//dispatcher.forward(request, response);
			
			response.sendRedirect("/Testproject/Confirm");
		}

}
