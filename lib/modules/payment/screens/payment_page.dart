import 'package:flutter/material.dart';
import 'package:xenshop/constants/colors_constants.dart';
import 'package:xenshop/constants/string_constants.dart';
import 'package:xenshop/utils/ui/custom_elevated_button.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title : const Text(paymentScreenName), backgroundColor: primaryColorDark),
      backgroundColor: appBackgroundColor,
      body: Scaffold(
        body: Container(
          height: size.height/2.7,
          margin: const EdgeInsets.fromLTRB(10.0, 100, 10.0, 0),
          child: Align(
            alignment: Alignment.center,
            child: Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.04,),
                    const Text('Payment Successful', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(height: size.height * 0.02,),
                    const Text('Your have successfully check out your cart'),
                    SizedBox(height: size.height * 0.07,),
                    CustomElevatedButton(
                        text: backToHomeLbl,
                        width: 250.0,
                        height: 50,
                        buttonColor: primaryColorDark,
                        onPressed: (){
                          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }
}
