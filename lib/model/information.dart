class Information {
  String? condition, info;

  Information(this.condition, this.info);
}

List<Information> information = [
  Information("Under Weight",
      "Keep in mind that an underweight BMI calculation may pose certain health risks. Please consult with your healthcare provider for more information about BMI calculations."),
  Information("Normal",
      "This healthy weight helps reduce your risk of serious health conditions and means you’re close to your fitness goals."),
  Information("Over Weight",
      "Being overweight may increase your risk of cardiovascular disease. Consult with your healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve your health."),
  Information("Obese",
      "People with obesity are at increased risk for many diseases and health conditions, including cardiovascular disease, high blood pressure (Hypertension), Type 2 diabetes, breathing problems and more. Consult with your healthcare provider and consider making lifestyle changes through healthy eating and fitness to improve your overall health and quality of life."),
];

List<String?> condition = information.map((city) => city.condition).toList();
List<String?> info = information.map((city) => city.info).toList();
