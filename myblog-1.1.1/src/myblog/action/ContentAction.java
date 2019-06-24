package myblog.action;

import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myblog.Comment;
import myblog.model.DataRoom;
import myblog.model.DataRoomDao;

public class ContentAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		DataRoomDao dao = DataRoomDao.getInstance();
		int num = 0;
		int pageNum = 0 ;
		String userID = null;
		DataRoom article = null;
		String files,orgfiles;
		ArrayList<String> fileList = new ArrayList<String>();
		ArrayList<String> orgList = new ArrayList<String>();
		String file2 = "";
		String orgfile1 = "";
		String orgfile2 = "";
		ArrayList<Comment> commentList = null;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			article = dao.getArticle(num);
			commentList = dao.getCommentList(num);
		}catch(Exception e) {e.printStackTrace();}
		files = article.getFiles();
		orgfiles = article.getOrgfiles();
		StringTokenizer st = new StringTokenizer(files,","); 
		StringTokenizer st2 = new StringTokenizer(orgfiles,",");
		while(st.hasMoreTokens()) {
			String str = st.nextToken();
			fileList.add(str);
		}
		while(st2.hasMoreTokens()) {
			String str = st2.nextToken();
			orgList.add(str);
		}
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		request.setAttribute("commentList" , commentList);
		request.setAttribute("fileList", fileList);
		request.setAttribute("orgList",orgList);
		return "/WEB-INF/databoard/content.jsp";
	}
}
