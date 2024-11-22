import 'package:equatable/equatable.dart';

class Client extends Equatable {
  final int? id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? address;
  final String? photo;
  final String? caption;
  final DateTime? created;
  final DateTime? updated;

  const Client({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
    this.created,
    this.updated,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      address: json['address'],
      photo: json['photo'],
      caption: json['caption'],
      created: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updated: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'address': address,
      'photo': photo,
      'caption': caption,
      'created_at': created?.toIso8601String(),
      'updated_at': updated?.toIso8601String(),
    };
  }

  Client copyWith({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? address,
    String? photo,
    String? caption,
    DateTime? created,
    DateTime? updated,
  }) {
    return Client(
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      address: address ?? this.address,
      photo: photo ?? this.photo,
      caption: caption ?? this.caption,
      created: created ?? this.created,
      updated: updated ?? this.created,
    );
  }

  @override
  String toString() {
    return 'Client{id: $id, firstname: $firstname, lastname: $lastname, email: $email, address: $address, photo: $photo, caption: $caption, created: $created, updated}';
  }

  @override
  List<Object?> get props => [
        id,
        firstname,
        lastname,
        email,
        address,
        photo,
        caption,
        created,
        updated
      ];
}
