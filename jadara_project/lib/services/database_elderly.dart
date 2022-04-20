class Elderly {
  final int elderly_id;
  final String elderly_name;
  final int elderly_phone;
  final String elderly_password;
  final String elderly_email;
  final String elderly_city;




  const Elderly({
  required this.elderly_id,
  required this.elderly_name,
  required  this.elderly_phone,
  required this.elderly_password,
  required  this.elderly_email,
  required this.elderly_city,


  } );

  factory Elderly.fromMap(Map<String, dynamic> data) => new Elderly(
    elderly_id: data['id'],
    elderly_name: data['name'],
    elderly_phone: data['phone'],
    elderly_password: data['password'],
    elderly_email: data['email'],
    elderly_city: data['city'],

  );
  Map<String , dynamic> toMap(){
    return {
      'id':elderly_id,
      "name": elderly_name,
      "phone":elderly_phone,
      "password":elderly_password,
      "email":elderly_email,
      "city":elderly_city
    };
  }

  @override
  String toString(){
    return 'baby{id:$elderly_id , name: $elderly_name , phone:$elderly_phone , password: $elderly_password ,email: $elderly_email , "city:$elderly_city}';

  }
}
