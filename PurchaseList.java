package SportyShoes.com;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Entity
@Data
public class PurchaseList {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String username;
	private String Uname;
	private String prodID;
	private String prodName;
	private String prodGender;
	private String prodCat;
	private int shoeSize;
	private int ProdPrice;
	private int ProdQty;
	private String DelAddress;
	private LocalDate ProdDate;
	private String prodStatus;
	private String OrderID;

}
