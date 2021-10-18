import 'package:flutter/material.dart';
import 'package:getmancar_ui/style/colors_style.dart';

class ShowLangDialog extends StatefulWidget {
  ShowLangDialog({Key? key}) : super(key: key);

  @override
  _ShowLangDialogState createState() => _ShowLangDialogState();
}

class _ShowLangDialogState extends State<ShowLangDialog> {
  final List<String> listLanguages = ['Ukraine', 'Russian', 'English'];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 250.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              const Text(
                'Choose language',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16.0),
              const CustomDevider(),
              SizedBox(
                height: 150.0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 2.0,
                    right: 16.0,
                    bottom: 23.0,
                  ),
                  child: ListView.builder(
                      itemCount: listLanguages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const SizedBox(height: 16.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  },
                                  child: Text(
                                    listLanguages[index],
                                    style: const TextStyle(
                                        color: Color(0xff313131)),
                                  ),
                                ),
                                _currentIndex == index
                                    ? const Icon(
                                        Icons.check,
                                        color: BrandColor.primaryColor,
                                      )
                                    : const SizedBox(
                                        height: 24.0,
                                      )
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
              const CustomDevider(),
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      color: BrandColor.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _dismissDialog() {
    Navigator.pop(context);
  }
}

class CustomDevider extends StatelessWidget {
  const CustomDevider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1.0,
      decoration: BoxDecoration(color: Color(0xffE6E4E3)),
    );
  }
}
