package boot.data.dto;


import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("CommunityDto")
public class CommunityDto {

	private int com_num;
	private String com_user_id;
	private String com_nickname;
	private String com_image;
	private String com_title;
	private String com_content;
	private String com_photo;
	private String com_category;
	private Timestamp com_writetime;
	private Timestamp com_updatetime;
	private int com_readcount;
	private int com_likes;
	private String com_post_type;
	
}
