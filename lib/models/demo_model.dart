class DemoModel {
  List<Demos> demos;

  DemoModel({this.demos});

  DemoModel.fromJson(Map<String, dynamic> json) {
    if (json['demos'] != null) {
      demos = new List<Demos>();
      json['demos'].forEach((v) {
        demos.add(new Demos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.demos != null) {
      data['demos'] = this.demos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Demos {
  String url;

  Demos({this.url});

  Demos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}