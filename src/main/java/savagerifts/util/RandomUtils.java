package savagerifts.util;

import savagerifts.model.DieType;
import savagerifts.model.sheet.Roll;

import java.util.Random;

public class RandomUtils {
	
	public static int rollDie(Roll roll) {
		int result = getResultOfDieType(roll.getDieType());
		if (roll.getModifier() != null) {
			result += roll.getModifier();
		}
		return result;
	}
	
	public static int getResultOfDieType(DieType type) {
		return new Random().nextInt(type.getPips()) + 1;
	}
	
}