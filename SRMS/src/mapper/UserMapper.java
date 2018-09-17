package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.UserModel;


public class UserMapper implements RowMapper<UserModel> {

	@Override
	public UserModel mapRow(ResultSet result, int arg1) throws SQLException {
		UserModel user = new UserModel();
		user.setUserId(result.getInt(1));
		
		user.setUserName(result.getString(2));
		user.setUserEmail(result.getString(3));
		user.setUserPassword(result.getString(4));
		user.setUserType(result.getString(5));
		user.setUserPhone(result.getString(6));
		user.setLocId(result.getInt(7));
		user.setName(result.getString(8));
		return user;
	}

}
