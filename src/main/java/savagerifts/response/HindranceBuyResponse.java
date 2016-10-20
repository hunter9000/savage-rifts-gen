package savagerifts.response;

import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;

import java.util.HashMap;
import java.util.Map;

public class SkillBuyResponse {

	public Hindrance major;
	public Hindrance minor1;
	public Hindrance minor2;

    public int numMinorsChosen;
	public int numMajorsChosen;

	public int numRemainingHindrancePoints;

}
