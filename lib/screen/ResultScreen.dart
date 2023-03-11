import 'package:BMI/screen/result.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.isMale,
    required this.result,
    required this.age,
  }) : super(key: key);
  final bool isMale;
  final int result;
  final int age;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        backgroundColor: Colors.purple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.purple,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: isMale ? Colors.blue : Colors.pink,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Image.asset(
                          isMale
                              ? 'asset/images/male.png'
                              : 'asset/images/female.png',
                          height: 200,
                          width: 200,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          'Gender\n${isMale ? 'Male' : 'Female'}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.purple,
                child:  GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child: Text(
                      'BMI\n$result',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:45,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ) ,
                  onTap: (){Navigator.push(context,
                    MaterialPageRoute(
                      builder:(context) =>Result(isMale: isMale,
                      bmi: result,),
                    ),);


                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                color: Colors.purple,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: (isMale ? Colors.blue : Colors.pink).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'age\n$age',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:45,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}