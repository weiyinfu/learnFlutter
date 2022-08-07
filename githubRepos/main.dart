import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' show parse;

class Repo {
  String title;
  String description;
  String language;
  int star;
  int fork;

  Repo(this.title, this.description, this.language, this.star, this.fork);
}

Future<List<Repo>> getRepos() async {
  HttpClient cli = HttpClient();
  var repos = <Repo>[];
  var url = "https://github.com/weiyinfu?tab=repositories";
  while (true) {
    var req = await cli.getUrl(Uri.parse(url));
    var resp = await req.close();
    var html = await resp.transform(Utf8Decoder()).join();
    var doc = parse(html);
    var lis = doc.querySelectorAll("#user-repositories-list li");
    for (var i in lis) {
      var title = i.querySelector("h3 a")?.text.trim();
      var description = i.querySelector("p[itemprop=description]")?.text?.trim();
      var language = i.querySelector("span[itemprop=programmingLanguage]")?.text?.trim();
      var star = int.parse(i.querySelector("svg[aria-label=star]")?.parentNode?.text?.trim() ?? "0");
      var fork = int.parse(i.querySelector("svg[aria-label=star]")?.parentNode?.text?.trim() ?? "0");
      var repo = Repo(title ?? "", description ?? "", language ?? "", star, fork);
      repos.add(repo);
    }
    var nextPage = doc.querySelector(".paginate-container a[class=next_page]");
    if (nextPage == null) {
      break;
    }
    url = nextPage.attributes["href"] ?? "";
    if (url == "") break;
    if (!url.startsWith("http")) {
      url = "https://github.com/${url}";
    }
  }

  return repos;
}

void testRepos() {
  getRepos().then((repos) {
    for (var repo in repos) {
      print("${repo.title} ${repo.description} ${repo.language},${repo.star},${repo.fork}");
    }
  });
}

class MyHome extends StatefulWidget {
  const MyHome();

  @override
  State<StatefulWidget> createState() {
    return MyHomeState();
  }
}

class MyHomeState extends State<StatefulWidget> {
  List<Repo> repos = List.empty();

  MyHomeState() {
    getRepos().then((repos) {
      setState(() {
        print("repos is done");
        this.repos = repos;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var uiRepos = repos.map((repo) {
      return Column(children: [
        Row(
          children: [
            Text(repo.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w200,
                )),
            Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Text(repo.description,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10,
                      color: Colors.white60,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.w100,
                    ))),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.white60, size: 15),
            Text("${repo.star}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white60,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w100,
                )),
            Icon(
              Icons.fork_left_rounded,
              color: Colors.white60,
              size: 15,
            ),
            Text("${repo.fork}",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white60,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w100,
                )),
          ],
        )
      ]);
    }).toList();
    List<Widget> a = [
      Text("一共${repos.length}个仓库",
          style: const TextStyle(
            fontSize: 30,
            color: Colors.white70,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w500,
          ))
    ];
    a.addAll(uiRepos);
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(40, 10, 10, 20),
      child: ListView(children: a),
      decoration: BoxDecoration(color: Colors.black),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: "Github仓库列表",
    home: MyHome(),
    color: Colors.black,
  ));
  return;
}
