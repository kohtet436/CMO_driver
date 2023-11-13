import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // English
        'en_MM': {
          // Log In Screen
          'greetings': 'Welcome!',
          'logIn': 'Log in',
          'logInId': 'ID',
          'logInPassword': 'Password',
          'driverIdErrorText': 'Please enter valid driver id.',
          'passwordErrorText': 'Pease enter valid password.',
          'dataWrongErrorText':
              'Your password or email is incorrect. Please try again or contact admin.',
          'dataBlankErrorText': 'Please enter valid input',

          // Settings Screen
          'privacyAndSecurity': 'Privacy And Security',
          'changePassword': 'Change Password',
          'language': 'Language',
          'changeLanguage': 'Change Language',

          // Navigation Screen
          'home': 'Home',
          'profile': 'Profile',
          'information': 'Information',
          'leaveManagement': 'Leave Management',
          'settings': 'Settings',
          'logOut': 'Log out',

          // Leaves Screen
          'driverLeave': 'Driver Leave',
          'vehicleLeave': 'Vehicle Leave',
          'status': 'Status',
          'pendingLeave': 'Pending Leave',
          'leaveHistory': 'Leave History',
          'cancelLeaveConfirmText':
              'Please confirm that you want to cancel this leave request.',

          // Change Password Screen
          'changePasswordAppBar': 'Change Password',
          'currentPassword': 'Current Password',
          'currentPasswordHint': 'Enter the current password',
          'newPassword': 'New Password',
          'newPasswordHint': 'Enter the new password',
          'newAgainPasswordHint': 'Enter the new password (again)',
          'changePasswordButton': 'Change',
          'minimumCharacterCount': 'At least Eight letters',
          'oneSmallLetter': 'One small letter',
          'oneCapitalLetter': 'One capital letter',
          'oneNumber': 'One number letter',
          'oneSpecialLetter': 'One special letter (e.g. - ! @ # \$)',
          'isMatch': 'Passwords match',
          'confirmation': 'Confirmation',
          'changePaswordConfirmText':
              'Please confirm that you want to change your password.',

          // Leave Request Screen
          'leaveRequestAppBar': 'Leave Request',
          'leaveType': 'Leave Type',
          'leaveDays': 'Leave Days',
          'oneDayLeave': 'One day',
          'multipleDaysLeave': 'More than one day',
          'leaveDate': 'Leave Date',
          'leaveReason': 'Leave Reason',
          'leaveRequestButton': 'Apply Leave',
          'warning': 'Warning',
          'leaveReasonEmptyWarning': 'Reason cannout be empty',

          // Base Route Details Screen
          'totalFerryStops': 'Total Ferry Stops',
          'totalEmployees': 'Total Employees',
          'vehicleInfo': 'Vehicle Info',
          'vehicleModel': 'Model',
          'vehicleColor': 'Color',
          'vehicleLicensePlate': 'License Plate',
          'vehicleLicenseExpiredDate': 'License Expired Date',
          'vehicleCapacity': 'Capacity',
          'ferryStopsInfo': 'Ferry Stops Info',
          'employees': 'Employees',

          // Profile Screen
          'email': 'Email Address',
          'phone': 'Phone',
          'nrc': 'NRC Number',
          'address': 'Address',
          'dateOfBirth': 'Date of Birth',
          'gender': 'Gender',
          'licenseNumber': 'License Number',
          'licenseColor': 'License Color',
          'licenseExpiredDate': 'License Expired Date',
          'updatePhoneNumberHint': 'Please input your phone number',
          'updateAddressHint': 'Please input your address',
          'phoneNumberError': 'Phone number needs to start with 09',
          'phoneNumberInvalid': 'Please enter a valid phone number',
          'addressTooShortHint':
              'Address needs to be long at least 4 characters',

          // Employee Attendance Screen
          'employeeAttendanceAppBar': 'Employee Attendance',
          'present': 'Present',
          'absent': 'Absent',
          'late': 'Late',
          'leave': 'Leave',
          'coming': 'Coming',
          'noEmployee': 'No employee',
          'employeeStatus': 'Employee Status',
          'employeeList': 'Employee List',
          'checkedInTime': 'Checked in: ',
          'changeStatusConfirmText':
              'Please confrim that you want to change the status.',
          'sendText': 'Send',
          'employeeAttendance': 'Employee Attendance',
          'sendAttendanceConfirmText':
              'Please confirm that you want to send the attendance list.',

          // Home Screen
          'checkAttendance': 'Check Attendance',
          'startRoute': 'Start Route',
          'endRoute': 'End Route',
          'currentFerryStop': 'Current Ferry Stop',
          'nextFerryStop': 'Next Ferry Stop',
          'checkIn': 'Check In Ferry Stop',
          'checkOut': 'Check Out Ferry Stop',
          'routeInfo': 'Route',
          'morning': 'Morning',
          'evening': 'Evening',
          'startRouteConfirmText':
              'Please confirm that you want to start the route.',
          'checkInConfirmText':
              'Please confirm that you have reached the ferry stop.',
          'checkOutConfirmText':
              'Please confirm that you are going to leave the ferry stop.',
          'endRouteConfirmText':
              'Please confirm that you want to end the route.',
          'noMoreRoute': 'No more route',
          'routeEnded': 'Route ended',

          // Daily Route Ferry Stop List Screen
          'ferryStopList': 'Ferry Stop List',

          // General
          'confirmButton': 'Confirm',
          'backButton': 'Back',
          'rangeSpacer': 'to',
          'spacer': ', ',
        },

        // Burmese
        'my_MM': {
          // Log In Screen
          'greetings': 'မင်္ဂလာပါ',
          'logIn': 'ဝင်မည်',
          'logInId': 'ဝန်ထမ်းနံပါတ်',
          'logInPassword': 'စကားဝှက်',
          'driverIdErrorText': 'မှန်ကန်သောအချက်အလက် ဖြည့်သွင်းပါ',
          'passwordErrorText': 'မှန်ကန်သောအချက်အလက် ဖြည့်သွင်းပါ',
          'dataWrongErrorText':
              'ထည့်သွင်းထားသောအချက်အလက်များ မှားယွင်းနေပါသည်။ ထပ်မံ၍ ကြိုးစားပါ။',
          'dataBlankErrorText': 'အချက်အလက်များ ပြည့်စုံစွာဖြည့်သွင်းပါ',

          // Settings Screen
          'privacyAndSecurity': 'ကိုယ်ရေးကိုယ်တာနှင့် လုံခြုံရေး',
          'changePassword': 'စကားဝှက်ပြောင်းလဲမည်',
          'language': 'ဘာသာစကား',
          'changeLanguage': 'ဘာသာစကားပြောင်းလဲမည်',

          // Navigation Screen
          'home': 'ပင်မစာမျက်နှာ',
          'profile': 'မိမိအကြောင်း',
          'information': 'ပင်မလမ်းကြောင်း',
          'leaveManagement': 'ခွင့်ယူရန်',
          'settings': 'ပြင်ဆင်ခြင်း',
          'logOut': 'ထွက်မည်',

          // Leaves Screen
          'driverLeave': 'ယာဥ်မောင်းခွင့်',
          'vehicleLeave': 'ယာဥ်ခွင့်',
          'status': 'အခြေအနေ',
          'pendingLeave': 'လက်ရှိတင်ထားသောခွင့်',
          'leaveHistory': 'ခွင့်မှတ်တမ်း',
          'cancelLeaveConfirmText':
              'လက်ရှိတင်ထားသောခွင့်ကို Cancelရန် သေချာပါသလား။',

          // Change Password Screen
          'changePasswordAppBar': 'လက်ရှိစကားဝှက်ပြောင်းလဲရန်',
          'currentPassword': 'လက်ရှိစကားဝှက်',
          'currentPasswordHint': 'လက်ရှိစကားဝှက်ကို ရိုက်သွင်းပါ',
          'newPassword': 'စကားဝှက်အသစ်',
          'newPasswordHint': 'စကားဝှက်အသစ်ကို ရိုက်သွင်းပါ',
          'newAgainPasswordHint': 'စကားဝှက်အသစ်ကို ထပ်မံ၍ရိုက်သွင်းပါ',
          'changePasswordButton': 'ပြောင်းမည်',
          'minimumCharacterCount': 'စာလုံးရေအနည်းဆုံး ၈ လုံး',
          'oneSmallLetter': 'အက္ခရာအသေး ၁ လုံး',
          'oneCapitalLetter': 'အက္ခရာအကြီး ၁ လုံး',
          'oneNumber': 'ဂဏန်း ၁ လုံး',
          'oneSpecialLetter': 'သင်္ကေတ ၁ လုံး (ဥပမာ - ! @ # \$)',
          'isMatch': 'ကိုက်ညီသည်',
          'confirmation': 'အတည်ပြုခြင်း',
          'changePaswordConfirmText': 'စကားဝှက်ပြောင်းလဲရန် သေချာပါသလား။',

          // Leave Request Screen
          'leaveRequestAppBar': 'ခွင့်ယူရန်',
          'leaveType': 'ခွင့်အမျိုးအစား',
          'leaveDays': 'ခွင့်ရက်အရေအတွက်',
          'oneDayLeave': 'တစ်ရက်',
          'multipleDaysLeave': 'တစ်ရက်နှင့်အထက်',
          'leaveDate': 'ခွင့်ရက်',
          'leaveReason': 'ခွင့်အကြောင်းအရင်း',
          'leaveRequestButton': 'ခွင့်တင်မည်',
          'warning': 'သတိပေးချက်',
          'leaveReasonEmptyWarning':
              'ခွင့်အကြောင်းအရင်းအား မဖြစ်မနေထည့်သွင်းရမည်။',

          // Base Route Details Screen
          'totalFerryStops': 'စုစုပေါင်းမှတ်တိုင်',
          'totalEmployees': 'စုစုပေါင်းစီးနင်းသူ',
          'vehicleInfo': 'ကားအချက်အလက်',
          'vehicleModel': 'ကားမော်ဒယ်',
          'vehicleColor': 'ကားအရောင်',
          'vehicleLicensePlate': 'ကားနံပါတ်',
          'vehicleLicenseExpiredDate': 'သက်တမ်းကုန်ချိန်',
          'vehicleCapacity': 'လူပမာဏ',
          'ferryStopsInfo': 'ဖယ်ရီမှတ်တိုင်များ',
          'employees': 'စီးနင်းသူများ',

          // Profile Screen
          'email': 'အီးမေးလ်လိပ်စာ',
          'phone': 'ဖုန်းနံပါတ်',
          'nrc': 'နိုင်ငံသားမှတ်ပုံတင်အမှတ်',
          'address': 'လိပ်စာ',
          'dateOfBirth': 'မွေးနေ့',
          'gender': 'လိင်',
          'licenseNumber': 'လိုင်စင်နံပါတ်',
          'licenseColor': 'လိုင်စင်အရောင်',
          'licenseExpiredDate': 'လိုင်စင်သက်တမ်းကုန်ချိန်',
          'updatePhoneNumberHint': 'ဖုန်းနံပါတ်အား ထည့်သွင်းပါ',
          'updateAddressHint': 'လိပ်စာအား ထည့်သွင်းပါ',
          'phoneNumberError': 'ဖုန်းနံပါတ်သည် ၀၉ နှင့်စတင်ရန်လိုအပ်သည်',
          'phoneNumberInvalid': 'မှန်ကန်သောဖုန်းနံပါတ်ကို ထည့်သွင်းပါ',
          'addressTooShortHint': 'လိပ်စာသည် အနည်းဆုံးစာလုံးရေ ၄ လုံးရှိရမည်',

          // Employee Attendance Screen
          'employeeAttendanceAppBar': 'ယနေ့စီးနင်းလိုက်ပါသူများ',
          'present': 'စီးနင်း',
          'absent': 'ပျက်ကွက်',
          'late': '‌နောက်ကျ',
          'leave': 'ခွင့်',
          'coming': 'လိုက်မည်',
          'noEmployee': 'စီးနင်းသူမရှိပါ',
          'employeeStatus': 'စီးနင်းသူအခြေအနေ',
          'employeeList': 'စီးနင်းသူစာရင်း',
          'checkedInTime': 'ယာဥ်ပေါ်တက်ချိန် - ',
          'changeStatusConfirmText': 'ပြောင်းလဲရန် သေချာပါသလား။',
          'sendText': 'ပေးပို့မည်',
          'employeeAttendance': 'ယနေ့စီးနင်းသူများ',
          'sendAttendanceConfirmText':
              'ယနေ့စီးနင်းသူစာရင်းအား ပေးပို့ရန်သေချာပါလား။',

          // Home Screen
          'checkAttendance': 'လူစာရင်းစစ်ရန်',
          'startRoute': 'လမ်းကြောင်းစတင်မည်',
          'endRoute': 'လမ်းကြောင်းအဆုံးသတ်မည်',
          'currentFerryStop': 'ယခုရောက်ရှိနေသည့်မှတ်တိုင်',
          'nextFerryStop': 'ယခုရောက်ရှိမည့်မှတ်တိုင်',
          'checkIn': 'မှတ်တိုင်သို့ရောက်ရှိပါပြီ',
          'checkOut': 'မှတ်တိုင်မှထွက်ခွာပါပြီ',
          'routeInfo': 'လမ်းကြောင်း',
          'morning': 'မနက်ပိုင်း',
          'evening': 'ညနေပိုင်း',
          'startRouteConfirmText': 'လမ်းကြောင်းစတင်ရန် သေချာပါသလား။',
          'checkInConfirmText': 'မှတ်တိုင်သို့ရောက်ရှိကြောင်း အတည်ပြုပါ။',
          'checkOutConfirmText': 'မှတ်တိုင်မှထွက်ခွာကြောင်း အတည်ပြုပါ။',
          'endRouteConfirmText': 'လမ်းကြောင်းအား အဆုံးသတ်ရန် သေချာပါသလား။',
          'noMoreRoute': 'လမ်းကြောင်းမရှိတော့ပါ',
          'routeEnded': 'လမ်းကြောင်းပြီးဆုံးပါပြီ',

          // Daily Route Ferry Stop List Screen
          'ferryStopList': 'ယနေ့ဖယ်ရီမှတ်တိုင်များ',

          // General
          'confirmButton': 'လုပ်မည်',
          'backButton': 'နောက်သို့',
          'rangeSpacer': 'မှ',
          'spacer': '၊ ',
        }
      };
}
