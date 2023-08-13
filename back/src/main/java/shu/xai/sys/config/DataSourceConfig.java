package shu.xai.sys.config;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.neo4j.ogm.session.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.neo4j.repository.config.EnableNeo4jRepositories;
import org.springframework.data.neo4j.transaction.Neo4jTransactionManager;
import org.springframework.data.transaction.ChainedTransactionManager;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * Created by yuziyi on 2021/6/19.
 */
@Configuration
@EnableTransactionManagement
@EnableNeo4jRepositories(basePackages = {"shu.xai.demo.repo"})
@EntityScan(basePackages = {"shu.xai.demo.pojo"})
public class DataSourceConfig {

    @Primary
    @Bean("dataSourceXAI")
    @ConfigurationProperties("spring.datasource.druid.xai")
    public DataSource mDataSourceOne(){
        return DruidDataSourceBuilder.create().build();
    }


    @Primary
    @Bean("jdbcTemplateXAI")
    public JdbcTemplate mJdbcTemplateOne(@Qualifier("dataSourceXAI") DataSource dataSource){
        return new JdbcTemplate(dataSource);
    }

    @Bean("dataSourceSuperAlloy")
    @ConfigurationProperties("spring.datasource.druid.superalloy")
    public DataSource mDataSourceTwo(){
        return DruidDataSourceBuilder.create().build();
    }

    @Bean("jdbcTemplateSuperAlloy")
    public JdbcTemplate mJdbcTemplateTwo(@Qualifier("dataSourceSuperAlloy") DataSource dataSource){
        return new JdbcTemplate(dataSource);
    }

    @Bean("transactionManager")
    @Primary
    public DataSourceTransactionManager transactionManager(DataSource dataSource){
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean("neo4jTransactionManager")

    public Neo4jTransactionManager neo4jTransactionManager(SessionFactory sessionFactory){
        return new Neo4jTransactionManager(sessionFactory);
    }

    @Autowired
    @Bean(name = "multiTransactionManager")
    public PlatformTransactionManager multiTransactionManager(
            Neo4jTransactionManager neo4jTransactionManager,
            DataSourceTransactionManager mysqlTransactionManager
    ){
        return new ChainedTransactionManager(neo4jTransactionManager, mysqlTransactionManager);
    }

}