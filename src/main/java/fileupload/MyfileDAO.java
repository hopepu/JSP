package fileupload;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MyfileDAO extends DBConnPool{//jdbc 1,2,5단계 상속받음
	// jdbc 1~5단계
	
	// 입력 메서드
	public int insertFile(MyfileDTO fileDTO) {
		int result=0;
		String query = "insert into myfile (idx, name, title, cate, ofile, sfile)"
									+ " values (seq_board_num.nextval, ?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fileDTO.getName());
			pstmt.setString(2, fileDTO.getTitle());
			pstmt.setString(3, fileDTO.getCate());
			pstmt.setString(4, fileDTO.getOfile());
			pstmt.setString(5, fileDTO.getSfile());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			System.out.println("MyfileDAO의 insertFile() 오류");
			e.printStackTrace();
		}
		return result;
	}
	
	// 출력 메서드
	public List<MyfileDTO> myFileList(){
		List<MyfileDTO> fileList = new Vector<MyfileDTO>(); // 멀티 스레드 용
		
		String query ="select * from myfile order by idx desc";
		
		try {
			pstmt = con.prepareStatement(query);
			rs = pstmt.executeQuery(); //쿼리문 실행 후에 결과를 표로
			
			while(rs.next()) {
				MyfileDTO dto = new MyfileDTO(); // 빈객체 생성
				dto.setIdx(rs.getString("idx"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setCate(rs.getString("cate"));
				dto.setOfile(rs.getString("ofile"));
				dto.setSfile(rs.getString("sfile"));
				dto.setPostdate(rs.getString("postdate")); // 객체 값 입력 완료
				
				fileList.add(dto); //리스트에 객체 삽입
			}
		} catch (SQLException e) {
			System.out.println("MyfileDAO의 myFileList() 오류");
			e.printStackTrace();
		}		
		return fileList; // 결론 테이블에 있는 모든 값이 리스트의 객체로 리턴된다.
	}
	
	// 수정 메서드
	
	// 삭제 메서드
}
