package com.model;

public class MemberDTO {
   private String m_id;
   private String m_pw;
   private String name;
   private String nickname;
   private String birth;
   private String gender;
   private String email;
   
   
   public MemberDTO(String m_id, String m_pw, String name, String nickname, String birth, String gender, String email) {

      this.m_id = m_id;
      this.m_pw = m_pw;
      this.name = name;
      this.nickname = nickname;
      this.birth = birth;
      this.gender = gender;
      this.email = email;
   }


	public MemberDTO(String m_id, String nickname) {

		this.m_id = m_id;	
		this.nickname = nickname;

	}
   
   public String getM_id() {
      return m_id;
   }



   public void setM_id(String m_id) {
      this.m_id = m_id;
   }


   public String getM_pw() {
      return m_pw;
   }


   public void setM_pw(String m_pw) {
      this.m_pw = m_pw;
   }


   public String getName() {
      return name;
   }

   

   public void setName(String name) {
      this.name = name;
   }


   public String getNickname() {
      return nickname;
   }


   public void setNickname(String nickname) {
      this.nickname = nickname;
   }


   public String getBirth() {
      return birth;
   }


   public void setBirth(String birth) {
      this.birth = birth;
   }


   public String getGender() {
      return gender;
   }


   public void setGender(String gender) {
      this.gender = gender;
   }


   public String getEmail() {
      return email;
   }


   public void setEmail(String email) {
      this.email = email;
   }
   
   
}