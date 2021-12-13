
import 'package:flutter/material.dart';

class Help extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body: Text(
        '''Help Section.... ''',style: Theme.of(context).textTheme.headline3!.copyWith(color:Colors.green),
      ),
    );
  }
}