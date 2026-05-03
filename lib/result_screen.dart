import 'package:bmi_calculator_app/bmi_calculator.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.bmiResult,
    required this.bmiCategory,
  });

  final String bmiResult;
  final String bmiCategory;

  /// Maps BMI value to a 0.0–1.0 position on the gauge
  /// Range: 10 (left) → 40 (right)
  double _gaugePosition() {
    final double bmi = double.tryParse(bmiResult) ?? 22.0;
    return ((bmi - 10) / 30).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final categoryInfo = bmiData[bmiCategory] ?? bmiData["Normal"]!;
    final String advice = categoryInfo["advice"] as String;

    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Title ──
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
            child: Text(
              "Result",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Row: "Your BMI is" + category label
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Your BMI is",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        bmiCategory,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Big BMI number
                  Text(
                    bmiResult,
                    style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Gauge bar
                  _BmiGauge(position: _gaugePosition()),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bmiCategory,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    advice,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.8,
                      color: Color(0xFF333333),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
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
                    const Text(
                      "Re-Calculate",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.arrow_back, size: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Gauge Widget ──
class _BmiGauge extends StatelessWidget {
  const _BmiGauge({required this.position});
  final double position; // 0.0 → 1.0

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double barWidth = constraints.maxWidth;
        final double dotX = position * barWidth;

        return SizedBox(
          height: 24,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              // Gradient bar
              Container(
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF388E3C), // green – normal
                      Color(0xFFFBC02D), // yellow – overweight
                      Color(0xFFE53935), // red – obese
                    ],
                  ),
                ),
              ),
              // Dot indicator
              Positioned(
                left: dotX - 10,
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
