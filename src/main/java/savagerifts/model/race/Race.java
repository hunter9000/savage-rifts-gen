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