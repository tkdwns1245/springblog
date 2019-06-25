package myblog.action;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadProAction implements CommandAction{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String fileName = request.getParameter("file");
		String folder = request.getServletContext().getRealPath("/upload");
		System.out.println(folder);
		String filePath = folder + "/" + fileName;
		try {
			File file = new File(filePath);
			byte b[] = new byte[(int) file.length()];
			
			response.reset();
			response.setContentType("application/octet-stream");
			String Encoding = new String(fileName.getBytes("UTF-8"), "8859_1");
			response.setHeader("Content-Disposition", "attachment;filename=" + Encoding);
			response.setHeader("Content-Length", String.valueOf(file.length()));
			
			if(file.isFile())
			{
				FileInputStream fileInputStream = new FileInputStream(file);
				ServletOutputStream servletOutputStream = response.getOutputStream();
				
				int readNum = 0;
				while((readNum = fileInputStream.read(b)) != -1) {
					servletOutputStream.write(b,0,readNum);
				}
				servletOutputStream.close();
				fileInputStream.close();
			}
		}catch(Exception e) {
			System.out.println("Download Exception : " + e.getMessage());
		}
		return null;
	}
}
