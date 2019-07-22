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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="classpath:/spring/root-context.xml")
public class ManagerTest {
	
	private static final Logger logger=LoggerFactory.getLogger(ManagerTest.class);

	@Autowired
	private IManagerDAO dao;

	@Test
	public void insert()throws Exception
	{
		for(int i=1; i<20;i ++)
		{
			ProductVO vo =new ProductVO();
			vo.setCategory("computer");
			vo.setCompanyName("samsung");
			vo.setExplain1("제품 간략설명 "+ i);
			vo.setExplain2("제품 상세설명" +i);
			vo.setPrice(i*1000);
			vo.setProductName("삼성 모델"+i);
			vo.setThumNail("resources/images/uploads/d2ded927-e6ff-4f0c-b63e-1436e07cbcaffacebook.png");
			
			dao.productInsert(vo);
		
		}
	}



}
