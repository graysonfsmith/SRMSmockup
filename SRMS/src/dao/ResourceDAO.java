package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.LocationResourceMapper;
import mapper.ResourceMapper;
import model.BookingModel;
import model.LocationResourceModel;
import model.ResourceModel;

import java.util.List;

public class ResourceDAO {
    private JdbcTemplate temp;
    
    public ResourceDAO(){
        temp = ConnectionDAO.getTemplate();
    }
    
    // Return ResourceModel with specified resourceID
    public ResourceModel getResource(int resId) {
    	return (ResourceModel)temp.queryForObject("Select * from Resources where resId = ?", new ResourceMapper(), resId);
    }
    
//    // Inserts specified Resource into Resources table
//    public int insertResource(ResourceModel res) {
//    	return temp.update("insert into Resources values(?,?,?,?,?,?,?,1)",
//    			res.getResId(), res.getRoomNumber(), res.getResName(), 
//    			res.getResType(), res.getDescription(), res.getStatus(), res.getPhotoOfResource());
//    }
//	
    // Updates isActive column entry to 0 to the specified Resource from Resources table
    public int deleteResource(ResourceModel res) {
    	return temp.update("update Resources set isActive = 0 where resId = ?", res.getResId());
    }
	
    // Updates specified Resource from Resources table
//    public int updateResource(ResourceModel res) {
//    	return temp.update("update Resources set roomNumber = ?, resName = ?, resType =?, "
//    			+ "description = ?, status = ?, photoOfResource = ? where resId = ?)",
//    			res.getRoomNumber(), res.getResName(), res.getResType(), 
//    			res.getDescription(), res.getStatus(), res.getPhotoOfResource(), res.getResId());
//    }
    
    // Given LocationID and ResourceTypeID, returns list of Resources models with corresponding ID's
    public List<ResourceModel> getResourcesWithLocIDandResTypeID(int locId, int resTypeId){
    	return temp.query("select r.* from Resources r join LocationResource lr on r.resId = lr.resId where lr.locId = ? and r.resType = ?",
    			new ResourceMapper(), locId, resTypeId);
    }
    
    // Given BookingModel, return the Resource
    public ResourceModel getResourceWithBooking(BookingModel book) {
        List<ResourceModel> ans = temp.query("select r.* "
                + " from Resources r join LocationResource lr on r.resId = lr.resId " +
                "join BOOKING B on lr.LOCRESID = B.LOCRESID "
                + "where b.bookingid = ?",new ResourceMapper(), book.getID());
    	return ans.get(0);
    }
    public List<LocationResourceModel> getLoccationResources(){
    	return temp.query("select * from locationresource", new LocationResourceMapper());
    	
    }
    // Given ResourceTypeID, returns list of Resource models with corresponding ID's
    public List<ResourceModel> getResourcesWithResTypeID(int resTypeId){
    	return temp.query("select * from Resources where resType = ?", new ResourceMapper(), resTypeId);
    }
    
    // Returns a list of ResourceModel from Resources table
    public List<ResourceModel> getAllResources() {
    	return temp.query("select * from Resources", new ResourceMapper());
    }

}
