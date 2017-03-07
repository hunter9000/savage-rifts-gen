package savagerifts.response;

import savagerifts.model.sheet.PerkSelection;
import savagerifts.model.sheet.Sheet;

public class PerkSelectionResponse {

    PerkSelection perkSelection;
    Sheet sheet;

    public PerkSelectionResponse(PerkSelection perkSelection, Sheet sheet) {
        this.perkSelection = perkSelection;
        this.sheet = sheet;
    }

    public PerkSelection getPerkSelection() {
        return perkSelection;
    }
    public void setPerkSelection(PerkSelection perkSelection) {
        this.perkSelection = perkSelection;
    }

    public Sheet getSheet() {
        return sheet;
    }
    public void setSheet(Sheet sheet) {
        this.sheet = sheet;
    }
}
