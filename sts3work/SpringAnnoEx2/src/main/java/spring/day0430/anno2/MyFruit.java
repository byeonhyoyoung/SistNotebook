package spring.day0430.anno2;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component //�׻� �����ڸ��� �� ����ϱ�
public class MyFruit {

	//@Autowired //�ڵ����..�±����� �ϳ����϶� ..���ø���Ʈ ������ �ΰ��ε�..?
	//�������̽��� ������ Ŭ������ �Ѱ��ϰ��� �ڵ������� �Ǵµ� ���� ������ Ŭ������ 2���̻��̸� �ڵ����Կ� ������ ����
	
	//��Ȯ�ϰ� bean�� �̸����� �����Ϸ���..@Resource��� ���ֱ�
	/* @Resource(name= "tManggo") */
	@Resource(name= "vietnamManggo")
	Manggo mg;
	
	public void writeManggo()
	{
		System.out.println("***���� �����ϴ� ������***");
		mg.writeMangoName();
	}
}