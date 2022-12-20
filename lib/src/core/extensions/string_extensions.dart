extension ImagePath on String {
  String get toSvg => "assets/icons/svg_$this.svg";

  String get toPng => "assets/images/ig_$this.png";

  String get toJpg => "assets/images/ig_$this.jpg";

  String get toJson => "assets/lottie/$this.json";
}

extension NumberParsing on String {
  int get parseInt => int.parse(this);

  int? get tryParseInt => int.tryParse(this);

  double get parseDouble => double.parse(this);

  double? get tryParseDouble => double.tryParse(this);
}
