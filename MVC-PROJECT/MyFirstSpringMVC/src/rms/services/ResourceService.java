package rms.services;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import rms.dao.*;
import rms.model.*;

@Controller
public class ResourceService {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String ResourceTypeService(ModelMap modelList)
	{
		LocationDAO dao1 = new LocationDAO();
		LocationModel loc = dao1.getLocation(1);
		List<LocationModel> allLoc = dao1.getAllLocations();
		ResourceTypeDAO dao2 =  new ResourceTypeDAO();
		List<ResourceTypeModel> list = dao2.getFromLocation(loc);
		
		modelList.addAttribute("thisLoc", loc);
		modelList.addAttribute("resourceTypes", list);
		modelList.addAttribute("allLoc", allLoc);
		return "resources";
	}
	
	
	
	@RequestMapping(value="/{locid}", method=RequestMethod.GET)
	public String ResourceTypeLocationChange(@PathVariable int locid, ModelMap modelList)
	{
		LocationDAO dao1 = new LocationDAO();
		LocationModel loc = dao1.getLocation(locid);
		List<LocationModel> allLoc = dao1.getAllLocations();
		ResourceTypeDAO dao2 =  new ResourceTypeDAO();
		List<ResourceTypeModel> list = dao2.getFromLocation(loc);
		
		modelList.addAttribute("thisloc", loc);
		modelList.addAttribute("resourceTypes", list);
		modelList.addAttribute("allLoc", allLoc);
		return "resources";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String ResourceDelete(ModelMap modelList)
	{
		
		return "resources";
	}

	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String ResourceEdit(ModelMap modelList)
	{
		
		return "resources";
	}
	
	
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String ResourceAdd(ModelMap modelList)
	{
		
		return "resources";
	}
	
	
}
