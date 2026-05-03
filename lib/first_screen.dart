import 'package:bmi_calculator_app/bmi_calculator.dart';
import 'package:bmi_calculator_app/result_screen.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isMale = true;
  double height = 170;
  int weight = 70;
  int age = 20;
  var result = "";
  String category = '';
  void reset() {
    isMale = true;
    height = 170;
    weight = 70;
    age = 20;
    result = "";

    setState(() {});
  }

  void calcBMI() {
    double hM = height / 100;
    double bmi = weight / (hM * hM);
    result = bmi.toStringAsFixed(1);
    category = calculateBMICategory(bmi);
  }

  String unit = 'cm';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.calculate, size: 30),
            SizedBox(width: 10),
            Text(
              'BMI Calculator App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: reset,
            icon: Icon(Icons.refresh, size: 30, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    spacing: 10,
                    children: [
                      GenderCard(
                        gender: "Male",
                        icon: Icons.male,
                        isSelected: isMale,
                      ),
                      GenderCard(
                        gender: "Female",
                        icon: Icons.female,
                        isSelected: !isMale,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFe8e8e8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Height",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: ['cm', 'in', 'ft'].map((u) {
                                final bool isActive = unit == u;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      unit = u;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: isActive
                                            ? const Color(0xFF2b2b2b)
                                            : const Color(0xFFbbbbbb),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        u,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: isActive
                                              ? Colors.white
                                              : Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),

                        Text(
                          () {
                            if (unit == 'cm') return '${height.round()} cm';
                            if (unit == 'in')
                              return '${(height / 2.54).toStringAsFixed(1)} in';
                            // feet: e.g. 5'7"
                            final double totalInches = height / 2.54;
                            final int ft = (totalInches / 12).floor();
                            final int inches = (totalInches % 12).round();
                            return "$ft' $inches\"";
                          }(),
                          style: const TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2b2b2b),
                          ),
                        ),
                        Slider(
                          activeColor: const Color(0xFF2b2b2b),
                          inactiveColor: const Color(0xFFFFFFFF),
                          min: 100,
                          max: 300,
                          value: height,
                          onChanged: (newHeight) {
                            height = newHeight;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: buildCounterCard(
                          title: "Weight",
                          value: weight,
                          onIncrease: () {
                            weight++;
                            setState(() {});
                          },
                          onDecrease: () {
                            weight--;
                            setState(() {});
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: buildCounterCard(
                          title: "Age",
                          value: age,
                          onIncrease: () {
                            age++;
                            setState(() {});
                          },
                          onDecrease: () {
                            age--;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      calcBMI();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ResultScreen(
                              bmiResult: result,
                              bmiCategory: category,
                            );
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      backgroundColor: const Color(0xFF2b2b2b),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Calculate",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.loop, size: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded GenderCard({
    required String gender,
    required IconData icon,
    required bool isSelected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () {
          isMale = gender == "Male";
          setState(() {});
        },
        child: Card(
          color: isSelected ? const Color(0xFFdafd87) : const Color(0xFFe8e8e8),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 50),
              Text(
                gender,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCounterCard({
    required String title,
    required int value,
    required Function onIncrease,
    required Function onDecrease,
  }) {
    return Card(
      color: const Color(0xFFe8e8e8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  onDecrease();
                },
                icon: Icon(Icons.remove),
                color: Color(0xFFFFFFFF),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF2b2b2b),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2b2b2b),
                ),
              ),
              IconButton(
                onPressed: () {
                  onIncrease();
                },
                icon: Icon(Icons.add),
                color: Color(0xFFFFFFFF),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF2b2b2b),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ],
          ),
          if (value == weight)
            Text("kg", style: TextStyle(fontSize: 17, color: Color(0xFF888888)))
          else
            Text(
              "Years",
              style: TextStyle(fontSize: 17, color: Color(0xFF888888)),
            ),
        ],
      ),
    );
  }
}
