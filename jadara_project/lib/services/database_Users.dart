class Users {
  final String user_name;
  final String user_email;
  final String user_password;
  final int user_id;
  final int user_phone;
  final String user_city;



  const Users({
    required this.user_id,
    required this.user_name,
    required this.user_phone,
    required this.user_password,
    required this.user_email,
    required this.user_city,

  } );
  // job screen
  factory Users.fromMap(Map<String, dynamic> data) => new Users(
      user_id: data['id'],
      user_name: data['name'],
      user_phone: data['phone'],
      user_password: data['password'],
      user_email: data['email'],
      user_city: data['city'],
  );
  Map<String , dynamic> toMap(){
    return {
      'id':user_id,
      "name": user_name,
      "phone":user_phone,
      "password":user_password,
      "email":user_email,
      "city":user_city
    };
  }

  @override
  String toString(){
    return 'usrs{id:$user_id , name: $user_name , phone:$user_phone , password: $user_password ,email: $user_email , "city:$user_city}';

  }


}
