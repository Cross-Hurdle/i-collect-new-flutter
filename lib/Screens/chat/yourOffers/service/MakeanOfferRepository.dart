import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:icollekt/Exports/Exports.dart';

import '../Model/MakeAnOffer.dart';
import '../Model/YourOfferModle/AcceptOfferModel.dart';
import '../Model/YourOfferModle/OtherOfferModel.dart';
import '../Model/YourOfferModle/PendingOfferModel.dart';

class MakeAnRepository {
  late PendingOfferModle pendinglist;
  late OtherOfferModle otherOfferModle;
  late AcceptOfferModle acceptOfferModle;
  late MakeAnOfferModle makeAnOfferModle;
  Future<PendingOfferModle> getpendingOffer() async {
//print(email);

    final response = await Dio().get(
      "http://$baseurl/api/make-price/pending/offer/${preferences.getInt('Userid')}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    pendinglist = PendingOfferModle.fromJson(response.data);
    return pendinglist;
  }

  Future<AcceptOfferModle> getAcceptedOffer() async {
//print(email);

    final response = await Dio().get(
      "http://$baseurl/api/make-price/accept/list/offer/${preferences.getInt('Userid')}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    acceptOfferModle = AcceptOfferModle.fromJson(response.data);
    return acceptOfferModle;
  }

  Future<OtherOfferModle> getOtherOffer() async {
//print(email);

    final response = await Dio().get(
      "http://$baseurl/api/make-price/bargain/reject/list/offer/${preferences.getInt('Userid')}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    otherOfferModle = OtherOfferModle.fromJson(response.data);
    print(otherOfferModle);
    return otherOfferModle;
  }

  Future<MakeAnOfferModle> getMakeAnOffer() async {
//print(email);

    final response = await Dio().post(
      "http://$baseurl/api/make-price/alloffers/all/bargain/${preferences.getInt('Userid')}",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );

    makeAnOfferModle = MakeAnOfferModle.fromJson(response.data);
    return makeAnOfferModle;
  }

  Future offerstaus({required id, required status}) async {
    var postBody = jsonEncode({"status": status, "id": id});
    print(status);

    final response =
        await Dio().post("http://$baseurl/api/make-price/bargain/update_Offer/",
            options: Options(
              headers: {
                "Content-Type": "application/json",
              },
            ),
            data: postBody);
    return response.data;
  }
}
