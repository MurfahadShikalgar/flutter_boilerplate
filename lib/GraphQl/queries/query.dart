
const String allProductsQuery = """
  query allProducts {
  products(first: 10, channel: "default-channel") {
    edges {
      node{
        id
        name
        description
      }
    }
  }
}
""";
