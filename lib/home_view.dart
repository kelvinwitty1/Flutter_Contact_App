
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart'; 
import 'contact_datails_view.dart';
import 'contact_model.dart';
 
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
 
  final ScrollController _scrollController = ScrollController();
 
  final List<Map<String, String>> data = [
    {
      "name": "Roy Apkafu",
      "phone": "+233 65 82 78 982",
      "email": "non@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "Mary Yevu",
      "phone": "+233 67 43 45 712",
      "email": "tediam23@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "Clara Queen",
      "phone": "+233 56 77 43 341",
      "email": "vel234@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "Kelvin Witty",
      "phone": "+233 58 82 37 896",
      "email": "eros.rices@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "White Carlos",
      "phone": "+233 64 74 36 271",
      "email": "ategestas34@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "HOW Debugger",
      "phone": "+233 23 81 60 333",
      "email": "proinnisl@gmail.com",
      "country": "Ghana",
      "region": "Kumasi"
    },
    {
      "name": "Britanney Akua",
      "phone": "+233 67 87 13 241",
      "email": "nonr132@gmail.com",
      "country": "Ghana",
      "region": "Takradi"
    },
    {
      "name": "William Ganio",
      "phone": "1-412-819-7163",
      "email": "molestie.in@yahoo.ca",
      "country": "Ghana",
      "region": "Accra "
    },
    {
      "name": "Shellie Mampong",
      "phone": "+233 24 16 98-234",
      "email": "nond.1@gmail.com",
      "country": "Ghana",
      "region": "Accra"
    },
    {
      "name": "Gabriel Asampana",
      "phone": "+233 45 34 76 234",
      "email": "sag.12@gmail.com",
      "country": "GHANA",
      "region": "Soutuom"
    }
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/person1.jpg'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'kelvinyevu1@gmail.com',
                                name: 'Kelvin Yevuyibor',
                                phone: '+233 24 54 36 ',
                                region: 'Greater Accra'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/person1.jpg'),
                    ),
                    title: const Text(
                      'Kamal Yakubu',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 24 54 36 757'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/person2.png'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}