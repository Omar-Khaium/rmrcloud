import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rmrcloud/widget/widget_edit_profile.dart';

class ProfileWidget extends StatelessWidget {
  static final String path =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTdidNuwBVsremAuu9OD5XykIER2KUK2Z-c8OeEL1RmuoBJsjSu";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProfileWidget(),
              fullscreenDialog: true));
        },
        label: Text("Edit"),
        icon: Icon(Icons.border_color),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 256,
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: path,
                fit: BoxFit.cover,
                placeholder: (context, url) => new CupertinoActivityIndicator(),
                errorWidget: (context, url, error) => new Icon(
                  Icons.broken_image,
                  size: 36,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 175.0, 16.0, 16.0),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 16.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 96.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Evan Islam",
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text("Online Marketing Specialist"),
                                    subtitle: Text("Euless, TX"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 84,
                        width: 84,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(84),
                            border: Border.all(
                                color: Colors.grey.shade100, width: 4),
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(path),
                                fit: BoxFit.cover)),
                        margin: EdgeInsets.only(left: 16.0, bottom: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text("User information"),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Email"),
                          subtitle: Text(
                            "evan@centralstationmarketing.com",
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Icon(Icons.email),
                        ),
                        ListTile(
                          title: Text("Phone"),
                          subtitle: Text(
                            "+1-888-296-7629",
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Icon(Icons.phone),
                        ),
                        ListTile(
                          title: Text("Website"),
                          subtitle: Text(
                            "https://www.centralstationmarketing.com",
                            overflow: TextOverflow.ellipsis,
                          ),
                          leading: Icon(Icons.web),
                        ),
                        ListTile(
                          title: Text("About"),
                          subtitle: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nulla, illo repellendus quas beatae reprehenderit nemo, debitis explicabo officiis sit aut obcaecati iusto porro? Exercitationem illum consequuntur magnam eveniet delectus ab."),
                          leading: Icon(Icons.person),
                        ),
                        ListTile(
                          title: Text("Joined Date"),
                          subtitle: Text("15 February 2019"),
                          leading: Icon(Icons.calendar_view_day),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(),
            )
          ],
        ),
      ),
    );
  }
}
