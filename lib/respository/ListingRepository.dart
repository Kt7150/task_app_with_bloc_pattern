import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:task_app_with_bloc_pattern/model/ListingModel.dart'; // Import your ListingModel

class ListingRepository {
  Future<ListingModel> fetchListingData() async {
    final response = await http.get(Uri.parse('https://mocki.io/v1/cead1ab5-8153-4557-a587-f6ebb2710769'));
    if (response.statusCode == 200) {
      print(response.body);
      final Map<String, dynamic> jsonData = json.decode(response.body);
      final ListingModel listingModel = ListingModel.fromJson(jsonData);
      print(listingModel);
      return listingModel;
    } else {
      throw Exception('Failed to load Listing data');
    }
  }
}
