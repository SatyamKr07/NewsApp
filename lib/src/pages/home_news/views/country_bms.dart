import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import '../../../central/my_logger.dart';
import '../../../central/strings.dart';
import '../../../controllers/home_news_controller.dart';

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
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: Get.height,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Choose Your Location',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Divider(color: Colors.grey),
                      const SizedBox(height: 16),
                      // Text("Nepal")
                      const Expanded(child: RadioTileList()),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  homeNewsController.selectedCountry =
                                      homeNewsController.tempCountry;
                                });

                                homeNewsController.getCountryNews();

                                Navigator.pop(context);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(16.0),
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
            const Text("Location"),
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

class _MyStatefulWidgetState extends State<RadioTileList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              groupValue: homeNewsController.selectedValue,
              onChanged: (value) {
                setState(() {
                  homeNewsController.selectedValue = value;
                  homeNewsController.tempCountry = countryName;
                  homeNewsController.selectedCountryCode =
                      homeNewsController.countriesList[index][countryName];

                  logger.d(
                      'homeNewsController.selectedCountryCode ${homeNewsController.selectedCountryCode}');
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
