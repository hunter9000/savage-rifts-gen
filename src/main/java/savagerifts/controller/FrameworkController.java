package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import savagerifts.model.framework.Framework;
import savagerifts.repository.FrameworkRepository;


@RestController
public class FrameworkController {

    @Autowired
    private FrameworkRepository frameworkRepository;

    // get all the frameworks
    @RequestMapping(value="/api/framework/", method= RequestMethod.GET)
    public Iterable<Framework> createSheet(@PathVariable String characterName) {
        return frameworkRepository.findAll();
    }
}
