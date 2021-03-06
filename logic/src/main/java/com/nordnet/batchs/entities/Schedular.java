package com.nordnet.batchs.entities;

import static javax.persistence.GenerationType.IDENTITY;

// Generated 24 mars 2017 10:30:00 by Hibernate Tools 3.4.0.CR1

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Schedular generated by hbm2java
 */
@Entity
@Table(name = "schedular")
public class Schedular implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Bean bean;
	private String name;
	private String method;
	private String cron;

	public Schedular() {
	}

	public Schedular(String name, String method, String cron) {
		this.name = name;
		this.method = method;
		this.cron = cron;
	}

	public Schedular(Bean bean, String name, String method, String cron) {
		this.bean = bean;
		this.name = name;
		this.method = method;
		this.cron = cron;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bean_id")
	public Bean getBean() {
		return this.bean;
	}

	public void setBean(Bean bean) {
		this.bean = bean;
	}

	@Column(name = "name", nullable = false, length = 45)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "method", nullable = false, length = 45)
	public String getMethod() {
		return this.method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	@Column(name = "cron", nullable = false)
	public String getCron() {
		return this.cron;
	}

	public void setCron(String cron) {
		this.cron = cron;
	}

}
