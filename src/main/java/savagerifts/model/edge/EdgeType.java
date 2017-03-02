package savagerifts.model.edge;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum EdgeType {
	// CORE BOOK
	// background
	ALERTNESS("Alertness"),
	AMBIDEXTROUS("Ambidextrous"),
	ARCANE_BACKGROUND_MAGIC("Arcane Background (Magic)"),
	ARCANE_BACKGROUND_PSIONICS("Arcane Background (Psionics)"),
	ARCANE_BACKGROUND_MIRACLES("Arcane Background (Miracles)"),
	ARCANE_BACKGROUND_SUPER_POWERS("Arcane Background (Super Powers)"),
	ARCANE_BACKGROUND_WEIRD_SCIENCE("Arcane Background (Weird Science)"),
	ARCANE_RESISTANCE("Arcane Resistance"),
	IMPROVED_ARCANE_RESISTANCE("Improved Arcane Resistance"),
	ATTRACTIVE("Attractive"),
	VERY_ATTRACTIVE("Very Attractive"),
	BERSERK("Berserk"),
	BRAVE("Brave"),
	BRAWNY("Brawny"),
	FAST_HEALER("Fast Healer"),
	FLEET_FOOTED("Fleet Footed"),
	LINGUIST("Linguist"),
	LUCK("Luck"),
	GREAT_LUCK("Great Luck"),
	QUICK("Quick"),
	RICH("Rick"),
	FILTHY_RICH("Filthy Rich"),
	
	// combat
	BLOCK("Block"),
	IMPROVED_BLOCK("Improved Block"),
	BRAWLER("Brawler"),
	BRUISER("Bruiser"),
	COMBAT_REFLEXES("Combat Reflexes"),
	COUNTERATTACK("Counterattack"),
	IMPROVED_COUNTERATTACK("Improved Counterattack"),
	DODGE("Dodge"),
	IMPROVED_DODGE("Improved Dodge"),
	ELAN("Elan"),
	EXTRACTION("Extraction"),
	IMPROVED_EXTRACTION("Improved Extraction"),
	FIRST_STRIKE("First Strike"),
	IMPROVED_FIRST_STRIKE("Improved First Strike"),
	FLORENTINE("Florentine"),
	FRENZY("Frenzy"),
	IMPROVED_FRENZY("Improved Frenzy"),
	GIANT_KILLER("Giant Killer"),
	HARD_TO_KILL("Hard To Kill"),
	HARDER_TO_KILL("Harder To Kill"),
	IMPROVISATIONAL_FIGHTER("Improvisational Fighter"),
	KILLER_INSTINCT("Killer Instinct"),
	LEVEL_HEADED("Level Headed"),
	IMPROVED_LEVEL_HEADED("Improved Level Headed"),
	MARKSMAN("Marksman"),
	MARTIAL_ARTIST("Martial Artist"),
	IMPROVED_MARTIAL_ARTIST("Improved Martial Artist"),
	NERVES_OF_STEEL("Nerves of Steel"),
	IMPROVED_NERVES_OF_STEEL("Improved Nerves of Steel"),
	QUICK_DRAW("Quick Draw"),
	ROCK_AND_ROLL("Rock and Roll"),
	STEADY_HANDS("Steady Hands"),
	SWEEP("Sweep"),
	IMPROVED_SWEEP("Improved Sweep"),
	TRADEMARK_WEAPON("Trademark Weapon"),
	IMPROVED_TRADEMARK_WEAPON("Improved Trademark Weapon"),
	TWO_FISTED("Two Fisted"),
	
	//leadership
	COMMAND("Command"),
	COMMAND_PRESENCE("Command Presence"),
	FERVOR("Fervor"),
	HOLD_THE_LINE("Hold the Line"),
	INSPIRE("Inspire"),
	LEADER_OF_MEN("Leader of Men"),
	NATURAL_LEADER("Natural Leader"),
	TACTICIAN("Tactician"),
	
	//power
	NEW_POWER("New Power"),
	POWER_POINTS("Power Points"),
	RAPID_RECHARGE("Rapid Recharge"),
	IMPROVED_RAPID_RECHARGE("Improved Rapid Recharge"),
	SOUL_DRAIN("Soul Drain"),
	
	//professional
	ACE("Ace"),
	ACROBAT("Acrobat"),
	ADEPT("Adept"),
	ASSASSIN("Assassin"),
	CHAMPION("Champion"),
	GADGETEER("Gadgeteer"),
	HOLY_UNHOLY_WARRIOR("Holy/Unholy Warrior"),
	INVESTIGATOR("Investigator"),
	JACK_OF_ALL_TRADES("Jack of All Trades"),
	MCGUYVER("McGuyver"),
	MENTALIST("Mentalist"),
	MR_FIX_IT("Mr. Fix It"),
	SCHOLAR("Scholar"),
	THIEF("Thief"),
	WIZARD("Wizard"),
	WOODSMAN("Woodsman"),
	
	//social
	CHARISMATIC("Charismatic"),
	COMMON_BOND("Common Bond"),
	CONNECTIONS("Connections"),
	STRONG_WILLED("Strong Willed"),
	
	//weird
	BEAST_BOND("Beast Bond"),
	BEAST_MASTER("Beast Master"),
	DANGER_SENSE("Danger Sense"),
	HEALER("Healer"),
	LIQUID_COURAGE("Liquid Courage"),
	SCAVENGER("Scavenger"),
	
	// wildcard
	DEAD_SHOT("Dead Shot"),
	MIGHTY_BLOW("Mighty Blow"),
	POWER_SURGE("Power Surge"),
	
	//legendary
	FOLLOWERS("Followers"),
	MARTIAL_ARTS_MASTER("Martial Arts Master"),
	PROFESSIONAL("Professional"),
	EXPERT("Expert"),
	MASTER("Master"),
	SIDEKICK("Sidekick"),
	TOUGH_AS_NAILS("Tough As Nails"),
	IMPROVED_TOUGH_AS_NAILS("Improved Tough As Nails"),
	WEAPON_MASTER("Weapon Master"),
	MASTER_OF_ARMS("Master of Arms"),

	// RIFTS BOOK
	// iconic
	BEYOND_THE_LIMIT("Beyond the Limit"),
	BURN_BRIGHTER("Burn Brighter"),
	BURN_FOR_GLORY("Burn for Glory"),
	BURN_PAST_THE_PAIN("Burn Past the Pain"),
	BURN_FOR_TOMORROW("Burn for Tomorrow"),
	CYBERKINETIC_AWARENESS("Cyberkinetic Awareness"),
	IMPROVED_CYBERKINETIC_AWARENESS("Improved Cyberkinetic Awareness"),
	CYBERKINETIC_DENIAL("Cyberkinetic Denial"),
	FLAME_BLAST("Flame Blast"),
	FRESHLY_JUICED("Freshly Juiced"),
	GUN_NUT("Gun Nut"),
	GYMNASTIC_MASTERY("Gymnastic Mastery"),
	IMPROVED_CYBER_ARMOR("Improved Cyber Armor"),
	MASTER_CYBER_ARMOR("Master Cyber Armor"),
	IMPROVED_FIERY_AURA("Improved Fiery Aura"),
	IMPROVED_FIRE_MASTERY("Improved Fire Mastery"),
	IMPROVED_FLAME_BOLT("Improved Flame Bolt"),
	GREATER_FLAME_BOLT("Greater Flame Bolt"),
	IMPROVED_PSI_SWORD("Improved Psi Sword"),
	MASTER_PSI_SWORD("Master Psi Sword"),
	LEY_LINE_OBSERVATION_SPHERE("Ley LIne Observation Sphere"),
	LEY_LINE_PHASING("Ley Line Phasing"),
	LEY_LINE_GATE("Ley Line Gate"),
	OFF_THE_HANDLE("Off the Handle"),
	PSI_SHIELD("Psi Shield"),
	RAPID_FLAME_BOLT("Rapid Flame Bolt"),
	READ_THE_FLAME("Read the Flame"),
	SPLIT_THE_SECONDS("Split the Seconds"),
	BURN_FASTER("Burn Faster"),
	SUBLIME_CHAOS("Sublime Chaos"),
	UPGRADE("Upgrade"),

	// background
	UPGRADABLE("Upgradable"),

	// combat
	BATTLE_HARDENED("Battle Hardened"),
	CHARGE("Charge"),
	OVERRUN("Overrun"),
	COMBAT_SENSE("Combat Sense"),
	IMPROVED_COMBAT_SENSE("Improved Combat Sense"),
	DIRTY_FIGHTER("Dirty Fighter"),
	TRICKY_FIGHTER("Tricky Fighter"),

	// power
	CYBER_PSYCHIC_ALIGNMENT("Cyber Psychic Alignment"),
	IMPROVED_CYBER_PSYCHIC_ALIGNMENT("Improved Cyber Psychic Alignment"),
	ENERGY_CONTROL("Energy Control"),
	PSI_BLADE("Psi Blade"),
	EXCEPTIONAL_RAPID_RECHARGE("Exceptional Rapid Recharge"),
	SIXTH_SENSE("Sixth Sense"),
	TELEMECHANICS("Telemechanics"),

	//professional
	COMBAT_ACE("Combat Ace"),
	MAJOR_PSIONIC("Major Psionic"),
	MASTER_PSIONIC("Master Psionic"),
	MASTER_OF_MAGIC("Master of Magic"),
	POWER_ARMOR_JOCK("Power Armor Jock"),
	ROBOT_ARMOR_JOCK("Robot Armor Jock"),

	// special
	I_KNOW_A_GUY("I Know A Guy"),
	SCROUNGER("Scrounger");

	private String displayName;

	public String getDisplayName() {
		return displayName;
	}

	EdgeType(String displayName) {
		this.displayName = displayName;
	}
}