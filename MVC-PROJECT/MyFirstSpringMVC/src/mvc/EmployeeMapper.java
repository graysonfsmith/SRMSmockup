package mvc;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class EmployeeMapper implements RowMapper<EmployeeClass>{

	@Override
	public EmployeeClass mapRow(ResultSet arg0, int arg1) throws SQLException {
		// TODO Auto-generated method stub
		
		EmployeeClass obj = new EmployeeClass();
		
		obj.setEcity(arg0.getString("ECITY"));
		obj.setEid(arg0.getInt("EID"));
		obj.setEname(arg0.getString("ENAME"));
		obj.setEsalary(arg0.getInt("ESALARY"));
		
		return obj;
	}
	
	
	
}

