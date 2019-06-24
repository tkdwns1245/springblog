package myblog.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import myblog.model.DataRoom;
import myblog.model.DataRoomDao;

public class WriteProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			HttpSession session = request.getSession();
			String userID = null;
			String title = null;
			String content = null;
			String uploadPath = request.getRealPath("/upload");
			String fileName1 = "";
			String fileName2 = "";
			String orgfileName1 = "";
			String orgfileName2 = "";
			
			DataRoom dr = new DataRoom();
			if(session.getAttribute("userID") !=null)
				userID = (String)session.getAttribute("userID");
			try {
				MultipartRequest multi = new MultipartRequest(
						request,uploadPath,50 * 1024 * 1024,"utf-8",new DefaultFileRenamePolicy());
				System.out.println(uploadPath);
				fileName1 = multi.getFilesystemName("file1");
				orgfileName1 = multi.getOriginalFileName("file1");
				fileName2 = multi.getFilesystemName("file2");
				orgfileName2 = multi.getOriginalFileName("file2");
				dr.setTitle(multi.getParameter("title"));
				System.out.println(multi.getParameter("title"));
				dr.setContent(multi.getParameter("content"));
				dr.setFiles(fileName1+"," + fileName2);
				dr.setOrgfiles(orgfileName1 + "," + orgfileName2);
			}catch(Exception e) {e.printStackTrace();}
			dr.setId(userID);
			dr.setReadcount(0);
			dr.setRegdate( new Timestamp(System.currentTimeMillis()));
			DataRoomDao dbPro = DataRoomDao.getInstance();
			dbPro.insertArticle(dr);
			return "/WEB-INF/databoard/writePro.jsp";
	}
}
