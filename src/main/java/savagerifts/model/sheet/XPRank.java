package savagerifts.model.sheet;

public enum XPRank {
    NOVICE,
    SEASONED,
    VETERAN,
    HEROIC,
    LEGENDARY;

    public boolean isBefore(XPRank rank) {
        return this.ordinal() < rank.ordinal();
    }
}
