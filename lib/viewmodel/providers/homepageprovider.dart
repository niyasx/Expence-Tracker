

import 'package:flutter/material.dart';
class Homepageprovider with ChangeNotifier{


  Homepageprovider(){
  }

  String  month='';

  void monthpro(String aa){
    month=aa;
    notifyListeners();
  }


  
  //what is provider ? provider is a statemanaging tool in flutter in which we extends its class changenotifier into our
  //specific class which we are going to use as our provider class and the extended class change notifier has a methode 
  //called notifylisteners which pass this information of the changed state to its listners.   

}