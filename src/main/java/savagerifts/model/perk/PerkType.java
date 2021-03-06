package savagerifts.model.perk;

import com.fasterxml.jackson.annotation.JsonFormat;
import savagerifts.model.benefittable.BenefitTableType;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum PerkType {

    BODY_ARMOR_1(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_2(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_3(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_4(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_5(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_6(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_7(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_8(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_9(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_10(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_11(BenefitTableType.BODY_ARMOR),
    BODY_ARMOR_12(BenefitTableType.BODY_ARMOR, true),

    CLOSE_COMBAT_WEAPONS_1(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_2(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_3(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_4(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_5(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_6(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_7(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_8(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_9(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_10(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_11(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_12(BenefitTableType.CLOSE_COMBAT_WEAPONS),
    CLOSE_COMBAT_WEAPONS_13(BenefitTableType.CLOSE_COMBAT_WEAPONS, true),

    CYBERNETICS_1(BenefitTableType.CYBERNETICS),
    CYBERNETICS_2(BenefitTableType.CYBERNETICS),
    CYBERNETICS_3(BenefitTableType.CYBERNETICS),
    CYBERNETICS_4(BenefitTableType.CYBERNETICS),
    CYBERNETICS_5(BenefitTableType.CYBERNETICS),
    CYBERNETICS_6(BenefitTableType.CYBERNETICS),
    CYBERNETICS_7(BenefitTableType.CYBERNETICS),
    CYBERNETICS_8(BenefitTableType.CYBERNETICS),
    CYBERNETICS_9(BenefitTableType.CYBERNETICS),
    CYBERNETICS_10(BenefitTableType.CYBERNETICS),
    CYBERNETICS_11(BenefitTableType.CYBERNETICS),
    CYBERNETICS_12(BenefitTableType.CYBERNETICS),
    CYBERNETICS_13(BenefitTableType.CYBERNETICS),
    CYBERNETICS_14(BenefitTableType.CYBERNETICS),


    EDUCATION_1(BenefitTableType.EDUCATION),
    EDUCATION_2(BenefitTableType.EDUCATION),
    EDUCATION_3(BenefitTableType.EDUCATION),
    EDUCATION_4(BenefitTableType.EDUCATION),
    EDUCATION_5(BenefitTableType.EDUCATION),
    EDUCATION_6(BenefitTableType.EDUCATION),
    EDUCATION_7(BenefitTableType.EDUCATION),
    EDUCATION_8(BenefitTableType.EDUCATION),
    EDUCATION_9(BenefitTableType.EDUCATION),
    EDUCATION_10(BenefitTableType.EDUCATION),
    EDUCATION_11(BenefitTableType.EDUCATION),
    EDUCATION_12(BenefitTableType.EDUCATION, true),


    ENCHANTED_ITEMS_MYSTIC_GADGETS_1(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_2(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_3(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_4(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_5(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_6(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_7(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_8(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_9(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_10(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_11(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_12(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS),
    ENCHANTED_ITEMS_MYSTIC_GADGETS_13(BenefitTableType.ENCHANTED_ITEMS_MYSTIC_GADGETS, true),


    EXPERIENCE_WISDOM_1(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_2(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_3(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_4(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_5(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_6(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_7(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_8(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_9(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_10(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_11(BenefitTableType.EXPERIENCE_WISDOM),
    EXPERIENCE_WISDOM_12(BenefitTableType.EXPERIENCE_WISDOM, true),


    MAGIC_MYSTICISM_1(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_2(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_3(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_4(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_5(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_6(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_7(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_8(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_9(BenefitTableType.MAGIC_MYSTICISM),
    MAGIC_MYSTICISM_10(BenefitTableType.MAGIC_MYSTICISM, true),


    PSIONICS_1(BenefitTableType.PSIONICS),
    PSIONICS_2(BenefitTableType.PSIONICS),
    PSIONICS_3(BenefitTableType.PSIONICS),
    PSIONICS_4(BenefitTableType.PSIONICS),
    PSIONICS_5(BenefitTableType.PSIONICS),
    PSIONICS_6(BenefitTableType.PSIONICS),
    PSIONICS_7(BenefitTableType.PSIONICS),
    PSIONICS_8(BenefitTableType.PSIONICS),
    PSIONICS_9(BenefitTableType.PSIONICS),
    PSIONICS_10(BenefitTableType.PSIONICS),
    PSIONICS_11(BenefitTableType.PSIONICS, true),


    RANGED_WEAPONS_1(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_2(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_3(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_4(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_5(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_6(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_7(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_8(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_9(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_10(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_11(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_12(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_13(BenefitTableType.RANGED_WEAPONS),
    RANGED_WEAPONS_14(BenefitTableType.RANGED_WEAPONS, true),


    TRAINING_1(BenefitTableType.TRAINING),
    TRAINING_2(BenefitTableType.TRAINING),
    TRAINING_3(BenefitTableType.TRAINING),
    TRAINING_4(BenefitTableType.TRAINING),
    TRAINING_5(BenefitTableType.TRAINING),
    TRAINING_6(BenefitTableType.TRAINING),
    TRAINING_7(BenefitTableType.TRAINING),
    TRAINING_8(BenefitTableType.TRAINING),
    TRAINING_9(BenefitTableType.TRAINING),
    TRAINING_10(BenefitTableType.TRAINING),
    TRAINING_11(BenefitTableType.TRAINING, true),


    UNDERWORLD_BLACK_OPS_1(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_2(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_3(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_4(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_5(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_6(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_7(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_8(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_9(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_10(BenefitTableType.UNDERWORLD_BLACK_OPS),
    UNDERWORLD_BLACK_OPS_11(BenefitTableType.UNDERWORLD_BLACK_OPS, true);

    private BenefitTableType tableType;
    private boolean mustSwap = false;

    public BenefitTableType getTableType() {
        return tableType;
    }
    public boolean isMustSwap() {
        return mustSwap;
    }

    PerkType(BenefitTableType tableType) {
        this.tableType = tableType;
    }
    PerkType(BenefitTableType tableType, boolean mustSwap) {
        this.tableType = tableType;
        this.mustSwap = mustSwap;
    }

}
