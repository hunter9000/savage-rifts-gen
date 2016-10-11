import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.DieType;
import savagerifts.model.benefittable.BenefitTable;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.benefittable.PerkRange;
import savagerifts.model.framework.Framework;
import savagerifts.model.perk.Perk;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.model.user.User;
import savagerifts.repository.*;
import savagerifts.request.NewSheetRequest;
import savagerifts.request.PerkSwapRequest;
import savagerifts.response.PerkSelectionResponse;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.RandomUtils;
import savagerifts.util.SheetUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class RaceController {
	
	@Autowired
    private RaceRepository raceRepository;
	
	@RequestMapping(value = "/api/race/", method = RequestMethod.GET)
	public Iterable<Race> getAllRaces() {
		return raceRepository.findAll();
	}
	
	
}