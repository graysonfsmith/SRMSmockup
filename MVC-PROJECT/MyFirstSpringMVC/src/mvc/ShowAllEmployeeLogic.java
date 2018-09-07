package mvc;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;


public class ShowAllEmployeeLogic {
	public List<EmployeeClass> selectAllEmployee(){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("jtemp");
		List<EmployeeClass> list = temp.query("select * from employee_data", new EmployeeMapper());
		return list;
	}
	public int insertEmployee(EmployeeClass obj){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("jtemp");
		return temp.update("insert into employee_data values(?,?,?,?)", obj.getEid(), obj.getEname(), obj.getEcity(), obj.getEsalary());
		
	}
	
	public int editEmployee(EmployeeClass obj){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("jtemp");
		return temp.update("update employee_data set ename=?, ecity=?, esalary=? where eid=?",  obj.getEname(), obj.getEcity(), obj.getEsalary(), obj.getEid());
		
	}
	
	public int deleteEmployee(int eid){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("jtemp");
		return temp.update("delete from employee_data where eid = ?", eid);
		
	}
	
	
	public EmployeeClass getEmployee(int eid){
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
		JdbcTemplate temp = (JdbcTemplate)context.getBean("jtemp");
		return (EmployeeClass)temp.queryForObject("select * from employee_data where eid=?", new EmployeeMapper(),eid);
		
		
	}
	
	
	
	
	
}
