package savagerifts.request;

import savagerifts.model.AttributeType;

public class PointBuyRequest {
    private AttributeType stat;
    private OperationType operation;		// inc or dec

    public enum OperationType {
        INC, DEC
    }

    public AttributeType getStat() {
        return stat;
    }
    public void setStat(AttributeType stat) {
        this.stat = stat;
    }

    public OperationType getOperation() {
        return operation;
    }
    public void setOperation(OperationType operation) {
        this.operation = operation;
    }
}
