package jstl.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.mysql.cj.protocol.Resultset;

import mysql.db.DbConnect;

public class ShopDao {

	DbConnect db=new DbConnect();
	
	//전체출력
	public List<ShopDto> getAllSangpums()
	{
		List<ShopDto> list=new Vector<ShopDto>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		Resultset rs=null;
		
		String sql="select * from jshop order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next) {
				
				ShopDto dto=new ShopDto();
				
				dto.setNum(rs.getString("num"));
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(null, pstmt, conn);
		}
		
	}
	
}
