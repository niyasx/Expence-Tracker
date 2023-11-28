import 'package:expense_tracker/view/Pages/income.dart';
import 'package:expense_tracker/viewmodel/Functions/function.dart';
import 'package:expense_tracker/viewmodel/providers/incomeprovider.dart';
import 'package:flutter/material.dart';

class HistoryList extends StatefulWidget {
  const HistoryList({super.key});

  @override
  State<HistoryList> createState() => _HistoryListState();
}

class _HistoryListState extends State<HistoryList> {
  Income incomeobj = Income(mainBoard: MainBoard());

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
    valueListenable: recentListNotifier,
    builder: (context, recentlist, child) {
      return ListView.separated(
        itemCount: recentlist.length,
          itemBuilder: (context, index) {
            // final data=recentlist[index]; 
            return ListTile(
              leading: Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                child: Image.asset(
                    'assets/image/${IncomeProvider().defualtcat}.png'),
              ),
              title: Text(IncomeProvider().defualtcat),
              // subtitle: Text(incomeobj.discriptionController.text),
              // trailing: Text(incomeobj.incomeController.text),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
         ); 
    }, 
    );
  }
}



ValueNotifier<List<RecentHistory>> recentListNotifier = ValueNotifier([]);

void addHistory(RecentHistory value) {
  value.time = DateTime.now(); // Add the current timestamp
  recentListNotifier.value.add(value);
  // recentListNotifier.notifyListeners();
}



class RecentHistory {
  final TextEditingController amount;
  final String category;
  final String description;
  DateTime time;

  RecentHistory({
    required this.amount,
    required this.category,
    required this.description,
    required this.time, required String discription, required String payment,
  });
}