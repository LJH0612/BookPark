package com.example.spring02.model.shop.dao;

import java.util.List;

import com.example.spring02.model.shop.dto.ProductVO;

public interface ProductDAO {
	
	public List<ProductVO> listProduct();
	
	public ProductVO detailProduct(int productId);
	
	public void updateProduct(ProductVO vo);
	
	public void deleteProduct(int productId);
	
	public void insertProduct(ProductVO vo);
	
	public String fileInfo(int productId);
	
	public List<ProductVO> serchInfo(String keyword);
	
	public List<ProductVO> kindProduct(String productKind);
	
}
