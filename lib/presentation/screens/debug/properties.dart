import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:imba/data/models/property_listing_model.dart';
import 'package:imba/data/repositories/property_repository.dart';

class PropertiesScreen extends StatefulWidget {
  @override
  _PropertiesScreenState createState() => _PropertiesScreenState();
}

class _PropertiesScreenState extends State<PropertiesScreen> {
  final PropertyRepository propertyService = PropertyRepository(dio: Dio());
  late Future<List<PropertyListing>> futureProperties;

  @override
  void initState() {
    super.initState();
    futureProperties = propertyService.getAllProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Properties List')),
      body: FutureBuilder<List<PropertyListing>>(
        future: futureProperties,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No properties found'));
          }

          List<PropertyListing> properties = snapshot.data!;

          return ListView.builder(
            itemCount: properties.length,
            itemBuilder: (context, index) {
              final property = properties[index];
              return ListTile(
                title: Text(property.listingName),
                subtitle: Text(property.location),
                trailing: Text(property.service),
              );
            },
          );
        },
      ),
    );
  }
}


class ListingDetailsScreen extends StatefulWidget {
  final String listingName;

  ListingDetailsScreen({required this.listingName});

  @override
  _ListingDetailsScreenState createState() => _ListingDetailsScreenState();
}

class _ListingDetailsScreenState extends State<ListingDetailsScreen> {
  final PropertyRepository listingService = PropertyRepository(dio: Dio());
  late Future<PropertyListing> futureListing;

  @override
  void initState() {
    super.initState();
    futureListing = listingService.getListingById(widget.listingName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listing Details')),
      body: FutureBuilder<PropertyListing>(
        future: futureListing,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No listing found'));
          }

          PropertyListing listing = snapshot.data!;

          return Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(listing.listingName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Location: ${listing.location}', style: TextStyle(fontSize: 18)),
                Text('Price: \$${listing.price}', style: TextStyle(fontSize: 18)),
                Text('Service: ${listing.service}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('Description:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(listing.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          );
        },
      ),
    );
  }
}
