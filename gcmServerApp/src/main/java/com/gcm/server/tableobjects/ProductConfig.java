package com.gcm.server.tableobjects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="t_product_config")
public class ProductConfig {
     
    @Id
    @Column(name="product_config_id")
    @GeneratedValue
    private Long productConfigId;
    
    @Column(name="app_name")
    private String appName;
    
    private String channel;
    
    private String lang;
     
    @Column(name="tree_code")
    private String treeCode;

	public Long getProductConfigId() {
		return productConfigId;
	}

	public void setProductConfigId(Long productConfigId) {
		this.productConfigId = productConfigId;
	}

	public String getAppName() {
		return appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	public String getChannel() {
		return channel;
	}

	public void setChannel(String channel) {
		this.channel = channel;
	}

	public String getLang() {
		return lang;
	}

	public void setLang(String lang) {
		this.lang = lang;
	}

	public String getTreeCode() {
		return treeCode;
	}

	public void setTreeCode(String treeCode) {
		this.treeCode = treeCode;
	}
 
 }