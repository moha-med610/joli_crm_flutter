class AllCustomers {
  final String message;
  final List<Customers> data;

  AllCustomers(this.message, this.data);
}

class SingleCustomer {
  final String message;
  final Customers? data;

  SingleCustomer(this.message, this.data);
}

class Customers {
  final String id;
  final CompanyData company;
  final String name;
  final String phone;
  final String address;
  final String city;
  final String? whatsapp;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;

  Customers(
    this.id,
    this.company,
    this.name,
    this.phone,
    this.address,
    this.city,
    this.whatsapp,
    this.notes,
    this.createdAt,
    this.updatedAt,
  );
}

class CompanyData {
  final String id;
  final String companyName;

  CompanyData(this.id, this.companyName);
}
