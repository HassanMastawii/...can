// {
//     url: api/x/messages,
//     request: get,
//     auth: token,
//     query: None,
//     response: #all msg in all groub and usere
// }
// {
//     url : api/x/searchuser,
//     request: get
//     auth: token,
//     query: search, #-->  Search by user_id or username or user contry
//     response:  #data of user that like $srarch
// }
// {
//     url : api/x/messages,
//     request: post,
//     auth: token,
//     query: [
//         'from_user',
//         'to_user',
//         'room_id',
//         'type'
//     ],
//     response: #status => success
// }
// {
//     url: api/x/voice,
//     request: post,
//     auth: token,
//     query: [
//         'recording' #=> file request
//     ],
//     response: #url of voice in root dir
// }
// {
//     url: api/x/userentry,
//     request: post,
//     auth: token,
//     query: [
//         'room_id'
//     ],
//     response: #None
// }
// {
//     url: api/x/userleave,
//     request: post,
//     auth: token,
//     query: [
//         'room_id'
//     ],
//     response: #None
// }
// {
//     url: api/x/dads1,
//     request: get,
//     auth: token,
//     query: None,
//     response: #Ads in first section with all info of ads
// }
// {
//     url: api/x/dads2,
//     request: get
//     auth: token,
//     query: None,
//     response: #Ads in secondary  section with all info of ads
// }
// {
//     url: api/x/createroom,
//     request: post,
//     auth: token,
//     query:[
//         'name' #=> name of room
//         'password' #=> password of room If found
//     ],
//     response: #return to home page
// }
// {
//     url: api/x/checkroom,
//     request: get,
//     auth: token,
//     query: None,
//     response: #if the user have room return 1 if not return 0
// }
// {
//     url: api/x/searchroom,
//     request: get,
//     auth: token,
//     query: [
//         'search' #=> name or contry
//     ],
//     response : #reqord of room that like $search
// }
// {
//     url: api/x/roominfo,
//     request: get,
//     auth: token,
//     query: [
//         'room_id'
//     ],
//     response: #room info
// }
// {
//     url: api/x/up_room_img,
//     request: post,
//     auth: token,
//     query:[
//         'image' # request file as (jpeg,png,jpg,gif)
//     ],
//     response: [
//         'message', #=>msg of status
//         'src' #=>src url of image
//     ]
// }
// {
//   url: api/x/new_room_ads,
//   request: post,
//   auth: token,
//   query: [
//     'room_id',
//     'room_owner',
//     'Ads' #=> Text Ads
//   ],
//   response: #message
// }

// {
//   # أنشاء روم
//     url: api/x/createroom,
//     request: post,
//     auth: token,
//     query:[
//         'name' #=> أسم الروم
//         'password' #=> الباسورد اذا كانت موجودة
//     ],
//     response: null #=>  لا شيئ
// }
// {
//   # التحقق اذا كان لليوزر روم
//     url: api/x/checkroom,
//     request: get,
//     auth: token,
//     query: None,
//     response: # أذا كان لليوزر روم = 1
//               # أذالم يكن للسوزر روم = 2
// }
// {
//   #البحث عن روم
//     url: api/x/searchroom,
//     request: get,
//     auth: token,
//     query: [
//         'search' #=> اسم البلد او اسم الروم
//     ],
//     response : #كل الرومات المشابهة لهذا الاسم
// }
// {
//   # معلومات الروم
//     url: api/x/roominfo,
//     request: get,
//     auth: token,
//     query: [
//         'room_id'
//     ],
//     response: # معلومات الروم
// }
// {
//   #تحديث صورة الروم
//     url: api/x/up_room_img,
//     request: post,
//     auth: token,
//     query:[
//         'image' # request file as (jpeg,png,jpg,gif)
//     ],
//     response: [
//         'message', #=>رسالة بحالة الطلب
//         'src' #=>مسار الصورة
//     ]
// }
// {
//   #تحديث حالة الروم
//   url : /api/x/up_room_status,
//   request : post,
//   auth: token,
//   query: [
//     'room_id',  # ID الروم
//     'id' #ID  الحالة
//   ],
// }

// {
//   #أضافة اعلان جديد للروم
//   url : /api/x/new_room_ads,
//   request : post,
//   auth: token,
//   query: [
//     'room_id',
//     'room_owner', # اسم صاحي الاعلان من المشرفين
//     'Ads' # نص الاعلان
//   ],
//   response: Null
// }
// {
//   # تغيير باسورد الروم
//   url : /api/x/update_room_pass,
//   request : post,
//   auth: token,
//   query: [
//     'room_id',
//     'password'
//   ],
//   response:  'message' => 'Password update successfully'
// }
// {
//   #  خلفيات الروم
//   url : /x/getback,
//   request : get,
//   auth: token,
//   query: [
// null
//   ],
//   response: #  قائمة بخلفيات الروم الموجودة مع المعلومات
// }
// {
//   # تعيين خلفية للروم
//   url :  /api/x/setbackground,
//   request : post,
//   auth: token,
//   query: [
// 'room_id',
// 'backsrc' # مسار الخلفية من قائمة الهلفيات المستدعاة
//   ],
//   response: Null
// }
// {
//   # تسجيل عمليكة دخول للروم بالسجل
//   url :  /api/x/room_enter_logs,
//   request : post,
//   auth: token,
//   query: [
//     'room_id',

//   ],
//   response: Null
// }
// {
//     # أضافة اليوزر الى قائمة يوزرات الروم
//   url :  /api/x/addtouserlist,
//   request : post,
//   auth: token,
//   query: [
//     'room_id'

//   ],
//   response: Null
// }
// {
//         # ازالة اليوزر الى قائمة يوزرات الروم

//   url :  /api/x/removetouserlist,
//   request : get,
//   auth: token,
//   query: [
//     None
//   ],
//   response: Null
// }
// {

//   url :  /api/x/getuserlist,
//   request : any,
//   auth: token,
//   query: [
// 'room_id'

//   ],
//   response: multi data # coin list and user list in room
// }
// {

//   url :  /api/x/getallcointoroom,
//   request : post,
//   auth: token,
//   query: [

// 'room_id'
//   ],
//   response: #total coin list daily in room
// }

// {
// # gift data
//   url :  /api/x/giftlist,
//   request : get,
//   auth: token,
//   query: [
//     None
//   ],
//   response: #return gift list
// }

// {
// # get user log
//   url :  /api/x/dlogs,
//   request : get,
//   auth: token,
//   query: [

// None
//   ],
//   response: Null
// }

// {
//   url :  /api/x/create_family,
//   request : post,
//   auth: token,
//   query: [

// 'family_pic' => img file,
// 'family_name'
// 'family_bio'

//   ],
//   response: Null
// }
// {
// # get list of family
//   url :  /api/x/family_list,
//   request : post,
//   auth: token,
//   query: [
// 'id' => # id of user

//   ],
//   response: check_fam # chek if user in family
//   family_list # list of all family
// }
// {

//   url :  /api/x/family_list_by_id,
//   request : get,
//   auth: token,
//   query: [
// 'id' # id of family


//   ],
//   response: family_info # family info
//   family_member # family member
// }
