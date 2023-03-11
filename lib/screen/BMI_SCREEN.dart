import 'dart:async';

import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ResultScreen.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool? isMale;
  double hight = 50;
  int age = 0;
  int weight = 0;
  bool cancel = false;
  int bmi=0;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'BMI Calculation',
          textAlign: TextAlign.end,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        color: isMale == true
                            ? Colors.blue
                            : Colors.grey.withOpacity(0.5),
                        child: Column(
                          children: [
                            Image.asset(
                              'asset/images/male.png',
                              height: 100,
                              width: 100,
                            ),
                            const Text(
                              'Male',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(20),
                        color: isMale == false
                            ? Colors.pink
                            : Colors.grey.withOpacity(0.5),
                        child: Column(
                          children: [
                            Image.asset(
                              'asset/images/female.png',
                              height: 100,
                              width: 100,
                            ),
                            const Text(
                              'Female',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey.withOpacity(0.5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Height',
                      style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${hight.round()}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        const Text(
                          'CM',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    ),
                    Slider(
                      value: (hight),
                      min: 50,
                      max: 200,
                      activeColor: Colors.purple,
                      thumbColor: Colors.purple,
                      inactiveColor: Colors.purple.withOpacity(0.5),
                      onChanged: (value) {
                        setState(() {
                          hight = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            '$age',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          GestureDetector(
                            onLongPress: () => setState(() {
                              timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
                                setState(() {
                                  age++;
                                });
                              });
                            }),
                            onLongPressEnd: (_) => setState(() {
                              timer?.cancel();
                            }),
                            child: FloatingActionButton(
                              backgroundColor: Colors.purple.withOpacity(0.8),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              heroTag: 'age+',
                              mini: true,
                              child: const Icon(Icons.add),
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () => setState(() {
                              timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
                                setState(() {
                                  age--;
                                });
                              });
                            }),
                            onLongPressEnd: (_) => setState(() {
                              timer?.cancel();
                            }),
                            child: FloatingActionButton(
                              backgroundColor: Colors.purple.withOpacity(0.8),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              heroTag: 'age-',
                              mini: true,
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          Text(
                            '$weight',
                            style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          InkWell(
                            onTapUp: (details) {
                              setState(() {
                                cancel = false;
                              });
                            },
                            onLongPress: () {
                              setState(() {

                              });
                            },
                            child: GestureDetector(
                              onLongPress: () => setState(() {
                                timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
                                  setState(() {
                                    weight++;
                                  });
                                });
                              }),
                              onLongPressEnd: (_) => setState(() {
                                timer?.cancel();
                              }),
                              child: FloatingActionButton(
                                backgroundColor: Colors.purple.withOpacity(0.8),
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'weight+',
                                mini: true,
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onLongPress: () => setState(() {
                              timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
                                setState(() {
                                  weight--;
                                });
                              });
                            }),
                            onLongPressEnd: (_) => setState(() {
                              timer?.cancel();
                            }),
                            child: FloatingActionButton(
                              backgroundColor: Colors.purple.withOpacity(0.8),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              heroTag: 'weight- ',
                              mini: true,
                              child: const Icon(Icons.remove),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(hight / 100, 2);
                print(result.round());
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      age: age,
                      result: result.round(),
                      isMale: isMale ?? true,
                    ),
                  ),
                );
              },
              child: const Text(
                'CALCULATION',
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
