<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	.nav ul {
		list-style-type: none; /* 리스트 점 없애기 */
		display: flex;
		gap: 20px;
		padding: 0;
		justify-content: center;
		margin-top: 40px;
	}
	
	.nav ul a {
	   display: block;
	   color: gray;
	   text-decoration: none;
	   font-weight: 700;
	   font-size: 25px;
	   line-height: 32px;
	   padding: 0 15px;
	}
	
	.linkgo {
	   display: flex;
	   text-decoration: none;
	   font-size: 30px;
	   align-items: center;
	}
	
	.container {
		display: flex;
		align-items: center; /* 세로 가운데 정렬 */
		justify-content: space-between;
		margin-bottom: 20px;
	}
	
	.container h2 {
        display: inline-block;
        color: black;
    }
    
    .hot {
    	color: blue;
    }
    
    .wrap_title a {
    	text-decoration: none;
    	color: black;
    	font-size: 30px;
    }
    
    .list_story li {
    	list-style-type: none;
    	font-size: 28px;
    	padding-bottom: 30px;
    }
    
    .list_story a {
    	text-decoration: none;
    	color: black;
    }
    
    .list_story .item {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .list_story .details {
        display: flex;
        gap: 10px;
    }
    
    .section_inner {
        border: 1px solid #eaedf4;
        border-radius: 15px;
        margin: 40px 0;
        padding: 20px;
    }
    
    ul.list_category {
    	display: flex;
    	gap: 15px;
    	padding: 0;
    	justify-content: center;
    	flex-wrap: wrap;
    }
    
    ul.list_category li {
    	text-align: center;
    	border: 1px solid gray;
        border-radius: 10px;
        height: 70px;
        width: 180px;
        display: flex;
        justify-content: center;
        align-items: center;
        list-style: none;
    }
    
    .list_category a {
        text-decoration: none;
        color: inherit;
        display: block;
        line-height: 40px;
        font-size: 25px;
    }
    
    .community_list {
    	margin-top: 50px;
    	display: flex;
    	flex-wrap: wrap;
    	gap: 20px;
    	justify-content: space-between;
    }
    
    .wrap_title {
	    display: flex;
	    justify-content: space-between;
	}
	
	.list_story ul a {
		padding-bottom: 30px;
	}
</style>
</head>
<body>
<nav class="nav" style="margin-top: 50px;">
	<ul>
		<a class="nav-link" href="${root }/community/list">홈</a>
	    <a class="nav-link" href="${root }/community/interviewlist">현직자 인터뷰</a>
	</ul>
</nav>

<div class="commutitle" style="width: 1200px; margin: 50px auto;">
	<div class="container">
        <div class="linkgo d-flex justify-content-between" style="width: 100%;">
            <a href="${root }/community/homedetail">
                <h2>
                    <b>실시간 전체글 ${totalCount}개<i class="bi bi-chevron-right"></i></b>
                </h2>
            </a>
           
            <div class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="다른 사람들은 어떤 이야기를 할까?" aria-label="Search"
                style="width: 350px;">
                <button type="button" class="btn btn-outline-success">
                	<span class="blind">검색</span>
                </button>
            </div>
        </div>
    </div>
    
	<div class="section_inner">
		<div class="wrap_title d-flex justify-content-between" style="margin-bottom: 20px;">
			<a href="#" style="margin-top: 25px;">
				<b class="hot">HOT</b> <b>이번주 전체 인기글</b>
			</a>
			<a href="#" style="font-size: 20px; color: gray;">
			더보기<i class="bi bi-chevron-right"></i></a>
		</div>
		<ul class="list_story">
			<c:forEach var="dto" items="${list}">
				<li class="item">
					<a href="#">${dto.sangpum}</a>
					<div class="details">
						<span class="comment">${dto.price}</span>
						<span class="views">${dto.ipgoday}</span>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</div>

<div style="width: 1200px; margin: 60px auto;">
	<div class="container2">
		<div class="linkgo d-flex justify-content-between" style="width: 100%;">
            <h2><b>주제별 커뮤니티</b></h2>
        </div>
        <div class="category" style="margin-top: 50px;">
        	<ul class="list_category js-category">
    			<li><a href="#">전체글</a></li>
    			<li><a href="#">신입</a></li>
    			<li><a href="#">취준</a></li>
    			<li><a href="#">자소서</a></li>
    			<li><a href="#">면접</a></li>
    			<li><a href="#">Q&A</a></li>
        	</ul>
        	
       		<div class="community_list">
       			<div class="section_inner" style="width: 48%;">
       				<div class="wrap_title">
       					<a class="title" href="#"><b>전체글</b></a>
       					<a href="#" style="font-size: 1.1em;">더보기<i class="bi bi-chevron-right"></i></a>
       				</div>
       				<ul class="list_story" style="margin-top: 20px;">
       					<li><a href="#">내용 불러오기 1</a></li>
       					<li><a href="#">내용 불러오기 2</a></li>
       					<li><a href="#">내용 불러오기 3</a></li>
       					<li><a href="#">내용 불러오기 4</a></li>
       				</ul>
       			</div>
       			
       			<div class="section_inner" style="width: 48%;">
       				<div class="wrap_title">
       					<a class="title" href="#"><b>신입</b></a>
       					<a href="#" style="font-size: 1.1em;">더보기<i class="bi bi-chevron-right"></i></a>
       				</div>
       				<ul class="list_story" style="margin-top: 20px;">
       					<li><a href="#">내용 불러오기 1</a></li>
       					<li><a href="#">내용 불러오기 2</a></li>
       					<li><a href="#">내용 불러오기 3</a></li>
       					<li><a href="#">내용 불러오기 4</a></li>
       				</ul>
       			</div>
       			
       			<div class="section_inner" style="width: 48%;">
			        <div class="wrap_title">
			            <a class="title" href="#"><b>취준</b></a>
			            <a href="#" style="font-size: 1.1em;">더보기<i class="bi bi-chevron-right"></i></a>
			        </div>
			        <ul class="list_story" style="margin-top: 20px;">
			            <li><a href="#">내용 불러오기 1</a></li>
			            <li><a href="#">내용 불러오기 2</a></li>
			            <li><a href="#">내용 불러오기 3</a></li>
			            <li><a href="#">내용 불러오기 4</a></li>
			        </ul>
			    </div>
			    
			    <div class="section_inner" style="width: 48%;">
			        <div class="wrap_title">
			            <a class="title" href="#"><b>자소서</b></a>
			            <a href="#" style="font-size: 1.1em;">더보기<i class="bi bi-chevron-right"></i></a>
			        </div>
			        <ul class="list_story" style="margin-top: 20px;">
			            <li><a href="#">내용 불러오기 1</a></li>
			            <li><a href="#">내용 불러오기 2</a></li>
			            <li><a href="#">내용 불러오기 3</a></li>
			            <li><a href="#">내용 불러오기 4</a></li>
			        </ul>
			    </div>
       			
       			<div class="section_inner" style="width: 48%;">
			        <div class="wrap_title">
			            <a class="title" href="#"><b>면접</b></a>
			            <a href="#" style="font-size: 1.1em;">더보기<i class="bi bi-chevron-right"></i></a>
			        </div>
			        <ul class="list_story" style="margin-top: 20px;">
			            <li><a href="#">내용 불러오기 1</a></li>
			            <li><a href="#">내용 불러오기 2</a></li>
			            <li><a href="#">내용 불러오기 3</a></li>
			            <li><a href="#">내용 불러오기 4</a></li>
			        </ul>
			    </div>
       			
       			<div class="section_inner" style="width: 48%;">
			        <div class="wrap_title">
			            <a class="title" href="#"><b>Q&A</b></a>
			            <a href="#" style="font-size: 1.1em;">더보기<i class="bi bi-chevron-right"></i></a>
			        </div>
			        <ul class="list_story" style="margin-top: 20px;">
			            <li><a href="#">내용 불러오기 1</a></li>
			            <li><a href="#">내용 불러오기 2</a></li>
			            <li><a href="#">내용 불러오기 3</a></li>
			            <li><a href="#">내용 불러오기 4</a></li>
			        </ul>
			    </div>
       		</div>
        </div>
	</div>
</div>
</body>
</html>

<%-- <table class="table table-bordered">
   <caption align="top"><b>
     <span style="float: right;"><button type="button" class="btn btn-outline-success"
     onclick="location.href='writeform'">게시글 작성</button></span>
   </b></caption>
   
   <c:forEach var="dto" items="${list }">
      <tr>
         <td width="250" rowspan="4">
           <c:if test="${dto.photoname!='no' }">
              <c:forTokens var="pn" items="${dto.photoname }" delims="," begin="0" end="0">
                 <a href="../ipgoimage/${pn }">
                   <img alt="" src="../ipgoimage/${pn }" style="width: 150px;">
                 </a>
              </c:forTokens>
           </c:if>
           
           <c:if test="${dto.photoname=='no' }">
              <a href="../image/noimage.jpg">
               <img alt="" src="../image/noimage.jpg" style="width: 150px;">
              </a>   
           </c:if>
         </td>
         <td>
           <b>상품명: ${dto.sangpum }</b>
         </td>
      </tr>
      
      <tr>
        <td>
          <b>단가: <fmt:formatNumber value="${dto.price }" type="currency"/></b>
        </td>
      </tr>
      <tr>
        <td>
          <b>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy년 MM월 dd일"/></b>
        </td>
      </tr>
      
      <tr>
        <td>
          <button type="button" class="btn btn-outline-info"
          onclick="location.href='updateform?num=${dto.num}'">수정</button>
          <button type="button" class="btn btn-outline-info"
          onclick="location.href='delete?num=${dto.num}'">삭제</button>
        </td>
      </tr>
   </c:forEach>
</table>

</div>
</body>
</html> --%>