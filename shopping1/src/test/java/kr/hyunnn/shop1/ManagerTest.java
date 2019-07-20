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
		for(int i=1; i<120;i ++)
		{
			ProductVO vo =new ProductVO();
			vo.setCategory("NoteBook");
			vo.setCompanyName("samsung");
			vo.setExplain1("aaaaa");
			vo.setExplain2("bbbbbbbb");
			vo.setPrice(12451111);
			vo.setProductName("abc"+i);
			vo.setThumNail("resources/images/uploads/d2ded927-e6ff-4f0c-b63e-1436e07cbcaffacebook.png");
			
			dao.productInsert(vo);
		
		}
	}



}
