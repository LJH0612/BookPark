package com.example.spring02.service.shop;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring02.model.shop.dao.ProductDAO;
import com.example.spring02.model.shop.dto.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;
	
	// 01. �긽�뭹紐⑸줉
	@Override
	public List<ProductVO> listProduct(){
		return productDao.listProduct();
	}
	// 02. �긽�뭹�긽�꽭
	@Override
	public ProductVO detailProduct(int productId) {
		return productDao.detailProduct(productId);
	}
	// 03. �긽�뭹�닔�젙
	@Override
	public void updateProduct(ProductVO vo) {
		productDao.updateProduct(vo);
	}
	// 04. �긽�뭹�궘�젣
	@Override
	public void deleteProduct(int productId) {
		productDao.deleteProduct(productId);
	}
	// 05. �긽�뭹異붽�
	@Override
	public void insertProduct(ProductVO vo) {
		productDao.insertProduct(vo);	
	}
	// 06. �긽�뭹�씠誘몄� �궘�젣瑜� �쐞�븳 �씠誘몄��뙆�씪 �젙蹂�
	@Override
	public String fileInfo(int productId) {
		return productDao.fileInfo(productId);
	}
	
	@Override
	public List<ProductVO>serchInfo(String keyword) {
		return productDao.serchInfo(keyword);
	}
	
	@Override
	public List<ProductVO> kindProduct(String productKind) {
		return productDao.kindProduct(productKind);
	}

}
