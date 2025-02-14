// ignore_for_file: file_names, must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../logic/user/user.dart';

class UpdateNameModalSheet extends StatelessWidget {
  String accessToken;

  UpdateNameModalSheet({super.key, required this.accessToken});

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Update Phone',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Enter new phone',
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the modal sheet
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () async {
                  // Perform the name update logic here

                    String enteredText = _nameController.text;
                    if (enteredText.isEmpty || enteredText.length < 10){
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Validation Error'),
                            content: const Text("Please enter  the channel code"),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }else{

                      try{
                        String phone = '254${enteredText.substring(1)}';
                        await updateUser(phone, accessToken);
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());
                      }
                    }
                  // ...
                  Navigator.of(context).pop(); // Close the modal sheet
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Usage example
void showUpdateNameModalSheet(BuildContext context, String accessToken) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return UpdateNameModalSheet(accessToken: accessToken,);
    },
  );
}
