import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;

   return Scaffold(
     backgroundColor: Colors.teal.shade50,
      body: Center(
        child: ElevatedButton(
          onPressed: (){
          },
          child: Text('Button'),
        )
      )
   );
  }
}