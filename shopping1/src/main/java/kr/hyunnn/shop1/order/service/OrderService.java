package kr.hyunnn.shop1.order.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParser;

import kr.hyunnn.shop1.cart.model.CartVO;
import kr.hyunnn.shop1.order.repository.IOrderDAO;


@Service
public class OrderService implements IOrderService {

	private static final String API_KEY = "3547483274077377";
	private static final String API_SECRET = "v7Uc5BYp7qayhvM0WSOHeztoe399rYwX5q9b18A8zLHQguRdmFUAenZsq8CS68QcyZnA8YIHKqy0Updg";

	@Autowired
	private IOrderDAO dao;
	
	public String getAccessToken() throws Exception {
		String accessToken = "";

		String reqURL = "https://api.iamport.kr/users/getToken";

		BufferedWriter bw = null;
		BufferedReader br = null;
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);// POST요청시에는 setDoOutput메서드의 매개값을 true로 전달.

			bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			String param = "";
			param += "imp_key=" + API_KEY + "&imp_secret=" + API_SECRET;
			bw.write(param); // 출력버퍼를 통해 문자열데이터 전송
			bw.flush(); // 출력버퍼를 비우는 코드

			// 요청이 성공했다면 HTTP Status가 200번으로 응답됨.
			int resCode = conn.getResponseCode();
			System.out.println("response status: " + resCode);

			// 응답된 JSON데이터 문자열로 읽기
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			// JSON데이터를 줄단위로 로딩.
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("토큰 얻기 결과데이터: " + result);

			// result데이터를 JSON형태로 파싱
			/*{
				
				  "response": {  "access_token": "d5d5688dfd72d18a26885fcc1d67e7601cec4357",
				  }
			} */
			JSONParser jParser = new JSONParser();
			JSONObject element = (JSONObject) jParser.parse(result);

			JSONObject Token = (JSONObject) element.get("response");
			accessToken = (String) Token.get("access_token");

			System.out.println("getToken==>>" + accessToken);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			br.close();
			bw.close();
		}
		return accessToken;
	}

	@Override
	public long getOrderData(String accessToken,String payNo) throws Exception 
	{
		long payAmount=0;

		String reqURL = "https://api.iamport.kr/payments/"+payNo;

		BufferedReader br = null;
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection(); // 해당 URL로 서버연결하기 위한 객체

			conn.setRequestMethod("GET");

			// 요청 헤더에 데이터 담기.
			conn.setRequestProperty("Authorization", accessToken);

			// 요청이 성공했다면 HTTP Status가 200번으로 응답됨.
			int resCode = conn.getResponseCode();
			System.out.println("결제 정보 얻기 -> response status: " + resCode);

			// 응답된 JSON데이터 문자열로 읽기
			br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			// JSON데이터를 줄단위로 로딩.
			String line = "";
			String result = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("주문 결과 조회한 결과데이터: " + result);

			// result데이터를 JSON형태로 파싱
			/*{
		    "code": 0,
		    "message": null,
		    "response": {
		        "amount": 1000,
		        "apply_num": "30037974", 카드사 승인번호
		        "buyer_addr": "부산 해운대구 APEC로 17 (우동) 24",
		        "buyer_email": "exam@x.com",
		        "buyer_name": "admin",
		        "buyer_postcode": "48060",
		         "buyer_tel": "010-1234-5678",
		          "card_code": "381",
        "card_name": "국민KB카드",
           "imp_uid": "imp_117148534782",
        "merchant_uid": "merchant_1564818105940",
         */
			JSONParser jParser = new JSONParser();
			JSONObject element = (JSONObject) jParser.parse(result);

			JSONObject data = (JSONObject) element.get("response");

			 payAmount = (long) data.get("amount");
			System.out.println("결제 금액==>>" + payAmount);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			br.close();
		}
		return payAmount;
	}

	@Override
	public void addOrder(CartVO vo) throws Exception {

		Map<String, Object> map= new HashMap<>();
		map.put("userId",vo.getUserId());
		map.put("productId",vo.getProductId());
		map.put("count",vo.getCount());
		
		dao.addOrder(map);
		
	}
}
