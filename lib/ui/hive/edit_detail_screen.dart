import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:local_databases/bloc/databse/detail_bloc/detail_bloc.dart';
import 'package:local_databases/bloc/databse/detail_bloc/detail_event.dart';
import 'package:local_databases/bloc/databse/detail_bloc/detail_state.dart';
import 'package:local_databases/config/hive_store.dart';
import 'package:local_databases/model/detail_model.dart';
import 'package:local_databases/model/user_data_model.dart';
import 'package:local_databases/ui/hive/detail_view_screen.dart';
import 'package:local_databases/widgets/editText.dart';

class EditDetailScreen extends StatefulWidget {
  const EditDetailScreen({Key? key}) : super(key: key);

  @override
  State<EditDetailScreen> createState() => _EditDetailScreenState();
}

class _EditDetailScreenState extends State<EditDetailScreen> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  TextEditingController? nameCtr;
  TextEditingController? emailCtr;
  TextEditingController? phoneCtr;
  TextEditingController? addressCtr;

  late DetailBloc detailBloc;
  late DetailModel? detailModel;

  void initState() {
    super.initState();
    detailBloc = context.read<DetailBloc>();
    late Box<DetailModel> detailModel = Hive.box<DetailModel>(hiveStore.userDetailKey);
    nameCtr = TextEditingController(text: detailModel.values.first.name);
    emailCtr = TextEditingController(text: detailModel.values.first.email);
    phoneCtr = TextEditingController(text: detailModel.values.first.phone);
    addressCtr = TextEditingController(text: detailModel.values.first.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocListener<DetailBloc, DetailState>(
        listener: (context, state) {
          // if (state is DetailErrorState) {
          //   print("${state.msg}");
          // }
          // if (state is DetailAddedSuccessState) {
          //   print("State is DetailAddedSuccessState");
          // }
          if (state is DetailAddedSuccessState) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailViewScreen()));
          }
        },
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
                          height: 25,
                        ),
                        Text(
                          "Edit Details",
                          style: TextStyle(fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        EditText(
                          controller: nameCtr,
                          textInputType: TextInputType.text,
                          hint: "Enter Your Name",
                          inputformtters: [
                            LengthLimitingTextInputFormatter(30),
                            // FilteringTextInputFormatter(RegExp(r'[a-zA-Z]'),
                            //     allow: true),
                            LengthLimitingTextInputFormatter(25)
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
                          height: 20,
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
                                          borderRadius: BorderRadius.circular(10))),
                                  onPressed: () {
                                    FocusNode? focusNode;
                                    FocusManager.instance.primaryFocus?.unfocus();
                                    if (focusNode != null) {
                                      focusNode.unfocus();
                                    }
                                    if (_form.currentState?.validate() ?? false) {
                                      detailBloc.add(DetailSubmitEvent(
                                          userDataModel: UserDataModel(
                                              name: nameCtr?.text.trim(),
                                              email: emailCtr?.text.trim(),
                                              phone: phoneCtr?.text.trim(),
                                              address: addressCtr?.text.trim())));
                                    }
                                  },
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(color: Colors.white),
                                  ))),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
