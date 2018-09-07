package rms.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import rms.model.VisitorsModel;

public class VisitorsMapper implements RowMapper<VisitorsModel> {

	@Override
	public VisitorsModel mapRow(ResultSet result, int arg1) throws SQLException {
		VisitorsModel visitor = new VisitorsModel();
		visitor.setvisId(result.getInt(1));
		visitor.setVisName(result.getString(2));
		visitor.setVisEmail(result.getString(3));
		visitor.setVisPhone(result.getString(4));
		visitor.setBadgeId(result.getInt(5));
		visitor.setVisPurpose(result.getString(6));
		visitor.setVisCompany(result.getString(7));
		return visitor;
	}

}
