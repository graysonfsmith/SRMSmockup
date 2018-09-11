package rms.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import rms.model.ResourceModel;

public class ResourceMapper implements RowMapper<ResourceModel> {
	public ResourceModel mapRow(ResultSet results, int row) throws SQLException {
		ResourceModel model = new ResourceModel();
		model.setResId(results.getInt(1));
		model.setRoomNumber(results.getInt(2));
		model.setResName(results.getString(3));
		model.setResType(results.getString(4));
		model.setDescription(results.getString(5));
		model.setStatus(results.getString(6));
		model.setPhotoOfResource(results.getString(7));
		
		return model;
	}
}