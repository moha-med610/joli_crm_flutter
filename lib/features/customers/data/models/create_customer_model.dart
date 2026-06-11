class CreateCustomerModel {
  final String name;
  final String phone;
  final String address;
  final String city;
  final String? whatsapp;
  final String? nodes;

  CreateCustomerModel({
    required this.name,
    required this.phone,
    required this.address,
    required this.city,
    this.whatsapp,
    this.nodes,
  });
}
