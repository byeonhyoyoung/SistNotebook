package com.boot.ex1;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

//메인!!!에 등록해주는것이 중요
@SpringBootApplication
@ComponentScan({"boot.test","hello.boot","sist.boot"}) //새로운 패키지 등록
public class SpringBootEx1Application {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootEx1Application.class, args);
	}

}
