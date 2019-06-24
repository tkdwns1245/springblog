package myblog.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myblog.Comment;
import myblog.model.DataRoomDao;

public class CommentProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String bnum = request.getParameter("bnum");
		String pageNum = request.getParameter("pageNum");
		String content = request.getParameter("content");
		Comment tmpComment = new Comment();
		tmpComment.setBnum(Integer.parseInt(request.getParameter("bnum")));
		tmpComment.setId(request.getParameter("id"));
		tmpComment.setContent(content);
		DataRoomDao dao = DataRoomDao.getInstance();
		dao.insertComment(tmpComment);
		return "/WEB-INF/databoard/content.do?num=" +bnum + "&pageNum=" + pageNum;
	}
}
