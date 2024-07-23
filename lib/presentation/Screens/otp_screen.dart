// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_maps/constants/my_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final phoneNumber = '';

  Widget _buildIntroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Verify Your Phone Number ',
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 2),
          child: RichText(
            text: TextSpan(
              text: 'Enter Your 6 Digit Code Numbers Sent To You At ',
              style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: 18,
                height: 1.4,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: '$phoneNumber',
                    style: GoogleFonts.roboto(
                      color: MyColors.blue,
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 6,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 40,
            borderWidth: 1,
            activeColor: MyColors.blue,
            inactiveColor: MyColors.blue,
            inactiveFillColor: Colors.white,
            activeFillColor: MyColors.lightBlue,
            selectedColor: MyColors.blue,
            selectedFillColor: Colors.white),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          //otpCode = code;
          print('Completed');
        },
        onChanged: (value) {
          print(value);
        },
      ),
    );
  }

  Widget _buildVrifyButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: Size(110, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        child: Text(
          'Verify',
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 32, vertical: 88),
          child: Column(
            children: [
              _buildIntroText(),
              SizedBox(height: 80),
              _buildPinCodeFields(context),
              SizedBox(height: 60),
              _buildVrifyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
