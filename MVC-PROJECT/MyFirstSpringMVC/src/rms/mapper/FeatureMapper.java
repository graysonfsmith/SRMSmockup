package rms.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import rms.model.FeatureModel;

public class FeatureMapper implements RowMapper<FeatureModel> {
	public FeatureModel mapRow(ResultSet results, int row) throws SQLException {
		FeatureModel model = new FeatureModel();
		model.setFeaId(results.getInt(1));
		model.setFeaType(results.getString(2));
		model.setDescription(results.getString(3));
		model.setIconPath(results.getString(4));
		
		return model;
	}
}
