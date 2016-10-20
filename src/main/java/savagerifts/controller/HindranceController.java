package savagerifts.controller;



public class HindranceController {
	
	@Autowired
	private HindranceRepository hindranceRepository;
	
	@RequestMapping(value = "/api/hindrance/", method = RequestMethod.GET)
	public Iterable<Hindrance> getHindrances() {
		return hindranceRepository.findAll();
	}
}

