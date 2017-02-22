package savagerifts.model.sheet;

public enum XPRank {
    Novice,
    Seasoned,
    Veteran,
    Heroic,
    Legendary;

    public boolean isBefore(XPRank rank) {
        return this.ordinal() < rank.ordinal();
    }
}
