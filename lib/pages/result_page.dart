// result_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_application_7/components/bottom_button.dart';
import 'package:flutter_application_7/components/custom_card.dart';
import 'package:flutter_application_7/constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmr});

  final String bmr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR CALCULATOR')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Your BMR',
                style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CustomCard(
              color: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Menampilkan nilai BMR yang dikirim dari halaman input.
                  Text(bmr, style: bmrTextStyle),
                  Text(
                    'Calories/day at rest',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 22.0),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'This is an estimate based on the Mifflin-St Jeor equation. '
                      'Daily calorie needs vary with activity and other factors.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'BACK',
            onTap: () {
              // Kembali ke input agar pengguna dapat mengubah data dan menghitung ulang.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
