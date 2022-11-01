package SportyShoes.com;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AdminRepository extends JpaRepository<Admin, String> {
	
	@Query("select Admin from Admin Admin where username=?1 and password=?2")	
	public Admin findByuser(String AdUname,String AdPass);
	
	@Query("select Admin from Admin Admin where username=?1")	
	public Admin findAdUser(String username);

}
