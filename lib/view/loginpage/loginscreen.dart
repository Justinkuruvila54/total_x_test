// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:total_x_test/view/otp_verificationscreen/otp_verificationscreen.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

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
                height: 102,
                width: 130,
                child: Image.asset("assets/images/loginicon.png"),
              ),
              SizedBox(
                height: 17,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Enter Phone Number",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter Phone Number *",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "By Continuing, I agree to TotalX’s Terms and condition & privacy policy",
                    style: TextStyle(fontSize: 11),
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
                                builder: (context) => Otp_verificationscreen(),
                              ));
                        },
                        child: Text("Get OTP")),
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
