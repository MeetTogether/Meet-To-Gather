package com.meetogether._00.config;

import java.beans.PropertyVetoException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:db.properties")
public class RootAppConfig {

//	@Value("${spring.database.initPoolSize}")
//	int ips;
//
//	@Value("${spring.database.maxPoolSize}")
//	int mps;

	Environment env;

	@Autowired
	public void setEnv(Environment env) {
		this.env = env;
	}
	
	@Bean
	public JedisPool jedisPool() {
		JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
		jedisPoolConfig.setMaxIdle(Integer.parseInt(env.getProperty("spring.jedisPoolConfig.maxIdle")));
		jedisPoolConfig.setMaxTotal(Integer.parseInt(env.getProperty("spring.jedisPoolConfig.maxTotal")));
		jedisPoolConfig.setTestOnBorrow(Boolean.parseBoolean(env.getProperty("spring.jedisPoolConfig.testOnBorrow")));
		String host = env.getProperty("spring.jedisPool.host");
		int port = Integer.parseInt(env.getProperty("spring.jedisPool.port"));
		int timeout = Integer.parseInt(env.getProperty("spring.jedisPool.timeout"));
		String pwd = env.getProperty("spring.jedisPool.password");
		return new JedisPool(jedisPoolConfig, host, port, timeout, pwd);

	}

	@Bean
	public DataSource dataSource() {
		ComboPooledDataSource ds = new ComboPooledDataSource();
		ds.setUser(env.getProperty("spring.database.user"));
		ds.setPassword(env.getProperty("spring.database.password"));
		try {
			ds.setDriverClass(env.getProperty("spring.database.driverClass"));
		} catch (PropertyVetoException e) {
			e.printStackTrace();
		}
		ds.setJdbcUrl(env.getProperty("spring.database.spring.databaseUrl"));
//		ds.setInitialPoolSize(ips);
//		ds.setMaxPoolSize(mps);
		ds.setInitialPoolSize(Integer.parseInt(env.getProperty("spring.database.initPoolSize")));
		ds.setMaxPoolSize(Integer.parseInt(env.getProperty("spring.database.maxPoolSize")));
		return ds;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
		factory.setDataSource(dataSource());
		factory.setPackagesToScan(new String[] {
				"com.meetogether.eeit10927.model",
				"com.meetogether.eeit10901.model",
				"com.meetogether.eeit10913.model",
				"com.meetogether.eeit10936.pairs.model",
				"com.meetogether.eeit10936.friends.model"});
		factory.setHibernateProperties(additionalProperties());
		return factory;
	}

	private Properties additionalProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", org.hibernate.dialect.SQLServer2012Dialect.class);
		properties.put("hibernate.show_sql", Boolean.TRUE);
//      properties.put("hibernate.format_sql", Boolean.TRUE);
		properties.put("default_batch_fetch_size", 10);
//		properties.put("hibernate.hbm2ddl.auto", "update");
		return properties;
	}

	@Bean(name = "transactionManager")
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txManager = new HibernateTransactionManager();
		txManager.setSessionFactory(sessionFactory);
		return txManager;
	}

	

}
