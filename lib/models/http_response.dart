class HttpResponse {
  int? status;
  String? description;
  dynamic body;

  HttpResponse({this.status, this.description, this.body});

  HttpResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    description = json['description'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['description'] = description;
    data['body'] = body;
    return data;
  }
}
