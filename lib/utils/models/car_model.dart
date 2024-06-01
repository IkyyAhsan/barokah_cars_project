import 'package:flutter/material.dart';

class CarModel extends StatelessWidget {
  final String merk;
  final String model;
  final String hargaJual;

  const CarModel({
    super.key,
    required this.merk,
    required this.model,
    required this.hargaJual,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Center(
        child: Container(
          width: 180,
          height: 170,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFE82027),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Merk: $merk\nModel: $model\nHarga: $hargaJual',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
