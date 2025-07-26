import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:homzie/Module/PropertyList/viewModel.dart';
import 'package:homzie/Theme/appColors.dart';

class PropertyList extends StatelessWidget {
  const PropertyList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PropertyListController>();
    final List<Map<String, dynamic>> dummyProperties = [
      {
        'name': 'Rumah Mainroad',
        'price': 'Rp 2.300.000.000',
        'landArea': '495m²',
        'buildingArea': '185m²',
        'bedroom': '4',
        'location': 'Bojong Koneng Cikutra, Bandung',
        'image': 'https://nfmzjkdmokamtjyrcjhw.supabase.co/storage/v1/object/sign/housezie/house/mainroad.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84MmY4NmY4Mi05MDE3LTRhZmItOWE5My00NjViODkxOGUyZDMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJob3VzZXppZS9ob3VzZS9tYWlucm9hZC5qcGciLCJpYXQiOjE3NTMyNjc2MzcsImV4cCI6MTc4NDgwMzYzN30.S5mdSZHynVGAYgELiVxU6nr8IWlFnMzQbGqVjprzmSU',
      },
      {
        'name': 'Podomoro Modern Milineal',
        'price': 'Rp 800.000.000',
        'landArea': '60m²',
        'buildingArea': '31m²',
        'bedroom': '2',
        'location': 'Bojongsoang, Bandung',
        'image': 'https://nfmzjkdmokamtjyrcjhw.supabase.co/storage/v1/object/sign/housezie/house/podomoro.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84MmY4NmY4Mi05MDE3LTRhZmItOWE5My00NjViODkxOGUyZDMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJob3VzZXppZS9ob3VzZS9wb2RvbW9yby5qcGciLCJpYXQiOjE3NTMyNjc2NjksImV4cCI6MTc4NDgwMzY2OX0.KVtfOtKxE1dIiJ90atGqYh6-ncq55IwTLMSfWeTswp4',
      },
      {
        'name': 'Aretha Raya Living',
        'price': 'Rp 696.000.000',
        'landArea': '90m²',
        'buildingArea': '72m²',
        'bedroom': '2',
        'location': 'Ciganitri, Buah Batu, Bandung',
        'image': 'https://nfmzjkdmokamtjyrcjhw.supabase.co/storage/v1/object/sign/housezie/house/aretha-living.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84MmY4NmY4Mi05MDE3LTRhZmItOWE5My00NjViODkxOGUyZDMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJob3VzZXppZS9ob3VzZS9hcmV0aGEtbGl2aW5nLmpwZyIsImlhdCI6MTc1MzI2NzYyMiwiZXhwIjoxNzg0ODAzNjIyfQ.VHKVNybrNSrk2ebSna_QH0ojnuuk2bsu4OmEe396tkw',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Property List',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.black),
            onPressed: () {
              // action add di sini
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: dummyProperties.length,
              itemBuilder: (context, index) {
                final property = dummyProperties[index];
                return PropertyCard(
                  name: property['name'],
                  price: property['price'],
                  landArea: property['landArea'],
                  buildingArea: property['buildingArea'],
                  bedroom: property['bedroom'],
                  location: property['location'],
                  image: property['image'],
                );
              },
            ),
          ),
          SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  controller.navigateToSimulation();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Simulation',
                  style: TextStyle(fontSize: 16, color: AppColors.background),
                ),
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String name;
  final String price;
  final String landArea;
  final String buildingArea;
  final String bedroom;
  final String location;
  final String image;

  const PropertyCard({
    super.key,
    required this.name,
    required this.price,
    required this.landArea,
    required this.buildingArea,
    required this.bedroom,
    required this.location,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: image.isNotEmpty && image.startsWith('http')
                  ? Image.network(
                image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  );
                },
              )
                  : Image.asset(
                'assets/images/house-icon.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.square_foot, size: 16),
                      SizedBox(width: 4),
                      Text(landArea),
                      SizedBox(width: 8),
                      Icon(Icons.home_work_outlined, size: 16),
                      SizedBox(width: 4),
                      Text(buildingArea),
                      SizedBox(width: 8),
                      Icon(Icons.bed, size: 16),
                      SizedBox(width: 4),
                      Text(bedroom),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
