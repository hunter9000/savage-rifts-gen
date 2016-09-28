

public class RandomUtils {
	
	public static int rollDie(Roll roll) {
		int result = getResultOfDieType(roll.getDieType());
		if (roll.getModifier != null) {
			result += roll.getModifier();
		}
		return result;
	}
	
	public static int getResultOfDieType(DieType type) {
		return Random.getNextInt(type.getPips()) + 1;
	}
	
}