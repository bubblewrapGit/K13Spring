package springboard.util;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;

public class EnvFileReader {
	// static 으로 정의된 메서드(클래스명으로 직접 접근이 가능함)
	public static String getValue(String envFile, String ketName) {
		
		// Environment 객체를 통해 외부파일을 읽기위한 컨테이너생성 및 객체 생성
		// (legacy프로젝트의 기본패키지(com.kosmo.springlegacy) 내에 EnvironmentController 클래스 참조)
		ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();
		ConfigurableEnvironment env = ctx.getEnvironment();
		MutablePropertySources propertySources = env.getPropertySources();
		
		String envStr = "";
		try {
			// 프로퍼티 파일명과 키값을 매개변수로 처리
			String envPath = "classpath:"+envFile;
			propertySources.addLast(new ResourcePropertySource(envPath));
			
			envStr = env.getProperty(ketName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return envStr;
	}
}