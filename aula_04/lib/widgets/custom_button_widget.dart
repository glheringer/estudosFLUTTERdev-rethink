import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? size;
  final bool disable;

  const CustomButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.disable = false, 
    this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) return Colors.red;
          if (states.contains(MaterialState.pressed)) return Colors.lightBlue;
          return Colors.cyan;
        }),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        // textStyle: MaterialStateProperty.resolveWith((states){
        //      if (states.contains(MaterialState.pressed)) {
        //       return TextStyle(
        //         fontSize: size != null ? size! * 2 : 28
        //       );
        //     }
        //      return null;
        // })
      ),
    );
  }
}
