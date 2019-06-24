package myblog.action;

import java.io.File;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import myblog.model.DataRoom;
import myblog.model.DataRoomDao;

public class UpdateProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		DataRoomDao dao = DataRoomDao.getInstance();
		int num = 0;
		int pageNum = 0;
		DataRoom dr = null;
		String uploadPath = request.getRealPath("/WEB-INF/databoard/upload");
		ArrayList<String> fileNames = new ArrayList<String>();
		ArrayList<String> orgfileNames = new ArrayList<String>();
		
		try {
		String str1 = "";
		String str2 = "";
		int cnt = 0;
		MultipartRequest multi = new MultipartRequest(
				request,uploadPath,50 * 1024 * 1024,"utf-8",new DefaultFileRenamePolicy());
		fileNames.add(multi.getFilesystemName("file1"));
		orgfileNames.add(multi.getOriginalFileName("file1"));
		fileNames.add(multi.getFilesystemName("file2"));
		orgfileNames.add(multi.getOriginalFileName("file2"));
		num = Integer.parseInt(multi.getParameter("num"));
		pageNum = Integer.parseInt(multi.getParameter("pageNum"));
		
		dr = dao.updateGetArticle(num);
		dr.setTitle(multi.getParameter("title"));
		dr.setContent(multi.getParameter("content"));
		for(String fn : fileNames)
		{
			cnt++;
			str1 +=fn;
			if(cnt == fileNames.size())
				break;
			str1 +=",";
		}
		cnt = 0;
		for(String fn : orgfileNames)
		{
			cnt++;
			str2 +=fn;
			if(cnt == orgfileNames.size())
				break;
			str2 +=",";
		}
		if(!str1.equals("null,null"))//입력 받은 모든 파일이 null 이 아닐 경우만 게시판 데이터 갱신
		{
			deleteFiles(dr,request);//게시판 데이터 갱신 시 이전에 저장되어 있던 파일 삭제
			dr.setFiles(str1);
			dr.setOrgfiles(str2);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		int check = dao.updateArticle(dr);
		
		request.setAttribute("pageNum", new Integer(pageNum));
		request.setAttribute("check", new Integer(check));
		return "/databoard/updatePro.jsp";
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
