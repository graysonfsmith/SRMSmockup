package rms.dao;


import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import rms.mapper.ResourceTypeMapper;
import rms.model.*;

public class ResourceTypeDAO
{
    private JdbcTemplate temp;
    private ApplicationContext context;
    public ResourceTypeDAO()
    {
        context = new ClassPathXmlApplicationContext("spring-config.xml");
        temp = (JdbcTemplate) context.getBean("jtemp");
    }
    public List<ResourceTypeModel> getFromLocation(LocationModel location)
    {
        return temp.query("select * from roomtype where locname = ?",new ResourceTypeMapper(),location.getLocName());
    }
}