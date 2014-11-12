package com.gcm.server.tableobjects;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

@Entity
@Table(name="t_products")
//@Cache(usage=CacheConcurrencyStrategy.READ_ONLY)
public class Product {
     
    @Id
    @Column(name="product_id")
    @GeneratedValue
    private Long productId;
     
    @Column(name="product_name")
    private String productName;
     
    @ManyToOne(cascade={CascadeType.ALL})
    @JoinColumn(name="parent_product_id")
    private Product product;
    
    @Column(name="tree_code")
    private String treeCode;
    
    @Column(name="display_order")
    private Integer displayOrder;
    
    @Column(name="product_code")
    private String productCode;

	@OneToMany(mappedBy="product")
    private Set<Product> subProducts = new HashSet<Product>();
 
    public Product() {
    }
 
    public Product(String productName) {
        this.productName = productName;        
    }
    
    //Getter and Setter methods
    
	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}
	
   public Integer getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(Integer displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getTreeCode() {
		return treeCode;
	}

	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Set<Product> getSubProducts() {
		return subProducts;
	}

	public void setSubProducts(Set<Product> subProducts) {
		this.subProducts = subProducts;
	}
}