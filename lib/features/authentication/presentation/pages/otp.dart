import 'package:assign/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../constants/font.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../widgets/otp_input.dart';

class OTPVerifiy extends StatefulWidget {
  final String phoneNo;
  const OTPVerifiy({super.key, required this.phoneNo});

  @override
  State<OTPVerifiy> createState() => _OTPVerifiyState();
}

class _OTPVerifiyState extends State<OTPVerifiy> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  final TextEditingController _fieldFive = TextEditingController();
  final TextEditingController _fieldSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image.asset('assets/images/banner.png'),
                ),
                SizedBox(
                  height: 50,
                ),
                Text('OTP Verification', style: AppFonts.mainFont()),
                SizedBox(height: 20),
                Text(
                    'Enter the OTP sent to ' + widget.phoneNo,
                    style: AppFonts.subFont(),
                    textAlign: TextAlign.center),
                SizedBox(height: 30),
                Container(
                  height: 50,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      OtpInput(_fieldOne, true), // auto focus
                      OtpInput(_fieldTwo, false),
                      OtpInput(_fieldThree, false),
                      OtpInput(_fieldFour, false),
                      OtpInput(_fieldFive, true), // auto focus
                      OtpInput(_fieldSix, false),
                    ]),
                  ),
                ),
                SizedBox(height: 20),
                BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    // if ( _fieldOne.text.length == 1 && _fieldTwo.text.length == 1 && _fieldThree.text.length == 1 && _fieldFour.text.length == 1 && _fieldFive.text.length == 1 && _fieldSix.text.length == 1) {
                    //   BlocProvider.of<AuthBloc>(context).add(
                    //       CodeValidEvent());
                    // }
                  },
                  builder: (context, state) {
                    if (state is CodeValidState) {
                      return SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: AppColors.secondaryColor,
                              padding: EdgeInsets.all(20),
                              side: BorderSide(
                                color: Colors.transparent, // Border color
                                width: 0.0, // Border width
                              ),
                            ),
                            onPressed: () {
                              
                            },
                            child: Text(
                              'CONTINUE',
                              style: TextStyle(color: AppColors.primaryColor),
                            )),
                      );
                    }
                    
                    return SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: AppColors.secondaryLighter,
                            padding: EdgeInsets.all(20),
                            side: BorderSide(
                              color: Colors.transparent, // Border color
                              width: 0.0, // Border width
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'CONTINUE',
                            style: TextStyle(color: AppColors.primaryColor),
                          )),
                    );
                  },
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Didn\'t receive code?  ',
                        style: AppFonts.subFont(),
                        textAlign: TextAlign.center),
    
                        Text(
                        'Resend Code',
                        style: AppFonts.subColorFont(),
                        textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}