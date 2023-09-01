import 'package:flutter/material.dart';

class AppBorders {
  AppBorders._();

  static Border get genderContainerBorderStyle =>
      Border.all(width: 2, color: Colors.green);
      
      static  OutlineInputBorder generalOutlineInputBorder(Color color){
        return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide:  BorderSide(
          color: color,
          width: 1.5
        )
      );}
      
      static  OutlineInputBorder searchOutlineInputBorder(Color color){
        return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:  BorderSide(
          color: color,
          width: 1.5
        )
      );}

  


}
