package rms.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import rms.mapper.LocationMapper;
import rms.model.LocationModel;

import java.util.List;

public class LocationDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;

    public LocationDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        temp = (JdbcTemplate) context.getBean("jtemp");
    }
    
    // Return LocationModel with specified locationID
    public LocationModel getLocation(int locId) {
    	return (LocationModel)temp.queryForObject("Select * from Location where locId = ?", new LocationMapper(), locId);
    }
    
    // Inserts specified location into Location table
    public int insertLocation(LocationModel loc) {
    	return temp.update("insert into Location values(?,?,?,?,?,?)",
    			loc.getLocId(), loc.getLocName(), loc.getLocCity(), loc.getLocState(), loc.getLocAddress(), loc.getDescription());
    }
	
    // Updates isActive column entry to 0 to the specified location from Location table
    public int deleteLocation(LocationModel loc) {
    	return temp.update("update Location set isActive = ? where locId = ?", 0, loc.getLocId());
    }
	
    // Updates specified location from Location table
    public int updateLocation(LocationModel loc) {
    	return temp.update("update Location set locName = ?, locCity = ?, locState =?, locAddress = ?, description = ? where feaId = ?)",
    			loc.getLocName(), loc.getLocCity(), loc.getLocState(), loc.getLocAddress(), loc.getDescription(), loc.getLocId());
    }
    
    // Returns a list of LocationModel from Location table
    public List<LocationModel> getAllLocations() {
    	return temp.query("select * from Location", new LocationMapper());
    }

}
