package SportyShoes.com;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Autowired
	CxDao cxDao;
	
	@Autowired
	ProductDao prDao;
	
	@RequestMapping("/")
	public ModelAndView homePage(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		List<Product> list=prDao.getShoes();
		mv.setViewName("homePage.jsp");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/GenSearch")
	public ModelAndView GenSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		List<Product> list=prDao.findByProdGen(request.getParameter("prodGender"));
		mv.setViewName("homePage.jsp");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/CatSearch")
	public ModelAndView CatSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		List<Product> list=prDao.findByProdCat(request.getParameter("prodCat"));
		mv.setViewName("homePage.jsp");
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping("/CustomSearch")
	public ModelAndView CustomSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		List<Product> list=prDao.CustomiseSearch(request.getParameter("prodGender"), request.getParameter("ProdCat"));
		int i=0;
		if(list.isEmpty()) {
			mv.setViewName("CusSearch.jsp");
			mv.addObject("Message", "No result found");
		}else {
					mv.setViewName("homePage.jsp");
					mv.addObject("list", list);
			}
		return mv;
	}
	
	@RequestMapping("/UserLogin")
	public ModelAndView UserLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		String username=request.getParameter("username");
		String pass=request.getParameter("pass");
		Customer user=cxDao.GetCx(username, pass);
		if(user!=null) {
			UserLoginDetail ud=new UserLoginDetail();
			ud.setUsername(username);
			ud.setUname(user.getUname());
			List<Product> list=prDao.getShoes();
			mv.setViewName("homePage.jsp");
			mv.addObject("list", list);			
		}else {
			mv.setViewName("UserLogin.jsp");
			mv.addObject("Message", "Username or Password Incorrect");
		}
		return mv;
	}
	
	@RequestMapping("/UserRegister")
	public ModelAndView UserRegister(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		String username=request.getParameter("username");
		int Unum=Integer.parseInt(request.getParameter("Unum"));
		Customer cx1=cxDao.FindCx(username);
		Customer cx2=cxDao.FindByNum(Unum);
		if(cx1==null && cx2==null) {
			if(Integer.parseInt(request.getParameter("Uage"))>=18) {
				Customer cust=new Customer();
				cust.setUsername(request.getParameter("username"));
				cust.setPassword(request.getParameter("pass"));
				cust.setUname(request.getParameter("Uname"));
				cust.setUage(Integer.parseInt(request.getParameter("Uage")));
				cust.setUgender(request.getParameter("Ugender"));
				cust.setUnum(Integer.parseInt(request.getParameter("Unum")));
				cxDao.AddCx(cust);
				mv.setViewName("UserLogin.jsp");
				mv.addObject("Message", "Registration successful");
			}else {
				mv.setViewName("UserRegister.jsp");
				mv.addObject("Message", "Age must be min 18 years.");
			}
		}else if(cx1.getUsername().equals(username)){
			mv.setViewName("UserRegister.jsp");
			mv.addObject("Message", "Username already registered");
		}else if(cx2.getUnum()==Unum){
			mv.setViewName("UserRegister.jsp");
			mv.addObject("Message", "Mobile Number already registered");			
		}
		return mv;
	}
	
	@RequestMapping("/SetUserPass")
	public ModelAndView SetUserPass(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		String username=request.getParameter("username");
		int Unum=Integer.parseInt(request.getParameter("Unum"));
		String pass=request.getParameter("pass");
		Customer cx1=cxDao.FindCx(username);
		if(cx1==null) {
			mv.setViewName("SetUserPass.jsp");
			mv.addObject("Message", "Username not available");
		}else if(cx1.getUnum()!=Unum){
			mv.setViewName("SetUserPass.jsp");
			mv.addObject("Message", "Mobile number incorrect");
		}else {
			cx1.setPassword(pass);
			cxDao.AddCx(cx1);
			mv.setViewName("UserLogin.jsp");
			mv.addObject("Message", "Password change successfully");			
		}
		return mv;
	}
	
	@RequestMapping("/UserCart")
	public ModelAndView UserCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		int size=Integer.parseInt(request.getParameter("ProdSize"));
		String ProdID=request.getParameter("ProdID");
		Product prod=prDao.findProd(ProdID);
		UserLoginDetail ud=new UserLoginDetail();
	if(ud.getUname()!=null) {
		PurchaseList purList=new PurchaseList();
		purList.setUsername(ud.getUsername());
		purList.setUname(ud.getUname());
		purList.setProdID(prod.getProdID());
		purList.setProdName(prod.getProdName());
		purList.setProdGender(prod.getProdGender());
		purList.setProdCat(prod.getProdCat());
		purList.setShoeSize(size);
		List<ShoesSize> sz=prod.getShoeSizes();
		for(ShoesSize sz1:sz) {
			if(sz1.getShoeSize()==size) {
				purList.setProdPrice(sz1.getProdPrice());
				purList.setProdQty(sz1.getStock());
			}
		}
		purList.setProdStatus("Cart");
		List<PurchaseList> cart=prDao.findPrCart(ud.getUsername(), "Cart");
		int k=0;
		for(PurchaseList pl:cart) {
			k++;
		}
	if(k<5) {
	if(prDao.prodAvailableInCart(ud.getUsername(), "Cart", ProdID, size)==null) {		
		PurchaseList pl=prDao.AddCart(purList);
	}
	}else {
		mv.addObject("Message", "Cart is full, Delete some item to add new product.");
	}
		List<PurchaseList> purchaseList=prDao.findPrCart(ud.getUsername(), "Cart");
	for(PurchaseList pu:purchaseList) {
		prod=prDao.findProd(pu.getProdID());
		sz=prod.getShoeSizes();
		for(ShoesSize sz1:sz) {
			if(sz1.getShoeSize()==pu.getShoeSize()) {
				pu.setProdQty(sz1.getStock());
				pu.setProdPrice(sz1.getProdPrice());
				PurchaseList plUpdate=prDao.AddCart(pu);
			}				
		}		
	}	
		List<PurchaseList> cartList=prDao.findPrCart(ud.getUsername(), "Cart");
		mv.setViewName("UserCart.jsp");
		mv.addObject("cartList", cartList);
	}else {
		mv.setViewName("UserLogin.jsp");
	}
		return mv;
	}
	
	@RequestMapping("/ShopingCart")
	public ModelAndView ShopingCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		UserLoginDetail ud=new UserLoginDetail();
		Product prod=new Product();
		List<ShoesSize> sz=prod.getShoeSizes();
		List<PurchaseList> purchaseList=prDao.findPrCart(ud.getUsername(), "Cart");
		for(PurchaseList pu:purchaseList) {
			prod=prDao.findProd(pu.getProdID());
			sz=prod.getShoeSizes();
			for(ShoesSize sz1:sz) {
				if(sz1.getShoeSize()==pu.getShoeSize()) {
					pu.setProdQty(sz1.getStock());
					pu.setProdPrice(sz1.getProdPrice());
					PurchaseList plUpdate=prDao.AddCart(pu);
				}				
			}		
		}
	
		List<PurchaseList> cartList=prDao.findPrCart(ud.getUsername(), "Cart");
		mv.setViewName("UserCart.jsp");
		mv.addObject("cartList", cartList);
		return mv;
	}
	
	@RequestMapping("/DeleteFromCart")
	public ModelAndView DeleteFromCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		UserLoginDetail ud=new UserLoginDetail();
		PurchaseList purList=prDao.findForDelete(request.getParameter("ProdID"), Integer.parseInt(request.getParameter("shoeSize")), ud.getUsername(), "Cart");
		int i=prDao.DeleteFromCart(purList);		
		mv.setViewName("ShopingCart");
		return mv;
	}
	
	@RequestMapping("/CartDetail")
	public ModelAndView CartDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		
		UserLoginDetail ud=new UserLoginDetail();
		
		List<PurchaseList> cartList=prDao.findPrCart(ud.getUsername(), "Cart");
		mv.setViewName("UserCart.jsp");
		mv.addObject("cartList", cartList);
		return mv;
	}
	
	@RequestMapping("/PurDetail")
	public ModelAndView PurDetail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		int TotalProduct=Integer.parseInt(request.getParameter("TotalProduct"));
		PurchaseDetail purDetail=new PurchaseDetail();
		purDetail.setAddress(request.getParameter("DelAddress"));
	for(int i=0;i<TotalProduct;i++) {
		if(i==0) {
			purDetail.setProdID1(request.getParameter("prodID1"));
			purDetail.setBuyQty1(Integer.parseInt(request.getParameter("BuyQty1")));
			purDetail.setSize1(Integer.parseInt(request.getParameter("size1")));
		}
		if(i==1) {
			purDetail.setProdID2(request.getParameter("prodID2"));
			purDetail.setBuyQty2(Integer.parseInt(request.getParameter("BuyQty2")));
			purDetail.setSize2(Integer.parseInt(request.getParameter("size2")));
		}
		if(i==2) {
			purDetail.setProdID3(request.getParameter("prodID3"));
			purDetail.setBuyQty3(Integer.parseInt(request.getParameter("BuyQty3")));
			purDetail.setSize3(Integer.parseInt(request.getParameter("size3")));
		}
		if(i==3) {
			purDetail.setProdID4(request.getParameter("prodID4"));
			purDetail.setBuyQty4(Integer.parseInt(request.getParameter("BuyQty4")));
			purDetail.setSize4(Integer.parseInt(request.getParameter("size4")));
		}
		if(i==4) {
			purDetail.setProdID5(request.getParameter("prodID5"));
			purDetail.setBuyQty5(Integer.parseInt(request.getParameter("BuyQty5")));
			purDetail.setSize5(Integer.parseInt(request.getParameter("size5")));
		}
	}
		
		mv.setViewName("PaymentPage.jsp");
		return mv;
	}
	
	@RequestMapping("/BuyProduct")
	public ModelAndView BuyProduct(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		UserLoginDetail ud=new UserLoginDetail();
		PurchaseDetail purDetail=new PurchaseDetail();
		List<PurchaseList> cart=prDao.findPrCart(ud.getUsername(), "Cart");
		PurchaseList purList=new PurchaseList();
		LocalDate date=LocalDate.now();
		int k=0;
		for(PurchaseList pl:cart) {
			k++;
		}
		List<PurchaseList> SoldList=prDao.findPrCart(ud.getUsername(), "Sold");
		int j=0;
		for(PurchaseList sl:SoldList) {
			j++;
		}
		String OrderID=ud.getUsername()+j;
		for(int i=0;i<k;i++) {
			if(i==0) {
				purList=prDao.prodAvailableInCart(ud.getUsername(), "Cart", purDetail.getProdID1(), purDetail.getSize1());
				purList.setProdQty(purDetail.getBuyQty1());
				purList.setProdDate(date);
				purList.setDelAddress(purDetail.getAddress());
				purList.setProdStatus("Sold");
				purList.setOrderID(OrderID);
				PurchaseList pl=prDao.AddCart(purList);
			}
			if(i==1) {
				purList=prDao.prodAvailableInCart(ud.getUsername(), "Cart", purDetail.getProdID2(), purDetail.getSize2());
				purList.setProdQty(purDetail.getBuyQty2());
				purList.setProdDate(date);
				purList.setDelAddress(purDetail.getAddress());
				purList.setProdStatus("Sold");
				purList.setOrderID(OrderID);
				PurchaseList pl=prDao.AddCart(purList);
			}
			if(i==2) {
				purList=prDao.prodAvailableInCart(ud.getUsername(), "Cart", purDetail.getProdID3(), purDetail.getSize3());
				purList.setProdQty(purDetail.getBuyQty3());
				purList.setProdDate(date);
				purList.setDelAddress(purDetail.getAddress());
				purList.setProdStatus("Sold");
				purList.setOrderID(OrderID);
				PurchaseList pl=prDao.AddCart(purList);
			}
			if(i==3) {
				purList=prDao.prodAvailableInCart(ud.getUsername(), "Cart", purDetail.getProdID4(), purDetail.getSize4());
				purList.setProdQty(purDetail.getBuyQty4());
				purList.setProdDate(date);
				purList.setDelAddress(purDetail.getAddress());
				purList.setProdStatus("Sold");
				purList.setOrderID(OrderID);
				PurchaseList pl=prDao.AddCart(purList);
			}
			if(i==4) {
				purList=prDao.prodAvailableInCart(ud.getUsername(), "Cart", purDetail.getProdID5(), purDetail.getSize5());
				purList.setProdQty(purDetail.getBuyQty5());
				purList.setProdDate(date);
				purList.setDelAddress(purDetail.getAddress());
				purList.setProdStatus("Sold");
				purList.setOrderID(OrderID);
				PurchaseList pl=prDao.AddCart(purList);
			}
		}

		List<PurchaseList> PurList1=prDao.findPurList(ud.getUsername(), OrderID);
		for(PurchaseList puList:PurList1) {
			Product pr1=prDao.findProd(puList.getProdID());
			for(ShoesSize sh:pr1.getShoeSizes()) {
				if(sh.getShoeSize()==puList.getShoeSize()) {
					int stock=sh.getStock()-puList.getProdQty();
					sh.setStock(stock);
				}
			}
			Product prd=prDao.AdShoes(pr1);
		}
		mv.setViewName("UserPurchase.jsp");
		mv.addObject("PurList", PurList1);
		return mv;
	}
	
	@RequestMapping("/UserLogout")
	public ModelAndView UserLogout(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();		
			UserLoginDetail ud=new UserLoginDetail();
			ud.setUname(null);
			ud.setUsername(null);
			mv.setViewName("UserLogin.jsp");
			return mv;
	}
}