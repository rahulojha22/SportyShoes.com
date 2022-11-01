package SportyShoes.com;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

import lombok.Data;

@Entity
@Data
public class ShoesSize {
	@Id
	private String id;
	private int shoeSize;
	private int stock;
	private int ProdPrice;

}
