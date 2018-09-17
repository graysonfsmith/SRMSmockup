package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationMapper;
import mapper.UserMapper;
import model.LocationModel;
import model.UserModel;
//import model.UserModel;


public class UserDAO {

	 ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	 JdbcTemplate jtemp = (JdbcTemplate)context.getBean("jt");
	
	public LocationModel getUserLocation(int userid) {
		UserModel user = (UserModel)jtemp.queryForObject("select * from users where userid = ?", new UserMapper(),userid);
		LocationModel location = (LocationModel)jtemp.queryForObject("select * from location where locid = ?",new LocationMapper(), user.getLocId());
		return location;
	}
}
