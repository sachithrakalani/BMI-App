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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.male, size: 150),
                      Text("Male"),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.female, size: 150),
                      Text("Female"),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children:[
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
                          onPressed: (){
                            setState(() {
                              if(height > 50){
                                height--; 
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
                          onPressed: (){
                            setState(() {
                              if(height < 220){
                                height++;
                              } 
                            });
                          } ,
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
                          onPressed: (){
                            setState(() {
                              if(weight > 30){
                                weight--; 
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
                          onPressed:(){
                            setState(() {
                              if(weight < 300){
                                weight++;
                              }
                             });
                          } ,
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
                  "22.5",
                style: kInputLableColour.copyWith(
                      color: kOutputTextColor,fontSize: 60,
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  
}
