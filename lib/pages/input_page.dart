// input_page.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_7/calculator.dart';
import 'package:flutter_application_7/components/bottom_button.dart';
import 'package:flutter_application_7/components/custom_card.dart';
import 'package:flutter_application_7/components/icon_card.dart';
import 'package:flutter_application_7/components/round_icon_button.dart';
import 'package:flutter_application_7/constants.dart';

import 'result_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Menyimpan pilihan pengguna; setiap perubahan diperbarui lewat setState.
  Gender selectedGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMR CALCULATOR')),
      body: SafeArea(
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Pilihan jenis kelamin menjadi penentu konstanta rumus BMR.
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CustomCard(
                      color: selectedGender == Gender.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconCard(
                        cardIcon: FontAwesomeIcons.mars.data,
                        caption: 'MALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: selectedGender == Gender.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconCard(
                        cardIcon: FontAwesomeIcons.venus.data,
                        caption: 'FEMALE',
                      ),
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('HEIGHT', style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: numberTextStyle),
                        const Text('cm', style: labelTextStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 12.0,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 20.0,
                        ),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double value) {
                          // Slider mengubah tinggi dan memperbarui angka di layar.
                          setState(() {
                            height = value.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  // Tombol +/- memperbarui berat dan usia sebelum perhitungan.
                  Expanded(
                    child: CustomCard(
                      color: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('WEIGHT (kg)', style: labelTextStyle),
                          Text(weight.toString(), style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus.data,
                                onPressed: () {
                                  setState(() {
                                    if (weight >= 30) {
                                      weight--;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus.data,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      color: activeCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('AGE (years)', style: labelTextStyle),
                          Text(age.toString(), style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus.data,
                                onPressed: () {
                                  setState(() {
                                    if (age > 15) age--;
                                  });
                                },
                              ),
                              const SizedBox(width: 10.0),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus.data,
                                onPressed: () {
                                  setState(() {
                                    if (age < 80) age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomButton(
              buttonTitle: 'CALCULATE',
              onTap: () {
                // Kirim seluruh input ke kalkulator untuk memperoleh nilai BMR.
                Calculator cal = Calculator(
                  height: height,
                  weight: weight,
                  age: age,
                  gender: selectedGender,
                );
                String bmr = cal.calculateBMR().round().toString();
                // Setelah dihitung, pindah ke halaman hasil dengan nilai BMR.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultPage(bmr: bmr)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
