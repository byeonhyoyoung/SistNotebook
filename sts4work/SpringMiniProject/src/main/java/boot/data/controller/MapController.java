package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {

	@GetMapping("/load/map")
	public String lmap() //보낼거없으니 String
	{
		return "/load/loadmap";
	}
}
