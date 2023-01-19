import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class KeyValue extends HookWidget {
  final String keyy ;
  final String valuee ;
  const KeyValue({Key? key,required this.keyy,required this.valuee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).orientation == Orientation.landscape ? MediaQuery.of(context).size.width * 0.45 : MediaQuery.of(context).size.width - 33,
      child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 4,
            child: Text(keyy,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
          ),

          Expanded(flex: 8,
            child: Text(valuee,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
