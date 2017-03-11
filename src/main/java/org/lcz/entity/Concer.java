package org.lcz.entity;



public class Concer {


	private String id;
	private User userByConcernerId;
	private User userByConcernedId;
	private String concernTime;


	public Concer() {
	}

	public Concer(String id, User userByConcernerId, User userByConcernedId) {
		this.id = id;
		this.userByConcernerId = userByConcernerId;
		this.userByConcernedId = userByConcernedId;
	}

	public Concer(String id, User userByConcernerId, User userByConcernedId,
			String concernTime) {
		this.id = id;
		this.userByConcernerId = userByConcernerId;
		this.userByConcernedId = userByConcernedId;
		this.concernTime = concernTime;
	}


	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public User getUserByConcernerId() {
		return this.userByConcernerId;
	}

	public void setUserByConcernerId(User userByConcernerId) {
		this.userByConcernerId = userByConcernerId;
	}

	public User getUserByConcernedId() {
		return this.userByConcernedId;
	}

	public void setUserByConcernedId(User userByConcernedId) {
		this.userByConcernedId = userByConcernedId;
	}

	public String getConcernTime() {
		return this.concernTime;
	}

	public void setConcernTime(String concernTime) {
		this.concernTime = concernTime;
	}

}