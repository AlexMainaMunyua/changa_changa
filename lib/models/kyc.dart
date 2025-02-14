// ignore_for_file: non_constant_identifier_names


class KycUserModel {
  String? id_number;
  String? nationality;
  String? id_document_type;
  String? date_of_birth;
  String? postal_code;
  String? country_code;
  String? full_name;
  Address? address;

  KycUserModel({
    this.id_number,
    this.nationality,
    this.id_document_type,
    this.date_of_birth,
    this.postal_code,
    this.country_code,
    this.full_name,
    this.address
  });

  factory KycUserModel.fromJson(Map<String, dynamic> json) {
    return KycUserModel(
        id_number: json['id_number'],
        nationality: json['nationality'],
        full_name: json['full_name'],
        id_document_type: json['id_document_type'],//lastName: json['lastName'],
        date_of_birth: json['date_of_birth'],
        country_code: json['country_code'],
        postal_code: json['postal_code'],
        address: json['address']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id_number': id_number,
      'nationality': nationality,
      'full_name': full_name,
      'id_document_type': id_document_type,
      'date_of_birth': date_of_birth,
      'country_code': country_code,
      'postal_code': postal_code,
      'address': address,
    };
  }
}

class Address {
  String? address_line;
  String? postal_code;
  String? country;

  Address({
    this.address_line,
    this.postal_code,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address_line: json['address_line'],
      postal_code: json['postal_code'],
      country: json['country'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'address_line': address_line,
      'postal_code': postal_code,
      'country': country,
    };
  }
}


