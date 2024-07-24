class PermissionModel{
  String? id;
  bool? superAdmin;
  bool? organizationAdmin;
  bool? merchant;
  bool? serviceAgent;
  bool? fieldAgent;
  bool? inventoryWorker;
  bool? consumer;

  PermissionModel(
      {this.id,
      this.superAdmin,
      this.organizationAdmin,
      this.merchant,
      this.serviceAgent,
      this.fieldAgent,
      this.inventoryWorker,
      this.consumer});

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      id: json['_id'],
      superAdmin: json['superAdmin'],
      organizationAdmin: json['organizationAdmin'],
      merchant: json['merchant'],
      serviceAgent: json['serviceAgent'],
      fieldAgent: json['fieldAgent'],
      inventoryWorker: json['inventoryWorker'],
      consumer: json['consumer'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'superAdmin': superAdmin,
      'organizationAdmin': organizationAdmin,
      'merchant': merchant,
      'serviceAgent': serviceAgent,
      'fieldAgent': fieldAgent,
      'inventoryWorker': inventoryWorker,
      'consumer': consumer,
    };
  }
}