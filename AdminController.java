package SportyShoes.com;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	AdminDao AdDao;
	
	@Autowired
	ProductDao prDao;
	
	@Autowired
	CxDao cxDao;
		
	@RequestMapping("/AdminLogin")
	public ModelAndView AdminLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		Admin ad=AdDao.findAdmin(request.getParameter("AdUname"),request.getParameter("AdPass"));
		if(ad!=null) {
			AdminLoginDetail AdDetail=new AdminLoginDetail();
			AdDetail.setAdName(ad.getName());
			AdDetail.setAdUsername(ad.getUsername());
			mv.setViewName("AdminHome.jsp");
			mv.addObject("Admin", ad.getName());
		}else {
			mv.setViewName("AdminLogin.jsp");
			mv.addObject("Message", "Username or Password Incorrect");
		}				
		return mv;
	}
	
	@RequestMapping("/AdminProfile")
	public ModelAndView AdminProfile(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();		
		AdminLoginDetail ad=new AdminLoginDetail();
		Admin admin=AdDao.findAdUser(ad.getAdUsername());
		mv.setViewName("AdminProfile.jsp");
		mv.addObject("admin", admin);
		return mv;
	}
	
	@RequestMapping("/AdminChangePassword")
	public ModelAndView AdminChangePassword(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();		
		AdminLoginDetail ad=new AdminLoginDetail();
		Admin admin=AdDao.findAdUser(ad.getAdUsername());
		admin.setPassword(request.getParameter("NewAdPass"));
		admin=AdDao.AdInsert(admin);
		mv.setViewName("AdminProfile");
		return mv;
	}
	
	@RequestMapping("/AdminRegister")
	public ModelAndView AdminRegister(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		Admin admin=new Admin();
		
		if(AdDao.findAdmin(request.getParameter("AdUname"),request.getParameter("AdPass"))!=null) {
			admin.setUsername(request.getParameter("NewAdUname"));
			admin.setPassword(request.getParameter("NewAdPass"));
			admin.setName(request.getParameter("AdName"));
			admin.setAge(Integer.parseInt(request.getParameter("AdAge")));
			admin.setGender(request.getParameter("AdGender"));
			admin.setMobileno(Integer.parseInt(request.getParameter("AdNum")));
			Admin ad=AdDao.AdInsert(admin);
			mv.setViewName("AdminLogin.jsp");
			mv.addObject("Message", "Admin Registered Successful");
		}else {
			mv.setViewName("AdminRegister.jsp");
			mv.addObject("Message", "Existing Admin's Username or Password Incorrect");
		}				
		return mv;
	}
	
	@RequestMapping("/AdLogout")
	public ModelAndView AdLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();		
		AdminLoginDetail adDetail=new AdminLoginDetail();
		adDetail.setAdName(null);
		adDetail.setAdUsername(null);
		mv.setViewName("AdminLogin.jsp");
		return mv;
	}
	
	@RequestMapping("/AddShoe")
	public ModelAndView AdShoes(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		Product prod=new Product();
		prod.setProdID(request.getParameter("ProdID"));
		prod.setProdName(request.getParameter("ProdName"));
		prod.setProdGender(request.getParameter("ProdGender"));
		prod.setProdCat(request.getParameter("ProdCat"));
				
		ShoesSize sz2=new ShoesSize();
		ShoesSize sz3=new ShoesSize();
		ShoesSize sz4=new ShoesSize();
		ShoesSize sz5=new ShoesSize();
		ShoesSize sz6=new ShoesSize();
		ShoesSize sz7=new ShoesSize();
		ShoesSize sz8=new ShoesSize();
		ShoesSize sz9=new ShoesSize();
		ShoesSize sz10=new ShoesSize();
		List<ShoesSize> ShSize=new ArrayList<ShoesSize>();
	
	if(request.getParameter("sz2")!=null) {
		String id2=request.getParameter("ProdID")+request.getParameter("sz2");
		sz2.setId(id2);				
		sz2.setShoeSize(Integer.parseInt(request.getParameter("sz2")));		
		sz2.setStock(Integer.parseInt(request.getParameter("st2")));		
		sz2.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice2")));
		ShSize.add(sz2);
	}
	if(request.getParameter("sz3")!=null) {
		String id3=request.getParameter("ProdID")+request.getParameter("sz3");
		sz3.setId(id3);		
		sz3.setShoeSize(Integer.parseInt(request.getParameter("sz3")));		
		sz3.setStock(Integer.parseInt(request.getParameter("st3")));		
		sz3.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice3")));
		ShSize.add(sz3);		
	}
	if(request.getParameter("sz4")!=null) {
		String id4=request.getParameter("ProdID")+request.getParameter("sz4");
		sz4.setId(id4);		
		sz4.setShoeSize(Integer.parseInt(request.getParameter("sz4")));		
		sz4.setStock(Integer.parseInt(request.getParameter("st4")));		
		sz4.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice4")));
		ShSize.add(sz4);		
	}
	if(request.getParameter("sz5")!=null) {
		String id5=request.getParameter("ProdID")+request.getParameter("sz5");
		sz5.setId(id5);
		sz5.setShoeSize(Integer.parseInt(request.getParameter("sz5")));		
		sz5.setStock(Integer.parseInt(request.getParameter("st5")));		
		sz5.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice5")));
		ShSize.add(sz5);		
	}
	if(request.getParameter("sz6")!=null) {
		String id6=request.getParameter("ProdID")+request.getParameter("sz6");
		sz6.setId(id6);		
		sz6.setShoeSize(Integer.parseInt(request.getParameter("sz6")));		
		sz6.setStock(Integer.parseInt(request.getParameter("st6")));		
		sz6.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice6")));
		ShSize.add(sz6);		
	}
	if(request.getParameter("sz7")!=null) {
		String id7=request.getParameter("ProdID")+request.getParameter("sz7");
		sz7.setId(id7);		
		sz7.setShoeSize(Integer.parseInt(request.getParameter("sz7")));		
		sz7.setStock(Integer.parseInt(request.getParameter("st7")));		
		sz7.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice7")));
		ShSize.add(sz7);		
	}
	if(request.getParameter("sz8")!=null) {
		String id8=request.getParameter("ProdID")+request.getParameter("sz8");
		sz8.setId(id8);		
		sz8.setShoeSize(Integer.parseInt(request.getParameter("sz8")));		
		sz8.setStock(Integer.parseInt(request.getParameter("st8")));		
		sz8.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice8")));
		ShSize.add(sz8);		
	}
	if(request.getParameter("sz9")!=null) {
		String id9=request.getParameter("ProdID")+request.getParameter("sz9");
		sz9.setId(id9);
		sz9.setShoeSize(Integer.parseInt(request.getParameter("sz9")));
		sz9.setStock(Integer.parseInt(request.getParameter("st9")));
		sz9.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice9")));
		ShSize.add(sz9);		
	}
	if(request.getParameter("sz10")!=null) {
		String id10=request.getParameter("ProdID")+request.getParameter("sz10");
		sz10.setId(id10);
		sz10.setShoeSize(Integer.parseInt(request.getParameter("sz10")));
		sz10.setStock(Integer.parseInt(request.getParameter("st10")));
		sz10.setProdPrice(Integer.parseInt(request.getParameter("ProdPrice10")));
		ShSize.add(sz10);
	}
				
		prod.setShoeSizes(ShSize);		
		Product prd=prDao.AdShoes(prod);		
		mv.setViewName("AddShoes.jsp");
		mv.addObject("Message", "Shoe Added Successfully");
		return mv;
	}
	
	@RequestMapping("/UpdateShoes")
	public ModelAndView UpdateShoes(HttpServletRequest request, HttpServletResponse response) {
		String Message;
		String Control=request.getParameter("Control");
		int i=0;
		ModelAndView mv = new ModelAndView();
		Product pr=prDao.findProd(request.getParameter("ProdID"));
	if(pr==null) {
		Message="No shoes available with the given Product ID.";
	}else {
		int size=Integer.parseInt(request.getParameter("shoeSize"));
		int price=Integer.parseInt(request.getParameter("ProdPrice"));
		int stock=Integer.parseInt(request.getParameter("stock"));
		for(ShoesSize sh:pr.getShoeSizes()){
			if(sh.getShoeSize()==size) {
				sh.setProdPrice(price);
				sh.setStock(stock);
				i++;
			}
		}
		if(i==0) {
			Message="The given size is not available.";
		}else {
			Product prd=prDao.AdShoes(pr);
			Message="Shoes Updated successfully.";
		}
	}
	if(Control!=null) {
		mv.setViewName("ShoesList");
	}else {
		mv.setViewName("UpdateShoes.jsp");
	}		
		mv.addObject("Message", Message);
		return mv;
	}
	
	@RequestMapping("/UpdateShoesFromList")
	public ModelAndView UpdateShoesFromList(HttpServletRequest request, HttpServletResponse response) {
		String ProdID1=request.getParameter("ProdID");
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("UpdateShoes.jsp");
		mv.addObject("ProdID", ProdID1);
		mv.addObject("Control", "Control");
		return mv;
	}
	
	@RequestMapping("/DeleteShoes")
	public ModelAndView DeleteShoes(HttpServletRequest request, HttpServletResponse response) {
		String Message;
		ModelAndView mv = new ModelAndView();
		int del=prDao.DeleteShoe(request.getParameter("ProdID"));
	if(del==0) {
		Message="No shoes available with the given Product ID.";
	}else {
		Message="Shoes deleted successfully.";
	}
		mv.setViewName("DeleteShoe.jsp");
		mv.addObject("Message", Message);
		return mv;
	}
	
	@RequestMapping("/DeleteShoesFromList")
	public ModelAndView DeleteShoesFromList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		int del=prDao.DeleteShoe(request.getParameter("ProdID"));
	
		mv.setViewName("ShoesList");
		return mv;
	}
	
	@RequestMapping("/ShoesList")
	public ModelAndView ShoesList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		List<Product> list=prDao.getShoes();
		mv.setViewName("ShoesList.jsp");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/CxList")
	public ModelAndView CxList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		List<Customer> cx=cxDao.FindAllCx();
		mv.setViewName("CxList.jsp");
		mv.addObject("cx", cx);
		return mv;
	}
	
	@RequestMapping("/SearchCx")
	public ModelAndView SearchCx(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		Customer cx=cxDao.FindCx(request.getParameter("username"));
		if(cx!=null) {
			mv.setViewName("CustomerSearch.jsp");
			mv.addObject("cx", cx);
		}else {
			mv.setViewName("SearchCx.jsp");
			mv.addObject("Message", "Customer not available.");
		}				
		return mv;
	}
	
	@RequestMapping("/PurRepByDate")
	public ModelAndView PurRepByDate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();		
		LocalDate StartDate=LocalDate.parse(request.getParameter("StartDate"));
		LocalDate EndDate=LocalDate.parse(request.getParameter("EndDate"));
		
		List<PurchaseList> purList=prDao.findPurRepByDate(StartDate, EndDate);
	if(purList.isEmpty()) {
		mv.setViewName("PurRepByDate.jsp");
		mv.addObject("Message", "No report is available for the selected date.");
	}else {
		mv.setViewName("PurchaseReport.jsp");
		mv.addObject("purList", purList);
	}
		return mv;
	}
	
	@RequestMapping("/PurRepByCat")
	public ModelAndView PurRepByCat(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();		
		LocalDate StartDate=LocalDate.parse(request.getParameter("StartDate"));
		LocalDate EndDate=LocalDate.parse(request.getParameter("EndDate"));
		String prodCat=request.getParameter("ProdCat");
		
		List<PurchaseList> purList=prDao.findPurRepByDate(StartDate, EndDate);
		if(purList.isEmpty()) {
			mv.setViewName("PurRepByCat.jsp");
			mv.addObject("Message", "No report is available for the selected date.");
		}else {
			int k=0;
			for(PurchaseList pl: purList) {
				if(pl.getProdCat().equals(prodCat)) {
					k++;
				}
			}
			if(k==0) {
				mv.setViewName("PurRepByCat.jsp");
				mv.addObject("Message", "No report is available for the selected category.");
			}else {
				mv.setViewName("PurchaseReport.jsp");
				mv.addObject("purList", purList);
				mv.addObject("prodCat", prodCat);
			}
		}
		return mv;
	}	
}
