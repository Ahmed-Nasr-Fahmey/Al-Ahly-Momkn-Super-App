class NationalIdModel {
  String? id;
  String? firstName;
  String? lastName;
  String? address;
  String? nationalId;
  String? status;
  String? birthday;
  String? gender;
  String? image;
  String? manuFactorId;

  NationalIdModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.address,
      this.nationalId,
      this.status,
      this.birthday,
      this.gender,
      this.image,
      this.manuFactorId});


  factory NationalIdModel.fromJson(Map<String, dynamic> json) {
    return NationalIdModel(
      id: json['_id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      nationalId: json['nationalID'],
      status: json['status'],
      birthday: json['birthdate'],
      gender: json['gender'],
      image: json['image'],
      manuFactorId: json['manuFactorId'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'firstName': firstName,
      'lastName': lastName,
      'address': address,
      'nationalID': nationalId,
      'status': status,
      'birthdate': birthday,
      'gender': gender,
      'image': image,
      'manuFactorId': manuFactorId,
    };
  }
}
