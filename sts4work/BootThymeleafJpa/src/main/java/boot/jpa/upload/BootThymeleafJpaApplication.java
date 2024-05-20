package boot.jpa.upload;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"mycar.*"})
@EntityScan("mycar.data") //Dto위치
@EnableJpaRepositories("mycar.repository") //Dao위치 ..→Jpa하면 기본적으로 주어야할것들
public class BootThymeleafJpaApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootThymeleafJpaApplication.class, args);
	}

}
