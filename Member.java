package vo;

import java.sql.Date;
import java.util.List;

public class Member {

	/*
	 * MEMBER_ID VARCHAR2(20 BYTE) No MEMBER_PWD VARCHAR2(30 BYTE) No NAME
	 * VARCHAR2(15 BYTE) No BIRTHDAY DATE Yes NICKNAME VARCHAR2(30 BYTE) No
	 * PHONE_NUM VARCHAR2(11 BYTE) No BALANCE NUMBER(7,0) Yes PROFILE_IMG
	 * VARCHAR2(100 BYTE) Yes STATUS_MESSAGE VARCHAR2(100 BYTE) Yes STATUS
	 * NUMBER(1,0) Yes
	 */

	// 인증모아보기
	// 카테고리로 검색가능 이름으로도 검색가능 챌린지 이름으로도 검색가능
//   public Category category;
//   public Together_Info together_info;
//   public Photo_Shoot photo_shoot;

	private String mem_id; // 아이디
	private String mem_pwd; // 비밀번호
	private String mem_name; // 이름
	private Date mem_birthday; // 생년월일
	private String mem_nickname; // 별명
	private String mem_phone_num; // 휴대폰번호
	private int mem_balance; // 포인트
	private String mem_profile_img; // 프로필 사진
	private String mem_status_message; // 상태 메세지
	private int mem_status; // 상태
	
	

	public Member(String mem_id, String mem_pwd, String mem_name, Date mem_birthday, String mem_nickname,
			String mem_phonme_num, int mem_balance, String mem_profile_img, String mem_status_message, int mem_status) {
		super();
		this.mem_id = mem_id;
		this.mem_pwd = mem_pwd;
		this.mem_name = mem_name;
		this.mem_birthday = mem_birthday;
		this.mem_nickname = mem_nickname;
		this.mem_phonme_num = mem_phonme_num;
		this.mem_balance = mem_balance;
		this.mem_profile_img = mem_profile_img;
		this.mem_status_message = mem_status_message;
		this.mem_status = mem_status;
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pwd() {
		return mem_pwd;
	}

	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public Date getMem_birthday() {
		return mem_birthday;
	}

	public void setMem_birthday(Date mem_birthday) {
		this.mem_birthday = mem_birthday;
	}

	public String getMem_nickname() {
		return mem_nickname;
	}

	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}

	public String getMem_phonme_num() {
		return mem_phonme_num;
	}

	public void setMem_phonme_num(String mem_phonme_num) {
		this.mem_phonme_num = mem_phonme_num;
	}

	public int getMem_balance() {
		return mem_balance;
	}

	public void setMem_balance(int mem_balance) {
		this.mem_balance = mem_balance;
	}

	public String getMem_profile_img() {
		return mem_profile_img;
	}

	public void setMem_profile_img(String mem_profile_img) {
		this.mem_profile_img = mem_profile_img;
	}

	public String getMem_status_message() {
		return mem_status_message;
	}

	public void setMem_status_message(String mem_status_message) {
		this.mem_status_message = mem_status_message;
	}

	public int getMem_status() {
		return mem_status;
	}

	public void setMem_status(int mem_status) {
		this.mem_status = mem_status;
	}

}