import 'package:flutter/material.dart';
import 'package:sample_bmi_app1/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int height = 150;
  int weight = 75;
  String gender = '';

  late double bmi = calculateBMI(height: height, weight: weight);
  late String result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'M';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == 'M'
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Column(
                        children: [
                          Icon(Icons.male, size: 150),
                          Text("Male"),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = 'F';
                      });
                    },
                    child: Container(
                      height: 200,
                      width: 175,
                      decoration: BoxDecoration(
                          color: gender == 'F'
                              ? Colors.orange.withAlpha(150)
                              : Colors.orange.withAlpha(50),
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.all(8.0),
                      child: const Column(
                        children: [
                          Icon(Icons.female, size: 150),
                          Text("Female"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            
              const SizedBox(height: 50),
            
              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text("Height"),
                      Text(
                        "$height",
                        style: kInputLableColour,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height > 50) {
                                  height--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (height < 220) {
                                  height++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                
                const Spacer(),
                
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      const Text("Weight"),
                      Text(
                        "$weight",
                        style: kInputLableColour,
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 30) {
                                  weight--;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.remove,
                              size: 40,
                            ),
                          ),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight < 300) {
                                  weight++;
                                  bmi = calculateBMI(
                                      height: height, weight: weight);
                                }
                              });
                            },
                            child: const Icon(
                              Icons.add,
                              size: 40,
                            ),
                          )
                        ],
                      )
                    ])),
              ]),
            
              const SizedBox(height: 50),
            
              Column(
                children: [
                  const Text("BMI"),
                  Text(
                    bmi.toStringAsFixed(2),
                    style: kInputLableColour.copyWith(
                      color: kOutputTextColor,
                      fontSize: 60,
                    ),
                  ),
                  Text(
                    result = getResult(bmi),
                    style: result == 'Overweight'
                        ? const TextStyle(
                            color: Color(0xFF00FF00),
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          )
                        : result == 'Normal'
                            ? const TextStyle(
                                color: Color(0xFFFF1111),
                                fontSize: 70,
                                fontWeight: FontWeight.bold,
                              )
                            : result == 'Underweight'
                                ? const TextStyle(
                                    color: Color(0xFF0000FF),
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(),
                  ),
                ],
              )
          
            ]
          ),
        ),
      ),
    );
  }

  double calculateBMI({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  String getResult(double bmiValue) {
    if (bmiValue >= 25) {
      return 'Overweight';
    } else if (bmiValue > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
