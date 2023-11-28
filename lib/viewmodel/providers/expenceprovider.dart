

import 'package:flutter/foundation.dart';

class ExpenceProvider with ChangeNotifier{

  String defualtcat = '';
  String defaultdis='';
  String defaultpay='';
  String defaultattach='';
  bool isSwitched=false;


 void categorypro(String categoryvalue){
  defualtcat = categoryvalue;
  notifyListeners();
 }

 void discriptionpro(String discriptionvalue){
  defaultdis= discriptionvalue;
  notifyListeners();
 }

 void paymentpro(String paymentvalue){
  defaultpay = paymentvalue;
  notifyListeners();
 }
  void attachmentpro(String attachmentvalue){
  defaultattach = attachmentvalue;
  notifyListeners();
 }
  void switchpro(){
  isSwitched=!isSwitched;
  notifyListeners();
 }

}