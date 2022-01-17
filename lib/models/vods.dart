class CimosVODS {
  String? id;
  String? video;
  String? name;
  int? duration;
  String? pictureId;
  String? created;
  String? file;
  String? description;

  CimosVODS(
      {this.id,
      this.video,
      this.name,
      this.duration,
      this.pictureId,
      this.created,
      this.file,
      this.description});

  CimosVODS.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    video = json['Video'];
    name = json['Name'];
    duration = json['Duration'];
    pictureId = json['PictureId'];
    created = json['Created'];
    file = json['File'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Video'] = video;
    data['Name'] = name;
    data['Duration'] = duration;
    data['PictureId'] = pictureId;
    data['Created'] = created;
    data['File'] = file;
    data['Description'] = description;
    return data;
  }
}
