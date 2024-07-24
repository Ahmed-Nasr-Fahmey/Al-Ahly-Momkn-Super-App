import 'package:equatable/equatable.dart';

class ServiceBookingHistoryModel extends Equatable {
  ServiceBookingHistoryModel({
    required this.message,
    required this.service,
  });

  final String? message;
  final Service? service;

  factory ServiceBookingHistoryModel.fromJson(Map<String, dynamic> json){
    return ServiceBookingHistoryModel(
      message: json["message"],
      service: json["service"] == null ? null : Service.fromJson(json["service"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "service": service?.toJson(),
  };

  @override
  List<Object?> get props => [
    message, service, ];
}

class Service extends Equatable {
  Service({
    required this.id,
    required this.name,
    required this.image,
    required this.code,
    required this.description,
    required this.fees,
    required this.state,
    required this.type,
    required this.providerId,
    required this.categoryId,
    required this.from,
    required this.to,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String? id;
  final String? name;
  final Image? image;
  final String? code;
  final String? description;
  final int? fees;
  final String? state;
  final String? type;
  final String? providerId;
  final String? categoryId;
  final DateTime? from;
  final DateTime? to;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  factory Service.fromJson(Map<String, dynamic> json){
    return Service(
      id: json["_id"],
      name: json["name"],
      image: json["image"] == null ? null : Image.fromJson(json["image"]),
      code: json["code"],
      description: json["description"],
      fees: json["fees"],
      state: json["state"],
      type: json["type"],
      providerId: json["providerId"],
      categoryId: json["categoryId"],
      from: DateTime.tryParse(json["from"] ?? ""),
      to: DateTime.tryParse(json["to"] ?? ""),
      createdAt: DateTime.tryParse(json["createdAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["updatedAt"] ?? ""),
      v: json["__v"],
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image?.toJson(),
    "code": code,
    "description": description,
    "fees": fees,
    "state": state,
    "type": type,
    "providerId": providerId,
    "categoryId": categoryId,
    "from": from?.toIso8601String(),
    "to": to?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };

  @override
  List<Object?> get props => [
    id, name, image, code, description, fees, state, type, providerId, categoryId, from, to, createdAt, updatedAt, v, ];
}

class Image extends Equatable {
  Image({
    required this.publicId,
    required this.secureUrl,
  });

  final String? publicId;
  final String? secureUrl;

  factory Image.fromJson(Map<String, dynamic> json){
    return Image(
      publicId: json["public_id"],
      secureUrl: json["secure_url"],
    );
  }

  Map<String, dynamic> toJson() => {
    "public_id": publicId,
    "secure_url": secureUrl,
  };

  @override
  List<Object?> get props => [
    publicId, secureUrl, ];
}
