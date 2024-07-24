class OcrModel{
  OcrModel({required this.ocrData, required this.status});

  List<dynamic> ocrData;
  String status;

  factory OcrModel.fromJson(Map<String, dynamic> json) {
    return OcrModel(
        ocrData: json["ocr_data"],
        status: json["status"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'ocr_data': ocrData,
      'status': status,
    };
  }
}