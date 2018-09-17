package dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import mapper.ResourceTypeMapper;
import model.ResourceTypeModel;

import java.util.List;

public class ResourceTypeDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;
    
    public ResourceTypeDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        temp = (JdbcTemplate) context.getBean("jt");
    }
    
    // Return ResourceTypeModel with specified resourceTypeID
    public ResourceTypeModel getResourceType(int rtId) {
    	return (ResourceTypeModel)temp.queryForObject("Select * from ResourceType where retID = ?", new ResourceTypeMapper(), rtId);
    }
    
    // Inserts specified Resource into ResourceType table
    public int insertResourceType(ResourceTypeModel rt) {
    	return temp.update("insert into ResourceType values(?,?,?,?,1)",
    			rt.getID(), rt.getName(), rt.getIconName(), rt.getDescription());
    }
	
    // Updates isActive column entry to 0 to the specified ResourceType from ResourceType table
    public int deleteResourceType(ResourceTypeModel rt) {
    	return temp.update("update ResourceType set isActive = 0 where retID = ?", rt.getID());
    }
	
    // Updates specified ResourceType from ResourceType table
    public int updateResourceType(ResourceTypeModel rt) {
    	return temp.update("update ResourceType set retName = ?, retIconName = ?, retDescr = ? where retID = ?",
    			rt.getName(), rt.getIconName(), rt.getDescription(), rt.getID());
    }
    
    // Given LocationID, returns a list of ResourceType Models with corresponding locID
    public List<ResourceTypeModel> getResourceTypesWithLocId(int locId){
    	return temp.query("select Distinct rt.retID,  rt.retName, rt.retIconName, rt.description, rt.isActive from ResourceType rt join Resources r "
    			+ "on rt.retID = r.resType join LocationResource lr on r.resId = lr.resId where lr.locId = ?", 
    			new ResourceTypeMapper(), locId);
    }

    // Returns a list of ResourceTypeModel from ResourceType table
    public List<ResourceTypeModel> getAllResourceTypes() {
    	return temp.query("select * from ResourceType", new ResourceTypeMapper());
    }

}
