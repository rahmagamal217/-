import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:medicine_remainder/constants.dart';

class MedicineListContainer extends StatelessWidget {
  const MedicineListContainer({
    super.key,
    required this.size,
    required this.image,
    required this.name,
    required this.nextDose,
  });
  final Size size;
  final String image;
  final String name;
  final String nextDose;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: SizedBox(
        height: 120,
        width: size.width * 0.6,
        child: Material(
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
          elevation: 5,
          child: GestureDetector(
            onTap: (() {}),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {}), //deleteFunction,
                    icon: Icons.delete,
                    backgroundColor: Colors.red.shade300,
                    borderRadius: BorderRadius.circular(12),
                  )
                ],
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Row(
                    children: [
                      IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                        color: customColor3,
                      ),
                      SizedBox(
                        width: size.width * 0.09,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                name,
                                style: const TextStyle(fontSize: 23),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'الجرعه التاليه : $nextDose ',
                                    style:
                                        TextStyle(fontSize: 18, color: customColor),
                                  ),
                                  const SizedBox(width: 5,),
                                  const Icon(Icons.alarm)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(
                        image,
                        width: size.width * 0.35,
                        height: 40,
                        alignment: Alignment.centerLeft,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
