package savagerifts.request;

import savagerifts.model.AttributeType;

public class AttributeBuyRequest {
    private AttributeType attribute;
    private OperationType operation;		// inc or dec

    public enum OperationType {
        INC, DEC
    }

    public AttributeType getAttribute() {
        return attribute;
    }
    public void setAttribute(AttributeType attribute) {
        this.attribute = attribute;
    }

    public OperationType getOperation() {
        return operation;
    }
    public void setOperation(OperationType operation) {
        this.operation = operation;
    }
}
