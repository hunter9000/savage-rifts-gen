package savagerifts.request;

import savagerifts.model.skill.SkillType;

public class HindranceBuyRequest {
    private HindranceType hindranceType;
	private SeverityType severityType;
    private OperationType operation;		// add or remove

    public enum OperationType {
        ADD, REMOVE
    }

    public HindranceType getHindranceType() {
        return hindranceType;
    }
    public void setHindranceType(HindranceType hindranceType) {
        this.hindranceType = hindranceType;
    }
	
	public SeverityType getSeverityType() {
        return severityType;
    }
    public void setSeverityType(SeverityType severityType) {
        this.severityType = severityType;
    }

    public OperationType getOperation() {
        return operation;
    }
    public void setOperation(OperationType operation) {
        this.operation = operation;
    }
}
