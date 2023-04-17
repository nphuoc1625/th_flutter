import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:th_flutter/Model/cart.dart';
import 'package:th_flutter/cart/components/bottom.dart';
import 'package:th_flutter/cart/components/mycart_header.dart';

import '../Model/cart_item.dart';
import '../Model/onclick.dart';

class MyCart extends StatefulWidget {
  static var routeName = "/mycart";

  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> implements OnClick {
  Cart cart = Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: header(context),
        body: cart.items.isEmpty
            ? const Center(child: Text("Your cart is empty"))
            : buildCart(),
        bottomNavigationBar: BottomCartPage(cart.totalPrice, this));
  }

  Widget buildCart() {
    return ListView.builder(
        itemCount: cart.items.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Container(
                  height: 180,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: const Offset(0, 1)),
                    ],
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: cart.items[index].item.image!),
                        const SizedBox(width: 10),
                        Expanded(child: buildColumn(cart.items[index]))
                      ])));
        });
  }

  Widget buildColumn(CartItem item) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(item.item.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      const SizedBox(height: 6),
      Text(item.item.description,
          style: TextStyle(color: Colors.grey[600], fontSize: 16)),
      const SizedBox(height: 6),
      Text("\$${item.item.price}",
          style: const TextStyle(fontSize: 18, color: Colors.red)),
      const Expanded(
        flex: 1,
        child: SizedBox(height: 10),
      ),
      Text("Qty: ${item.quantity}",
          style: TextStyle(color: Colors.grey[600], fontSize: 16)),
      const SizedBox(height: 6),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text("\$${item.total}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.red)),
        IconButton(
            onPressed: () {
              dialog(item);
            },
            icon: const Icon(Icons.delete_outline_outlined))
      ])
    ]);
  }

  dialog(CartItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Xóa ${item.item.title} ?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Hủy")),
          TextButton(
              onPressed: () {
                cart.removeItem(item);
                Navigator.pop(context, true);
              },
              child: const Text("Xác nhận"))
        ],
      ),
    ).then((value) {
      if (value == true) {
        setState(() {});
      }
    });
  }

  @override
  void onClick() {
    if (cart.items.isNotEmpty) {
      DatabaseReference ref = FirebaseDatabase.instance
          .ref("user")
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("order")
          .push();
      ref.set(cart.toMap());

      FirebaseDatabase.instance
          .ref("user")
          .child(FirebaseAuth.instance.currentUser!.uid)
          .child("notification")
          .push()
          .set({
        "read": false,
        "title": "Đơn hàng ${ref.key} được tạo thành công và đang đợi xác nhận",
        "time": DateTime.now().toIso8601String()
      });

      FToast.toast(context, msg: "tạo đơn hàng thành công", duration: 1000);
      cart.items.clear();
      setState(() {});
    } else {
      FToast.toast(context, msg: "Your cart is empty", duration: 1000);
    }
  }
}
