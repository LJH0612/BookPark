package com.example.spring02.controller.shop;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.board.dto.BoardVO;
import com.example.spring02.model.shop.dto.ProductVO;
import com.example.spring02.service.shop.ProductService;

@Controller
@RequestMapping("shop/product/*")
public class ProductController {
	@Inject
	ProductService productService;
	

	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("shop/productList");
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	
	@RequestMapping("list/0")
	public ModelAndView list0(ModelAndView mav){
		mav.setViewName("/shop/productList");
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	@RequestMapping("list/100")
	public ModelAndView list100(ModelAndView mav){
		String productKind="판타지";
		mav.setViewName("/shop/productList");
		mav.addObject("list", productService.kindProduct(productKind));
		return mav;
	}
	@RequestMapping("list/200")
	public ModelAndView list200( ModelAndView mav){
		String productKind="인문학";
		mav.setViewName("/shop/productList");
		mav.addObject("list", productService.kindProduct(productKind));
		return mav;
	}
	@RequestMapping("list/300")
	public ModelAndView list300(ModelAndView mav){
		String productKind="여행";
		mav.setViewName("/shop/productList");
		mav.addObject("list", productService.kindProduct(productKind));
		return mav;
	}
	

	@RequestMapping("detail/{productId}")
	public ModelAndView detail(@PathVariable("productId") int productId, ModelAndView mav){
		mav.setViewName("/shop/productDetail");
		mav.addObject("vo", productService.detailProduct(productId));
		return mav;
	}
	

	@RequestMapping("write.do")
	public String write(){
		return "/shop/productWrite";
	}
	

	@RequestMapping("insert.do")
	public String insert(ProductVO vo){
		String filename = "";

		if(!vo.getProductPhoto().isEmpty()){
			filename = vo.getProductPhoto().getOriginalFilename();
			// 媛쒕컻�뵒�젆�넗由� - �뙆�씪 �뾽濡쒕뱶 寃쎈줈
			//String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images"; //
			// 諛고룷�뵒�젆�넗由� - �뙆�씪 �뾽濡쒕뱶 寃쎈줈
			String path = "D:\\1804100289\\주작\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
			try {
				new File(path).mkdirs(); // �뵒�젆�넗由� �깮�꽦
				// �엫�떆�뵒�젆�넗由�(�꽌踰�)�뿉 ���옣�맂 �뙆�씪�쓣 吏��젙�맂 �뵒�젆�넗由щ줈 �쟾�넚
				vo.getProductPhoto().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setProductUrl(filename);
			productService.insertProduct(vo);
		}
		return "redirect:/shop/product/list.do";
	}
	
	// 5. �긽�뭹 �닔�젙(�렪吏�) �럹�씠吏� 留ㅽ븨
	@RequestMapping("edit/{productId}")
	public ModelAndView edit(@PathVariable("productId") int productId, ModelAndView mav){
		mav.setViewName("/shop/productEdit");
		mav.addObject("vo", productService.detailProduct(productId));
		return mav;
	}
	
	// 6. �긽�뭹 �닔�젙(�렪吏�) 泥섎━ 留ㅽ븨
	@RequestMapping("update.do")
	public String update(ProductVO vo){
		String filename = "";
		// 泥⑤��뙆�씪(�긽�뭹�궗吏�)�씠 蹂�寃쎈릺硫�
		if(!vo.getProductPhoto().isEmpty()){
			filename = vo.getProductPhoto().getOriginalFilename();
			// 媛쒕컻�뵒�젆�넗由� - �뙆�씪 �뾽濡쒕뱶 寃쎈줈
			//String path = "C:\\Users\\doubles\\Desktop\\workspace\\gitSpring\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images"; //
			// 諛고룷�뵒�젆�넗由� - �뙆�씪 �뾽濡쒕뱶 寃쎈줈
			String path = "D:\\1804100289\\주작\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
			try {
				new File(path).mkdirs(); // �뵒�젆�넗由� �깮�꽦
				// �엫�떆�뵒�젆�넗由�(�꽌踰�)�뿉 ���옣�맂 �뙆�씪�쓣 吏��젙�맂 �뵒�젆�넗由щ줈 �쟾�넚
				vo.getProductPhoto().transferTo(new File(path+filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setProductUrl(filename);
		// 泥⑤��뙆�씪�씠 蹂�寃쎈릺吏� �븡�쑝硫�
		} else {
			// 湲곗〈�쓽 �뙆�씪紐�
			ProductVO vo2 = productService.detailProduct(vo.getProductId());
			vo.setProductUrl(vo2.getProductUrl());
		}
		productService.updateProduct(vo);
		return "redirect:/shop/product/list.do";
	}
	
	// 7. �긽�뭹 �궘�젣 泥섎━ 留ㅽ븨
	@RequestMapping("delete.do")
	public String delete(@RequestParam int productId){
		// �긽�뭹 �씠誘몄� �젙蹂�
		String filename = productService.fileInfo(productId);
		String path = "D:\\1804100289\\주작\\spring02\\src\\main\\webapp\\WEB-INF\\views\\images\\";
		// �긽�뭹 �씠誘몄� �궘�젣
		if(filename != null){
			File file = new File(path+filename);
			// �뙆�씪�씠 議댁옱�븯硫�
			if (file.exists()){ 
				file.delete(); // �뙆�씪 �궘�젣
			}
		}
		// �젅肄붾뱶 �궘�젣
		productService.deleteProduct(productId);
		
		
		return "redirect:/shop/product/list.do";
	}
	
	@RequestMapping("serch.do")
	public ModelAndView serchlist(@RequestParam String keyword){
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", keyword);
		mav.addObject("list", productService.serchInfo(keyword));
		mav.setViewName("/shop/productList");
		return mav;
	}
}	

