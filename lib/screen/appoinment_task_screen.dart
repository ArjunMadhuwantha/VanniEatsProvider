import 'package:flutter/material.dart';
import 'package:servicehub_client/Colors.dart';
import 'package:servicehub_client/screen/task_confirmation_screen.dart';
import 'package:servicehub_client/styles.dart';

class AppoinmentTaskScreen extends StatefulWidget {
  const AppoinmentTaskScreen({super.key});

  @override
  State<AppoinmentTaskScreen> createState() => _AppoinmentTaskScreenState();
}

class _AppoinmentTaskScreenState extends State<AppoinmentTaskScreen> {
  final dateControlleer = TextEditingController();
  final timeControlleer = TextEditingController();
  final budgetControlleer = TextEditingController();
  final locationControlleer = TextEditingController();
  final additionalInformationControlleer = TextEditingController();

  final dateFocusNode = FocusNode();
  final timeFocusNode = FocusNode();
  final budgetFocusNode = FocusNode();
  final locationFocusNode = FocusNode();
  final additionalInformationFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    dateControlleer.dispose();
    timeControlleer.dispose();
    budgetControlleer.dispose();
    dateFocusNode.dispose();
    timeFocusNode.dispose();
    budgetFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Styles.appBar(context),
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputField('Select Date', dateControlleer, TextInputType.text,
                dateFocusNode),
            const SizedBox(
              height: 20,
            ),
            inputField('Select Time', dateControlleer, TextInputType.text,
                dateFocusNode),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Select Location',
              style: labelText,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                maxLines: 3,
                controller: locationControlleer,
                keyboardType: TextInputType.text,
                focusNode: locationFocusNode,
                style: const TextStyle(
                    fontFamily: 'Segoe UI', fontSize: 20, color: lightText),
                decoration: formInputStyle),
            const SizedBox(
              height: 20,
            ),
            inputField('Estimated Budget', budgetControlleer,
                TextInputType.text, budgetFocusNode),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Additional Info',
              style: labelText,
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
                maxLines: 3,
                controller: additionalInformationControlleer,
                keyboardType: TextInputType.text,
                focusNode: additionalInformationFocusNode,
                style: const TextStyle(
                    fontFamily: 'Segoe UI', fontSize: 20, color: lightText),
                decoration: formInputStyle),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        alignment: Alignment.bottomRight,
        height: 70,
        color: white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) =>
                      const TaskConfirmationScreen()));
            },
            // ignore: sort_child_properties_last
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Text(
                'Continue',
                style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: white),
              ),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: kPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7), // <-- Radius
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField(String labelName, TextEditingController controller,
      TextInputType inputType, FocusNode focusNode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: labelText,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
            controller: controller,
            keyboardType: inputType,
            focusNode: focusNode,
            style: const TextStyle(
                fontFamily: 'Segoe UI', fontSize: 20, color: lightText),
            decoration: formInputStyle),
      ],
    );
  }
}
