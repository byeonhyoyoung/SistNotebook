package boot.mvc.market;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"data.*"}) //@..등록이 되어있어야 등록이됨?(controller,mapper모두 등록)
@MapperScan({"data.mapper"}) //mapper등록하는곳
public class BootMybatisJstlApplication {

	public static void main(String[] args) {
		SpringApplication.run(BootMybatisJstlApplication.class, args);
	}

}
