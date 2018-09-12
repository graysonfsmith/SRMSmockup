package rms.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import rms.mapper.FeatureMapper;
import rms.model.FeatureModel;

import java.util.List;

public class FeatureDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;

    public FeatureDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml"); 
        temp = (JdbcTemplate) context.getBean("jtemp");
    }
    
    // Return FeatureModel with specified featureID
    public FeatureModel getFeature(int feaId) {
    	return (FeatureModel)temp.queryForObject("Select * from Feature where feaId = ?", new FeatureMapper(), feaId);
    }
    
    // Inserts specified user into Users table
    public int insertFeature(FeatureModel feature) {
    	return temp.update("insert into Feature values(?,?,?,?)",
    			feature.getFeaId(), feature.getFeaType(), feature.getDescription(), feature.getIconPath());
    }
	
    // Updates isActive column entry to 0 to the specified feature from Feature table
    public int deleteFeature(FeatureModel feature) {
    	return temp.update("update Feature set isActive = ? where feaId = ?", 0, feature.getFeaId());
    }
	
    // Updates specified feature from Feature table
    public int updateFeature(FeatureModel feature) {
    	return temp.update("update Feature set feaType = ?, description = ?, iconPath =? where feaId = ?)",
    			feature.getFeaType(), feature.getDescription(), feature.getIconPath(), feature.getFeaId());
    }
    
    // Given resourceID and locationID, returns a list of FeatureModels with corresponding ID's
    public List<FeatureModel> getFeaturesWithResIDandLocID(int resId, int locId) {
    	return temp.query("select f.feaId, f.feaType, f.description, f.iconPath from Feature f join ResourceFeature rf on "
    			+ "f.feaId = rf.feaId join LocationResource lr on rf.locResId = lr.locResId where lr.resId = ? and lr.locId = ?",
    			new FeatureMapper(), resId, locId);
    }
    
    // Returns a list of FeatureModel from Feature table
    public List<FeatureModel> getAllFeatures() {
    	return temp.query("select * from Feature", new FeatureMapper());
    }

}
