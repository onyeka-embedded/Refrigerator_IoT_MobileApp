import 'package:firstly/homepage.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        color: const Color.fromRGBO(34, 146, 180, 5),
        child: Column(
          children: [
            SizedBox(
              height: h / 4,
            ),
            const Text(
              "Apptivate!",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                  color: Colors.white),
            ),
            SizedBox(
              height: h / 2,
            ),
            GestureDetector(
              onTap: () {
                print("API Call");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                height: h * 0.07,
                width: w * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Continue',
                      style: TextStyle(
                          color: Color.fromRGBO(34, 146, 180, 5), fontSize: 20),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: const Color.fromRGBO(34, 146, 180, 5),
                      size: h * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
