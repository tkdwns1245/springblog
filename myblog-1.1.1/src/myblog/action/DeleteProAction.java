package myblog.action;

import java.io.File;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myblog.model.DataRoom;
import myblog.model.DataRoomDao;

public class DeleteProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String pass = request.getParameter("pass");
		
		DataRoomDao dbPro = DataRoomDao.getInstance();
		int check = dbPro.deleteArticle(num);
		DataRoom dr = dbPro.getArticle(num);
		deleteFiles(dr,request);
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));
		
		return "/WEB-INF/databoard/deletePro.jsp";
	}
	
	private void deleteFiles(DataRoom dr,HttpServletRequest request)
	{
		DataRoom article = dr;
        String orgfiles = article.getOrgfiles();
		StringTokenizer st = new StringTokenizer(orgfiles,",");
		while(st.hasMoreTokens()) {
			String str = st.nextToken();
			if(!str.equals(null))
			{
				String uploadFileName = request.getRealPath("/databoard/upload") +"/"+ str;
				File uploadfile = new File (uploadFileName);
		        if ( uploadfile.exists()&& uploadfile.isFile() )
		        {
		             uploadfile.delete();       // 파일 삭제
		        }
			}
		}
      

	}
}
