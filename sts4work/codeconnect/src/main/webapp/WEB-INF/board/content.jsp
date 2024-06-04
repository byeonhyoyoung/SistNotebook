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
<style type="text/css">
	.day{
		color: gray;
		margin-left: 90px;
		font-size: 0.9em;
	}
</style>
<script type="text/javascript">
	$(function(){
	
		//hidden처리한 전역변수(var 안쓰면 전역됨)
		num=$("#num").val(); //전역변수
		loginok="${sessionScope.loginok}";
		myid="${sessionScope.myid}";
		
		//alert(loginok+","+myid); //로그인된 사람 id띄우기
		
		//리스트호출
		list();
		
		//등록 버튼을 눌렀을떼
		$("#btnansweradd").click(function(){
			var content=$("#content").val();
			
			if(content.trim().length==0){ //안전하게 trim() 써주는것이 좋음
				alert("댓글내용을 입력해주세요");
				return;
			}
			
			//입력하면 ajax로 insert처리
			$.ajax({
				type:"post",
				dataType:"html",
				url:"ainsert",
				data:{"num":num,"content":content}, //num오류났을때 초기화안될수있음
				success:function(res){
					//alert("성공");
					list();
					
					//입력값 초기화
					$("#content").val("");
				}
			})
		})
		
	});
	
	//데이터 많아지니까
	//댓글리스트
   function list()
   {
	   num=$("#num").val(); //전역변수
	   loginok="${sessionScope.loginok}";
	   myid="${sessionScope.myid}";
	   
	   
	   $.ajax({
		   type:"get",
		   //restcontroller에서 return해주는게 json
		   dataType:"json",
		   url:"alist",
		   data:{"num":num},
		   success:function(data){
			   
			   $("span.acount").text(data.length); //댓글갯수
			   
			   //출력하고싶은것들 출력하기
			   //data가 배열명
			   var s="";
			   $.each(data,function(i,dto){
				   
				   s+="<b>"+dto.name+"</b>: "+dto.content;
				   s+="<span class='day'>"+dto.writeday+"</span>";
				   
				   //이때 s보이게하자
				   if(loginok=='yes' && myid==dto.myid){
					   s+="<i class='bi bi-pencil-square'></i>";
					   s+="&nbsp";
					   s+='<i class="bi bi-trash-fill"></i>';
				   }
				   
				   s+="<br>";
			   })
			   
			   //반복문 빠져나와서 출력해보기
			   $("div.alist").html(s);
		   }
	   })
   }
	
	
</script>
</head>
<body>
<div style="margin: 100px 180px;">
	<table class="table table-bordered" style="width: 600px">
		<tr>
			<td>
				<h3><b>${dto.subject }</b>
				<span style="color: gray; float: right; font-size: 12pt;">
					<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
				</span>
				</h3>
				<span>작성자: ${dto.name }(${dto.myid })</span>


				<c:if test="${dto.uploadfile!='no' }">
					<span style="float: right;">
					<a href="download?clip=${dto.uploadfile }">
					<i class="bi bi-cloud-download" style="color: gray;"></i>
					<b>${dto.uploadfile }</b> <!-- workbench확인 -->
					</a>
					</span>
				</c:if>
				
			</td>
		</tr>
		
		<tr>
			<td>
				<!-- 이미지 파일만 가져오고싶으니 true값만 가져오기 -->
				<c:if test="${bupload==true }">
					<h5>업로드된 파이이 이미지입니다</h5>
					<img alt="" src="../boardphoto/${dto.uploadfile }" style="max-width: 400px;">
				</c:if>
				
				<br><br>
				<pre>
					${dto.content }
				</pre>
				<br>
				<b>조회: ${dto.readcount }</b>&nbsp;&nbsp;
				<b>댓글: <span class="acount"></span></b>
			</td>
		</tr>
		
		<tr>
			<td>
			
				<div class="alist"></div> <!-- 댓글리스트 -->
				
				
				
				<input type="hidden" id="num" value="${dto.num }">
				<c:if test="${sessionScope.loginok!=null }">
					<div class="aform">
						<div class="d-inline-flex">
							<input type="text" class="form-control" style="width: 500px;"
							placeholder="댓글을 입력하세요" id="content">&nbsp;
							<button type="button" class="btn btn-info" style="width: 60px;"
							id="btnansweradd">등록</button>
						</div>
					</div>
				</c:if>
			</td>	
		</tr>
		
		<!-- 버튼들 -->
		<tr>
			<td align="right">
			
			<c:if test="${sessionScope.loginok!=null }">
				<button type="button" class="btn btn-outline-success" style="width: 80px;"
				onclick="location.href=''">글쓰기</button>
			</c:if>
				<button type="button" class="btn btn-outline-success" style="width: 80px;"
				onclick="location.href=''">목록</button>
				
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid  }">
				<button type="button" class="btn btn-outline-success" style="width: 80px;"
				onclick="location.href='updateform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
			</c:if>
			
			<c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid  }">
				<button type="button" class="btn btn-outline-success" style="width: 80px;"
				onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
			</c:if>	 <!-- 수정/삭제 c:if로 같이 묶어도됨 -->
				
			</td>
		</tr>
		
	</table>
</div>
</body>
</html>