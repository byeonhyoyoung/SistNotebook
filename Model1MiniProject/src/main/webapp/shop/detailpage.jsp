<%@page import="java.text.NumberFormat"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.ShopDao"%>
<%@page import="data.dto.ShopDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<style type="text/css">
	img.large{
		width: 400px;
		height: 480px;
	}
</style>
<!-- <script type="text/javascript">
	$(function(){
		
		$("#btncart").click(function(){
			
			
			var cartdata=$("#frm").serialize();
			alert(cartdata);
		})
	})
</script> -->
</head>
<body>
<%
	String shopnum=request.getParameter("shopnum");
	String loginok=(String)session.getAttribute("loginok"); //로그인상태여야 시퀀스 얻을 수 있음
	String myid=(String)session.getAttribute("myid");
	//아이디에 해당하는 멤버 시퀀스
	MemberDao mdao=new MemberDao();
	String num=mdao.getNum(myid);
	
	//해당상품에대한 데이터
	ShopDao sdao=new ShopDao();
	ShopDto dto=sdao.getData(shopnum);
	
	NumberFormat nf=NumberFormat.getCurrencyInstance();
%>

<div style="margin: 50px 100px; width: 800px;">
	<form id="frm"> <!-- id줘서 name을 한번에 넘김 -->
		<!-- hidden: 장바구니 db에 넣어야 할것 -->
		<input type="hidden" name="shopnum" value="<%=shopnum%>">
		<input type="hidden" name="num" value="<%=num%>">
		
	
	<table class="table">
           <tr>
             <td style="width: 500px;">
                <img alt="" src="shopsave/<%=dto.getPhoto()%>"
                class="large img-thumbnail">
             </td>
             <td style="width: 300px; padding-top: 50px;">
                <h4>카테고리: <%=dto.getCategory() %></h4><br>
                <h4>상품명: <%=dto.getSangpum() %></h4><br>
                <h4>가격: <%=nf.format(dto.getPrice()) %></h4><br>
                <!-- 갯수 -->
                <h4>갯수: 
                   <input type="number" min="1" max="10" value="1"
                   step="1" name="cnt" >
                  
                </h4><br>
                
                
                <div style="margin-top: 100px; margin-left: 60px;">
                   <button type="button" class="btn btn-info"
                   id="btncart">장바구니</button>
                   <button type="button" class="btn btn-success"
                   onclick="location.href='index.jsp?main=shop/shoplist.jsp'">상품목록</button>
                </div>
				
			</td>
		</tr>
	
	
		
	</table>
	</form>
	
	<script type="text/javascript">
	$("#btncart").click(function(){
		var login="<%=loginok%>";
		
		if(login=="null"){ //대따옴표 해주기
			alert("먼저 로그인을 해주세요");
			return;
		}
		
		//form태그 가져오기
		var cartdata=$("#frm").serialize();
		//alert(cartdata); //장바구니로 넘어가는거 됨 ->이제 cart에 insert되는거 만들기(shopDao로..)
		
		//insert처리
		$.ajax({
			type:"post", //detailprocess.jsp에서 Encoding했으니 post타입으로..
			dataType:"html",
			data:cartdata,
			url:"shop/detailprocess.jsp",
			success:function(){
				
				//alert("success");
				
				var a=confirm("장바구니에 저장하였습니다\n장바구니로 이동하려면 [확인]을 눌러주세요");
				
				if(a){
					location.href="index.jsp?main=shop/mycart.jsp";
				}
			}
		})
		
	});
	
	</script>
</div>
</body>
</html>