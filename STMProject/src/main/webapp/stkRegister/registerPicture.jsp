<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> --%>
<%-- <%@ page import="java.io.*, org.apache.commons.fileupload.*" %> --%>
<%-- <%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %> --%>
<%-- <%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %> --%>
<%-- <%@ page import="java.util.List" %> --%>
<%-- <%@ page import="java.util.Iterator" %> --%>
<%-- <%@ page import="org.apache.commons.fileupload.FileItem" %> --%>
<%-- <%  --%>
// String uploadPath = "경로/where/to/save/uploads"; // 파일을 저장할 경로
// File uploadDir = new File(uploadPath);
// if (!uploadDir.exists()) {
//     uploadDir.mkdir();
// }

// boolean isMultipart = ServletFileUpload.isMultipartContent(request);
// if (isMultipart) {
//     FileItemFactory factory = new DiskFileItemFactory();
//     ServletFileUpload upload = new ServletFileUpload(factory);
//     try {
//         List<FileItem> items = upload.parseRequest(request);
//         Iterator<FileItem> iter = items.iterator();
//         while (iter.hasNext()) {
//             FileItem item = iter.next();
//             if (!item.isFormField()) {
//                 String fileName = new File(item.getName()).getName();
//                 String filePath = uploadPath + File.separator + fileName;
//                 File uploadedFile = new File(filePath);
//                 item.write(uploadedFile);
//                 out.println("파일 업로드 완료: " + fileName);
//             }
//         }
//     } catch (Exception e) {
//         out.println("파일 업로드 오류: " + e.getMessage());
//     }
// }
<%-- %> --%>




