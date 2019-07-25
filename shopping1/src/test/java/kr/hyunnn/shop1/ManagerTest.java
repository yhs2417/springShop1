package kr.hyunnn.shop1;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.hyunnn.shop1.Manager.model.ProductVO;
import kr.hyunnn.shop1.Manager.repository.IManagerDAO;
import kr.hyunnn.shop1.review.model.ReviewVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:/spring/root-context.xml")
public class ManagerTest {
	
	private static final Logger logger=LoggerFactory.getLogger(ManagerTest.class);

	@Autowired
	private IManagerDAO dao;

	@Test
	public void insertProduct()throws Exception
	{
		for(int i=1; i<10;i++)
		{
			ProductVO vo =new ProductVO();
			vo.setCategory("NoteBook");
			vo.setCompanyName("INTEL");
			vo.setExplain1("HDD:"+i+"<br>램:"+i+"<br>cpu:"+i);
			vo.setExplain2("1줄<br>2줄<br>3줄<br>");
			vo.setPrice(i*3000);
			vo.setProductName("INTEL5 NOTEBOOK"+i);
			vo.setThumNail("resources/images/uploads/bd2a5b43-b4e6-4cb5-8267-29f08848e2a1sec_SM-T800NZWKKOO_007_front_white.jpg"
					 );
					
			//resources/images/uploads/95d75fe1-7f1a-4582-a6d5-86a173e89cb5imac27.png
			//resources/images/uploads/bd2a5b43-b4e6-4cb5-8267-29f08848e2a1sec_SM-T800NZWKKOO_007_front_white.jpg
			dao.productInsert(vo);
		}
	}
	
	@Test
	public void insertReview() throws Exception
	{
		for(int i=1; i<20;i++)
		{
			ReviewVO vo=new ReviewVO();
			vo.setContent("리뷰1줄<br>2줄<br>3줄<br>");
			vo.setHeader("리뷰 "+i);
			//vo.setProductId(productId);
			//vo.setUserId('admin');
			
			
		}
	}



}
