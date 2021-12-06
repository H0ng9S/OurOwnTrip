<%@page import="our.own.trip.dto.MemberDto"%>
<%@page import="our.own.trip.dto.BbsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- bbslist.jsp에서 글을 고르고 제목을 눌렀을 때 작성된 글들의 세부 정보를 보여주는 bbsdetail.jsp(페이지)이다.  -->
    
<%
    // bbslist.jsp에서 다음과 같이 문자열 seq값을 얻어오고 객체 seq에 정수형으로 파싱하여 넣는다. 
    //    String sseq = (String)request.getAttribute("seq");
    //    int seq = Integer.parseInt(sseq);
    
    //    int seq = (Integer)request.getAttribute("seq");
        
        BbsDto dto = (BbsDto)request.getAttribute("bbs");
        
        String name = (String)request.getAttribute("name");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    a { text-decoration: none; color: black; }
    a:visited { text-decoration: none; }
    a:hover { text-decoration: none; }
    a:focus { text-decoration: none; }
    a:hover, a:active { text-decoration: none; }
</style>
</head>
<body style="background-color:#D8D8D8">

<%-- <%
MemberDto mem = (MemberDto)session.getAttribute("login"); // 저장했던 키값이 "login"인 세션을 받아와서 MemberDto객체인 mem에 넣는다.
if(mem == null){ // 로그인 정보 세션값이 존재하지 않을 때
%>
   <script type="text/javascript">
   alert("로그인을 해주십시오.");  // 다음과 같은 알림창이 출력된다.
   location.href = "login.do"; // 로그인정보의 세션값이 존재하지 않기 때문에 다시 로그인 페이지인 login.jsp로 이동한다.
   </script>
<%
}
%> --%>


<div class="container text-center" align="center">
	    <h1><a href="main.do" style="text-decoration: none">Our Own Trip</a></h1>
</div>

<br><br>

<div align="center">

<table border="1">
<col width="200px"><col width="400px">

<tr>
    <th>작성자</th>
    <td><%=dto.getId() %></td>
</tr>

<tr>
    <th>제목</th>
    <td>
        <%-- <input type="text" value="<%=dto.getTitle().replaceAll("\"", "&#34;") %>" size="90"> --%>
        <%=dto.getTitle().replaceAll("\"", "&#34;") %>
    </td>
</tr>

<tr>
    <th>작성일</th>
    <td>
        <%=dto.getWdate() %>
    </td>
</tr>

<tr>
    <th>조회수</th>
    <td>
        <%=dto.getReadcount() %>
    </td>
</tr>

<tr>
    <th>내용</th>
    <td>
        <textarea rows="15" cols="90" readonly="readonly"><%=dto.getContent() %></textarea>
    </td>
</tr>

</table>
</div>

<br>
<div align="center">
<button type="button" onclick="location.href='<%=name %>.do'">글목록</button>
<%-- <button type="button" onclick="answerbbs(<%=dto.getSeq() %>)">답글</button> --%>



<%
MemberDto mem = (MemberDto)session.getAttribute("login");
if(mem != null){
%>
  <%
    if(dto.getId().equals(mem.getId())){ // 세션에 저장되어 있는 로그인정보의 아이디와 글을 작성한 작성자의 아이디가 같을 때만 아래의 버튼이 보인다.
  %>
	<button type="button" onclick="updatebbs(<%=dto.getSeq() %>)">수정</button>
	<button type="button" onclick="deletebbs(<%=dto.getSeq() %>)">삭제</button>
  <% 
    }
  %>
  <%
}
%>

<%-- <%
if(dto.getId().equals(mem.getId())){ // 세션에 저장되어 있는 로그인정보의 아이디와 글을 작성한 작성자의 아이디가 같을 때만 아래의 버튼이 보인다.
	%>
	<button type="button" onclick="updatebbs(<%=dto.getSeq() %>)">수정</button>
	<button type="button" onclick="deletebbs(<%=dto.getSeq() %>)">삭제</button>
	<% 
}
%> --%>
</div>

<br><br>

<jsp:include page="sharereplylist.jsp" flush="false"/>

<br><br>

<%
if(mem != null){
%>
	<div align="center">

		<form action="writesharereply.do" method="post">
			<input type="hidden" name="seq" size="50px" value="<%=dto.getSeq()%>" readonly="readonly">
			<input type="hidden" name="title" size="50px" value="<%=dto.getTitle() %>" readonly="readonly">
			<input type="hidden" name="wdate" size="50px" value="<%=dto.getWdate() %>" readonly="readonly">
			<input type="hidden" name="readcount" size="50px" value="<%=dto.getReadcount() %>" readonly="readonly">
			<input type="hidden" name="content" size="50px" value="<%=dto.getContent() %>" readonly="readonly">
			<input type="hidden" name="name" size="50px" value="<%=name  %>" readonly="readonly">
			<table border="1">
				<col width="600px" height="300px">

				<tr>
					<th align="left"><%=mem.getId()%>님 <input type="hidden"
						name="id" size="50px" value="<%=mem.getId()%>"
						readonly="readonly"> <!-- id는 글을 작성할 때 이미 로그인이 되어있고 글을 작성하는 작성자의 id는 고정이므로 value값으로 id를 넣어주고 읽기만 가능한 readonly를 해준다.-->
					</th>
				</tr>

				<tr>
					<td><textarea rows="2px" cols="80px" name="replycontent"></textarea>
					</td>
				</tr>

				<tr>
					<td align="right"><input type="submit" value="댓글작성"></td>
				</tr>

			</table>

		</form>


	</div>
	
  <%
}
%>


<script type="text/javascript">
/* function answerbbs(seq) {
	location.href = "bbsanswer.do?seq=" + seq; // 답글 버튼을 눌렀을 때 실행되는 함수, bbsanswer.jsp로 seq값을 가지고 이동
} */
function updatebbs(seq) {
	location.href = "sharebbsupdate.do?seq=" + seq; // 수정 버튼을 눌렀을 때 실행되는 함수, bbsupdate.jsp로 seq값을 가지고 이동
}
function deletebbs(seq,sort) {
	location.href = "sharebbsdelete.do?seq=" + seq; // 삭제 버튼을 눌렀을 때 실행되는 함수, bbsdelete.jsp로 seq값을 가지고 이동
}


</script>


</body>
</html>









