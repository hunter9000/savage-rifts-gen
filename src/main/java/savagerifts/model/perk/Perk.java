package savagerifts.model.perk;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "perk")
public class Perk {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@Column(name = "description", nullable = false, length = 1000)
	private String description;

	@Column(name = "type", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private PerkType type;


	// granted edges vs. edge choices (from category)
	// gains this edge, plus a backup edge incase they have the first one already. need to apply these after edge selection step? or does this just mean if your framwork gives it to you, since that's the only thing you've done before this step?
	@OneToMany(mappedBy = "perk")
	private List<PerkProvidedEdge> perkProvidedEdges;

	@OneToMany(mappedBy = "perk")
	private List<PerkEdgeChoice> perkEdgeChoices;

	// +1 die type in this skill, specific starting dietype, and/or +x bonus to skill??
	// seems like the starting die types set the default before you make skill buy, and the bonus is added after that. how is the +1 die type used??
//	@OneToMany(mappedBy = "perk")
	@Transient
	private List<PerkSkill> perkSkills;

	// granted gear & quantity
	@Transient
	private List<PerkProvidedGear> providedGears;

	// +x to stats (parry, isp, ppe, etc)
	@Column(name = "parry_bonus", nullable = true, updatable = false)
	private Integer parryBonus;

	@Column(name = "isp_bonus", nullable = true, updatable = false)
	private Integer isp;

	@Column(name = "ppe_bonus", nullable = true, updatable = false)
	private Integer ppe;

	// extra languages
	@Column(name = "num_languages_bonus", nullable = true, updatable = false)
	private Integer numExtraLanguages;

	// number of times a perk may be rolled, default to 1. when rolling, if already taken N times, reroll
	@Column(name = "max_times_chosen", nullable = true, updatable = false)
	private Integer maxTimesChosen;		// default 1, nullable for infinite?
	
	// QUESTIONABLE:
	// underworld blackops 6, TRAINING_1: etra skill points to spend on certain skills?!
	// TRAINING_3, TRAINING_8: choose any professional edge. may ignore some requirements, but not others?! wtf
	// TRAINING_6: starting die type to skill, OR +x to skill if already has it
	// TRAINING_9: +1 die type for choice of a few skills
	// PSIONICS_5, MAGIC_MYSTICISM_4: one power from own list of any rank, or any novice power outside your list
	// RANGED_WEAPONS_1: how to do this?? how to choose which weapon to apply bonuses from weapons tables to? need extra step after table swap? or just let the user figure it out afterwards?
	
	//MAGIC_MYSTICISM_1, ENCHANTED_ITEMS_MYSTIC_GADGETS_10: technowizards/cyberknights get different treatment?
	



//	@Transient
//	public String getBenefitTableDisplayName() {
//		return type.getTableType().getDisplayName();
//	}
//	public void setBenefitTableDisplayName(String displayName) {
//		// do nothing, this is a read only property
//	}


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public PerkType getType() {
		return type;
	}
	public void setType(PerkType type) {
		this.type = type;
	}

	public List<PerkProvidedEdge> getPerkProvidedEdges() {
		return perkProvidedEdges;
	}
	public void setPerkProvidedEdges(List<PerkProvidedEdge> perkProvidedEdges) {
		this.perkProvidedEdges = perkProvidedEdges;
	}

	public List<PerkEdgeChoice> getPerkEdgeChoices() {
		return perkEdgeChoices;
	}
	public void setPerkEdgeChoices(List<PerkEdgeChoice> perkEdgeChoices) {
		this.perkEdgeChoices = perkEdgeChoices;
	}

	public List<PerkSkill> getPerkSkills() {
		return perkSkills;
	}
	public void setPerkSkills(List<PerkSkill> perkSkills) {
		this.perkSkills = perkSkills;
	}

	public List<PerkProvidedGear> getProvidedGears() {
		return providedGears;
	}
	public void setProvidedGears(List<PerkProvidedGear> providedGears) {
		this.providedGears = providedGears;
	}

	public Integer getParryBonus() {
		return parryBonus;
	}
	public void setParryBonus(Integer parryBonus) {
		this.parryBonus = parryBonus;
	}

	public Integer getIsp() {
		return isp;
	}
	public void setIsp(Integer isp) {
		this.isp = isp;
	}

	public Integer getPpe() {
		return ppe;
	}
	public void setPpe(Integer ppe) {
		this.ppe = ppe;
	}

	public Integer getNumExtraLanguages() {
		return numExtraLanguages;
	}
	public void setNumExtraLanguages(Integer numExtraLanguages) {
		this.numExtraLanguages = numExtraLanguages;
	}

	public Integer getMaxTimesChosen() {
		return maxTimesChosen;
	}
	public void setMaxTimesChosen(Integer maxTimesChosen) {
		this.maxTimesChosen = maxTimesChosen;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Perk) {
			return type.equals( ((Perk)obj).getType() );
		}
		return false;
	}

	@Override
	public int hashCode() {
		return type.hashCode();
	}
}