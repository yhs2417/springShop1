package kr.hyunnn.shop1.commons.summerNote;

import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/image")
public class SummerNoteController 
{
	@PostMapping("")
	public String imageUpload(HttpSession session,MultipartFile file) throws Exception
	{
		System.out.println("summernote진입");
		String path=session.getServletContext()
		.getRealPath("resources/images/uploads/");
		
		UUID uuid = UUID.randomUUID();
		
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;
		System.out.println(path);
		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		//String filepath = path + str_filename;
		//System.out.println("파일경로 : " + filepath);

		File f = new File(path,str_filename);
		
		FileCopyUtils.copy(file.getInputStream(),
						new FileOutputStream(f));
		//file.transferTo(f);
		
		System.out.println("리턴할 url1 :"+"resources/images/uploads/"+str_filename);
	
		return "resources/images/uploads/"+str_filename;
		//위주소로 db에 저장하면 됨. 
	}
	
}
