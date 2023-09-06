import 'package:assign/constants/colors.dart';
import 'package:assign/features/authentication/presentation/pages/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../constants/font.dart';
import '../bloc/auth_bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String phoneNo = '';
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text('Login to continue', style: AppFonts.mainFont()),
              SizedBox(height: 20),
              Text(
                  'Add your phone number we\'ll send you a verificdation code so we know you\'re real',
                  style: AppFonts.subFont(),
                  textAlign: TextAlign.center),
              SizedBox(height: 30),
              IntlPhoneField(
                controller: _phoneController,
                onChanged: (phone) {
                  if (phone.number.toString().length == 10 &&
                      isNumericUsingRegularExpression(phone.number.toString())) {
                    BlocProvider.of<AuthBloc>(context).add(
                        PhoneNoValidEvent(phoneNo: phone.completeNumber));
                  } else{
                    BlocProvider.of<AuthBloc>(context).add(
                        PhoneNoInValidEvent());
                  }
                  phoneNo = phone.completeNumber;
                },
                decoration: InputDecoration(
                  labelText: 'Enter Phone Number',
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          width: 1, color: AppColors.secondaryColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(
                          width: 1, color: AppColors.secondaryColor)),
                ),
                initialCountryCode: 'IN',
              ),
              SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  
                },
                builder: (context, state) {
                  if (state is PhoneNoValidState) {
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    OTPVerifiy(phoneNo: phoneNo)));
                          },
                          child: Text(
                            'SEND VERIFICATION CODE',
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
                          'SEND VERIFICATION CODE',
                          style: TextStyle(color: AppColors.primaryColor),
                        )),
                  );
                },
              )
            ],
          ),
        ),
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
