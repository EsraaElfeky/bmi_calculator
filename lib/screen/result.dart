import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({Key? key, required this.isMale, required this.bmi})
      : super(key: key);
  final bool isMale;
  final int bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            SingleChildScrollView(),
            Container(
              decoration: BoxDecoration(
                color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Image.asset(
                isMale ? 'asset/images/bmim.png' : 'asset/images/bmif.png'),
            SizedBox(height: 80),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(getMessage(bmi),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            const SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      isMale
                          ? '\nYou must \n\n* take good care of your health.\n'
                          '*Drink approximately 15.5 cups (3.7 liters) of fluid per day for men.'
                          '\n*You should do exercise.\n* not smoke.\n*  sleep early.'
                          : '\nYou must \n\n* take good care of your health.\n'
                          '*Drink approximately 11.5 cups (2.7 liters) of fluid per day for women.'
                          '\n*You should do exercise.\n* not smoke.\n*  sleep early.',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Image.asset(getImage(isMale,bmi),height: 250,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  String getMessage(int bmi) {
    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi > 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi > 25 && bmi < 30) {
      return 'Over Weight';
    } else if (bmi > 35 && bmi < 40) {
      return 'Severe Obesity';
    } else if (bmi > 44 && bmi < 45) {
      return 'Morbid Obesity';
    } else {
      return 'Super Obesity';
    }
  }

  String getImage(bool male, int bmi) {
    if (bmi < 18.5) {
      return male ? 'asset/images/1m.png': 'asset/images/1f.png';
    } else if (bmi > 18.5 && bmi < 25) {
      return male ? 'asset/images/2m.png': 'asset/images/2f.png';
    } else if (bmi > 25 && bmi < 30) {
      return male ? 'asset/images/3m.png': 'asset/images/3f.png';
    } else if (bmi > 35 && bmi < 40) {
      return male ? 'asset/images/4m.png': 'asset/images/4f.png';
    } else if (bmi > 44 && bmi < 45) {
      return male ? 'asset/images/5m.png': 'asset/images/5f.png';
    } else {
      return male ? 'asset/images/6m.png': 'asset/images/6f.png';
    }
  }
}