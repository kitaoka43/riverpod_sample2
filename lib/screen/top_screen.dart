import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample2/constants.dart';
import 'package:riverpod_sample2/state/count_state.dart';
import 'package:riverpod_sample2/view_model/top_view_model.dart';
import 'package:intl/intl.dart';


class TopScreen extends ConsumerWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countData = ref.watch(countProvider);
    final countList = ref.watch(countListProvider);
    final vm = TopVm();
    vm.setRef(ref);

    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(titleProvider)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                ref.watch(subtitleProvider),
              ),
              Text(
                '${countData.count}',
                style: Theme.of(context).textTheme.headline4,
              ),
              Text(
                '${DateFormat('yyyy/HH:mm:ss').format(countData.createdAt)}',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: countList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.lightBlueAccent,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text('${countList[index].count}', style: TextStyle(fontSize: 25),),
                              SizedBox(width: 30,),
                              Text('${DateFormat('yyyy/HH:mm:ss').format(countList[index].createdAt)}'),
                            ],
                          ),
                        );
                      }),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          vm.countUp(countData);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
