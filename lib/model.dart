enum MessageType {user, bot}

class GptMessage {
  final String mesageText;
  final MessageType messagetype;

  GptMessage({required this.mesageText, required this.messagetype});
}
