import 'package:exploring_http_package/request%20base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'request base.dart';
import 'item.dart';
import 'error widget.dart';
import 'success widget.dart';
class HttpWidget extends StatefulWidget{
  final HTTPRequest<Item> _request;
  const HttpWidget(this._request);

  @override
  State<StatefulWidget> createState() {
    return HttpWidgetState();
  }

}

class HttpWidgetState extends State<HttpWidget>{
  late final Future<Item> futureItem;
  @override
  void initState(){

    super.initState();
    futureItem=widget._request.execute();


  }


  @override
  Widget build(BuildContext context) {


    return FutureBuilder<Item>(future:futureItem,
    builder: (context,snapshot){
      if(snapshot.hasError)
        {
          return const ErrorItemWidget();
        }
      if (snapshot.hasData){
        return SuccessItemWidget(snapshot.data);
                   }
      return const Center (child:CircularProgressIndicator());



    }


    );
  }
}