package SportyShoes.com;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductDao {
	@Autowired
	ShoesRepository PrRepo;
	
	@Autowired
	ShSize SzRepo;
	
	@Autowired
	PurchaseRepository purchase;
		
	public Product AdShoes(Product prod) {
		return PrRepo.save(prod);
	}
	
	public ShoesSize AdSize(ShoesSize sz) {
		return SzRepo.save(sz);
	}
	
	public List<Product> getShoes(){
		return PrRepo.findAll();
	}
	
	public List<Product> findByProdGen(String prodGender){
		return PrRepo.findByProdGen(prodGender);
	}
	
	public List<Product> findByProdCat(String prodCat){
		return PrRepo.findByProdCat(prodCat);
	}
	
	public List<Product> CustomiseSearch(String prodGender, String prodCat){
		return PrRepo.CustomiseSearch(prodGender, prodCat);
	}
	
	public Product findProd(String ProdID) {
		return PrRepo.findByProdID(ProdID);
	}
	
	public int DeleteShoe(String prodID) {
		int i=0;
		if(PrRepo.findByProdID(prodID)!=null) {
			PrRepo.deleteById(prodID);
			i++;
		}		
		return i;
	}
	
	public PurchaseList findForDelete(String prodID, int shoeSize, String username, String ct) {
		return purchase.findForDelete(prodID, shoeSize, username, ct);
	}
	
	public int DeleteFromCart(PurchaseList purList) {
		purchase.delete(purList);;
		return 1;
	}
	
	public PurchaseList AddCart(PurchaseList purList) {
		return purchase.save(purList);
	}
	
	public PurchaseList prodAvailableInCart(String username,String prodStatus, String prodID, int shoeSize) {
		return purchase.prodInCart(username, prodStatus, prodID, shoeSize);
	}
	
	public List<PurchaseList> findPrCart(String username,String prodStatus) {
		return purchase.findCart(username, prodStatus);
	}
	
	public List<PurchaseList> findPurList(String username,String OrderID) {
		return purchase.findPurList(username, OrderID);
	}
	
	public List<PurchaseList> findPurRepByDate(LocalDate StartDate, LocalDate EndDate){
		return purchase.findPurRepByDate(StartDate, EndDate);
	}

}
