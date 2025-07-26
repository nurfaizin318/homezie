import 'package:get/get.dart';

class RecommendationController extends GetxController {
  var recommendations = [
    {
      'ranking': 1,
      'name': 'Aretha Raya Living',
      'image_url': 'https://nfmzjkdmokamtjyrcjhw.supabase.co/storage/v1/object/sign/housezie/house/aretha-living.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84MmY4NmY4Mi05MDE3LTRhZmItOWE5My00NjViODkxOGUyZDMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJob3VzZXppZS9ob3VzZS9hcmV0aGEtbGl2aW5nLmpwZyIsImlhdCI6MTc1MzI2NzYyMiwiZXhwIjoxNzg0ODAzNjIyfQ.VHKVNybrNSrk2ebSna_QH0ojnuuk2bsu4OmEe396tkw',
    },
    {
      'ranking': 2,
      'name': 'Mainroad Bojong Koneng',
      'image_url': 'https://nfmzjkdmokamtjyrcjhw.supabase.co/storage/v1/object/sign/housezie/house/mainroad.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84MmY4NmY4Mi05MDE3LTRhZmItOWE5My00NjViODkxOGUyZDMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJob3VzZXppZS9ob3VzZS9tYWlucm9hZC5qcGciLCJpYXQiOjE3NTMyNjc2MzcsImV4cCI6MTc4NDgwMzYzN30.S5mdSZHynVGAYgELiVxU6nr8IWlFnMzQbGqVjprzmSU',
    },
    {
      'ranking': 3,
      'name': 'Podomoro Modern Milineal',
      'image_url': 'https://nfmzjkdmokamtjyrcjhw.supabase.co/storage/v1/object/sign/housezie/house/podomoro.jpg?token=eyJraWQiOiJzdG9yYWdlLXVybC1zaWduaW5nLWtleV84MmY4NmY4Mi05MDE3LTRhZmItOWE5My00NjViODkxOGUyZDMiLCJhbGciOiJIUzI1NiJ9.eyJ1cmwiOiJob3VzZXppZS9ob3VzZS9wb2RvbW9yby5qcGciLCJpYXQiOjE3NTMyNjc2NjksImV4cCI6MTc4NDgwMzY2OX0.KVtfOtKxE1dIiJ90atGqYh6-ncq55IwTLMSfWeTswp4',
    },
  ].obs;


 void navigateToCalculator() {
    Get.toNamed('/financing');
 }
}
