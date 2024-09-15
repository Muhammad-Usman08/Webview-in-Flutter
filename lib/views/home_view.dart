import 'package:flutter/material.dart';
import 'package:web_view_app/component/CommonButton.dart';
import 'package:web_view_app/views/web_view.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;

  //controllers
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Web View in Flutter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: urlController,
                decoration: InputDecoration(
                  hintText: 'Enter Website URL',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(17.0),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Commonbutton(
                buttonText: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Open Web Page',
                        style: TextStyle(color: Colors.white),
                      ),
                height: 45,
                color: Colors.blue[900],
                width: 190,
                onpressed: () async {
                  if (urlController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter URL')),
                    );
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebView(
                        url: urlController.text,
                      ),
                    ),
                  );

                  urlController.clear();

                  setState(() {
                    isLoading = false;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
