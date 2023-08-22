import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/BannerModel.dart'; // Import your BannerModel class

class BannerRepository {
   Future<BannerModel> fetchBannerData() async {
      final response = await http.get(Uri.parse('https://mocki.io/v1/783f8c69-af91-45ff-87df-e675c3f11fef'));
       print(response);
      if (response.statusCode == 200) {
         return BannerModel.fromJson(json.decode(response.body));
      } else {
         throw Exception('Failed to load banner data');
      }
   }
}
