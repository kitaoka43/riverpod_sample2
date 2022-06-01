import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample2/model/count_data.dart';

final countProvider =
    StateProvider((ref) => CountData(count: 0, createdAt: DateTime.now()));
final countListProvider = StateProvider((ref) {
  CountData countData = CountData(count: 0, createdAt: DateTime.now());
  List<CountData> list = [countData];
  return list;
});
