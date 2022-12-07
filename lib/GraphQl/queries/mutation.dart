String deleteItemMutation(String id) { 
  return """
  mutation deleteItem{
  productDelete(id: "$id"){
    product{
      id
    }
  }
}
""";
}
