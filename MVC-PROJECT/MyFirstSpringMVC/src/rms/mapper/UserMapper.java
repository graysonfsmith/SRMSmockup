package rms.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import rms.model.UsersModel;


public class UserMapper implements RowMapper<UsersModel> {

	@Override
	public UsersModel mapRow(ResultSet result, int arg1) throws SQLException {
		UsersModel user = new UsersModel();
		user.setUserId(result.getInt(1));
		user.setLocId(result.getInt(2));
		user.setUserName(result.getString(3));
		user.setUserEmail(result.getString(4));
		user.setUserPassword(result.getString(5));
		user.setUserType(result.getString(6));
		user.setUserPhone(result.getString(7));
		return user;
	}

}
