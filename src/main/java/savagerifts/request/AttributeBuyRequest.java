package savagerifts.request;

import savagerifts.model.AttributeType;
import savagerifts.security.BadRequestException;

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

    public boolean validate() throws BadRequestException {
        String errorString = "";
        boolean error = false;
        if (attribute == null) {
            errorString += " attribute is invalid ";
            error = true;
        }
        if (operation == null) {
            errorString += " operation is invalid ";
            error = true;
        }
        if (error) {
            throw new BadRequestException("request is invalid for these reasons: " + errorString);
        }
        return true;
    }
}
