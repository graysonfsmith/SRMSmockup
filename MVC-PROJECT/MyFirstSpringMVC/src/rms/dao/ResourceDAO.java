package rms.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import rms.mapper.LocationMapper;
import rms.model.*;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.time.*;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ResourceDAO {
    private JdbcTemplate temp;
    private ApplicationContext context;

    public ResourceDAO(){
        context = new ClassPathXmlApplicationContext("spring-config.xml");
        temp = (JdbcTemplate) context.getBean("jt");
    }
    public List<List<ResourceModel>> getFromResourceType(ResourceTypeModel rt,LocationModel l)
    {
    	List<List<ResourceModel>> data = new ArrayList<>();
    	//temp.queryForObject("Select r.* from resources r join resourceType rt on r.restype = rt.retid join locationresource lr on lr.resid = r.resid where lr.locId = ? and rt.retid = ?", new ResourceMapper(), locId);
    	
        return data;
    }
    public void insert(ResourceTypeModel model)
    {

    }
    public void update(int ID, ResourceTypeModel model)
    {

    }
    public void remove(int ID)
    {

    }
    public ResourceTypeModel get(int ID)
    {
        return new ResourceTypeModel();
    }
    public List<ResourceTypeModel> getALL()
    {
        return new ArrayList<>();
    }
}
