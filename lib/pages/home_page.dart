import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:winfood_menu/repository/loja_repository.dart';
import 'dart:math';
import '../app_images.dart';
import '../model/departamentos_model.dart';
import '../model/loja_model.dart';
import '../model/produtos_model.dart';
import '../repository/depto_repository.dart';
import '../repository/produtos_repository.dart';
import '../responsive.dart';

class HomePage extends StatefulWidget {
  String?codloja;
  HomePage({Key? key,this.codloja}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late NumberFormat formatter;
  late LojaRepository repositoryLoja;
  late DeptoRepository repositoryDepto;
  late ProdutosRepository repositoryProdutos;
  late TabController _tabController;
  
  late Future<Loja> lojaFuture;
  late Future<List<DepartamentosModel>> departamentosFuture;
  late Future<List<ProdutosModel>> maisPedidosFuture;
  late Future<List<ProdutosModel>> promocaoFuture;
  late Future<List<ProdutosModel>> produtosFuture;

  late Loja loja = Loja();
  List<DepartamentosModel> departamentos = [];
  List<ProdutosModel> maisPedidos = [];
  List<ProdutosModel> promocoes = [];
  List<ProdutosModel> produtosDefault = [];
  List<ProdutosModel> produtosFull = [];

  GlobalKey promoKey = GlobalKey();
  GlobalKey maisPedidosKey = GlobalKey();
  GlobalKey cardapioKey = GlobalKey();

  String codloja = '';

  late Size size;

  @override
  void initState() {
    // TODO: implement initState
    formatter = NumberFormat.simpleCurrency(locale: "pt_Br");
    codloja = widget.codloja??'';
    repositoryLoja = LojaRepository();
    repositoryDepto = DeptoRepository();
    repositoryProdutos = ProdutosRepository();
    super.initState();
  }

  List<Widget>buildTabs(){
    List<Widget>tabs = [];
    departamentos.forEach((c) {
      tabs.add(Tab(text: c.nome,));
    });
    return tabs;
  }

  List<Widget>buildingTabView(){
    List<Widget>views = [];

    departamentos.forEach((d) {

      List<Widget>rows = [];

      rows.add(
          Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.centerLeft,
              child: Text(
                d.nome!,
                style: TextStyle(color: Colors.deepOrange, fontSize: 22),
              )
          )
      );

      produtosFull.forEach((p) {

        if(d.codigo == p.codDepto){

          rows.add(InkWell(
            child: Container(
              margin: EdgeInsets.all(8),
              height: size.height * 0.15,
              width: Responsive.isDesktop(context) ?
              size.width * 0.3 :
              Responsive.isTablet(context) ?
              size.width * 0.45 :
              size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(1, 2), // changes position of shadow
                            ),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            topLeft: Radius.circular(10)),
                        child: AppImages().newImageProduct(p, context),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(1, 2), // changes position of shadow
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(p.nome!.toUpperCase(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style:
                                  TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w600)),
                            ),
                            Container(
                              child: Text(p.descricao!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 12, color: Colors.black54,fontWeight: FontWeight.w600)),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Text(
                                      formatter.format(p.precoVenda),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: p.precoPromocao! > 0
                                          ? const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black38,
                                          decorationThickness: 4,
                                          decorationColor: Colors.red,
                                          decorationStyle:
                                          TextDecorationStyle.solid,
                                          decoration: TextDecoration.lineThrough)
                                          : const TextStyle(
                                          fontSize: 14,
                                          color: Colors.deepOrange,fontWeight: FontWeight.w600)),
                                ),
                                Container(
                                  child: Text(
                                      p.precoPromocao! > 0
                                          ? formatter
                                          .format(p.precoPromocao)
                                          : '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.deepOrange,fontWeight: FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              openDetalhes(p, context);
            },
          ));

        }
      });

