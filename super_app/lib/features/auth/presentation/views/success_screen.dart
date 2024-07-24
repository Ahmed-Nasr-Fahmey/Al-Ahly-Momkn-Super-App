import 'package:flutter/material.dart';
import 'package:super_app/constants.dart';

class SignedUpScreen extends StatelessWidget {
  const SignedUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Image(image: AssetImage("assets/success.png")),
          ),
          Column(
            children: [
              Text("Sign up Successfully",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text("Everything will be fine !",style: TextStyle(fontSize: 16,color: Constants.textFieldHintColor),),
            ],
          ),

          Image(image: AssetImage("assets/PoweredBy.png"))
          
        ],
      ),
    );
  }
}
