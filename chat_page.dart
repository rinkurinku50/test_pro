import 'package:flutter/material.dart';
import 'package:flutter_ui/utils.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Message> messages = [
    Message(id: 0, received: false, text: " Hi Ben, it's great to finally meet you in person.", timestamp: '4:30 PM'),
    Message(
        id: 1,
        received: true,
        text: "Yes, same here Alex. I've heard a lot about your company and the work you do",
        timestamp: '4:31 PM'),
    Message(
        id: 2, received: false, text: "Thank you. Likewise, I've been following your company's progress and I'm impressed with your growth.", timestamp: '4:32 PM'),
    Message(id: 3, received: true, text: "Thanks, we've been working hard to expand our reach. So, what brings you here today?", timestamp: '4:33 PM'),
    Message(id: 4, received: false, text: "I wanted to discuss the possibility of a collaboration between our two companies. I think there are some areas where we can work together to create something truly innovative.", timestamp: '4:33 PM'),
    Message(id: 5, received: true, text: " I agree, I've been thinking the same thing. Can you tell me more about your vision?", timestamp: '4:33 PM'),
    Message(id: 6, received: false, text: "Sure. I think we could combine our expertise in software development and data analysis to create a new product that would be highly valuable to our customers. We could each bring our own strengths to the table and work together to create something truly unique.", timestamp: '4:33 PM'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peachColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(
            20,
            14,
            20,
            MediaQuery.of(context).viewInsets.bottom + 30),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
              color: greyColor, borderRadius: BorderRadius.circular(40)),
          child: Row(
            children: [
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter Your Message",
                      hintStyle: TextStyle(fontSize: 18)),
                ),
              ),
              CircleAvatar(
                backgroundColor: peachColor,
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top + 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: greyColor,
                  radius: 26,
                  backgroundImage:
                      const AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Alex Smith",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Online",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  child: Icon(
                    Icons.call,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) => MessageBubble(
                  message: messages[index],
                ),
                itemCount: messages.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MessageBubble extends StatefulWidget {
  final Message message;
  const MessageBubble({Key? key, required this.message}) : super(key: key);

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  bool showTimeS = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
          alignment: widget.message.received
              ? Alignment.centerLeft
              : Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showTimeS = !showTimeS;
                  });
                },
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: widget.message.received ? greyColor : peachColor,
                  ),
                  child: Text(
                    widget.message.text,
                    style: const TextStyle(
                        fontSize: 18, height: 1.4, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (showTimeS) ...[
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    widget.message.timestamp,
                    style: const TextStyle(fontSize: 12, height: 1.4),
                  ),
                )
              ]
            ],
          )),
    );
  }
}

class Message {
  final int id;
  final String text;
  final bool received;
  final String timestamp;

  Message(
      {required this.id,
      required this.received,
      required this.text,
      required this.timestamp});
}
