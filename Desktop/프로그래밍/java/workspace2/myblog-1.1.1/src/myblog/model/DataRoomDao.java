package myblog.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;

import myblog.Bbs;
import myblog.BlogDao;
import myblog.BoardDao;
import myblog.Comment;
import myblog.ConnUtil;

public class DataRoomDao {
	private static DataRoomDao instance = null;
	private DataRoomDao() {}
	public static DataRoomDao getInstance() {
		if(instance == null) {
			synchronized(DataRoomDao.class) {
				instance  = new DataRoomDao();
			}
		}
		return instance;
	}
	public int getArticleCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from DATA_BOARD");
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
	public ArrayList<DataRoom> getArticleList(int startNum, int endNum){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select * from (select rownum rnum, num, id, title,readcount,regdate,content,files from("
									+ "select * from DATA_BOARD order by num desc)) where rnum>=? and rnum<=?";
		ArrayList<DataRoom> tmpList = new ArrayList<DataRoom>();
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				DataRoom tmpDataRoom = new DataRoom();
				tmpDataRoom.setNum(rs.getInt("num"));
				tmpDataRoom.setId(rs.getString("id"));
				tmpDataRoom.setTitle(rs.getString("title"));
				tmpDataRoom.setReadcount(rs.getInt("readcount"));
				tmpDataRoom.setRegdate(rs.getTimestamp("regdate"));
				tmpDataRoom.setContent(rs.getString("content"));
				tmpDataRoom.setFiles(rs.getString("files"));
				tmpList.add(tmpDataRoom);
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
	public int insertArticle(DataRoom dr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "insert into DATA_BOARD(num,title,regdate,content,id,files,orgfiles) values(DATA_BOARD_SEQ.nextval,?,?,?,?,?,?)";
		
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dr.getTitle());
			pstmt.setTimestamp(2, Timestamp.valueOf(LocalDateTime.now()));
			pstmt.setString(3,dr.getContent());
			pstmt.setString(4, dr.getId());
			pstmt.setString(5, dr.getFiles());
			pstmt.setString(6, dr.getOrgfiles());
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
	public DataRoom getArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DataRoom article = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(
					"update DATA_BOARD set READCOUNT=READCOUNT+1 where NUM = ?");
			pstmt.setInt(1, num);
			pstmt.executeQuery();
			pstmt.close();
			pstmt = conn.prepareStatement("select * from DATA_BOARD where NUM = ?");
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new DataRoom();
				article.setNum(rs.getInt("num"));
				article.setTitle(rs.getString("title"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setId(rs.getString("id"));
				article.setFiles(rs.getString("files"));
				article.setOrgfiles(rs.getString("orgfiles"));
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
	public DataRoom updateGetArticle(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DataRoom article = null;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select * from DATA_BOARD where NUM = ?");
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				article = new DataRoom();
				article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
				article.setTitle(rs.getString("title"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
				article.setFiles(rs.getString("files"));
				article.setOrgfiles(rs.getString("orgfiles"));
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
	public int updateArticle(DataRoom article) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "update DATA_BOARD set TITLE = ?,CONTENT = ?,FILES = ?,ORGFILES = ?where NUM=?";
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, article.getTitle());
			pstmt.setString(2, article.getContent());
			pstmt.setString(3, article.getFiles());
			pstmt.setString(4, article.getOrgfiles());
			pstmt.setInt(5,  article.getNum());
			
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
			pstmt = conn.prepareStatement("delete from DATA_BOARD where NUM=?");
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
		String SQL = "insert into DATA_ROOM_REPLY values(DATA_ROOM_REPLY_SEQ.nextval,?,?,?,?)";
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
		String SQL = "select * from DATA_ROOM_REPLY where bnum = ? order by cnum asc";
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
			pstmt = conn.prepareStatement("delete from DATA_ROOM_REPLY where CNUM=?");
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
