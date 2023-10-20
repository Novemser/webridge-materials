package co.yiiu.pybbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.flyway.FlywayAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import javax.sql.DataSource;
import java.lang.reflect.Method;

// 不用默认配置的数据源，自己配置
@SpringBootApplication(scanBasePackages = "co.yiiu.pybbs",
        exclude = {DataSourceAutoConfiguration.class, FlywayAutoConfiguration.class})
@EnableAspectJAutoProxy
public class PybbsApplication implements CommandLineRunner {
    public static void main(String[] args) {
        SpringApplication.run(PybbsApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
    }
}
