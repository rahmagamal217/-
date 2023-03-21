import 'package:flutter/material.dart';
import 'package:medicine_remainder/Widgets/medicine_list_container.dart';
import 'package:medicine_remainder/constants.dart';
import 'package:weekday_scroller/weekday_scroller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    List<String> name = [
      'seringa',
      'pills',
      'Marivan',
      'Asthma device',
      'collyrium'
    ];
    List<String> nextDose = ['10:00', '12:00', '03:00', '06:00', '08:00'];
    var size = MediaQuery.of(context).size;
    double bottomNavBarHeight = size.height * 0.1;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.35,
          width: size.width,
          child: Material(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(60),
              bottomRight: Radius.circular(60),
            ),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [customColor1, customColor5],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '  تذكيرك اليومي\n  بالدواء',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        height: size.height * 0.15,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  WeekdayScroller(
                    selectedDay: selectedDay,
                    changeDay: (value) => setState(() {
                      selectedDay = value;
                    }),
                    backgroundColor: customColor1.withOpacity(0),
                    enableWeeknumberText: false,
                    selectedBackgroundColor: customColor,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: bottomNavBarHeight,
            right: 12,
            left: 12,
          ),
          child: SizedBox(
            height: size.height * 0.50,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return MedicineListContainer(
                  size: size,
                  image: imagesList[index],
                  name: name[index],
                  nextDose: nextDose[index],
                );
              },
              itemCount: imagesList.length,
            ),
          ),
        ),
      ],
    );
  }
}
