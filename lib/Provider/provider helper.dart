
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Exports/exports.dart';
 final scrollProvider= ChangeNotifierProvider((ref)=>Topscroll());
class Topscroll extends ChangeNotifier{
    ScrollController scrollController = ScrollController();
  void scrolled(){
  scrollController.jumpTo(0);
  print('called');
  notifyListeners();
    }
}