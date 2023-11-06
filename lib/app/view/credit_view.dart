import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CreditView extends StatelessWidget {
  const CreditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('D4D4D4'),
      appBar: AppBar(
        backgroundColor: HexColor('114773'),
        title: const Text('Anggota Tim Melanospy'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(right: 90.0, left: 90, top: 20),
                child: Center(
                  child: Image.asset(
                    'assets/images/bapak.png',
                    fit: BoxFit.cover,
                    width: 170,
                    height: 180,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.only(right: 90.0, left: 90),
                child: Center(
                  child: Image.asset(
                    'assets/images/qolbi.png',
                    width: 170,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Center(
                      child: Image.asset(
                        'assets/images/rizieq.png',
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/defri.png',
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/images/elan.png',
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Card(
                    child: Center(
                      child: Image.asset(
                        'assets/images/ilham.png',
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
