package savagerifts.model.race;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "race")
public class Race {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "type", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private RaceType type;

	@OneToMany(mappedBy = "race")
	private List<RaceAbility> abilities;

	@Column(name = "hasMagic", nullable = false)
	private boolean hasMagic;
	
	@Column(name = "hasPsionics", nullable = false)
	private boolean hasPsionics;
	


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public RaceType getType() {
		return type;
	}
	public void setType(RaceType type) {
		this.type = type;
	}
	
	@Transient
	public String getDescription() {
		return type.getDescription();
	}
	public void setDecription(String description) {
		// nothing, this is a readonly property
	}
	@Transient
		public String getDisplayName() {
		return type.getDisplayName();
	}
	public void setDisplayName(String displayName) {
		// nothing, this is a readonly property
	}
	
	public List<RaceAbility> getAbilities() {
		return abilities;
	}
	public void setAbilities(List<RaceAbility> abilities) {
		this.abilities = abilities;
	}

	public boolean isHasMagic() {
		return hasMagic;
	}
	public void setHasMagic(boolean hasMagic) {
		this.hasMagic = hasMagic;
	}

	public boolean isHasPsionics() {
		return hasPsionics;
	}
	public void setHasPsionics(boolean hasPsionics) {
		this.hasPsionics = hasPsionics;
	}
}