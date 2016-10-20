package savagerifts.model.hindrance;

public enum SeverityType {
    MINOR(1),
    MAJOR(2);
	
	private int numPoints;
	public int getNumPoints() {
		return numPoints;
	}
	SeverityType(int numPoints) {
		this.numPoints = numPoints;
	}
}
