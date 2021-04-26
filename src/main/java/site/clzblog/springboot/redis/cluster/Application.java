package site.clzblog.springboot.redis.cluster;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {
    private final StringRedisTemplate stringRedisTemplate;

    @Autowired
    public Application(StringRedisTemplate stringRedisTemplate) {
        this.stringRedisTemplate = stringRedisTemplate;
    }

    @GetMapping("set/value")
    public String setValue(@RequestParam("key") String key, @RequestParam("value") String value) {
        stringRedisTemplate.opsForValue().set(key, value);
        return String.format("Key:%s,Value:%s saved", key, value);
    }

    @GetMapping("get/value")
    public String getValue(@RequestParam("key") String key) {
        return stringRedisTemplate.opsForValue().get(key);
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}
