package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import savagerifts.model.Sheet;
import savagerifts.repository.SheetRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class SheetController {

    @Autowired
    private SheetRepository sheetRepository;

    @Autowired
    private HttpServletRequest request;

    // create sheet
    @RequestMapping(value="/api/sheet/", method= RequestMethod.POST)
    public void createSheet() {

    }

    // get all sheets belonging to user
    @RequestMapping(value="/api/sheet/", method= RequestMethod.GET)
    public List<Sheet> getSheets() {
        return null;
    }

    // get sheet
    @RequestMapping(value="/api/sheet/{sheetId}", method=RequestMethod.GET)
    public Sheet getSheet(@PathVariable long sheetId) {
        // repo.getSheet()
        // return sheet
        return null;
    }

//    @RequestBody
}
