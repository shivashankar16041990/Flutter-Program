import 'package:flutter/cupertino.dart';
import 'item.dart';
class SuccessItemWidget extends StatelessWidget{
  final Item? data;
  const SuccessItemWidget(this.data);

  @override
  Widget build(BuildContext context) {
    if (data!=null)
      return Text("id:${data?.id} \n title:${data?.title}");
    else
      return Text("no data received");



  }
}