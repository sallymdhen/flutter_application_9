import 'package:flutter/material.dart';
import 'package:flutter_application_9/core/app/app_routes.dart';
import 'package:flutter_application_9/core/models/product_model.dart';
import 'package:flutter_application_9/core/util/app_colors.dart';
import 'package:flutter_application_9/core/util/app_text_style.dart';
import 'package:flutter_application_9/features/details/presention/views/widget/describtion_widget.dart';
import 'package:flutter_application_9/features/home/presention/views/cart_screen.dart';
import 'package:flutter_application_9/features/home/presention/views/favorite_screen.dart';
import 'package:flutter_application_9/features/home/presention/widgets/cart_item_card.dart';
import 'package:flutter_application_9/features/widgets/main_button.dart';
import 'package:flutter_application_9/core/service/cart/manager_cart.dart';


class Details extends StatefulWidget {
   Details({super.key,required this.product});
   final ProductModel product;
  


  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
void initState() {
  super.initState();//;هي اسم الليست يلي بدي ضيف عليه 

}

 
 bool isFavorite = false;
final List<String> images = [
  'assets/image/tshirt1.png',
  'assets/image/tshirt2.png',
  'assets/image/tshirt3.png',
  'assets/image/tshirt4.png',
  'assets/image/tshirt2.png',
];
bool isOnApiImage = true;
int currentIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.backgroundLight,
      leading: Container(width: 47,height: 47,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.whiteColor,),
                          child: IconButton(
                         icon: Icon(Icons.arrow_back_ios , color: Colors.black,size: 15,),
                         onPressed: () {
                         Navigator.pop(context);
                                        }, ),),
 
      title: Text('T-shirt Shop',style: AppTextStyle.appBarScreensStyle,),centerTitle: true,
      actions: [
                 Stack(children: [InkWell(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CartScreen()));
                 },
                   child: Container(margin: EdgeInsets.all(8),
                                           height:44 ,width: 44,padding: EdgeInsets.all(10), 
                                           decoration: BoxDecoration(color: AppColors.whiteColor,
                                                                    shape: BoxShape.circle ), 
                                           child: Image.asset('assets/image/bag.png',width:24 ,height:24 ,),),
                 ),
                                  Positioned(right: 9,top: 9,
                                    child: Container(height:8 ,width: 8,decoration: 
                                  BoxDecoration(shape: BoxShape.circle,
                                               color: AppColors.redColor),))     
                                         ],)
      ],),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: 
                     [
                      SizedBox(height: 25,),
                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 20),
                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                                    Text('Programmer T-shirt',style: AppTextStyle.programerDetailStyle,),
                                    SizedBox(height: 14,),
                                    Text(widget.product.title,style: AppTextStyle.titleApiDetailStyle,),
                                    SizedBox(height: 8,),
                                    
                       
                                   ],),
                     ),

                     Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    children: [
      SizedBox(
        height: 221,
        child: Stack(
          children: [
            Center(
  child: isOnApiImage
      ? Image.network(
          widget.product.imagePath,
          width: 215,
          height: 220,
          fit: BoxFit.contain,
        )
      : Image.asset(
          images[currentIndex],
          width: 215,
          height: 220,
          fit: BoxFit.contain,
        ),
),
            Positioned(
              top: 0,
              left: 0,
              child: Text(
                "\$${widget.product.price}",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      //const SizedBox(height: 6),

      ///  القوس المنحني + الأيقونات فوقو أيقونات تفاعلية 
      Stack(clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
  
            child: Image.asset(
              "assets/image/Ellipse.png",height: 65,width:357,
            ),
          ),

          Positioned(bottom: -11,
            child: Container(
              width: 40,height: 20,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25),
              ),
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
            if (!isOnApiImage && currentIndex == 0) {
              isOnApiImage = true;
            } else if (!isOnApiImage && currentIndex > 0) {
              currentIndex--;
            }
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.whiteColor,
                    size: 8, 
                  ),
                ),
            
                GestureDetector(
                  onTap: () {
                    setState(() {
            if (isOnApiImage) {
              isOnApiImage = false;
              currentIndex = 0;
            } else {
              if (currentIndex < images.length - 1) {
                currentIndex++;
              }
            }
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.whiteColor,
                    size: 8,
                  ),
                ),
              ],
            )
            
            ),
          ),
        ],
      ),

      const SizedBox(height: 22),

      /// الصور الصغيرة جوا الكونتينر
      SizedBox(
        height: 85,
        child: ListView.separated(
         separatorBuilder: (context, index) =>  const SizedBox(width: 14),
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: 56,height: 56,
              //margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset(images[index],width:40 ,height: 40,),
            );
          },
        ),
      ),
    ],
  ),
),
      

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Text('تعديل الوصف',style: AppTextStyle.recPassStyle,),
                            DescriptionWidget(description: widget.product.description),
                            SizedBox(height: 60,),
                            Padding(
                              padding: const EdgeInsets.only(left: 28,right: 27),
                              child: Row(
                                children: [
                                Container(
                                     height:52 ,width: 52, 
                                     decoration: BoxDecoration(color: AppColors.whiteColor,
                                                              shape: BoxShape.circle ), 
                                     child: IconButton(onPressed: (){
                                      
                                     setState(() {
                                               if (isFavorite) {
        // هي لحتى احذف من المفضلة 
                                                 FavoriteManager.favoriteProducts.remove(widget.product);
                                                 
                                                isFavorite = false; }
                                                 else {
        // وهي منشان ضيف للمفضلة
                                                  FavoriteManager.favoriteProducts.add(widget.product);
                                                   isFavorite = true;
                                                       }});

                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                           SnackBar(
                                                                   content: Text(isFavorite ? "تمت إضافة المنتج إلى المفضلة"
                                                                                             : "تمت إزالة المنتج من المفضلة", ),), );


                                    }, icon: Icon(Icons.favorite,
                                    color: isFavorite?AppColors.favoriteRed:AppColors.lightGreyColor,
                                    
                                    ))),
                                     SizedBox(width: 45,),
                                     MainButton(
                                      onPressed: () {
                                            CartManager.cartItems.add({
                                            'id': DateTime.now().millisecondsSinceEpoch.toString(),
                                            'name': widget.product.title,
                                            'imagePath': widget.product.imagePath,
                                            'price': double.parse(widget.product.price),
                                            'quantity': 1,});

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text("تمت إضافة المنتج إلى السلة"),
    ),
  );
},
                                       
                                     
                                                            
                                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.shopping_bag, color: Colors.white),
                                                  SizedBox(width: 6,),
                                                  Text('Add TO Cart',style: AppTextStyle.logRegStyle,),
                                                ],),
                                               width: 208)
                              
                              ],),
                            )
                        
                          ],
                        ),
                      ),
                      
                                            
                            
        
        
        
        
        
        
        
        
        
        
        
        
        
                     ],),
      ),








    );
  }
}