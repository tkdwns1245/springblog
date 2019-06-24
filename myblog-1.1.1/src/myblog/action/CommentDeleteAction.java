package myblog.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myblog.model.DataRoomDao;

public class CommentDeleteAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		DataRoomDao dao = DataRoomDao.getInstance();
		dao.deleteComment(cnum);
		
		return "/WEB-INF/databoard/content.do?num=" +bnum + "&pageNum=" + pageNum;
	}
}
