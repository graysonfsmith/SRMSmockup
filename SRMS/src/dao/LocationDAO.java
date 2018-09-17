package dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationMapper;
import mapper.LocationResourceMapper;
import model.LocationModel;
import model.LocationResourceModel;

public class LocationDAO {
	
	static ApplicationContext context = new ClassPathXmlApplicationContext("spring-config.xml");
	static JdbcTemplate jtemp = (JdbcTemplate)context.getBean("jt");
	
	public static int insertLocation(LocationModel obj) {
		//use sq_locationModels sequence
		return jtemp.update("insert into location values(location_id.NEXTVAL,?,?,?,?,?)",obj.getLocname(),obj.getLoccity(),obj.getLocstate(), obj.getLocaddress(),obj.getLocdescription());
	}
	public List<LocationModel> getAllLocations() {
		return jtemp.query("select * from location", new LocationMapper());
	}
	public static int deleteLocation(int locid) {
		return jtemp.update("delete from location where locid = ?",locid);
	}
	public static int editLocation(LocationModel loc) {
		return jtemp.update("update location set locname=?,loccity=?,locstate=?,locaddress=?,description=? where locid=?",loc.getLocname(),loc.getLoccity(),loc.getLocstate(),loc.getLocaddress(),loc.getLocdescription(),loc.getLocid());
	}
	// Updates isActive column entry to 0 to the specified location from Location table
    public int deleteLocation(LocationModel loc) {
    	return jtemp.update("update Location set isActive = ? where locId = ?", 0, loc.getLocid());
    }
    public List<LocationResourceModel> getResId(int locid) {
    	System.out.println("Location ID: " + locid);
    	 return jtemp.query("select * from locationresource where locid = ?", new LocationResourceMapper(), locid);
    }
    public List<LocationResourceModel> getAllLocationResources()
    {
        return jtemp.query("select * from locationresource",new LocationResourceMapper());
    }
    public LocationResourceModel getLocationResource(int res,int loc)
    {
        return jtemp.queryForObject("select * from locationresource where locid=? and resid=?",new LocationResourceMapper(),loc,res);
    }
}
