package org.lcz.entity;

import java.util.HashSet;
import java.util.Set;


public class User {


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String username;
	private String password;
	private String name;
	private String intro;
	private String gender;
	private String province;
	private String city;
	private String registTime;
	private String type;
	private String email;
	private String mobile;
	private String qq;
	private Integer status;
	private Set concersForConcernedId = new HashSet(0);
	private Set pictures = new HashSet(0);
	private Set concersForConcernerId = new HashSet(0);


	public User() {
	}

	public User(String id) {
		this.id = id;
	}

	public User(String id, String username, String password, String name, String intro, String gender, String province,
			String city, String registTime, String type, String email, String mobile, String qq, Integer status,
			Set concersForConcernedId, Set pictures, Set concersForConcernerId) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.intro = intro;
		this.gender = gender;
		this.province = province;
		this.city = city;
		this.registTime = registTime;
		this.type = type;
		this.email = email;
		this.mobile = mobile;
		this.qq = qq;
		this.status = status;
		this.concersForConcernedId = concersForConcernedId;
		this.pictures = pictures;
		this.concersForConcernerId = concersForConcernerId;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntro() {
		return this.intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getProvince() {
		return this.province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegistTime() {
		return this.registTime;
	}

	public void setRegistTime(String registTime) {
		this.registTime = registTime;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getQq() {
		return this.qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getConcersForConcernedId() {
		return this.concersForConcernedId;
	}

	public void setConcersForConcernedId(Set concersForConcernedId) {
		this.concersForConcernedId = concersForConcernedId;
	}

	public Set getPictures() {
		return this.pictures;
	}

	public void setPictures(Set pictures) {
		this.pictures = pictures;
	}

	public Set getConcersForConcernerId() {
		return this.concersForConcernerId;
	}

	public void setConcersForConcernerId(Set concersForConcernerId) {
		this.concersForConcernerId = concersForConcernerId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", name=" + name + ", intro="
				+ intro + ", gender=" + gender + ", province=" + province + ", city=" + city + ", registTime="
				+ registTime + ", type=" + type + ", email=" + email + ", mobile=" + mobile + ", qq=" + qq
				+ ", status=" + status + ", concersForConcernedId=" + concersForConcernedId + ", pictures=" + pictures
				+ ", concersForConcernerId=" + concersForConcernerId + "]";
	}
   
}