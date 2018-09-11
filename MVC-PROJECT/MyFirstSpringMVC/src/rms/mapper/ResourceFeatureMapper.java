package rms.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import rms.model.ResourceFeatureModel;

public class ResourceFeatureMapper implements RowMapper<ResourceFeatureModel> {
	public ResourceFeatureModel mapRow(ResultSet results, int row) throws SQLException {
		ResourceFeatureModel model = new ResourceFeatureModel();
		model.setResFeaId(results.getInt(1));
		model.setFeaId(results.getInt(2));
		model.setLocResId(results.getInt(3));
		model.setQuantity(results.getInt(4));
		model.setDescription(results.getString(5));
		
		return model;
	}
	
}
