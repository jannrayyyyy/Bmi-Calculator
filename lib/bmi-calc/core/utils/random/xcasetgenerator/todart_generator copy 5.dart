import 'package:bmi_calc/bmi-calc/presentation/widgets/custom_quicksand_text.dart';
import 'package:flutter/material.dart';

class NotBmiRangeContainer extends StatelessWidget {
  const NotBmiRangeContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blue.shade300),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomQuickSand(
                  text: 'BELOW 18.5 = UNDERWEIGHT',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomQuickSand(
                  text: '18.5 - 24.9 = NORMAL WEIGHT',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomQuickSand(
                  text: '25.0 - 29.9 = OVERWEIGHT',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: Colors.red),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomQuickSand(
                  text: '30.0 - 34.9 = OBESITY CLASS I',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.purpleAccent),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomQuickSand(
                  text: 'ABOVE 40 = OBESITY',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
