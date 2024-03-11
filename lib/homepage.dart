import 'package:firstly/button.dart';
import 'package:firstly/button_sheet.dart';
import 'package:firstly/provider/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ApiProvider>(context, listen: false).fetchData();
    Provider.of<ApiProvider>(context, listen: false).isConnected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    final blynkProvider = Provider.of<ApiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text(
          'Apptivate',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(34, 146, 180, 5),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              //size: 20,
            ),
            onPressed: () {
              blynkProvider.fetchData();
              blynkProvider.isConnected();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            SizedBox(
              height: h / 3.2,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fridge.png')),
                ),
                width: w * 0.7,
                //color: Colors.black,
                // child:
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.07),
              child: blynkProvider.data.isNotEmpty
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const CustomContainer(),
                        /*------------------------------------------------ */
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(34, 146, 180, 5),
                                    width: 3),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            height: h * 0.25,
                            width: w * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<ApiProvider>(
                                    builder: (context, bylnkprovider, child) {
                                  if (blynkProvider.data.isNotEmpty) {
                                    return Text(
                                      "${bylnkprovider.data}°C",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18),
                                    );
                                  } else {
                                    return const CircularProgressIndicator();
                                  }
                                }),
                                Icon(
                                  Icons.thermostat_auto,
                                  color: const Color.fromRGBO(34, 146, 180, 5),
                                  size: h * 0.12,
                                ),
                                const Text(
                                  "Temperature",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ],
                            ))
                      ],
                    )
                  : const CircularProgressIndicator(),
            ),
            SizedBox(
              height: h * 0.08,
            ),
            GestureDetector(
              onTap: () {
                _showModalBottomSheet(context);
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(34, 146, 180, 5),
                      border: Border.all(color: Colors.transparent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  height: h * 0.07,
                  width: w * 0.7,
                  child: const Center(
                      child: Text(
                    'Set Temp',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.04,
            ),
            Consumer<ApiProvider>(
                builder: (context, isConnectedProvider, child) {
              print(isConnectedProvider.state);
              if (isConnectedProvider.state == "false") {
                return const Text(
                  "Offline",
                  style: TextStyle(color: Colors.red),
                );
              } else {
                return const Text(
                  "Online",
                  style: TextStyle(color: Colors.green),
                );
              }
            })
          ],
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const ButtonSheetD();
      },
    );
  }
}
