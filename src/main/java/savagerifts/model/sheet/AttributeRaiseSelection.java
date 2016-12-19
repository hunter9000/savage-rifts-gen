package savagerifts.model.sheet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.AttributeType;

import javax.persistence.*;

@Entity
@Table(name = "attribute_raise_selection")
public class AttributeRaiseSelection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "sheet", nullable = false, updatable = false)
    private Sheet sheet;

    @Column(name = "attributeType", nullable = false, updatable = false)
    private AttributeType attributeType;


    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Sheet getSheet() {
        return sheet;
    }
    public void setSheet(Sheet sheet) {
        this.sheet = sheet;
    }

    public AttributeType getAttributeType() {
        return attributeType;
    }
    public void setAttributeType(AttributeType attributeType) {
        this.attributeType = attributeType;
    }
}
