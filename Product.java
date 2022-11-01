package SportyShoes.com;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import lombok.Data;

@Entity
@Data
public class Product {
	@Id
	private String prodID;
	private String prodName;
	private String prodGender;
	private String prodCat;
	
	@OneToMany(cascade = CascadeType.ALL)
	private List<ShoesSize> shoeSizes;

}
