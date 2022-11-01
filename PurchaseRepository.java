package SportyShoes.com;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PurchaseRepository extends JpaRepository<PurchaseList, Integer> {
	
	@Query("select PurchaseList from PurchaseList PurchaseList where username=?1 and prodStatus=?2")	
	public List<PurchaseList> findCart(String username, String prodStatus);
	
	@Query("select PurchaseList from PurchaseList PurchaseList where username=?1 and prodStatus=?2 and prodID=?3 and shoeSize=?4")	
	public PurchaseList prodInCart(String username,String prodStatus, String prodID, int shoeSize);
	
	@Query("select PurchaseList from PurchaseList PurchaseList where username=?1 and OrderID=?2")	
	public List<PurchaseList> findPurList(String username,String OrderID);
	
	@Query("select PurchaseList from PurchaseList PurchaseList where ProdDate between ?1 and ?2")	
	public List<PurchaseList> findPurRepByDate(LocalDate StartDate, LocalDate EndDate);
	
	@Query("select PurchaseList from PurchaseList PurchaseList where prodID=?1 and shoeSize=?2 and username=?3 and prodStatus=?4")	
	public PurchaseList findForDelete(String prodID, int shoeSize, String username, String ct);
	
}
