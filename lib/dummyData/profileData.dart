class ProfileData {
  final String name;
  final String mobile;
  final String email;
  final List<UserAddress> address;
  final String imagePath;

  ProfileData({
    required this.name,
    required this.mobile,
    required this.email,
    required this.address,
    required this.imagePath,
  });
}

class UserAddress {
  final String address;
  final bool primary;
  UserAddress({required this.address, this.primary = false});
}

final List<ProfileData> profileData = [
  ProfileData(
    name: "Samrat Khan",
    mobile: "+91-123456789",
    email: "Samrat@mail.com",
    imagePath: "assets/images/u7.png",
    address: [
      UserAddress(
          address: "Dutta Pukur, Kolkata, West Bengal,Pin-700008",
          primary: true),
      UserAddress(address: "Mayapur, Nabadwip, Nadia, West Bengal,Pin-741313"),
    ],
  ),
];
