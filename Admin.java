package SportyShoes.com;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Admin {
	
	@Id
	private String username;
	private String password;
	private String name;
	private int age;
	private String gender;
	private int mobileno;

}
