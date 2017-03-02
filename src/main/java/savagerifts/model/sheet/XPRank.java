package savagerifts.model.sheet;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum XPRank {
    NOVICE("Novice"),
    SEASONED("Seasoned"),
    VETERAN("Veteran"),
    HEROIC("Heroic"),
    LEGENDARY("Legendary");

    private String displayName;

    XPRank(String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }

    public boolean isBefore(XPRank rank) {
        return this.ordinal() < rank.ordinal();
    }
}
