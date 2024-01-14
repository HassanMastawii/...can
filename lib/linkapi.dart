class AppLink {
  static const String serverLink = "https://app2.canary-chat.com";
  static const String apiLink = "$serverLink/api/";

  ///auth links
  static const String logInLink = "${apiLink}login";
  static const String registerLink = "${apiLink}register";

  ///user links
  static const String getMyProfileLink = "${apiLink}user";
  static const String searchUserLink = "${apiLink}x/searchuser";

  ///room links
  static const String searchRoomLink = "${apiLink}x/searchroom";
  static const String roomInfoLink = "${apiLink}x/roominfo";
  static const String createRoomLink = "${apiLink}x/createroom";
  static const String upRoomImgLink = "${apiLink}x/up_room_img";
  static const String newRoomAdsLink = "${apiLink}x/new_room_ads";
  static const String checkRoomLink = "${apiLink}x/checkroom";
  static const String dads1Link = "${apiLink}x/dads1";
  static const String dads2Link = "${apiLink}x/dads2";
  static const String getbackgroundsLink = "${apiLink}x/getback";
  static const String setbackgroundLink = "${apiLink}x/setbackground";
  static const String updateRoomPassLink = "${apiLink}x/update_room_pass";
  static const String getUserListLink = "${apiLink}x/getuserlist";
  static const String giftListLink = "${apiLink}x/giftlist";
  static const String removetouserlistLink = "${apiLink}x/removetouserlist";
  static const String addtouserlistLink = "${apiLink}x/addtouserlist";

  ///message links
  static const String getMessagesLink = "${apiLink}x/messages";
  static const String userEntryLink = "${apiLink}x/userentry";
  static const String userLeaveLink = "${apiLink}x/userleave";
  static const String voiceLink = "${apiLink}x/voice";
}
