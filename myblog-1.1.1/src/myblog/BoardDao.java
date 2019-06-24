package myblog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

public class BoardDao {
	private static BoardDao instance = null;
	private BoardDao() {}
	public static BoardDao getInstance() {
		if(instance == null) {
			synchronized(BoardDao.class) {
				instance  = new BoardDao();
			}
		}
		return instance;
	}
	
	public int insertArticle(Bbs bbs) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "insert into BOARD(num,title,regdate,content,id) values(BOARD_SEQ.nextval,?,?,?,?)";
		
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, bbs.getTitle());
			pstmt.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.setString(3,bbs.getContent());
			pstmt.setString(4, bbs.getId());
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			try {
				if(rs != null)rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return result;
	}
	public int getArticleCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from BOARD");
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close();} catch(SQLException e) {}
			if(conn != null) try {conn.close();} catch(SQLException e) {}
		}
		return x;
	}
	public ArrayList<Bbs> getArticleList(int startNum, int endNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select * from (select rownum rnum, num, id, title,readcount,regdate,content from("
									+ "select * from board order by num desc)) where rnum>=? and rnum<=?";
		ArrayList<Bbs> tmpList = new ArrayList<Bbs>();
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Bbs tmpBbs = new Bbs();
				tmpBbs.setNum(rs.getInt("num"));
				tmpBbs.setId(rs.getString("id"));
				tmpBbs.setTitle(rs.getString("title"));
				tmpBbs.setReadcount(rs.getInt("readcount"));
				tmpBbs.setRegdate(rs.getTimestamp("regdate"));
				tmpBbs.setContent(rs.getString("content"));
				tmpList.add(tmpBbs);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return tmpList;
	}
	public Bbs getArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Bbs article = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(
					"update BOARD set READCOUNT=READCOUNT+1 where NUM = ?");
			pstmt.setInt(1, num);
			pstmt.executeQuery();
			pstmt.close();
			pstmt = conn.prepareStatement("select * from BOARD where NUM = ?");
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new Bbs();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setId(rs.getString("id"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return article;
	}
	public Bbs updateGetArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Bbs article = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from BOARD where NUM = ?");
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new Bbs();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setTitle(rs.getString("title"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
			}
		}catch(Exception e)  {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return article;
	}
	public int updateArticle(Bbs article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "update BOARD set TITLE = ?,CONTENT = ? where NUM=?";
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setInt(3,  article.getNum());
			pstmt.executeQuery();
			result = 1;//수정 성공
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return result;
	}
	public int deleteArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("delete from BOARD where NUM=?");
			pstmt.setInt(1,  num);
			pstmt.executeQuery();
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return result;
	}
	public int insertComment(Comment comment) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "insert into REPLY values(COMMENT_SEQ.nextval,?,?,?,?)";
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, comment.getBnum());
			pstmt.setString(2, comment.getContent());
			pstmt.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.setString(4, comment.getId());
			pstmt.executeUpdate();
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return result;
	}
	public ArrayList<Comment> getCommentList(int bnum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select * from REPLY where bnum = ? order by cnum asc";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, bnum);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				Comment tmpComment = new Comment();
				tmpComment.setCnum(rs.getInt("cnum"));
				tmpComment.setBnum(rs.getInt("bnum"));
				tmpComment.setContent(rs.getString("content"));
				tmpComment.setRegdate(rs.getTimestamp("regdate"));
				tmpComment.setId(rs.getString("id"));
				list.add(tmpComment);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return list;
	}
	public int deleteComment(int cnum) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("delete from REPLY where CNUM=?");
			pstmt.setInt(1, cnum);
			pstmt.executeQuery();
			result = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs !=null) try {rs.close();} catch(SQLException e) {}
			if(pstmt != null) try {pstmt.close();} catch(SQLException e) {}
			if(conn != null) try { conn.close();} catch(SQLException e) {}
		}
		return result;
	}
	
}
