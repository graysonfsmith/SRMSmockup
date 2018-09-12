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
		int count = 0;
		LocationDAO locdao = new LocationDAO();
		LocationModel loc = locdao.getLocation(1);
		List<LocationModel> allLoc = locdao.getAllLocations();
		ResourceTypeDAO resTypedao =  new ResourceTypeDAO();
		
		List<ResourceTypeModel> list = resTypedao.getFromLocation(loc);
	
		
		
		ResourceDAO resdao = new ResourceDAO();
		FeatureDAO feadao = new FeatureDAO();
		
		
		for(ResourceTypeModel resType : list) {
			List<ResourceModel>  resList = resdao.getResourcesWithLocIDandResTypeID(loc.getLocId(), resType.getID());
			modelList.addAttribute(resType.getName().toString(), resList);
			for(ResourceModel res : resList) {
				List<FeatureModel> feaList = feadao.getFeaturesWithResIDandLocID(res.getResId(), loc.getLocId());
				System.out.println(res.getResName());
				for(FeatureModel fea : feaList) {
					
					System.out.println(fea.getFeaType());
					
				}
			}
			
		}
		
		
		modelList.addAttribute("thisLoc", loc);
		modelList.addAttribute("resourceTypes", list);
		modelList.addAttribute("allLoc", allLoc);
		return "resources";
	}
	
	
	
	@RequestMapping(value="/{locid}", method=RequestMethod.GET)
	public String ResourceTypeLocationChange(@PathVariable int locid, ModelMap modelList)
	{
		LocationDAO locdao = new LocationDAO();
		LocationModel loc = locdao.getLocation(locid);
		List<LocationModel> allLoc = locdao.getAllLocations();
		ResourceTypeDAO resTypedao =  new ResourceTypeDAO();
		List<ResourceTypeModel> list = resTypedao.getFromLocation(loc);
		
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
