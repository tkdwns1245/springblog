package myblog.action;

import java.io.PrintWriter;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WriteFormAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = 0;
		HttpSession session = request.getSession();
		String userID=null;
		
		try {
			if(request.getParameter("num") != null) {
				num = Integer.parseInt(request.getParameter("num"));
			}
		}catch (Exception e ) {e.printStackTrace();}
		request.setAttribute("num",new Integer(num));
		if(session.getAttribute("userID") == null)
		{
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인을 하세요')");
			out.println("location.href='" + request.getContextPath() + "/databoard/list.do'");
			out.println("</script>");
			return null;
		}
		return "/WEB-INF/databoard/writeForm.jsp";
	}
}
