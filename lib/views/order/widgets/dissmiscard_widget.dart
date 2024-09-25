import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/app_constants.dart';

class SwipeableOrderCard extends StatefulWidget {
  final String cmd;
  final String title;
  final String phone;
  final String waitTime;
  final String amount;

  const SwipeableOrderCard({
    super.key,
    required this.cmd,
    required this.title,
    required this.phone,
    required this.waitTime,
    required this.amount,
  });

  @override
  _SwipeableOrderCardState createState() => _SwipeableOrderCardState();
}

class _SwipeableOrderCardState extends State<SwipeableOrderCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  bool isSwiped = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    // Create the offset animation for sliding the card
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-0.4, 0),  // Swipe partially to reveal buttons
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  void _handleSwipe() {
    // Toggle swipe animation
    if (isSwiped) {
      _controller.reverse(); // Move card back to original position
    } else {
      _controller.forward(); // Move card to reveal buttons
    }
    isSwiped = !isSwiped;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Trigger the swipe when dragging ends
        if (details.primaryVelocity! < 0) {
          // Swiping to the left
          _handleSwipe();
        } else if (details.primaryVelocity! > 0 && isSwiped) {
          // Swiping to the right (only when card is swiped)
          _handleSwipe();
        }
      },
      child: Stack(
        children: [
          // Background buttons (Prête, Annulez)
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.blue,
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle "Prête" action
                      print('Order ${widget.cmd} marked as ready.');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Prête',
                          style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.string(
                          AppConstants.readyIconSvg,  // Placeholder for ready icon
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      // Handle "Annulez" action
                      print('Order ${widget.cmd} cancelled.');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Annulez',
                          style: GoogleFonts.itim(
                            textStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SvgPicture.string(
                          AppConstants.cancelIconSvg,  // Placeholder for cancel icon
                          height: 24,
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // The card that moves
          SlideTransition(
            position: _offsetAnimation,
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Order Circle
                    Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: AppConstants.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.cmd,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 18 / 15,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Order Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.itim(
                              textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                height: 18 / 15,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.phone,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.itim(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 18 / 15,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Attente : ${widget.waitTime}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.itim(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 18 / 15,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Montant : ${widget.amount}',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.itim(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                height: 18 / 15,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Call Button
                    const SizedBox(width: 2),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(height: 98),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.string(
                              AppConstants.phoneSvg,  // Placeholder for the call icon
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text("Appeler"),
                          ],
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
    );
  }
}
