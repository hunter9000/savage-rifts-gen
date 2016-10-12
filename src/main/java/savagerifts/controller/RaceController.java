package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import savagerifts.model.race.Race;
import savagerifts.repository.RaceRepository;

@RestController
public class RaceController {
	
	@Autowired
    private RaceRepository raceRepository;
	
	@RequestMapping(value = "/api/race/", method = RequestMethod.GET)
	public Iterable<Race> getAllRaces() {
		return raceRepository.findAll();
	}
	
	
}