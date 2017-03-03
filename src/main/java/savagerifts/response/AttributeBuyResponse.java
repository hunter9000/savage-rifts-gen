package savagerifts.response;

import savagerifts.model.AttributeType;
import savagerifts.model.sheet.Roll;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class AttributeBuyResponse {
	
	public Map<AttributeType, Roll> attributes = new HashMap<>();
	public Map<AttributeType, Boolean> canIncrease = new HashMap<>();
	public Map<AttributeType, Boolean> canDecrease = new HashMap<>();
	public Map<AttributeType, AttributeType> attributeTypes = new LinkedHashMap<>();
	public int remainingAttrPoints;

	public AttributeBuyResponse() {
		for (AttributeType type : AttributeType.values()) {
			attributeTypes.put(type, type);
		}
	}

	public int getRemainingAttrPoints() {
		return remainingAttrPoints;
	}
	public void setRemainingAttrPoints(int remainingAttrPoints) {
		this.remainingAttrPoints = remainingAttrPoints;
	}

	public Map<AttributeType, Boolean> getCanIncrease() {
		return canIncrease;
	}
	public void setCanIncrease(Map<AttributeType, Boolean> canIncrease) {
		this.canIncrease = canIncrease;
	}

	public Map<AttributeType, Boolean> getCanDecrease() {
		return canDecrease;
	}
	public void setCanDecrease(Map<AttributeType, Boolean> canDecrease) {
		this.canDecrease = canDecrease;
	}

	public Map<AttributeType, Roll> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<AttributeType, Roll> attributes) {
		this.attributes = attributes;
	}

	public Map<AttributeType, AttributeType> getAttributeTypes() {
		return attributeTypes;
	}
	public void setAttributeTypes(Map<AttributeType, AttributeType> attributeTypes) {
		this.attributeTypes = attributeTypes;
	}
}