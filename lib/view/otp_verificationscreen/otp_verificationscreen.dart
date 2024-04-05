// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';

import 'package:total_x_test/view/homepage/homescreen.dart';

class Otp_verificationscreen extends StatelessWidget {
  const Otp_verificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 140,
                width: 140,
                child: Image.asset("assets/images/otpicon.png"),
              ),
              SizedBox(
                height: 17,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: Text(
                      "OTP Verification",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter the verification code we just sent to your number +91 *******21.",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Center(
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Container(
                                  height: 40,
                                  width: 50,
                                  color: Colors.white,
                                  child: TextFormField(
                                      minLines: 1,
                                      //maxLength: 1,
                                      maxLines: 1,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          hintMaxLines: 1,
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))))),
                                ),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: 6),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text("59 sec"),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Don't Get OTP? Resend"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: SizedBox(
                    height: 50,
                    width: 350,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homescreeen(),
                              ));
                        },
                        child: Text("Verify")),
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
