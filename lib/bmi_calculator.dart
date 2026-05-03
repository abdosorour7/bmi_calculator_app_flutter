import 'package:flutter/material.dart';

const Map<String, Map<String, dynamic>> bmiData = {
  "Severe Thinness": {
    "color": Color(0xFFB71C1C),
    "advice": """Diet and Nutrition

Increase Caloric Intake:
- Eat frequent, small meals throughout the day.
- Focus on calorie-dense foods like nuts, seeds, avocados, and healthy oils.
- Add healthy snacks between meals such as peanut butter or cheese.

Choose Nutrient-Rich Foods:
- Prioritize high-protein foods (eggs, meat, fish, legumes) to rebuild muscle.
- Include complex carbohydrates (oats, brown rice, sweet potatoes).
- Eat plenty of fruits and vegetables for vitamins and minerals.

Lifestyle Tips:
- Seek immediate medical attention — this range carries serious health risks.
- Work with a dietitian to build a safe weight-gain meal plan.
- Avoid skipping meals under any circumstances.""",
  },
  "Moderate Thinness": {
    "color": Color(0xFFE53935),
    "advice": """Diet and Nutrition

Eat More Calories:
- Consume more high-calorie foods like nuts, avocados, and healthy oils.
- Increase portion sizes during meals.

Choose Nutrient-Rich Foods:
- Focus on foods rich in protein (lean meats, fish, eggs, legumes).
- Include complex carbohydrates (whole grains, sweet potatoes) for sustained energy.
- Eat plenty of fruits and vegetables for vitamins and minerals.

Lifestyle Tips:
- Consult a doctor or nutritionist to assess your weight-gain needs.
- Aim for light strength training to build muscle mass.
- Stay consistent with meal times and avoid long gaps between eating.""",
  },
  "Mild Thinness": {
    "color": Color(0xFFFF7043),
    "advice": """Diet and Nutrition

Boost Your Calorie Intake:
- Add healthy calorie-dense snacks like nuts, seeds, and whole-grain bread.
- Do not skip meals — eat at regular intervals.

Improve Meal Quality:
- Include a protein source in every meal (chicken, eggs, beans, dairy).
- Choose whole grains over refined carbs for better nutrition.
- Add healthy fats like olive oil, nuts, and avocado to your meals.

Lifestyle Tips:
- Aim for moderate strength training to build healthy muscle.
- Stay hydrated and get adequate sleep for better metabolism.
- Track your daily calorie intake to ensure you're meeting your goals.""",
  },
  "Normal": {
    "color": Color(0xFF388E3C),
    "advice": """Diet and Nutrition

Maintain a Balanced Diet:
- Follow a varied diet with fruits, vegetables, lean proteins, and whole grains.
- Keep portions moderate and avoid overeating.

Stay Consistent:
- Limit processed foods, added sugars, and saturated fats.
- Stay well-hydrated — aim for 8 glasses of water per day.

Lifestyle Tips:
- Maintain at least 150 minutes of moderate exercise per week.
- Get regular health check-ups to monitor your overall wellness.
- Prioritize quality sleep and stress management.""",
  },
  "Overweight": {
    "color": Color(0xFFFBC02D),
    "advice": """Diet and Nutrition

Reduce Excess Calories:
- Cut back on processed foods, sugary drinks, and fast food.
- Use smaller plates to help control portion sizes.

Make Healthier Food Choices:
- Fill half your plate with vegetables and fruits at each meal.
- Choose lean proteins (chicken, fish, legumes) over fatty meats.
- Replace refined carbs with whole grains (brown rice, whole-wheat bread).

Lifestyle Tips:
- Aim for at least 30 minutes of moderate exercise most days.
- Avoid late-night eating and mindless snacking.
- Consider consulting a nutritionist for a personalized meal plan.""",
  },
  "Obese Class I": {
    "color": Color(0xFFF57C00),
    "advice": """Diet and Nutrition

Start a Calorie Deficit:
- Reduce daily calorie intake gradually — avoid extreme crash diets.
- Avoid sugary beverages, alcohol, and high-fat fast food.

Focus on Whole Foods:
- Build meals around vegetables, lean proteins, and fiber-rich carbs.
- Avoid ultra-processed and packaged foods as much as possible.
- Eat slowly and mindfully to better recognize fullness.

Lifestyle Tips:
- Begin with low-impact exercise like walking, swimming, or cycling.
- Consult a healthcare provider for a structured weight-loss plan.
- Track your meals and physical activity using a health app.""",
  },
  "Obese Class II": {
    "color": Color(0xFFE64A19),
    "advice": """Diet and Nutrition

Follow a Structured Diet Plan:
- Work with a dietitian to create a medically appropriate calorie deficit.
- Prioritize high-fiber, high-protein, low-glycemic foods.
- Eliminate sugary drinks, processed snacks, and fried foods entirely.

Meal Strategies:
- Eat 4–5 small meals a day to stabilize blood sugar and reduce cravings.
- Avoid eating out frequently — prepare home-cooked meals when possible.

Lifestyle Tips:
- Medical supervision is strongly recommended before starting any program.
- Begin gentle physical activity and increase intensity gradually.
- Monitor blood pressure, blood sugar, and cholesterol regularly.""",
  },
  "Obese Class III": {
    "color": Color(0xFFD32F2F),
    "advice": """Diet and Nutrition

Seek Professional Guidance Immediately:
- Do not attempt drastic dieting without medical supervision.
- Work closely with a doctor and dietitian on a safe, structured plan.

Dietary Priorities:
- Focus on low-calorie, nutrient-dense foods (leafy greens, lean protein).
- Eliminate all sugary drinks, fast food, and heavily processed snacks.
- Eat smaller, more frequent meals to avoid overeating at once.

Lifestyle Tips:
- Immediate medical evaluation is essential — this range poses severe health risks.
- Discuss all medical treatment options with your doctor, including clinical programs.
- Even small amounts of gentle daily movement can make a meaningful difference.""",
  },
};

String calculateBMICategory(double bmi) {
  if (bmi < 16) {
    return "Severe Thinness";
  } else if (bmi < 17) {
    return "Moderate Thinness";
  } else if (bmi < 18.5) {
    return "Mild Thinness";
  } else if (bmi < 25) {
    return "Normal";
  } else if (bmi < 30) {
    return "Overweight";
  } else if (bmi < 35) {
    return "Obese Class I";
  } else if (bmi < 40) {
    return "Obese Class II";
  } else {
    return "Obese Class III";
  }
}
