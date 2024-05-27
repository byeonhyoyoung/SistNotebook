<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
<div style="margin: 50px 100px;">
	<!-- <h1>MemberList</h1> -->
	
	<h2 style="margin-top: 100px;">1:1문의</h2><br>
	
	<table class="table table-bordered">
		<tr align="center">
			<th width="450">제목</th>
			<th width="100">작성일</th>
			<th width="100">답변상태</th>
		</tr>
		<tr>
			<td>채용공고 문의</td>
			<td align="center">2024.05.27</td>
			<td align="center">답변대기</td>
		</tr>
		<tr>
			<td>이력서작성 문의</td>
			<td align="center">2024.05.22</td>
			<td align="center">답변완료</td>
		</tr>
		<tr>
			<td>문의</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>문의</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>문의</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>문의</td>
			<td></td>
			<td></td>
		</tr>
		
	</table>
	
	<div align="right" style="margin-top: 30px;">
		<button type="button" class="btn btn-success">문의하기</button>
	</div>
</div>

<div style="margin-top: 100px;">
	<table class="table table-bordered" style="width: 700px;">
								
		<tbody>
			<tr>
				<th scope="row"><label for="forName">이름</label></th>
				<td class="end">
					<input type="text" id="forName" name="REGNAME" title="이름 입력" style="width:150px" required="이름을 입력해주세요." maxlength="20" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="email1">이메일</label></th>
				<td class="end">
					<input type="text" id="email1" title="이메일 아이디 입력"  style="width:145px" maxlength="25" />&nbsp;@
					<label for="email2" class="blind"></label>
					<input type="text" id="email2" title="이메일 도메인입력" style="width:145px" maxlength="25" />
					<label for="email3" class="blind"></label> 
					<select onchange="fnEmailEvent(this)" id="email3" style="width:145px" title="이메일 도메인선택">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
                           <option value="hanmail.net">hanmail.net</option>
                           <option value="nate.com">nate.com</option>
                           <option value="hotmaiil.com">hotmaiil.com</option>
                           <option value="paran.com">paran.com</option>
                           <option value="yahoo.com">yahoo.com</option>
                           <option value="chol.com">chol.com</option>
                           <option value="dreamwiz.com">dreamwiz.com</option>
                           <option value="empal.com">empal.com</option>
                           <option value="freechal.com">freechal.com</option>
                           <option value="gmail.com">gmail.com</option>
                           <option value="hanafos.com">hanafos.com</option>
                           <option value="hanmir.com">hanmir.com</option>
                           <option value="hitel.net">hitel.net</option>
                           <option value="korea.com">korea.com</option>
                           <option value="lycos.co.kr">lycos.co.kr</option>
                           <option value="netian.com">netian.com</option>
					</select>
					<input type="hidden" id="EMAIL" name="EMAIL" title="이메일 주소" emailKr />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="forTit">제목</label></th>
				<td class="end">
					<input type="text" id="forTit" name="TITLE" title="제목 입력" style="width:500px" required="제목을 입력해주세요." maxlength="100" />
				</td>
			</tr>
			<tr>
				<th scope="row"><label for="forTit">사진첨부</label></th>
				<td class="end">
					<input type="file" id="forTit" name="TITLE" title="제목 입력" style="width:500px" required="제목을 입력해주세요." maxlength="100" />
				</td>
			</tr>
			<tr>
				<th scope="row" class="vaT pt20"><label for="forCon">내용</label></th>
				<td class="end">
					<textarea id="forCon" name="CONTENTS" style="max-width:500px; min-width:500px; height:236px; color:#333" required="내용을 입력해주세요."></textarea>
				</td>
			</tr>
		</tbody>
	</table>
							
							
	<div style="margin-left: 515px;">
		<button type="submit" class="btn btn-success">문의하기</button>
		<button type="button" class="btn btn-danger">취소하기</button>
	</div>

</div>
</body>
</html>