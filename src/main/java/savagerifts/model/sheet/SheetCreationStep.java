package savagerifts.model.sheet;

/** Steps of character creation. Do not rearrange the order of these values. */
public enum SheetCreationStep {
	TABLE_ROLLS,
	TABLE_ROLL_SWAP,
	RACE,
	ATTRIBUTES,
	SKILLS,
	HINDRANCES,
	EDGES;

//	private SheetCreationStep[] steps = SheetCreationStep.values();		// cache this value

	/** Depends on the ordinal order of the values. returns null if there's no next step. */
	public SheetCreationStep getNextStep() {
		for (SheetCreationStep step : SheetCreationStep.values()) {
			if (step.ordinal() == this.ordinal() + 1) {
				return step;
			}
		}
		return null;
	}

}