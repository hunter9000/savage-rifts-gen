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
	@Enumerated(Enumeration.STRING)
	private RaceType type;
	
	@Column(name = "description", length = 1000, nullable = false, updatable = false)
	private String description;
	
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
	
	public String getDescription() {
		return description;
	}
	public void setDecription(String description) {
		this.description = description;
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