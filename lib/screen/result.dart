import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Result extends StatefulWidget {
  const Result({Key? key, required this.isMale, required this.bmi})
      : super(key: key);
  final bool isMale;
  final int bmi;

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  final adUnitId = 'ca-app-pub-9237577594756341/4490424052';

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          // debugPrint('BannerAd failed to load: $error');
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: (widget.isMale ? Colors.blue : Colors.pink)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Image.asset(
                      widget.isMale
                          ? 'asset/images/bmim.png'
                          : 'asset/images/bmif.png',
                    ),
                    const SizedBox(height: 80),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (widget.isMale ? Colors.blue : Colors.pink)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(getMessage(widget.bmi),
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: (widget.isMale ? Colors.blue : Colors.pink)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.isMale
                                  ? '\nYou must \n\n* take good care of your health.\n'
                                      '*Drink approximately 15.5 cups (3.7 liters) of fluid per day for men.'
                                      '\n*You should do exercise.\n* not smoke.\n*  sleep early.'
                                  : '\nYou must \n\n* take good care of your health.\n'
                                      '*Drink approximately 11.5 cups (2.7 liters) of fluid per day for women.'
                                      '\n*You should do exercise.\n* not smoke.\n*  sleep early.',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Image.asset(
                            getImage(widget.isMale, widget.bmi),
                            height: 250,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if (_bannerAd != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: SizedBox(
                  width: _bannerAd!.size.width.toDouble(),
                  height: _bannerAd!.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd!),
                ),
              ),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  String getMessage(int bmi) {
    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi > 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi > 25 && bmi < 30) {
      return 'Over Weight';
    } else if (bmi > 35 && bmi < 40) {
      return 'Severe Obesity';
    } else if (bmi > 44 && bmi < 45) {
      return 'Morbid Obesity';
    } else {
      return 'Super Obesity';
    }
  }

  String getImage(bool male, int bmi) {
    if (bmi < 18.5) {
      return male ? 'asset/images/1m.png' : 'asset/images/1f.png';
    } else if (bmi > 18.5 && bmi < 25) {
      return male ? 'asset/images/2m.png' : 'asset/images/2f.png';
    } else if (bmi > 25 && bmi < 30) {
      return male ? 'asset/images/3m.png' : 'asset/images/3f.png';
    } else if (bmi > 35 && bmi < 40) {
      return male ? 'asset/images/4m.png' : 'asset/images/4f.png';
    } else if (bmi > 44 && bmi < 45) {
      return male ? 'asset/images/5m.png' : 'asset/images/5f.png';
    } else {
      return male ? 'asset/images/6m.png' : 'asset/images/6f.png';
    }
  }
}
