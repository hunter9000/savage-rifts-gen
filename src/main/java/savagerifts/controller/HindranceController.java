package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.repository.HindranceRepository;

@RestController
public class HindranceController {
	
	@Autowired
	private HindranceRepository hindranceRepository;
	
	@RequestMapping(value = "/api/hindrance/", method = RequestMethod.GET)
	public Iterable<Hindrance> getHindrances() {
		return hindranceRepository.findAll();
	}
}

