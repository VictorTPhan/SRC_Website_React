import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../misc.dart';
import '../screens/publish.dart';

class PasswordEntryModal extends StatelessWidget {
  PasswordEntryModal(this.password, [this.passwordFailed = false]);

  TextEditingController password;
  bool passwordFailed;

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Password Required",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 25
              ),
            ),
            const Text(
              "Password authentication is required in order to access the submitted material approval page.",
            ),
            if (passwordFailed)
              const Text(
                "Password failed! Please try again.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            Container(
              width: 400,
              child: TextField(
                controller: password,
                obscureText: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}

dynamic createPasswordEntryModal(BuildContext context, TextEditingController controller, [passwordFailed = false]) {
  var modal = PasswordEntryModal(controller, passwordFailed);
  return AwesomeDialog(
      context: context,
      animType: AnimType.leftSlide,
      dialogType: DialogType.noHeader,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: modal,
      ),
      btnOkText: "Submit",
      btnOkIcon: Icons.check,
      btnOkOnPress: () {
        //check if password is correct
        if (modal.password.text == password) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const PublishingPage())).then((value) {
            print("I'm back");
          });
        } else {
          //try again
          createPasswordEntryModal(context, controller, true);
        }
      },
      btnCancelText: "Back",
      btnCancelColor: Colors.grey,
      btnCancelIcon: Icons.arrow_back,
      btnCancelOnPress: () {

      }
  ).show();
}