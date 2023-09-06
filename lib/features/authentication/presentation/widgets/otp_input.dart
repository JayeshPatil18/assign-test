import 'package:assign/features/authentication/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/colors.dart';

class OtpInput extends StatelessWidget {
  static int count = 0;

  final TextEditingController controller;
  final bool autoFocus;
  OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        cursorColor: AppColors.secondaryColor,
        maxLength: 1,
        decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(
                          width: 1, color: AppColors.secondaryColor)
            ),
             focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                          width: 1, color: AppColors.secondaryColor)
            ),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1 && isNumericUsingRegularExpression(value)) {
            count++;
            if (count == 6) {
              BlocProvider.of<AuthBloc>(context).add(
                        CodeValidEvent());
            }
            FocusScope.of(context).nextFocus();
          } else if(value.length == 0){
            count--;
          }
        },
      ),
    );
  }

  
bool isNumericUsingRegularExpression(String string) {
  // Null or empty string is not a number
  if (string == null || string.isEmpty) {
    return false;
  }

  // Try to parse input string to number. 
  // Both integer and double work.
  // Use int.tryParse if you want to check integer only.
  // Use double.tryParse if you want to check double only.
  final number = num.tryParse(string);

  if (number == null) {
    return false;
  }

  return true;
}
}