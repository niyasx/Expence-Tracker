import 'package:shared_preferences/shared_preferences.dart';

class MainBoard {
  int finalincome = 0;
  int finalexpense = 0;
  int mainbalance = 0;

//function for to sum up  mainbalance and income
// here we set shared preference value and gets it here and its called in the homepage which we display the values.
  void incomecarrier(int incomecarrierValue) async {
    final prefs = await SharedPreferences.getInstance();
    finalincome = (prefs.getInt('finalincome') ?? 0) + incomecarrierValue;
    await prefs.setInt('finalincome', finalincome);
    mainbalance = (prefs.getInt('mainbalance') ?? 0) + incomecarrierValue;
    await prefs.setInt('mainbalance', mainbalance);

  }

  
//function for to substract  expence and mainbalance 

  void expensecarrier(int expencecarrierValue) async {
    final prefs = await SharedPreferences.getInstance();
    finalexpense = (prefs.getInt('finalexpence') ?? 0) + expencecarrierValue;
    await prefs.setInt('finalexpence', finalexpense);
    mainbalance = (prefs.getInt('mainbalance') ?? 0) - expencecarrierValue;
    await prefs.setInt('mainbalance', mainbalance);
  }

  

}
