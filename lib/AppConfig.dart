// ignore: non_constant_identifier_names
var this_year = DateTime.now().year.toString();

class AppConfig {
  // ignore: non_constant_identifier_names
  static String copyright_text =
      "@Icollekt" + this_year; //this shows in the splash screen
  // ignore: non_constant_identifier_names
  static String app_name =
      "Icollekt"; //this shows in the splash screen

  //configure this
  static const bool HTTPS = false;

  //configure this
  //static const DOMAIN_PATH = "192.168.0.108/ecommerce_demo_three";
  //static const DOMAIN_PATH = "demo.activeitzone.com/ecommerce_flutter_demo";
  static const DOMAIN_PATH = "i-collekt.crosshurdle.com:3000";

  //do not configure these below
  static const String API_ENDPATH = "api";
  static const String PUBLIC_FOLDER = "public";
  static const String User_PREFIX = "User";
  static const String PROTOCOL = HTTPS ? "https://" : "http://";
  static const String RAW_BASE_URL = "$PROTOCOL$DOMAIN_PATH";
  static const String BASE_URL = "$RAW_BASE_URL/$API_ENDPATH";

  //configure this if you are using amazon s3 like services
  //give direct link to file like https://[[bucketname]].s3.ap-southeast-1.amazonaws.com/
  //otherwise do not change anythink
  static const String BASE_PATH = "$RAW_BASE_URL/$PUBLIC_FOLDER/";
}
