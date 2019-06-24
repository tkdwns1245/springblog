package myblog;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ResearchDao {
	private static ResearchDao instance = null;
	private ResearchDao() {}
	public static ResearchDao getInstance() {
		if(instance == null) {
			synchronized(ResearchDao.class) {
				instance  = new ResearchDao();
			}
		}
		return instance;
	}
	
	public int insertResearch(Research rch) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "insert into RESEARCH values(RESEARCH_SEQ.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int result = -1;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, rch.getGender());
			pstmt.setInt(2, rch.getAge());
			pstmt.setInt(3, rch.getBackground());
			pstmt.setInt(4, rch.getMarry());
			pstmt.setString(5, rch.getBlood());
			pstmt.setInt(6, rch.getQ1());
			pstmt.setInt(7, rch.getQ2());
			pstmt.setInt(8, rch.getQ3());
			pstmt.setInt(9, rch.getQ4());
			pstmt.setInt(10, rch.getQ5());
			pstmt.setInt(11, rch.getQ6());
			pstmt.setInt(12, rch.getQ7());
			pstmt.setInt(13, rch.getQ8());
			pstmt.setInt(14, rch.getQ9());
			pstmt.setInt(15, rch.getQ10());
			pstmt.setInt(16, rch.getSum());
			
			result = pstmt.executeUpdate();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
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
	
	public int getResearchCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select count(*) from research";
		int result = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs =  pstmt.executeQuery();
			if(rs.next())
			{
				result =  rs.getInt(1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
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
	public int getScoreCount(int lower,int upper) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "select count(*) from research where sum>= ? and sum <?";
		int result = 0;
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, lower);
			pstmt.setInt(2, upper);
			rs =  pstmt.executeQuery();
			if(rs.next())
			{
				result =  rs.getInt(1);
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally{
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
}
