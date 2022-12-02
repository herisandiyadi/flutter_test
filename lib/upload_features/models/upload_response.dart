class UploadResponse {
  UploadResponse({
    required this.data,
    required this.success,
    required this.status,
  });

  Data data;
  bool success;
  int status;

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
        data: Data.fromJson(json["data"]),
        success: json["success"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "success": success,
        "status": status,
      };
}

class Data {
  Data({
    required this.id,
    required this.url,
    required this.media,
    required this.thumb,
    required this.width,
    required this.height,
  });

  String id;
  String url;
  String media;
  String thumb;
  int width;
  int height;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        url: json["url"],
        media: json["media"],
        thumb: json["thumb"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "media": media,
        "thumb": thumb,
        "width": width,
        "height": height,
      };
}
