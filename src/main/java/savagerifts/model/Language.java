package savagerifts.model;

import javax.persistence.*;

@Table
public class Language {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "name", nullable = false, length = 50)
	private String name;
	
	@Column(name = "description", nullable = false, length = 1000)
	private String description;
}

//INSERT INTO LANGUAGE (NAME, DESCRIPTION) VALUES('', '');