package myblog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;

public class BlogDao {
	private static BlogDao instance = null;
	private BlogDao() {}
	public static BlogDao getInstance() {
		if(instance == null) {
			synchronized(BlogDao.class) {
				instance  = new BlogDao();
			}
		}
		return instance;
	}
	
	public int insertUesr(User user)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			String str = "insert into users values(user_seq.nextval,?,?,?,?,?,?)";
			pstmt =conn.prepareStatement(str);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getEmail());
			pstmt.setInt(4, user.getGender());
			pstmt.setString(5, user.getName());
			pstmt.setTimestamp(6, Timestamp.valueOf(LocalDateTime.now()));
			int count = pstmt.executeUpdate();
			if(count>0) result = 0;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return result;
	}
	public int loginUser(String userID, String userPassword) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "SELECT password FROM users WHERE id = ?";
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;//로그인 성공
				}
				else
					return 0; //비밀번호 불일치
			}
			return -1;//아이디 없음
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return -2;//데이터베이스 오류
	}
	public User getUser(String userID) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		User tmpUser = new User();
		String SQL = "select * from users where id= ?";
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				tmpUser.setNum(rs.getInt("num"));
				tmpUser.setId(rs.getString("id"));
				tmpUser.setPassword(rs.getString("password"));
				tmpUser.setName(rs.getString("name"));
				tmpUser.setGender(rs.getInt("gender"));
				tmpUser.setEmail(rs.getString("email"));
				tmpUser.setRegdate(rs.getTimestamp("regdate"));
			}
			return tmpUser;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return tmpUser;
	}
	public int updateUser(User user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "update USERS set password = ?,email = ? where id = ?";
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "123123");
			pstmt.setString(2, "tkdwns1245@gmail.com");
			pstmt.setString(3, "tkdwns1245");
			return pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
	return -1;
	}
	public int idCheck(String id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select id from users where id= ?";
		String tmpStr = "";
		int result = 1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) return -1;
			return result;
		}catch(SQLException sqle) {
			sqle.printStackTrace();
		}
		finally {
			if(rs != null) try {rs.close();}catch(SQLException sqle1) {}
			if(pstmt != null) try {pstmt.close();}catch(SQLException sqle2) {}
			if(conn != null) try {conn.close();}catch(SQLException sqle3) {}
		}
		return -2;
	}
}
