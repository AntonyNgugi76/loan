import 'package:flutter/cupertino.dart';

class CheckLoan extends ChangeNotifier{
  late final bool? hasExistingLoan;
  void setHasLoan(bool loanstat){
    hasExistingLoan=loanstat;
    notifyListeners();
}
// void hasNoLoan(){
//     hasExistingLoan= false;
//     notifyListeners();
// }

}