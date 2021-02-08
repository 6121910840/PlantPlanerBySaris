import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'add_image.dart';

class CommuP extends StatefulWidget {
  @override
  _CommuPState createState() => _CommuPState();
}

class _CommuPState extends State<CommuP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text("Idea Garden", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () {},
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddImage()));
        },
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('imageURLs').snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> querySnapshot) {
          return !querySnapshot.hasData
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: querySnapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Container(
                              height: 350,
                              width: 350,
                              child: FadeInImage.memoryNetwork(
                                  fit: BoxFit.cover,
                                  placeholder: kTransparentImage,
                                  image: querySnapshot.data.docs[index]
                                      .get('url'))),
                        ),
                      ],
                    );
                  });

          // : Container(
          //     child: GridView.builder(
          //       itemCount: querySnapshot.data.docs.length,
          //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //           crossAxisCount: 1),
          //       itemBuilder: (context, index) {
          //         return Container(
          //           margin: EdgeInsets.all(3),
          //           child:  FadeInImage.memoryNetwork(
          //             fit: BoxFit.cover,
          //             placeholder: kTransparentImage,
          //             image: querySnapshot.data.docs[index].get('url')),
          //         );
          //       },
          //       ),
          //   );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class CommuP extends StatefulWidget {
//   @override
//   _CommuPState createState() => _CommuPState();
// }

// class _CommuPState extends State<CommuP> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("ตัวอย่างการจัดสวน",style: TextStyle(color: Colors.black),),
//         iconTheme: IconThemeData(color: Colors.black),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//           ),
//           onPressed: () {},
//         ),
//       ),

//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.grey,

//         child: IconButton(
//           icon: Icon(
//             Icons.add_a_photo

//           ),
//         ),
//       ),

//       body: ListView(
//         children: <Widget>[
//           SizedBox(
//             height: 20,

//           ),
//           Column(
//             children: <Widget>[
//               Container(
//                 height: 250,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("image/1.jpg"),fit: BoxFit.cover
//                   )
//                 ),

//               ),
//               SizedBox(
//                 height: 20,

//               ),
//               Container(
//                 height: 250,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("image/1.jpg"),fit: BoxFit.cover
//                   )
//                 ),

//               ),
//               SizedBox(
//             height: 20,

//             ),
//               Container(
//                 height: 250,
//                 width: 350,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("image/1.jpg"),fit: BoxFit.cover
//                   )
//                 ),

//               ),
//             ],
//           )
//         ],
//       ),

//     );
//   }
// }
