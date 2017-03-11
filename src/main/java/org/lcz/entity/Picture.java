package org.lcz.entity;


public class Picture{


	private String id;
	private User user;
	private String name;
	private String fname;
	private String intro;
	private String tags;
	private String url;
	private String uploadTime;
	private Integer clickNum;


	public Picture() {
	}

	public Picture(String id, User user) {
		this.id = id;
		this.user = user;
	}
  
	public Picture(String id, User user, String name, String fname, String intro, String tags, String url,
			String uploadTime, Integer clickNum) {
		super();
		this.id = id;
		this.user = user;
		this.name = name;
		this.fname = fname;
		this.intro = intro;
		this.tags = tags;
		this.url = url;
		this.uploadTime = uploadTime;
		this.clickNum = clickNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUploadTime() {
		return uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getClickNum() {
		return clickNum;
	}

	public void setClickNum(Integer clickNum) {
		this.clickNum = clickNum;
	}

	@Override
	public String toString() {
		return "Picture [id=" + id + ", user=" + user + ", name=" + name + ", fname=" + fname + ", intro=" + intro
				+ ", tags=" + tags + ", url=" + url + ", uploadTime=" + uploadTime + ", clickNum=" + clickNum + "]";
	}
	
}