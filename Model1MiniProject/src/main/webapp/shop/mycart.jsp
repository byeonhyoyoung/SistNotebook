<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
	img.photo{
		width: 60px;
		height: 80px;
		border: 2px solid gray;
		
	}
	
	div.sangpum{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	$(function(){
		
		$("#allcheck").click(function(){
			
			var chk=$(this).is(":checked"); //smartboard/boardlist.jsp확인해보기
			
			$(".idx").prop("checked",chk);
		});
		
		
		//상품클릭시 디테일 페이지로 이동
		$("div.sangpum").click(function(){
			
			//shopnum넘어오는지 확인하기
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum); //심어놓고 확인해보고 이동할것
			
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
			
		});
		
		//선택한 상품 삭제버튼
		$("#btncartdel").click(function(){
			
			var cnt=$(".idx:checked").length;
			//alert(cnt);
			
			if(cnt==0){ //null값 체크
				alert("먼저 삭제할 상품을 1개이상 선택해 주세요");
				return;
			};
			
			//넘어오는지 테스트
			$(".idx:checked").each(function(i,elt){
				
				var idx=$(this).attr("idx");
				console.log(idx);
				
				
				//선택한 장바구니 상품 모두 삭제하기
				del(idx);
			});
			
			//현재페이지 새로고침
			location.reload();
			
		});
		
		//i태그 한개 삭제이벤트
		$("i.del").click(function(){
			var idx=$(this).attr("idx");
			//alert(idx);
			
			var a=confirm("삭제하려면 [확인]을 눌러주세요"); //너무 순삭이니까..
			if(a){
				del(idx);
				location.reload(); //그 페이지에 그대로 머물러있어야하니까
			}
		});
		
		
		
		
	})
	
	//삭제하는 사용자 함수만들기
	function del(idx)
	{
		$.ajax({
			
			type:"get",
			url:"shop/cartdelete.jsp",
			dataType:"html",
			data:{"idx":idx},
			success:function(){
				
			}
		})
	}
</script>
</head>
<%
	String id=(String)session.getAttribute("myid");
	ShopDao dao=new ShopDao();
	List<HashMap<String,String>> list=dao.getCartList(id);
	NumberFormat nf=NumberFormat.getInstance();
%>
<body>
<h4 class="alert alert-info" style="width: 1000px;"><%=id %>님의 장바구니</h4>
<%-- <h4><%=list.size() %></h4> --%> <!-- 장바구니갯수 체크해봄 -->

<table class="table table-striped" style="width: 1000px;">
	<tr>
		<th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
		<th style="width: 200px;">상품정보</th>
		<th style="width: 200px;">상품금액</th>
	</tr>
	
	<%
	int totalmoney=0;
		for(int i=0; i<list.size(); i++)
		{
			HashMap<String,String> map=list.get(i); //첫번째 키값은 기본String
			//사진얻기
			String photo=map.get("photo");
			%> 
			<!-- 프론트 출력하게 자바 닫아주기 -->
			
			<tr>
				<td>
					<input type="checkbox" name="idx" idx="<%=map.get("idx")%>" class="idx">
				</td>
				<td>
					<div class="sangpum"  shopnum="<%=map.get("shopnum")%>"> <!-- 이미지 이동해야하니까 div 넣어보자 or span -->
						<img alt="" src="shopsave/<%=photo%>" class="photo" align="left" hspace="20"> <!-- hspace는 공간 -->
						<b>상품명: <%=map.get("sangpum") %></b><br>
						<b>갯수: <%=map.get("cnt") %>개</b><br>
						<b>가격: <%=map.get("price") %>원</b><br>
						<b>날짜: <%=map.get("cartday") %></b><br>
					</div>
				</td>
				
				<td style="vertical-align: middle;">
					<%
					
						
						int price=Integer.parseInt(map.get("price")); //형변환
						int cnt=Integer.parseInt(map.get("cnt"));
						price*=cnt;
						totalmoney+=price; //totalmoney에 price가 누적되어야겠지?
					%>
					
					<h6><%=nf.format(price) %>원
						<i class="bi bi-trash del" idx="<%=map.get("idx")%>" style="color: red; margin-left: 20px;"></i> <!-- idx심어주기 그래야 파라메타값으로 넘어가서 삭제되겠지 -->
					</h6>	
				</td>
			</tr>
		<%}
	%>
	
	<tr>
		<td colspan="3">
			<button type="button" class="btn btn-danger btn-lg"
			style="margin-left: 100px" id="btncartdel">선택상품삭제</button> <!-- ajax로 삭제할거니까 id줘놓기 -->
			
			<span style="font-size: 1.5em; float: right;">총주문금액 <b style="color: green;"><%=nf.format(totalmoney) %>  원</b></span>
		</td>
	</tr>
	
</table>
</body>
</html>