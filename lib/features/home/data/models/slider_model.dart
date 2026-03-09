class SliderModel {
  SliderData? data;
  String? message;
  int? status;

  SliderModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null ? SliderData.fromJson(json["data"]) : null;
    status = json["status"];
    message = json["message"];
  }
}

class SliderData {
  List<SliderImage>? sliders;

  SliderData.fromJson(Map<String, dynamic> json) {
    if (json["sliders"] != null) {
      sliders = <SliderImage>[];
      json["sliders"].forEach((v) {
        sliders?.add(SliderImage.fromJson(v));
      });
    }
  }
}

class SliderImage {
  String? image;

  SliderImage.fromJson(Map<String, dynamic> json) {
    image = json["image"];
  }
}
