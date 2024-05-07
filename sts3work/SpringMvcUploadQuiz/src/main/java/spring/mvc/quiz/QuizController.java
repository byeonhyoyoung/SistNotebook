package spring.mvc.quiz;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QuizController {

	@GetMapping("/quiz/myshop")
	public String myshop()
	{
		return "quiz/quizUploadForm";
	}
	
	@PostMapping("/quiz/upload")
	public ModelAndView read(
			@RequestParam String sangname,
			@RequestParam String price,
			@RequestParam String ipgoday,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpServletRequest request)
	{
		ModelAndView mview=new ModelAndView();
		
		//���ε��� ������� ���ϱ�
		String path=request.getSession().getServletContext().getRealPath("/WEB-INF/image");
		/*System.out.println(path);
		String fileName=photo.getOriginalFilename(); �ܼ��ϱ� �ʿ����*/
		
		
		//���糯¥�� �ð��� �̿��� ���ϸ� ����
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		ArrayList<String> files=new ArrayList<String>();
		
		//���ϸ� ���
		for(MultipartFile f:photo) //�ִ¸�ŭ �ݺ��� ������
		{
			String fileName=sdf.format(new Date())+"_"+f.getOriginalFilename();
			files.add(fileName);
			
			//�������ε���������!!!
			try {
				f.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		//mview.addObject("fileName", fileName);
		mview.addObject("files", files);
		mview.addObject("sangname", sangname);
		mview.addObject("price", price);
		mview.addObject("ipgoday", ipgoday);
		mview.addObject("path", path);
		
		mview.setViewName("quiz/quizUploadWrite");
		
		return mview;
	}
	
}
