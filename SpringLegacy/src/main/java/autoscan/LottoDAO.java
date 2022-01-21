package autoscan;

import java.util.Random;

import org.springframework.stereotype.Repository;

@Repository
public class LottoDAO {
	public LottoDAO() {
		System.out.println("LottoDAO생성자 호출");
	}
	public int getLottoNumber() {
		// 1~6까지 난수생성 메서드
		Random rand = new Random();
		// 생성된 난수는 서비스 객체로 반환한다.
		return rand.nextInt(6)+1;
	}
}
