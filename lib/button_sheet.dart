import 'package:firstly/provider/api_provider.dart';
import 'package:firstly/provider/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonSheetD extends StatefulWidget {
  const ButtonSheetD({super.key});

  @override
  State<ButtonSheetD> createState() => _ButtonSheetDState();
}

class _ButtonSheetDState extends State<ButtonSheetD> {
  final TextEditingController _textEditingController =
      TextEditingController(); // Create a TextEditingController
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final textFieldProvider = Provider.of<UiProvider>(context, listen: false);
    final setTempProvider = Provider.of<ApiProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textEditingController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              textFieldProvider.setTextFieldValue(
                  value); // Update the value in TextFieldProvider
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Color.fromRGBO(34, 146, 180, 5),
                ),
              ),
              hintText: 'Enter Temp',
              labelText: 'Temp Value',
            ),
          ),
          SizedBox(height: h * 0.05),
          GestureDetector(
            onTap: () {
              print(textFieldProvider.textFieldValue);
              setTempProvider.setTemp(textFieldProvider.textFieldValue);
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(34, 146, 180, 5),
                    border: Border.all(color: Colors.transparent),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                height: h * 0.06,
                width: w * 0.3,
                child: const Center(
                    child: Text(
                  'Set Temp',
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
