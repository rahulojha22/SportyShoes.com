package SportyShoes.com;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class Customer {
	@Id
	private String username;
	private String password;
	private String Uname;
	private int Uage;
	private String Ugender;
	@Column(unique = true)
	private int Unum;

}
