import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample2/state/count_state.dart';
import 'dart:async';

import '../model/count_data.dart';

class TopVm {
  late WidgetRef ref;

  void setRef(WidgetRef ref){
    this.ref = ref;
    Timer.periodic(const Duration(seconds: 1 ), onTimer);
  }

  void countUp(CountData countData){
    final result = CountData(count: countData.count + 1, createdAt: DateTime.now());
    ref.watch(countProvider.notifier).state = result;
    List<CountData> list = ref.watch(countListProvider);
    list.add(result);
  }

  void onTimer(Timer timer){
    CountData countData = ref.watch(countProvider);
    ref.watch(countProvider.notifier).state = CountData(count: countData.count, createdAt: DateTime.now());
  }
}