import 'package:flutter/material.dart';
import 'package:mood_tracking/src/user_model.dart';
import 'package:provider/provider.dart';


// Manages the different factor and emotion groups
// This is where the user adds or removes groups/members of the groups


class ManageScreen extends StatefulWidget {
  const ManageScreen({Key? key}) : super(key: key);

  @override
  _ManageScreenState createState() => _ManageScreenState();
}

class _ManageScreenState extends State<ManageScreen> {
  @override
  Widget build(BuildContext context) {
    return const FactorGroupForm();
  }
}



class FactorGroupForm extends StatefulWidget {
  const FactorGroupForm({Key? key}) : super(key: key);

  @override
  _FactorGroupFormState createState() => _FactorGroupFormState();
}

class _FactorGroupFormState extends State<FactorGroupForm> {

  final GlobalKey<FormState> _factorGroupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _factorGroupFormKey,
      child: Consumer<UserModel>(
        builder: (context, user, child) {
          return Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter a new Factor Group Title",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name for the factor group';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                child: const Text("Add to factor groups"),
                onPressed: () {
                  if (_factorGroupFormKey.currentState!.validate()) {
                    // runs when the form is valid and button is pressed
                  }
                },
              ),
            ],
          );
        }
      ),
    );
  }
}
