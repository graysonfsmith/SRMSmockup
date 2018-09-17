package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import model.LocationModel;

public class LocationMapper implements RowMapper<LocationModel> {

	@Override
	public LocationModel mapRow(ResultSet result, int arg1) throws SQLException {

		LocationModel obj = new LocationModel();
		obj.setLocid(result.getInt(1));
		obj.setLocname(result.getString(2));
		obj.setLoccity(result.getString(3));
		obj.setLocstate(result.getString(4));
		obj.setLocaddress(result.getString(5));
		obj.setLocdescription(result.getString(6));
		return obj;
	}
	
}
