package com.example.spring02.model.shop.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.shop.dto.ProductVO;


@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	SqlSession sqlSession;
	

	@Override
	public List<ProductVO> listProduct() {
		return sqlSession.selectList("product.listProduct");
	}
	
	@Override
	public ProductVO detailProduct(int productId) {
		return sqlSession.selectOne("product.detailProduct", productId);
	}
	
	@Override
	public void updateProduct(ProductVO vo) {
		sqlSession.update("product.updateProduct", vo);

	}
	
	@Override
	public void deleteProduct(int productId) {
		sqlSession.delete("product.deleteProduct", productId);
	}
	
	@Override
	public void insertProduct(ProductVO vo) {
		sqlSession.insert("product.insertProduct", vo);
	}
	
	@Override
	public String fileInfo(int productId) {
		return sqlSession.selectOne("product.fileInfo",productId);
	}
	
	@Override
	public List<ProductVO> serchInfo(String keyword) {
		return sqlSession.selectList("product.serchInfo", keyword);
	}
	
	@Override
	public List<ProductVO> kindProduct(String productKind){
		return sqlSession.selectList("product.kindProduct", productKind);			
	}

}
