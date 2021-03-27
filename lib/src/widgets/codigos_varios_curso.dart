// decoration: BoxDecoration(
// image: DecorationImage(
// fit: BoxFit.cover,
// image: AssetImage(pathImage)
// image: pathImage.contains('assets')? AssetImage(pathImage):new FileImage(new File(pathImage))
// ),

//Permisos de Apple.
// <key>NSCameraUsageDescription</key>
// <string>Platzi Trips reuiere tomar una foto. ¿Podemos user tú cámara?</string>
// <key>NSPhotoLibraryUsageDescription</key>
// <string>Platzi Trips reuiere tomar una foto. ¿Podemos user tú cámara?</string>
// <key>NSMicrophoneUsageDescription</key>
// <string>Platzi Trips reuiere tomar una foto. ¿Podemos user tú cámara?</string>

//  Future getImage() async{
// File image= await ImagePicker.pickImage(source: ImageSource.camera).catchError((onError) => print(onError));;
// if(image!=null){
// Navigator.push(context,
// MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image, camera: true,)));
// }
// }
//Prevenir perdida de datos
// Future<void> retrieveLostData()async{
// final LostDataResponse response = await ImagePicker.retrieveLostData();
// if (response==null){
// return;
// }
// if(response.file!=null){
// print("==============================FUNCIONO=============================");
// Navigator.push(context,
// MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: response.file)));

// }
// }
// getImage();
// retrieveLostData();

//
// ImagePicker.platform.pickImage(
// source: ImageSource.camera).then((image){
// File pickedFile = File(image.path);
// if(image != null)
// Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddNewPlace(image: pickedFile))
// );
// }).catchError((onError) => print(onError));
// }

// Creé un objeto tipo File llamado pickedFile en donde le asigne la ruta
//de la imagen como File(image.path).
// /
// Y Bueno luego entregamos como parametro pickedFile a AddNewPlace();
// /
// Y obvio hay que cambiar el objeto PickedFile de la clase AddNewPlace a File.






// CircleButton(false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1),
// () {
// ImagePicker().getImage(
// source: ImageSource.camera
// )
// .then((PickedFile image) {
// if(image != null) {
// Navigator.push(
// context,
// MaterialPageRoute(builder: (BuildContext context) => AddPlaceScreen(image: image) )
// );
// } else { print('Not image selected, do nothing'); }
//
// })
// .catchError((error) => print('${error}'));
//
// }),
