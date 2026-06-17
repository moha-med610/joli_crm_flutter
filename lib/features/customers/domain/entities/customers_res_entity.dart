class AllCustomers {
  final String message;
  final List<Customers> data;

  AllCustomers(this.message, this.data);
}

class SingleCustomer {
  final String message;
  final Customers data;

  SingleCustomer(this.message, this.data);
}

class Customers {
  final String id;
  final String company;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String? whatsapp;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  Customers({
    required this.id,
    required this.company,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    required this.whatsapp,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
}

class CompanyData {
  final String id;
  final String companyName;

  CompanyData(this.id, this.companyName);
}

class CreateCustomer {
  final String id;
  final String companyId;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String? whatsapp;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  CreateCustomer({
    required this.id,
    required this.companyId,
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    this.whatsapp,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });
}

class DeleteCustomer {
  final String message;
  final Map<String, dynamic> data;

  DeleteCustomer(this.message, this.data);
}
