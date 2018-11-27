import 'package:flutter_work2/redux/counter/countr_actions.dart';

int counterReducer(int counter,action) {
  if(action is IncrementAction){
    return counter + 1;
  }
  return counter;
}