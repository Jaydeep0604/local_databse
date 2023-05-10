import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_databases/bloc/databse/shared_pref_bloc/shared_detail_bloc.dart';
import 'package:local_databases/bloc/databse/shared_pref_bloc/shared_detail_event.dart';
import 'package:local_databases/config/shared_store.dart';
import 'package:local_databases/model/user_data_model.dart';
import 'package:local_databases/widgets/editText.dart';

class SharedEditDetailScreen extends StatefulWidget {
  const SharedEditDetailScreen({Key? key}) : super(key: key);

  @override
  State<SharedEditDetailScreen> createState() => _SharedEditDetailScreenState();
}

class _SharedEditDetailScreenState extends State<SharedEditDetailScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController? nameCtr;
  TextEditingController? emailCtr;
  TextEditingController? phoneCtr;
  TextEditingController? addressCtr;
  late SharedDetailBloc sharedDetailBloc;

  void initState() {
    super.initState();
    fetchData();
    sharedDetailBloc = context.read<SharedDetailBloc>();
  }

  void fetchData() async {
    final pref = await sharedStore.getAllData();
    setState(() {
      nameCtr = TextEditingController(text: pref['name']);
      emailCtr = TextEditingController(text: pref['email']);
      phoneCtr = TextEditingController(text: pref['phone']);
      addressCtr = TextEditingController(text: pref['address']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Form(
              key: _form,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 4, right: 30, left: 30),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Edit Shared Preferences Details",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 55,
                        ),
                        EditText(
                          controller: nameCtr,
                          textInputType: TextInputType.text,
                          hint: "Enter Your Name",
                          inputformtters: [
                            LengthLimitingTextInputFormatter(30),
                            // FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                            //     allow: true),
                          ],
                          validator: (value) {
                            if (value?.trimLeft().trimRight().isEmpty ?? true) {
                              return "Please enter Name";
                            }
                            if (value != null && value.length < 2) {
                              return "Name must be minimum 2 characters";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EditText(
                          controller: emailCtr,
                          textInputType: TextInputType.text,
                          hint: "Enter Your E-mail",
                          inputformtters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          validator: (value) {
                            if (value?.trimLeft().trimRight().isEmpty ?? true) {
                              return "Please enter E-mail";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EditText(
                          controller: phoneCtr,
                          textInputType: TextInputType.number,
                          hint: "Enter Your Phone",
                          inputformtters: [
                            LengthLimitingTextInputFormatter(30),
                          ],
                          validator: (value) {
                            if (value?.trimLeft().trimRight().isEmpty ?? true) {
                              return "Please enter Phone";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        EditText(
                          controller: addressCtr,
                          textInputType: TextInputType.text,
                          hint: "Enter Your Address",
                          inputformtters: [
                            LengthLimitingTextInputFormatter(250),
                          ],
                          validator: (value) {
                            if (value?.trimLeft().trimRight().isEmpty ?? true) {
                              return "Please enter Address";
                            }

                            return null;
                          },
                        ),
                        SizedBox(
                          height: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.black87,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onPressed: () {
                                    FocusNode? focusNode;
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                    if (focusNode != null) {
                                      focusNode.unfocus();
                                    }
                                    if (_form.currentState?.validate() ??
                                        false) {
                                      sharedDetailBloc.add(
                                          SharedDetailSubmitEvent(
                                              userDataModel: UserDataModel(
                                                  name: nameCtr?.text.trim(),
                                                  email: emailCtr?.text.trim(),
                                                  phone: phoneCtr?.text.trim(),
                                                  address: addressCtr?.text
                                                      .trim())));
                                    }
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
