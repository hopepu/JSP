package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DTO.MemberDTO;

public class MemberDAO {
	
	public void memberInsert(MemberDTO memberDTO, Connection con){
		try {
			String sql = "insert into member(id, pass, name, regidate) values (?,?,?, sysdate)";
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, memberDTO.getId());
			psmt.setString(2, memberDTO.getPass());
			psmt.setString(3, memberDTO.getName());
			
			int result = psmt.executeUpdate();
			if(result > 0) {
				System.out.println(result + "분이 가입되셨습니다.");
			} else {
				System.out.println("가입에 실패하셨습니다.");
			}
		} catch (SQLException e) {
			System.out.println("동일한 id가 존재합니다.");
			System.out.println("쿼리문이 오류입니다.");
			e.printStackTrace();
		}
		
		
	}
	
	public void memberRead(Connection con) throws SQLException {
		String sql = "select * from member";
		PreparedStatement psmt = con.prepareStatement(sql);
		ResultSet resultSet = psmt.executeQuery();
		while(resultSet.next()) {
			String id = resultSet.getString("id");
			String pw = resultSet.getString("pass");
			String name = resultSet.getString("name");
			Date regidate = resultSet.getDate("regidate");
			
			System.out.println(String.format("%s %s %s %s", id, pw, name, regidate)+"<br/>");
			
			
			
			
		}
		
	}
}
