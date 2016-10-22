package savagerifts.response;

import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;

import java.util.HashMap;
import java.util.Map;

public class HindranceBuyResponse {

	private Hindrance major;
	private Hindrance minor1;
	private Hindrance minor2;

	private int numMinorsChosen;
	private int numMajorsChosen;

	private int numRemainingHindrancePoints;

	public Hindrance getMajor() {
		return major;
	}
	public void setMajor(Hindrance major) {
		this.major = major;
	}

	public Hindrance getMinor1() {
		return minor1;
	}
	public void setMinor1(Hindrance minor1) {
		this.minor1 = minor1;
	}

	public Hindrance getMinor2() {
		return minor2;
	}
	public void setMinor2(Hindrance minor2) {
		this.minor2 = minor2;
	}

	public int getNumMinorsChosen() {
		return numMinorsChosen;
	}
	public void setNumMinorsChosen(int numMinorsChosen) {
		this.numMinorsChosen = numMinorsChosen;
	}

	public int getNumMajorsChosen() {
		return numMajorsChosen;
	}
	public void setNumMajorsChosen(int numMajorsChosen) {
		this.numMajorsChosen = numMajorsChosen;
	}

	public int getNumRemainingHindrancePoints() {
		return numRemainingHindrancePoints;
	}
	public void setNumRemainingHindrancePoints(int numRemainingHindrancePoints) {
		this.numRemainingHindrancePoints = numRemainingHindrancePoints;
	}
}
