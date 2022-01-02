import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:news_app/src/central/my_logger.dart';
import 'package:news_app/src/controllers/home_news_controller.dart';

class CountryBms extends StatefulWidget {
  @override
  State<CountryBms> createState() => _CountryBmsState();
}

class _CountryBmsState extends State<CountryBms> {
  final homeNewsController = Get.find<HomeNewsController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          // when raised button is pressed
          // we display showModalBottomSheet
          showModalBottomSheet<void>(
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text
              return SizedBox(
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose Your Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Divider(color: Colors.grey),
                      SizedBox(height: 16),
                      // Text("Nepal")
                      Expanded(child: RadioTileList()),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  homeNewsController.selectedCountry =
                                      homeNewsController.tempCountry;
                                });

                                logger.d(
                                    ' homeNewsController.tempCountry ${homeNewsController.tempCountry}');
                                logger.d(
                                    'homeNewsController.selectedCountry ${homeNewsController.selectedCountry}');
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text("Apply"),
                              )))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location"),
            Row(
              children: [
                Icon(Icons.location_on, size: 16),
                Text(homeNewsController.selectedCountry),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RadioTileList extends StatefulWidget {
  const RadioTileList({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

// enum CountryList {
//   Nepal,
//   USA,
//   India,
//   SriLanka,
// }

class _MyStatefulWidgetState extends State<RadioTileList> {
  // CountryList _site = CountryList.javatpoint;

  int? selectedValue = 2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getKeysFromMap(countriesList);
  }

  final homeNewsController = Get.find<HomeNewsController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: homeNewsController.countriesList.length,
      itemBuilder: (BuildContext context, int index) {
        String countryName = "";
        for (var key in homeNewsController.countriesList[index].keys) {
          countryName = key;
        }
        return InkWell(
          onTap: () {},
          child: ListTile(
            title: Text(countryName),
            trailing: Radio<int>(
              value: index,
              // value: CountryList.javatpoint,
              groupValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  homeNewsController.tempCountry = countryName;
                  logger.d(
                      'homeNewsController.tempCountry ${homeNewsController.tempCountry}');
                });
              },
            ),
          ),
        );
      },
    );
  }
}
