package sagan;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.Cloud;
import org.springframework.cloud.CloudFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;


//@Configuration
//@Profile(SaganProfiles.CLOUDFOUNDRY)
//class CloudFoundryDatabaseConfig {
//
//    @Bean
//    public Cloud cloud() {
//        return new CloudFactory().getCloud();
//    }
//
//    @Bean
//    public DataSource dataSource() {
//        DataSource dataSource = cloud().getServiceConnector("sagan-db", DataSource.class, null);
//        return dataSource;
//    }
//}

@Configuration
@Profile(SaganProfiles.STANDALONE)
class StandaloneDatabaseConfig {

    @Autowired
    private DataSource dataSource;

}
