import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../Exports/Exports.dart';
import '../Model/AddToCartListModle.dart';
import '../Model/CheckoutModle.dart';

//var baseurl='i-collekt.jksoftec.com:3001';
class CartRepository {
  late AddToCartListModle cartlist;
  late CheckoutSummaryModle checkoutSummaryModle;
  Future<AddToCartListModle> getAddTOCartProduct() async {
//print(email);

    final response = await Dio().get(
      "http://$baseurl/api/carts/carts-details/${preferences.getInt('Userid')}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    cartlist = AddToCartListModle.fromJson(response.data);
    return cartlist;
  }

  Future<CheckoutSummaryModle> getcartSummary(addressid, sellerid) async {
    print("addressid: $addressid");
    print("sellerid :$sellerid");
    final response = await Dio().get(
      "http://$baseurl/api/carts/cart-summary/$sellerid/${preferences.getInt('Userid')}/$addressid",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    checkoutSummaryModle = CheckoutSummaryModle.fromJson(response.data);
    return checkoutSummaryModle;
  }

  Future cart({required userid, required productid}) async {
    var postBody = jsonEncode({
      "product_id": productid,
      "user_id": userid,
    });
//print(email);

    final response = await Dio().post("http://$baseurl/api/carts/add-cart",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: postBody);
    return response.data;
  }

  Future cartDelete({required userid, required sellerid}) async {
    var postBody = jsonEncode({
      "owner_id": sellerid,
      "user_id": userid,
    });
//print(email);

    final response =
        await Dio().post("http://$baseurl/api/carts/bulk-carts-delete/delete",
            options: Options(
              headers: {
                "Content-Type": "application/json",
              },
            ),
            data: postBody);
    return response.data;
  }

  Future cartProductDelete({required userid, required productid}) async {
    var postBody = jsonEncode({
      "user_id": userid,
      "product_id": productid,
    });
//print(email);

    final response = await Dio().post("http://$baseurl/api/carts/carts-delete/",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: postBody);
    print(response.data);
    return response.data;
  }
}
