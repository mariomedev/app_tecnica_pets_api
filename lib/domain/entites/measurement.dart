class Measurement {
  String imperial;
  String metric;

  Measurement({
    required this.imperial,
    required this.metric,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    imperial: json["imperial"],
    metric: json["metric"],
  );

  Map<String, dynamic> toJson() => {
    "imperial": imperial,
    "metric": metric,
  };
}
