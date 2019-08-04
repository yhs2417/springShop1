package kr.hyunnn.shop1;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.Test;

public class PwTest {

	@Test
	public void Pw()
	{
		StandardPBEStringEncryptor enc=new StandardPBEStringEncryptor();
		
		enc.setAlgorithm("");
		enc.setPassword("");
		
		System.out.println(enc.encrypt(""));
		System.out.println(enc.encrypt(""));
		System.out.println(enc.encrypt(""));
		System.out.println(enc.encrypt(""));
		
	}
	
}
