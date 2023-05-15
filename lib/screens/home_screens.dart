import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:neivor_tecnico/config/menu/menu_items.dart';




class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(backgroundColor: Colors.white,
        appBar: const _Appbar(),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Autorizar acceso', style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
                ),),
                TextButton(onPressed: () {
              
            }, child: const Text('Ver favorito', style: TextStyle(
                  fontSize: 15,
                  color: Colors.deepPurpleAccent,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500
                  
                ),)),
              ],
            ),
            
            const _HomeScreen()
          ],
          
          
        ),
      )
      
      
    );

  }
}

class _Appbar extends StatelessWidget implements PreferredSizeWidget {
  const _Appbar({
    super.key, 
  }):preferredSize = const Size(double.infinity, 50 );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(onPressed: () {
        
      }, icon: Container(
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200]
        ),
        child: const Icon(
          Icons.arrow_back,color: Colors.black,),
      )
        ),
      backgroundColor: Colors.white,
      elevation: 0,
      
    );
  }
  
  @override
  final Size preferredSize;
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    
    
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
      
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {


    return Container(
      margin: const EdgeInsets.only(bottom: 10,top: 15),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.black54),
        borderRadius: BorderRadius.circular(5),
        
        
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: ListTile(
          title:Container(
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Icon(menuItem.icon),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(menuItem.title,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    
                    
                  ),),
                ),
                
              ],
            ),
          ),
          subtitle:Text(menuItem.subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
          
          onTap: () {
            showDialog(
              
              context: context, 
              builder: (context) => Column(
                
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AlertDialog(
                    
                    alignment: Alignment.center,
                    icon:const Icon(Icons.people),
                    title: const Text('Sincroniza tus contactos'),
                    content: const Text('permite el acceso para invitar a tu lista de amigos y familiares a tu condominio',textAlign: TextAlign.center,),
                  actions: [
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(300, 30),
                              backgroundColor: Colors.deepPurple
                            ),
                            onPressed: () =>context.push(menuItem.link) , child: Text('Permitir'),),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(300, 30),
                              backgroundColor: Colors.deepPurple
                              
                            ),
                            onPressed: () {
                      }, child: Text('Omitir')),
                        ],
                      ),
                    ),
                    
                  ],
                  ),
                ],
              )
            );
          },
          
          
        ),
      ),
    );
  }
}