package services;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller(value="/Rooms")
public class ResourceService {

	@RequestMapping(value="/rooms",method=RequestMethod.GET)
	public String test()
	{
		return "index";
	}
}
