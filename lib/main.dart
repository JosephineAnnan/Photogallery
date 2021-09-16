import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photogallery/picture_detail.dart';

void main() {

  runApp(MaterialApp(debugShowCheckedModeBanner: false,
  home: PhotoGalleryApp(),
  ));


}
 class PhotoGalleryApp extends StatefulWidget {
   const PhotoGalleryApp({Key? key}) : super(key: key);

   @override
   _PhotoGalleryAppState createState() => _PhotoGalleryAppState();
 }

 class _PhotoGalleryAppState extends State<PhotoGalleryApp> {
  // Image data source
   List Img = [
     "https://images.unsplash.com/photo-1631548980582-3daa3b503ce6?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
     "https://images.unsplash.com/photo-1631214953530-0ae0277ccf7f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
     "https://images.unsplash.com/photo-1631526705006-46b259b7516c?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
     "https://images.unsplash.com/photo-1631610039335-3de4e10e13c0?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
     "https://images.unsplash.com/photo-1631215583473-4710df684df1?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
     "https://images.unsplash.com/photo-1631171024401-313c0afeee3a?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDIxfHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
   ];
   @override
   Widget build(BuildContext context) {

     return Scaffold(
       body:  SafeArea(
         child: Padding(
           padding:EdgeInsets.symmetric(horizontal:12.0,vertical:10.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children:<Widget> [
               Text("Josie Gallery App" ,
                 style: TextStyle(
                   color: Colors.blue,
                   fontSize: 32.0,
                   fontWeight: FontWeight.bold
                 ),),
                 SizedBox(height:18.0),
                 TextField(
                   decoration: InputDecoration(
                     prefixIcon: Icon(Icons.search,color: Colors.amber,),
                     hintText: "Search for Image",
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0)
                     ),
                   ),
                 ),
               SizedBox(height: 24.0,),
               Expanded(child: Padding(
                 padding: EdgeInsets.symmetric(vertical: 10.0),
                 child: StaggeredGridView.countBuilder(
                     crossAxisCount: 2,
                     crossAxisSpacing: 12,
                     mainAxisSpacing: 12,
                      itemCount:Img.length ,
                     itemBuilder: (context,index){
                       return Container(
                         decoration: BoxDecoration(
                           color: Colors.transparent,
                           borderRadius: BorderRadius.circular(0.0)
                         ),
                         child: GestureDetector(
                           onTap: (){
                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context) =>PictureDetailScreen(Img[index])),);
                           },
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(0.0),
                             child: Image.network(Img[index],fit:BoxFit.fill ,),
                           ),
                         )
                       );
                     }, staggeredTileBuilder: (int index) {
                       return new StaggeredTile.count(1, index.isEven ? 1.2 :2);
                 },),
                     ),
               )
               ]
           ),
         ),
       ),
     );
   }
 }