      views.add(
          SingleChildScrollView(
            child: Wrap(children: rows)
          )
      );

    });
    return views;
  }

  openDetalhes(ProdutosModel produto, BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        alignment: Alignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(produto.nome!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.deepOrange,fontWeight: FontWeight.w600)),
            const SizedBox(height: 10),
            AppImages().newImageProduct(produto, context),
            const SizedBox(height: 5),
            Text(produto.descricao!,
                style: TextStyle(fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w600)),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  formatter.format(
                      produto.precoPromocao == 0 ? produto.precoVenda : produto.precoPromocao),
                  style: TextStyle(fontSize: 18, color: Colors.deepOrange,fontWeight: FontWeight.w600),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: codloja.isNotEmpty
          ? FutureBuilder(
        future: Future.wait([
          lojaFuture = repositoryLoja.getLojaFuture(codloja),
          departamentosFuture = repositoryDepto.getDeptosFuture(codloja),
          produtosFuture = repositoryProdutos.getProdutosFuture('',codloja),
          produtosFuture = repositoryProdutos.getProdutosFuture('promocao',codloja),
          //produtosFuture = repositoryProdutos.getProdutosFuture('favoritos',codloja),
        ]),
        builder: (context,AsyncSnapshot<List<dynamic>>snapshot){

          if(!snapshot.hasData){
            return Center(
                child: SpinKitThreeBounce(
                  color: Colors.deepOrange.shade400,
                  size: 30.0,
                ));
          }
  
          loja = snapshot.data![0]??Loja();
          departamentos = snapshot.data![1]??[];
          produtosFull = snapshot.data![2]??[];
          promocoes = snapshot.data![3]??[];
          //maisPedidos = snapshot.data![4]??[];

          _tabController = TabController(length: departamentos.length, vsync: this);
          return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 200,
                    stretch: true,
                    pinned: true,
                    floating: true,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(
                        color: Colors.white,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.2),
                                BlendMode.srcOver,
                              ),
                              child: Container(
                                child: AppImages().backgroundLoja(loja, context),
                              ),
                            ),
                            // Positioned(
                            //   child: Container(
                            //     height: 10,
                            //     clipBehavior: Clip.antiAlias,
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         // borderRadius: BorderRadius.vertical(
                            //         //   top: Radius.circular(15),
                            //         // ),
                            //         border: Border.all(
                            //           color: Colors.white,
                            //           width: 0,
                            //         )),
                            //   ),
                            //   bottom: -1,
                            //   left: 0,
                            //   right: 0,
                            // ),
                            Positioned(
                              child: Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    AppImages().imageLogo(loja, context),
                                    // Expanded(
                                    //   flex: 7,
                                    //   child: Container(
                                    //     height: double.maxFinite,
                                    //     margin: EdgeInsets.only(left: 5),
                                    //     child: Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       children: [
                                    //         Text('loja.nome',style: TextStyle(color: Colors.black54,fontSize: 16,overflow: TextOverflow.ellipsis),),
                                    //         Text('loja.ender',style: TextStyle(color: Colors.black45,overflow: TextOverflow.ellipsis),maxLines: 2,),
                                    //         Text('',style: TextStyle(color: Colors.black45,fontSize: 12)),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              //bottom: -40,
                              top: 50,
                              left: 25,
                              right: 0,
                            ),
                          ],
                        ),
                      ),
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.fadeTitle,
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top:8,left: 8,right: 8),
                            child: Text(
                              'PROMOÇÃO',
                              style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 22),
                            ),
                          ),
                          Container(
                            height: size.height * 0.17,
                            child: ScrollConfiguration(
                              behavior: ScrollConfiguration.of(context)
                                  .copyWith(
                                  dragDevices: {
                                    PointerDeviceKind.touch,
                                    PointerDeviceKind.mouse
                                  }),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:promocoes.length,
                                itemBuilder: (context, index) {
                                return InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.all(8),
                                    height:size.height * 0.23,
                                    width:
                                    Responsive.isDesktop(context) ?
                                    size.width * 0.3 :
                                    Responsive.isTablet(context) ?
                                    size.width * 0.45 :
                                    size.width * 0.85,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: const BorderRadius.only(
                                                    topLeft: Radius.circular(10),
                                                    bottomLeft: Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 4,
                                                    offset:
                                                    const Offset(1, 2), // changes position of shadow
                                                  ),
                                                ]),
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  bottomLeft: Radius.circular(10),
                                                  topLeft: Radius.circular(10)),
                                              child: AppImages().newImageProduct(promocoes[index], context),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: const BorderRadius.only(
                                                    topRight: Radius.circular(10),
                                                    bottomRight: Radius.circular(10)),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    spreadRadius: 2,
                                                    blurRadius: 4,
                                                    offset:
                                                    const Offset(1, 2), // changes position of shadow
                                                  ),
                                                ]),
                                            child: Padding(
                                              padding: const EdgeInsets.all(7.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(promocoes[index].nome!.toUpperCase(),
                                                        maxLines: 2,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: const TextStyle(
                                                            fontSize: 14, color: Colors.black54,fontWeight: FontWeight.w600)),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Text(promocoes[index].descricao!,
                                                        maxLines: 3,
                                                        overflow: TextOverflow.ellipsis,
                                                        style: TextStyle(fontSize: 12, color: Colors.black54,fontWeight: FontWeight.w600)),),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(right: 10),
                                                        child: Text(
                                                            formatter.format(promocoes[index].precoVenda),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.black38,
                                                                decorationThickness: 4,
                                                                decorationColor: Colors.red,
                                                                decorationStyle:
                                                                TextDecorationStyle.solid,
                                                                decoration:
                                                                TextDecoration.lineThrough,fontWeight: FontWeight.w600)),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                            formatter.format(promocoes[index].precoPromocao),
                                                            maxLines: 1,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 14,
                                                                color: Colors.deepOrange)),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )
                                            ,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    openDetalhes(promocoes[index], context);
                                  },
                                );
                              },),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                      pinned: true,
                      delegate: _SliverAppBarDelegate(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                TabBar(
                                  controller: _tabController,
                                  labelColor: Colors.deepOrange,
                                  isScrollable: true,
                                  tabs: buildTabs(),
                                ),
                              ],
                            ),
                          ),
                          maxHeight: 50,
                          minHeight: 50
                      )
                  ),
                ];
              },
              body: Container(
                padding: EdgeInsets.all(5),
                child: TabBarView(
                  controller: _tabController,
                  children: buildingTabView(),
                ),
              )
          );

        },
      )
          : Container(child: Center(child: Text('Error Codloja não encontrado!'),)),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({required this.minHeight, required this.maxHeight, required this.child});

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }


}
