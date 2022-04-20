class Baby {
  final int baby_id;
  final String baby_name;
  final int baby_phone;
  final String baby_password;
  final String baby_email;
  final String baby_city;
  // final String experience;




  const Baby({
    required this.baby_id,
    required this.baby_name,
    required this.baby_phone,
    required this.baby_password,
    required this.baby_email,
    required this.baby_city,
    // required this.experience,



  }
  );
  factory Baby.fromMap(Map<String, dynamic> data) => new Baby(
    baby_id: data['id'],
    baby_name: data['name'],
    baby_phone: data['phone'],
    baby_password: data['password'],
    baby_email: data['email'],
    baby_city: data['city'],
    // experience: data['experience'],



  );



  Map<String , dynamic> toMap(){
    return {
      'id':baby_id,
      "name": baby_name,
      "phone":baby_phone,
      "password":baby_password,
      "email":baby_email,
      "city":baby_city,
      // "experience":experience,

    };
  }


  @override
  String toString(){
    return 'baby{id:$baby_id , name: $baby_name , phone:$baby_phone , password: $baby_password ,email: $baby_email , "city:$baby_city }';

  }
}

