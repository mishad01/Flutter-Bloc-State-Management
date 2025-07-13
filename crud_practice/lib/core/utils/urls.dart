class Urls {
  static const String baseUrl = 'https://crud.teamrabbil.com/api/v1';
  static const String createProduct =
      'https://crud.teamrabbil.com/api/v1/CreateProduct';
  static String updateProduct(String id) => '$baseUrl/UpdateProduct/$id';
  static String deleteProduct(String id) => '$baseUrl/DeleteProduct/$id';
  static String getProducts = '$baseUrl/ReadProduct';
}
