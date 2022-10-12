
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:icollekt/Exports/Exports.dart';

final cartProvider =ChangeNotifierProvider((ref)=>CartProvider());
class CartProvider extends ChangeNotifier{
int?sellerid;
int? productid;
int? addressid;
String? sellername;
}
final checkoutProvider =ChangeNotifierProvider((ref)=>CheckoutProvider());
class CheckoutProvider extends ChangeNotifier{
int?sellerid;
int? productid;
int? addressid;
List?product;
String? sellername;
String? phonenumber;
String? grandtotal;
String? buyername;
String? street;
String? state;
String? country;
String? pincode;
}