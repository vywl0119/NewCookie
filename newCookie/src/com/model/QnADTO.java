package com.model;

public class QnADTO {
   
   private int number;
   private String main;
   private String sub;
   public int getNumber() {
      return number;
   }
   public void setNumber(int number) {
      this.number = number;
   }
   public String getMain() {
      return main;
   }
   public void setMain(String main) {
      this.main = main;
   }
   public String getSub() {
      return sub;
   }
   public void setSub(String sub) {
      this.sub = sub;
   }
   public QnADTO(int number, String main, String sub) {
      super();
      this.number = number;
      this.main = main;
      this.sub = sub;
   }

   
   
}