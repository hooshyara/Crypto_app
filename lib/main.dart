import 'package:flutter/material.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'service/network_service.dart';
import 'constant/url.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeView> {
  late final PageController pageController;
  final NetworkService _networkService = NetworkService();

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        elevation: 10,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Crypto',
              style: TextStyle(
                fontFamily: 'abril',
                fontSize: 30,
              ),
            ),
            Text(
              'Currency',
              style: TextStyle(
                fontFamily: 'josefin',
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: _networkService.getData(url: priceUrl),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final json = snapshot.data;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(
                  height: 220,
                  width: 1320,
                  child: PageView(
                    controller: pageController,
                    children: [
                      SizedBox(
                        height: 220,
                        width: 1320,
                        child: Card(
                          color: const Color(0XFF272727),
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                CryptoFontIcons.BTC,
                                color: Colors.grey.shade200,
                                size: 60,
                              ),
                              Text(
                                'BTC',
                                style: TextStyle(
                                  fontFamily: 'abril',
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'High Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['HIGHDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Open Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['OPENDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Low Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['LOWDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        width: 1320,
                        child: Card(
                          color: const Color(0XFF272727),
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                CryptoFontIcons.USDT,
                                color: Colors.grey.shade200,
                                size: 60,
                              ),
                              Text(
                                'USDT',
                                style: TextStyle(
                                  fontFamily: 'abril',
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'High Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['HIGHDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Open Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['OPENDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Low Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['LOWDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        width: 1320,
                        child: Card(
                          color: const Color(0XFF272727),
                          elevation: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                CryptoFontIcons.ETH,
                                color: Colors.grey.shade200,
                                size: 60,
                              ),
                              Text(
                                'ETH',
                                style: TextStyle(
                                  fontFamily: 'abril',
                                  color: Colors.grey.shade200,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'High Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['HIGHDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Open Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['OPENDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Low Day',
                                        style: TextStyle(
                                          fontFamily: 'abril',
                                          fontSize: 28,
                                          color: Colors.grey.shade200,
                                        ),
                                      ),
                                      Text(
                                        json['RAW']['BTC']['USD']['LOWDAY']
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: 'josefin',
                                            fontSize: 28,
                                            color: Colors.grey.shade200,
                                            fontWeight: FontWeight.w900),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: Colors.blue.shade900,
                    dotColor: Colors.purple,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Crypto',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: 'abril',
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  indent: 100,
                  endIndent: 100,
                  thickness: 1,
                ),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.black45,
                        size: 50,
                      ),
                      title: Text(
                        'BTC',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'josefin',
                        ),
                      ),
                      subtitle: Text(
                        '22010.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'abril',
                        ),
                      ),
                      trailing: Text(
                        '22010.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontFamily: 'abril',
                        ),
                      ),
                    ),
                  ),
                ),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.black45,
                        size: 50,
                      ),
                      title: Text(
                        'USDT',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'josefin',
                        ),
                      ),
                      subtitle: Text(
                        '22010.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'abril',
                        ),
                      ),
                      trailing: Text(
                        '22010.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontFamily: 'abril',
                        ),
                      ),
                    ),
                  ),
                ),
                const Card(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.history,
                        color: Colors.black45,
                        size: 50,
                      ),
                      title: Text(
                        'ETH',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'josefin',
                        ),
                      ),
                      subtitle: Text(
                        '22010.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontFamily: 'abril',
                        ),
                      ),
                      trailing: Text(
                        '22010.0',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontFamily: 'abril',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
