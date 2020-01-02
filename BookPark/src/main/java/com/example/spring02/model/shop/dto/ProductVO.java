package com.example.spring02.model.shop.dto;

import org.springframework.web.multipart.MultipartFile;

public class ProductVO {
	private int productId; // �긽�뭹踰덊샇
	private String productName; // �긽�뭹�씠由�
	private int productPrice; // �긽�뭹媛�寃�
	private String productDesc; // �긽�뭹 �긽�꽭�젙蹂�
	private String productUrl; // �긽�뭹�씠誘몄� 寃쎈줈
	private MultipartFile productPhoto; // �긽�뭹�씠誘몄��뙆�씪
	private String productKind;
	public String getProductKind() {
		return productKind;
	}
	public void setProductKind(String productKind) {
		this.productKind = productKind;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public String getProductDesc() {
		return productDesc;
	}
	public void setProductDesc(String productDesc) {
		this.productDesc = productDesc;
	}
	public String getProductUrl() {
		return productUrl;
	}
	public void setProductUrl(String productUrl) {
		this.productUrl = productUrl;
	}
	public MultipartFile getProductPhoto() {
		return productPhoto;
	}
	public void setProductPhoto(MultipartFile productPhoto) {
		this.productPhoto = productPhoto;
	}
	@Override
	public String toString() {
		return "ProductVO [productId=" + productId + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", productDesc=" + productDesc + ", productUrl=" + productUrl + ", productPhoto=" + productPhoto
				+ "]";
	}
	
}
