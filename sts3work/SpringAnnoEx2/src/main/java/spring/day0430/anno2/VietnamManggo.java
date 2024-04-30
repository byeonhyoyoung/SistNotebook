package spring.day0430.anno2;

import org.springframework.stereotype.Component;

@Component //vietnamManggo로 등록
public class VietnamManggo implements Manggo {

	@Override
	public void writeMangoName() {
		// TODO Auto-generated method stub

		System.out.println("베트남 망고가 맛있다!!!");
	}

}
