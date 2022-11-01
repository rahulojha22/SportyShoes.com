package SportyShoes.com;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ShoesRepository extends JpaRepository<Product, String> {
		
	@Query("select Product from Product Product where ProdID=?1")	
	public Product findByProdID(String ProdID);
	
	@Query("select Product from Product Product where prodGender=?1")	
	public List<Product> findByProdGen(String prodGender);
	
	@Query("select Product from Product Product where prodCat=?1")	
	public List<Product> findByProdCat(String prodCat);
	
	@Query("select Product from Product Product where prodGender=?1 and prodCat=?2")	
	public List<Product> CustomiseSearch(String prodGender, String prodCat);
	
	
}
