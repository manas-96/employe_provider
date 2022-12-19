class UserModel{
  int? id;
  String? name;
  String? email;
  String? mobile;
  int? availability;
  String? providerId;
  String? workNumber;
  String? address;
  String? country;
  String? zip;
  String? city;
  String? state;
  String? releaseDate;
  String? hireDate;
  String? rate;
  String? rating;
  String? image;
  UserModel(this.id,this.email,this.name,this.availability,this.mobile,this.providerId,
      this.zip,this.city,this.address,this.country,this.workNumber,this.state,this.hireDate,
      this.image,this.rate,this.rating,this.releaseDate);

  UserModel.fromJson(Map<String,dynamic>json):
        id=json["id"],
        name=json["name"],
        email=json["email"],
        availability=json["availability"],
        mobile=json["mobile"],
        providerId=json["provider_id"],
        zip=json["zip"],
        city=json["city"],
        state=json["state"],
        workNumber=json["work_phone"],
        hireDate=json["hire_date"],
        releaseDate=json["release_date"],
        image=json["profile_image"],
        rating=json["rating"];
}