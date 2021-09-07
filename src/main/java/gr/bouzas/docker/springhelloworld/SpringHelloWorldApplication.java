package gr.bouzas.docker.springhelloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringHelloWorldApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringHelloWorldApplication.class, args);
    }

    @GetMapping("/")
    public ResponseEntity<String> hello() {
        return ResponseEntity.ok("Hello World from Spring Boot");
    }
}
