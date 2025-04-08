import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../coustmer/home/home_view.dart';

class ShopOwnerSignIn extends StatefulWidget {
  @override
  _ShopOwnerSignInState createState() => _ShopOwnerSignInState();
}

class _ShopOwnerSignInState extends State<ShopOwnerSignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _shopAddressController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<File> _shopPhotos = [];

  Future<void> _pickImages(ImageSource source) async {
    final pickedFiles = await _picker.pickMultiImage(imageQuality: 80);

    if (pickedFiles != null) {
      setState(() {
        if (_shopPhotos.length + pickedFiles.length <= 6) {
          _shopPhotos.addAll(pickedFiles.map((file) => File(file.path)));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("You can select up to 6 images only!")),
          );
        }
      });
    }
  }

  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) =>
          Container(
            padding: EdgeInsets.all(10),
            height: 180,
            child: Column(
              children: [
                //  Text("Choose Image Source", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                  onTap: () async {
                    Navigator.pop(context);
                    final pickedFile = await _picker.pickImage(
                        source: ImageSource.camera, imageQuality: 80);
                    if (pickedFile != null) {
                      setState(() {
                        if (_shopPhotos.length < 6) {
                          _shopPhotos.add(File(pickedFile.path));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(
                                "You can select up to 6 images only!")),
                          );
                        }
                      });
                    }
                  },
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Gallery"),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImages(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
    );
  }

  void _deletePhoto(int index) {
    setState(() {
      _shopPhotos.removeAt(index);
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_shopPhotos.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please upload at least 1 shop photo")),
        );
        return;
      }

      print("Owner Name: ${_nameController.text}");
      print("Phone: ${_phoneController.text}");
      print("Email: ${_emailController.text}");
      print("Shop Name: ${_shopNameController.text}");
      print("Shop Address: ${_shopAddressController.text}");
      print("Total Photos: ${_shopPhotos.length}");
    }
  }

  Widget _buildTextField(
      {required TextEditingController controller, required String label, bool isPassword = false, TextInputType? keyboardType}) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black87),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
        ),
        validator: (value) => value!.isEmpty ? "Enter $label" : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.22,
              child: Image.asset(
                'assets/images/background image.png',
                // Make sure the image is added in assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(11.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTextField(
                        controller: _nameController, label: "Owner Name"),
                    _buildTextField(controller: _phoneController,
                        label: "Phone Number",
                        keyboardType: TextInputType.phone),
                    _buildTextField(controller: _emailController,
                        label: "Email ID",
                        keyboardType: TextInputType.emailAddress),
                    _buildTextField(controller: _passwordController,
                        label: "Password",
                        isPassword: true),
                    _buildTextField(
                        controller: _shopNameController, label: "Shop Name"),
                    _buildTextField(controller: _shopAddressController,
                        label: "Shop Address"),
                    SizedBox(height: 5),
                    GestureDetector(
                      onTap: _showImagePicker,
                      child: _shopPhotos.isEmpty
                          ? Container(
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("Upload Shop Photos")),
                      )
                          : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _shopPhotos.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (context, index) =>
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    _shopPhotos[index],
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  right: 2,
                                  child: GestureDetector(
                                    onTap: () => _deletePhoto(index),
                                    child: Container(
                                      padding: EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                          Icons.close, color: Colors.white,
                                          size: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.maxFinite,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          _submitForm(); // Call your form submission logic first

                          // Then navigate to the Home screen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeView()),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
