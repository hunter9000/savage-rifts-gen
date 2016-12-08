package savagerifts.model.skill;

import savagerifts.model.user.User;

import javax.persistence.*;

@Entity
@Table(name = "skill_knowledge")
public class SkillKnowledge {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "knowledgeCategory")
    @Enumerated(value = EnumType.STRING)
    private KnowledgeCategory knowledgeCategory;

    // the user who created this knowledge skill, if any
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user")
    private User user;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public KnowledgeCategory getKnowledgeCategory() {
        return knowledgeCategory;
    }
    public void setKnowledgeCategory(KnowledgeCategory knowledgeCategory) {
        this.knowledgeCategory = knowledgeCategory;
    }

    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object obj) {
        return this.name.equals(((SkillKnowledge)obj).name);
    }
}
