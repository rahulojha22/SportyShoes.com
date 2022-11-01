package SportyShoes.com;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminDao {
	@Autowired
	AdminRepository AdRepo;
		
	public Admin findAdmin(String AdUname, String AdPass) {
		return AdRepo.findByuser(AdUname, AdPass);
	}
		
	public Admin AdInsert(Admin admin) {
		return AdRepo.save(admin);
	}
	
	public Admin findAdUser(String username) {
		return AdRepo.findAdUser(username);
	}
	
}
