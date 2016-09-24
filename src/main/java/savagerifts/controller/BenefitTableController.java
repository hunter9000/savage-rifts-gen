package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import savagerifts.model.benefittable.BenefitTable;
import savagerifts.repository.BenefitTableRepository;

@RestController
public class BenefitTableController {

    @Autowired
    private BenefitTableRepository benefitTableRepository;

    @RequestMapping(value="/api/benefittable/", method= RequestMethod.GET)
    public Iterable<BenefitTable> getAllBenefitTables() {
        return benefitTableRepository.findAll();
    }
}
