package myblog.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myblog.model.DataRoom;
import myblog.model.DataRoomDao;

public class UpdateFormAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		DataRoomDao dbPro = DataRoomDao.getInstance();
		DataRoom article = dbPro.updateGetArticle(num);

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(session.getAttribute("userID") == null)
		{
			out.println("<script>");
			out.println("alert('로그인을 하세요')");
			out.println("location.href='" + request.getContextPath() + "/WEB-INF/databoard/list.do'");
			out.println("</script>");
			System.out.println("!!");
			return null;
		}
		if(!article.getId().equals(session.getAttribute("userID")))
		{
			out.println("<script>");
			out.println("alert('잘못된 경로로 접근하였습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		}
		request.setAttribute("pageNum",  new Integer(pageNum));
		request.setAttribute("article", article);
		return "/databoard/updateForm.jsp";
	}
}
