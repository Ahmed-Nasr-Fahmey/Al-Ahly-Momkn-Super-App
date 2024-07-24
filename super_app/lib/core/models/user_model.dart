
import 'package:super_app/core/models/permission_model.dart';

import 'national_id_model.dart';

class UserModel {
   String? userID;
   String? userName;
   String? userEmail;
   String? userPassword;
   NationalIdModel? nid  = NationalIdModel();
   String? mobileNumber;
  // String? organizationId;
   String? organizationName;
   bool? userStatus;
   int? businessUserId;
   PermissionModel? permission = PermissionModel();

  UserModel({
    this.userID,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.nid,
    this.userStatus,
    this.businessUserId,
    //this.organizationId,
    this.organizationName,
    this.permission,
    this.mobileNumber
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userID: json['_id'],
      userName: json['username'],
      userEmail: json['userEmail'],
      userPassword: json['userPassword'],
      nid: NationalIdModel.fromJson(json['userNationalID']),
      businessUserId: json['businessUserId'],
      //organizationId: json['organizationId'],
      organizationName: json['organizationName'],
      permission: PermissionModel.fromJson(json['permissionId']),
      userStatus: json['userStatus'],
      mobileNumber: json['userMobileNumber']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'username': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userNationalID': nid,
      'businessUserId': businessUserId,
      //'organizationId': organizationId,
      'organizationName': organizationName,
      'permissionId': permission,
      'userStatus': userStatus,
      'userMobileNumber': mobileNumber
    };
  }
}
