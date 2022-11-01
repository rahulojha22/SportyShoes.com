package SportyShoes.com;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CxDao {
	@Autowired
	CxRepository CxRepo;
	
	public Customer AddCx(Customer cx) {
		return CxRepo.save(cx);
	}
	
	public Customer FindCx(String username) {
		return CxRepo.findByUname(username);
	}
	
	public List<Customer> FindAllCx(){
		return CxRepo.findAll();
	}
	
	public Customer GetCx(String username, String pass) {
		return CxRepo.findByUnp(username, pass);
	}
	
	public Customer FindByNum(int Unum) {
		return CxRepo.findByNum(Unum);
	}
		
}
