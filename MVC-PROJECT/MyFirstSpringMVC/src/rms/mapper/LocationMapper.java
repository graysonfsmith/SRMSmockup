package rms.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import rms.model.LocationModel;

public class LocationMapper implements RowMapper<LocationModel> {

	@Override
	public LocationModel mapRow(ResultSet result, int arg1) throws SQLException {
		LocationModel visitor = new LocationModel();
		visitor.setLocId(result.getInt(1));
		visitor.setLocName(result.getString(2));
		visitor.setLocCity(result.getString(3));
		visitor.setLocState(result.getString(4));
		visitor.setLocAddress(result.getString(5));
		visitor.setDescription(result.getString(6));
		return visitor;
	}

}
