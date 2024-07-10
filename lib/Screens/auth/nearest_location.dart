import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamang_food_app/Screens/dashBoard/dash_board_screen.dart';


class NearestLocation extends StatefulWidget {
  const NearestLocation({Key? key}) : super(key: key);

  @override
  State<NearestLocation> createState() => _NearestLocationState();
}

class _NearestLocationState extends State<NearestLocation> {
  bool _useSearchIcon = true;
  final TextEditingController _searchController = TextEditingController();

  List<String> listTitles = [
    'House of Hue.Gah',
    'Cave Coffee',
    'Delissio crafted Dignin',
    'Lucid Cafe',
    'Zero',
    'Nini`s Kitchen',
    'Petra Lounge'
  ];

  List<String> listSubtitles = [
    'Motavarachha, Surat',
    'Katargam, Surat',
    'Magdalla, Surat',
    'VIP Road, Surat',
    'Vesu, Surat',
    'Piplod, Surat',
    'Dumas, Surat',
  ];

  void _toggleIcon() {
    setState(() {
      _useSearchIcon = !_useSearchIcon;
    });
  }

  void _updateSearchField(String text) {
    setState(() {
      _searchController.text = text;
      _searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: _searchController.text.length));
      _useSearchIcon = false;
    });
  }

  void _clearSearchField() {
    setState(() {
      _searchController.clear();
      _useSearchIcon = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Find restaurants near you',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Text(
              'Please enter your location or allow access to\nyour location to find restaurants near you.',
              style: TextStyle(fontSize: 15, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        _useSearchIcon ? Icons.search : Icons.location_on,
                        color: Colors.grey,
                      ),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () {
                      if (_searchController.text.isEmpty) {
                        _toggleIcon();
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: _clearSearchField,
                    color: Colors.grey,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: listTitles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(
                      CupertinoIcons.location_fill,
                      color: Colors.grey,
                    ),
                    title: Text(listTitles[index]),
                    subtitle: Text(listSubtitles[index]),
                    onTap: () {
                      _updateSearchField(listTitles[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(
                            listTiles: listTitles[index],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
