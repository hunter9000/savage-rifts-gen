package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import savagerifts.model.edge.Edge;
import savagerifts.repository.EdgeRepository;

@RestController
public class EdgeController {

    @Autowired
    private EdgeRepository edgeRepository;

    @RequestMapping(value = "/api/edge/", method = RequestMethod.GET)
    public Iterable<Edge> getAllEdges() {
        return edgeRepository.findAll();
    }
}
