package rms.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import rms.mapper.ResourceMapper;
import rms.model.ResourceModel;

import java.util.List;

public class ResourceDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;
    
    public ResourceDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        temp = (JdbcTemplate) context.getBean("jtemp");
    }
    
    // Return ResourceModel with specified resourceID
    public ResourceModel getResource(int resId) {
    	return (ResourceModel)temp.queryForObject("Select * from Resources where locId = ?", new ResourceMapper(), resId);
    }
    
    // Inserts specified Resource into Resources table
    public int insertResource(ResourceModel res) {
    	return temp.update("insert into Resources values(?,?,?,?,?,?,?)",
    			res.getResId(), res.getRoomNumber(), res.getResName(), 
    			res.getResType(), res.getDescription(), res.getStatus(), res.getPhotoOfResource());
    }
	
    // Updates isActive column entry to 0 to the specified Resource from Resources table
    public int deleteResource(ResourceModel res) {
    	return temp.update("update Resources set isActive = ? where resId = ?", 0, res.getResId());
    }
	
    // Updates specified Resource from Resources table
    public int updateResource(ResourceModel res) {
    	return temp.update("update Resources set roomNumber = ?, resName = ?, resType =?, "
    			+ "description = ?, status = ?, photoOfResource = ? where feaId = ?)",
    			res.getRoomNumber(), res.getResName(), res.getResType(), 
    			res.getDescription(), res.getStatus(), res.getPhotoOfResource(), res.getResId());
    }
    
    public List<ResourceModel> getResourcesWithLocIDandResTypeID(int locId, int resTypeId){
    	return temp.query("select r.resId, r.roomNumber, r.resName, r.resType, r.description, r.status, r.photoOfResource "
    			+ "from Resources r join LocationResource lr on r.resId = lr.resId where lr.locId = ? and r.resType = ?",
    			new ResourceMapper(), locId, resTypeId);
    }
    
    // Returns a list of ResourceModel from Resources table
    public List<ResourceModel> getAllResources() {
    	return temp.query("select * from Resources", new ResourceMapper());
    }

}
