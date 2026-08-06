class ApiConstants {
  // Base Url
  static const String baseUrl = "http://localhost:3000/";

  // Auth
  static const String login = "auth/login";
  static const String forgetPassword = "auth/forget-password";
  static const String verifyOtpForgetPassword = "auth/verify-otp";
  static const String resetPassword = "auth/reset-password";
  static const String changePassword = "auth/change-password";
  static const String logout = "auth/logout";
  static const String refreshToken = "auth/refresh-token";
  static const String profile = "auth/me";

  // Customers
  static const String getAllCustomers = "customers";
  static const String searchCustomers = "customers/search";
  static const String getSingleCustomer = "customers/{customerId}";
  static const String createCustomer = "customers";
  static const String updateCustomer = "customers/{customerId}";
  static const String deleteCustomer = "customers/{customerId}";

  // Products
  static const String products = "products";
  static const String getProductsById = "products/{productId}";
  static const String updateProduct = "products/update/{productId}";
  static const String deleteProduct = "products/delete/{productId}";

  static const String createCategory = "categories/add-category";
  static const String getAllCategories = "categories/all";
}
