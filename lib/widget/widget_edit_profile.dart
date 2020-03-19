import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EditProfileWidget extends StatefulWidget {
  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  GlobalKey _key = new GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _designationController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _streetController = new TextEditingController();
  TextEditingController _cityController = new TextEditingController();
  TextEditingController _stateController = new TextEditingController();
  TextEditingController _zipController = new TextEditingController();
  TextEditingController _joinDateController = new TextEditingController();
  TextEditingController _aboutController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _nameController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                validator: (val) {
                  return RegExp('[a-zA-Z]').hasMatch(val)
                      ? null
                      : 'Invalid Name';
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "Name",
                    hintText: "e.g. - John Doe",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _designationController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                validator: (val) {
                  return RegExp('[a-zA-Z]').hasMatch(val)
                      ? null
                      : 'Invalid Designation';
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "Designation",
                    hintText: "e.g. - Technichian",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.toolbox,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _emailController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                validator: (val) {
                  return RegExp('[a-zA-Z]').hasMatch(val)
                      ? null
                      : 'Invalid Email';
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "Email",
                    hintText: "e.g. - john@mail.com",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.email,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _phoneController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                validator: (val) {
                  return RegExp('[a-zA-Z]').hasMatch(val)
                      ? null
                      : 'Invalid Phone';
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "Phone",
                    hintText: "e.g. - XXX XXX XXX",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.phone,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _streetController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                validator: (val) {
                  return RegExp('[a-zA-Z]').hasMatch(val)
                      ? null
                      : 'Invalid Street';
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "Street",
                    hintText: "e.g. - 22 Baker Street",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.road,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _cityController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                validator: (val) {
                  return RegExp('[a-zA-Z]').hasMatch(val)
                      ? null
                      : 'Invalid City';
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "City",
                    hintText: "e.g. - Marylebone",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.cityVariant,
                      color: Colors.grey,
                    )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: _stateController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black),
                      validator: (val) {
                        return RegExp('[a-zA-Z]').hasMatch(val)
                            ? null
                            : 'Invalid State';
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          labelText: "State",
                          hintText: "e.g. - LN",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey.shade500),
                          prefixIcon: Icon(
                            MdiIcons.city,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  flex: 2,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      controller: _zipController,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(color: Colors.black),
                      validator: (val) {
                        return RegExp('[a-zA-Z]').hasMatch(val)
                            ? null
                            : 'Invalid Designation';
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          labelText: "Zip Code",
                          hintText: "e.g. - XXXXX",
                          labelStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.black),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(color: Colors.grey.shade500),
                          prefixIcon: Icon(
                            MdiIcons.zipDisk,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _aboutController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "About",
                    hintText: "e.g. - Lorem Ipsum...",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.account,
                      color: Colors.grey,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: TextFormField(
                controller: _joinDateController,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
                enabled: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    labelText: "Join Date",
                    hintText: "e.g. - 01/01/2020",
                    labelStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.grey.shade500),
                    prefixIcon: Icon(
                      MdiIcons.calendar,
                      color: Colors.grey,
                    )),
              ),
            ),

            MaterialButton(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text("Update", style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),),
              ),
              onPressed: (){},
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
