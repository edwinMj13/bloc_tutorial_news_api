import 'package:bloc_mini_project_new/utils/measurements.dart';
import 'package:bloc_mini_project_new/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/write_to_dev_bloc.dart';

class WriteToUs extends StatelessWidget {
  WriteToUs({super.key});

  final _formKey = GlobalKey<FormState>();
  final WriteToDevBloc writeToDevBloc = WriteToDevBloc();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode subjectFocusNode = FocusNode();
  final FocusNode detailsFocusNode = FocusNode();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final detailsController = TextEditingController();

  nextFocus(FocusNode focusNode, BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  submitForm() {}

  //  _validateFields(String? val){
  //   if(val.trim().isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(val)){
  //     return "Entre Correct Name";
  //   }else{
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight20,
            const CallEmailTile(),
            kHeight20,
            BlocListener<WriteToDevBloc, WriteToDevState>(
              bloc: writeToDevBloc,
              listener: (context, state) {
                if (state is WriteSnackBarState) {
                  snackBar('Submitted', context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller: nameController,
                        validator: (val) {
                          if (val!.trim().isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                            return "Enter Correct Name";
                          } else {
                            return null;
                          }
                        },
                        focusNode: nameFocusNode,
                        onFieldSubmitted: (value) {
                          nextFocus(emailFocusNode, context);
                        },
                        decoration: const InputDecoration(
                          labelText: 'Full Name',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      kHeight10,
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        focusNode: emailFocusNode,
                        controller: emailController,
                        onFieldSubmitted: (val) {
                          nextFocus(subjectFocusNode, context);
                        },
                        validator: (val) {
                          if (val!.trim().isEmpty ||
                              !RegExp(r'^[\w-\.]+@([\w-]+.)+[\w]{2,4}$')
                                  .hasMatch(val)) {
                            return "Entre Correct E-Mail";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Enter Email',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      kHeight10,
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        focusNode: subjectFocusNode,
                        controller: subjectController,
                        onFieldSubmitted: (val) {
                          nextFocus(detailsFocusNode, context);
                        },
                        validator: (val) {
                          if (val!.trim().isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                            return "Enter Subject";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          labelText: 'Enter Subject',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      kHeight10,
                      TextFormField(
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: detailsController,
                        minLines: 5,
                        maxLines: 8,
                        maxLength: 150,
                        validator: (val) {
                          if (val!.trim().isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(val)) {
                            return "Entre Details";
                          } else {
                            return null;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Details',
                          //labelText: 'Enter Details',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          writeToDevBloc.add(WritePostDataEvent(
                            name: nameController.value.text,
                            email: emailController.value.text,
                            subject: subjectController.value.text,
                            details: detailsController.value.text,));
                        }
                      }, child: Text("Submit")),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CallEmailTile extends StatelessWidget {
  const CallEmailTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.normal,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {},
                splashRadius: 6,
                icon: Icon(
                  Icons.call,
                  size: 30,
                  color: Colors.red[300],
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.red[100],
                ),
              ),
              kHeight10,
              Text(
                'Call Us',
                style: TextStyle(color: Colors.red[300],
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 15,
                offset: const Offset(0, 0),
                blurStyle: BlurStyle.normal,
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton.filled(
                onPressed: () {},
                splashRadius: 6,
                icon: Icon(
                  Icons.alternate_email_outlined,
                  size: 30,
                  color: Colors.blue[300],
                ),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.blue[100],
                ),
              ),
              kHeight10,
              Text(
                'Email Us',
                style: TextStyle(
                    color: Colors.blue[300],
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
