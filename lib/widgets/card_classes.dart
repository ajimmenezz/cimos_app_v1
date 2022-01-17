import 'package:flutter/material.dart';

class CardClases extends StatelessWidget {
  const CardClases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          child: Container(
            //TODO Tamaño del contenedor "ALTURA" "RECORDAR HACER EL REPOSITORIO"
            height: MediaQuery.of(context).size.height * 0.29,
            decoration: BoxDecoration(
              color: const Color(0xff7c94b6),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpz3Ua3-KDri1MmtVoF77kPN-Vq6C3cs1WMQ&usqp=CAU'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(9.0),
                          child: Text(
                            "claseName",
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.red,
                          size: 50,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: Text(
                            '30m | High Intensity | Indoor/Outdoor',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 55, left: 9),
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Reserve')),
                        ),
                        Expanded(child: Container()),
                        Padding(
                          padding: const EdgeInsets.only(top: 50.0, right: 9),
                          child: Column(
                            children: [
                              Text('10:00am'),
                              Text('Thursday June 22'),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
