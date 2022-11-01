package SportyShoes.com;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CxRepository extends JpaRepository<Customer, String> {
	
	@Query("select Customer from Customer Customer where username=?1 and password=?2")	
	public Customer findByUnp(String username,String pass);
	
	@Query("select Customer from Customer Customer where username=?1")	
	public Customer findByUname(String username);
	
	@Query("select Customer from Customer Customer where Unum=?1")	
	public Customer findByNum(int Unum);
		
}
