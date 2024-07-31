<%@page import="fileupload.MyfileDAO"%>
<%@page import="fileupload.MyfileDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- UploadProcess.jsp : cos.jar를 활용하여 파일처리 하고 dao로 연결한다. -->
    <%
    /* method="post" enctype="multipart/form-data" */
    /* 필요요소 4가지 : request, save root, max file size, encoding*/
    //1단계 : cos.jar 연결
    try{
    String saveDirectory = application.getRealPath("/Uploads"); //저장할 디렉토리
    /* application.getRealPath : http://192.168.111.101/board-jsp */
    
    int maxPostSize = 1024 * 1024 * 100;/* 최대 파일 크기 = kb * mb * 100 : 100메가바이트 */
    
    String encoding = "UTF-8";
    
    MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
    System.out.println("saveDirectory : "+saveDirectory);
    System.out.println("maxPostSize : "+maxPostSize);
    
    // 2단계 : ofile, sfile 결정
    
    // 2. 새로운 파일명 생성
    String fileName = mr.getFilesystemName("attachedFile");  // 현재 파일 이름
    String ext = fileName.substring(fileName.lastIndexOf("."));  // 파일 확장자
    String now = new SimpleDateFormat("yyyyMMdd_HmsS").format(new Date());
    String newFileName = now + ext;  // 새로운 파일 이름("업로드일시.확장자")
    
    System.out.println("fileName : "+fileName);
    System.out.println("ext : "+ext);
    System.out.println("now : "+now);
    System.out.println("newFileName : "+newFileName);

    // 3. 파일명 변경
    File oldFile = new File(saveDirectory + File.separator + fileName); // File.separator : \
    File newFile = new File(saveDirectory + File.separator + newFileName);
    oldFile.renameTo(newFile);
    
    System.out.println("oldFile : "+oldFile);
    System.out.println("newFile : "+newFile);
    
    // 4. FileUploadMain에서 넘어온 폼 값 처리 name="fileForm"
    
    String name = mr.getParameter("name");
    String title = mr.getParameter("title");
    String[] cateArray = mr.getParameterValues("cate");//배열은 Vaules
    StringBuffer cateBuf = new StringBuffer(); // String append 가능
        
    if(cateArray == null){
    	cateBuf.append("선택 없음");
    } else {
    	for(String s : cateArray){
    		cateBuf.append(s+",");
    	} // 사진, 과제, 워드, 음원
    }
    
    // 5. DTO에 4번 값 넣기
    MyfileDTO dto = new MyfileDTO();
    dto.setName(name);
    dto.setTitle(title);
    dto.setCate(cateBuf.toString());
    dto.setOfile(fileName);
    dto.setSfile(newFileName);
    
    // 6. DAO를 통해 데이터베이스에 반영
    MyfileDAO dao = new MyfileDAO();
    dao.insertFile(dto);
    dao.close();
    
    //7. 파일 목록 JSP로 리디렉션
    response.sendRedirect("FileList.jsp"); //성공시 되돌아감
    
    }catch (Exception e){
    	System.out.println("UploadProcess.jsp 예외 발생");
    	e.printStackTrace(); // 로그 출력
    	request.setAttribute("errorMessage", "파일 업로드 오류");
    	request.getRequestDispatcher("FileUploadMain.jsp").forward(request, response);
    	
    	
    };
    
    
    
    
    
    
    %>
    
    