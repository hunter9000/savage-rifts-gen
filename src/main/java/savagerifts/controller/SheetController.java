package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.user.User;
import savagerifts.repository.FrameworkRepository;
import savagerifts.repository.SheetRepository;
import savagerifts.repository.UserRepository;
import savagerifts.request.AuthRequest;
import savagerifts.request.NewSheetRequest;
import savagerifts.security.ForbiddenAccessException;
import savagerifts.util.AuthUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class SheetController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SheetRepository sheetRepository;

    @Autowired
    private FrameworkRepository frameworkRepository;

    @Autowired
    private HttpServletRequest request;


    // create sheet
    @RequestMapping(value="/api/sheet/", method= RequestMethod.POST)
    public ResponseEntity<?> createSheet(@RequestBody NewSheetRequest sheetRequest) {
        User owner = AuthUtils.getLoggedInUser(request);

        if (sheetRequest.characterName == null || sheetRequest.characterName.equals("")) {
            throw new ForbiddenAccessException();
        }

        Framework framework = frameworkRepository.findOne(sheetRequest.frameworkId);
        if (framework == null) {
            throw new ForbiddenAccessException();
        }

        Sheet sheet = new Sheet();
        sheet.setOwner(owner);
        sheet.setName(sheetRequest.characterName);
        sheet.setFramework(framework);

        sheetRepository.save(sheet);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    // get all sheets belonging to user
    @RequestMapping(value="/api/sheet/", method= RequestMethod.GET)
    public List<Sheet> getSheets() {
        User owner = AuthUtils.getLoggedInUser(request);
        return sheetRepository.findByOwner(owner);
    }

    // get sheet
    @SheetOwner
    @RequestMapping(value="/api/sheet/{sheetId}/", method=RequestMethod.GET)
    public Sheet getSheet(@PathVariable long sheetId) {
        return AuthUtils.getSheet(request);     // the sheet is retrieved by the SheetOwnerInterceptor
    }

    // choose framework
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/framework/{frameworkId}/", method = RequestMethod.POST)
    public void setFramework(@PathVariable long sheetId, @PathVariable long frameworkId) {
        Sheet sheet = AuthUtils.getSheet(request);
    }

//    @RequestBody
}
