import 'package:flutter_work2/redux/app_state.dart';
import 'package:flutter_work2/redux/counter/counter_reducer.dart';

AppState appReducer(AppState state  , action) {
  return AppState(count : counterReducer(state.count, action));
}