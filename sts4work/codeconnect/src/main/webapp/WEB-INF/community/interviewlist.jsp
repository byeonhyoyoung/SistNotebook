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
    .wrap_category_type ul {
        list-style-type: none;
        font-size: 20px;
        padding-left: 0;
    }
    .wrap_category_type ul li {
        display: inline;
        margin-right: 20px;
    }
    .card {
        margin-bottom: 20px;
    }
    a.page-link { 
    	color: gray; /* 페이징 숫자 색 */
    }
    .wrap_category_type .list_category {
    	overflow: hidden;
    	padding: 30px 40px 30px 30px;
    	border: 1px solid #eaeaea;
    }
    
    
</style>
</head>
<body>
<div class="container" style="margin-top: 120px;">
    <h4>현직자 인터뷰</h4>
    <div class="wrap_category_type" style="margin-top: 30px;">
        <ul class="list_category">
            <li><a href="">전체</a></li>
            <li><a href="">서버/백엔드 개발자</a></li>
            <li><a href="">프론트엔드 개발자</a></li>
            <li><a href="">웹 풀스택 개발자</a></li>
            <li><a href="">안드로이드 개발자</a></li>
            <li><a href="">IOS 개발자</a></li>
            <li><a href="">게임 클라이언트 개발자</a></li>
            <li><a href="">DBA</a></li>
            <li><a href="">빅데이터 엔지니어</a></li>
            <li><a href="">인공지능/머신러닝</a></li>
            <li><a href="">devops/시스템 엔지니어</a></li>
            <li><a href="">정보보안 담당자</a></li>
            <li><a href="">QA 엔지니어</a></li>
            <li><a href="">개발 PM</a></li>
            <li><a href="">HW/임베디드</a></li>
            <li><a href="">SW/솔루션</a></li>
            <li><a href="">VR/AR/3D</a></li>
            <li><a href="">기술지원</a></li>
        </ul>
    </div>
    <div class="input-group" style="margin-top: 30px; width: 350px; left: 10px; ">
        <input type="text" class="form-control" placeholder="직무 또는 기업명을 입력하세요">
        <button class="btn btn-primary" type="button">검색</button>
    </div>
    <div class="row" style="margin-top: 40px;">
        <c:forEach var="interview" items="${interviewList}">
            <div class="col-md-4">
                <div class="card">
                    <img src="${interview.image}" class="card-img-top" alt="인터뷰 이미지">
                    <div class="card-body">
                        <h5 class="card-title">${interview.title}</h5>
                        <p class="card-text">${interview.description}</p>
                        <a href="interviewDetail?num=${interview.num}" class="btn btn-primary">더보기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <nav aria-label="Page navigation example" style="margin-top: 20px;">
        <ul class="pagination justify-content-center">
            <c:if test="${startPage>1}">
                <li class="page-item">
                    <a class="page-link" href="list?currentPage=${startPage-1}">이전</a>
                </li>
            </c:if>
            <c:forEach var="pageNum" begin="${startPage}" end="${endPage}">
                <c:if test="${currentPage == pageNum}">
                    <li class="page-item active">
                        <a class="page-link" href="#">${pageNum}</a>
                    </li>
                </c:if>
                <c:if test="${currentPage != pageNum}">
                    <li class="page-item">
                        <a class="page-link" href="list?currentPage=${pageNum}">${pageNum}</a>
                    </li>
                </c:if>
            </c:forEach>
            <c:if test="${endPage < totalPage}">
                <li class="page-item">
                    <a class="page-link" href="list?currentPage=${endPage+1}">다음</a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
</body>
</html>