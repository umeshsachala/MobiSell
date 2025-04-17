import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPhoneScreen extends StatefulWidget {
  const AddPhoneScreen({super.key});

  @override
  State<AddPhoneScreen> createState() => _AddPhoneScreenState();
}

class _AddPhoneScreenState extends State<AddPhoneScreen> {
  final _phoneNameController = TextEditingController();
  final _phoneModelController = TextEditingController();
  final _phonePriceController = TextEditingController();
  final _storageController = TextEditingController();
  final _ramController = TextEditingController();
  final _descriptionController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  List<File> _pickedImages = [];

  String _selectedCondition = 'New';
  final List<String> _conditionOptions = ['New', 'Used', 'Refurbished'];

  String _selectedBrand = 'Samsung';
  final List<String> _brandOptions = [
    'Samsung',
    'Apple',
    'OnePlus',
    'Xiaomi',
    'Realme',
    'Oppo',
    'Vivo',
    'Motorola',
    'Nokia',
    'Google',
    'Sony',
    'Huawei',
    'Asus',
    'Lenovo',
  ];

  Future<void> _pickImages() async {
    final pickedFiles = await _picker.pickMultiImage();
    if (pickedFiles != null) {
      if (_pickedImages.length + pickedFiles.length > 7) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("You can select up to 7 images only")),
        );
        return;
      }

      setState(() {
        _pickedImages.addAll(pickedFiles.map((x) => File(x.path)));
      });
    }
  }

  void _submitPhone() {
    if (_phoneNameController.text.isNotEmpty &&
        _phoneModelController.text.isNotEmpty &&
        _phonePriceController.text.isNotEmpty &&
        _selectedBrand.isNotEmpty &&
        _storageController.text.isNotEmpty &&
        _ramController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _pickedImages.isNotEmpty) {
      Navigator.pop(context, {
        "name": _phoneNameController.text,
        "model": _phoneModelController.text,
        "price": _phonePriceController.text,
        "brand": _selectedBrand,
        "storage": _storageController.text,
        "ram": _ramController.text,
        "condition": _selectedCondition,
        "description": _descriptionController.text,
        "images": _pickedImages,
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields and select images"),
        ),
      );
    }
  }

  @override
  void dispose() {
    _phoneNameController.dispose();
    _phoneModelController.dispose();
    _phonePriceController.dispose();
    _storageController.dispose();
    _ramController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Phone'),
      //  backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                ..._pickedImages.map(
                  (image) => Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          image,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: -6,
                        right: -6,
                        child: IconButton(
                          icon: const Icon(Icons.cancel, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _pickedImages.remove(image);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (_pickedImages.length < 7)
                  GestureDetector(
                    onTap: _pickImages,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.add_a_photo, color: Colors.grey),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneNameController,
              decoration: const InputDecoration(labelText: 'Phone Name'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedBrand,
              items:
                  _brandOptions.map((brand) {
                    return DropdownMenuItem<String>(
                      value: brand,
                      child: Text(brand),
                    );
                  }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectedBrand = val!;
                });
              },
              decoration: const InputDecoration(labelText: 'Brand'),
            ),
            TextField(
              controller: _phoneModelController,
              decoration: const InputDecoration(labelText: 'Model'),
            ),
            TextField(
              controller: _phonePriceController,
              decoration: const InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _storageController,
              decoration: const InputDecoration(
                labelText: 'Storage (e.g. 128GB)',
              ),
            ),
            TextField(
              controller: _ramController,
              decoration: const InputDecoration(labelText: 'RAM (e.g. 6GB)'),
            ),
            DropdownButtonFormField<String>(
              value: _selectedCondition,
              items:
                  _conditionOptions.map((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
              onChanged: (val) {
                setState(() {
                  _selectedCondition = val!;
                });
              },
              decoration: const InputDecoration(labelText: "Condition"),
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _submitPhone,
              icon: const Icon(Icons.check),
              label: const Text("Add Phone"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
