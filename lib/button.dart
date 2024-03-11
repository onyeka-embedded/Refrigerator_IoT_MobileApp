import 'package:firstly/provider/api_provider.dart';
import 'package:firstly/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final switchState = Provider.of<UiProvider>(context);
    final blynkProvider = Provider.of<ApiProvider>(context);

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(34, 146, 180, 5), width: 3),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        height: h * 0.25,
        width: w * 0.4,
        child: Consumer<UiProvider>(builder: (context, myProvider, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 10,
                    backgroundColor:
                        myProvider.switchValue ? Colors.green : Colors.grey,
                  ),
                  SizedBox(
                    width: w * 0.07,
                  ),
                  Switch(
                    value: myProvider.switchValue,
                    onChanged: (value) {
                      // 'value' will be true if the switch is on, and false if it's off
                      switchState.toggleSwitch();
                      String myString = value ? '1' : '0';
                      blynkProvider.controlFidge(myString);
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: h * 0.01,
              ),
              Icon(
                Icons.power,
                color: const Color.fromRGBO(34, 146, 180, 5),
                size: h * 0.08,
              ),
              SizedBox(
                height: h * 0.01,
              ),
              const Text(
                "Refigerator",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              )
            ],
          );
        }));
  }
}
