package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.DieType;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.model.skill.KnowledgeCategory;
import savagerifts.model.skill.SkillKnowledge;
import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;
import savagerifts.repository.*;
import savagerifts.request.SkillBuyRequest;
import savagerifts.response.SkillBuyResponse;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.SheetUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class SheetSkillController {

    @Autowired
    private SheetRepository sheetRepository;

    @Autowired
    private SkillKnowledgeRepository skillKnowledgeRepository;

    @Autowired
    private HttpServletRequest request;

    /** Get the current skills with info about inc/dec and cost. */
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/skills/", method = RequestMethod.GET)
    public SkillBuyResponse getSkillBuy() {
        Sheet sheet = AuthUtils.getSheet(request);

        SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

        return skills;
    }

    /** Increase or decrease the given skill die roll */
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/skills/", method = RequestMethod.PUT)
    public SkillBuyResponse increaseDecreseSkillBuy(@RequestBody SkillBuyRequest skillBuyRequest) {
        Sheet sheet = AuthUtils.getSheet(request);

        // make the change, returns false if the change isn't valid
        if (!SheetUtils.validateAndMakeSkillChange(sheet, skillBuyRequest)) {
            throw new BadRequestException();
        }

        sheetRepository.save(sheet);

        // recreate the attributes after the change
        SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

        return skills;
    }

    /** Finish purchasing skills. */
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/skills/", method = RequestMethod.POST)
    public ResponseEntity<?> finishSkillPurchases() {
        Sheet sheet = AuthUtils.getSheet(request);

        if (sheet.getCreationStep() == SheetCreationStep.SKILLS) {
            SheetUtils.moveToNextCreationStep(sheet);
        }
        sheetRepository.save(sheet);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    /** Gets all the knowledge skills that are defined for all users, or for this specific user, except for those that this sheet already has added. */
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/skills/knowledge/", method = RequestMethod.GET)
    public Iterable<SkillKnowledge> getKnowledgeSkills() {
        Sheet sheet = AuthUtils.getSheet(request);

        // TODO: find a way to combine these into one query like: findByUserOrUserIsNull
        List<SkillKnowledge> knowledges = skillKnowledgeRepository.findByUser(sheet.getOwner());
        List<SkillKnowledge> globalKnowledges = skillKnowledgeRepository.findByUserIsNull();
        knowledges.addAll(globalKnowledges);

        for (SkillRoll skillRoll : sheet.getSkills()) {
            for (int i=0; i<knowledges.size(); i++) {
                SkillKnowledge skillKnowledge = knowledges.get(i);
                if (SheetUtils.skillMatches(skillRoll.getSkillType(), skillRoll.getSkillKnowledge(), SkillType.KNOWLEDGE, skillKnowledge)) {
                    knowledges.remove(i--);     // remove this from the list, and move the index back one so we track the list correctly
                }
            }
        }

        return knowledges;
    }

    /** Add the given pre-existing knowledge type skill to the sheet. */
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/skills/knowledge/{skillKnowledgeId}", method = RequestMethod.PUT)
    public void addKnowledgeSkill(@PathVariable Long skillKnowledgeId) {
        Sheet sheet = AuthUtils.getSheet(request);

        SkillKnowledge skillKnowledge = skillKnowledgeRepository.findOne(skillKnowledgeId);

        // check that the sheet doesn't already have this knowledge
        if (SheetUtils.sheetHasKnowledgeType(sheet, skillKnowledge)) {      // this sheet already knows this knowledge skill subtype
            throw new BadRequestException();
        }

        SkillRoll newRoll = new SkillRoll();
        newRoll.setSheet(sheet);
        newRoll.setSkillKnowledge(skillKnowledge);
        newRoll.setSkillType(SkillType.KNOWLEDGE);
        newRoll.setRoll(new Roll(DieType.D4, -2));

        sheet.getSkills().add(newRoll);

        sheetRepository.save(sheet);

    }

    @RequestMapping(value = "/api/knowledgecategories/", method = RequestMethod.GET)
    public KnowledgeCategory[] getKnowledgeCategories() {
        return KnowledgeCategory.values();
    }

}
