class ClientBody {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? address;
  final String? photo;
  final String? caption;

  const ClientBody({
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'address': address,
      'photo': photo,
      'caption': caption,
    };
  }
}
