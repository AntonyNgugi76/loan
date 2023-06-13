class SheIQquestions {
  var questions = [
    {
      'id': 1,
      'alias': 'loanNumber',
      'quiz_title': 'Previous loan experience',
      'question':
          'In the last one year, how many loans has your household taken?',
      'answer_tile': '',
      'type': 1,
      'input_type': 1,
      'answer_options': []
    },

    //  1 loanNumber:1
//     'In the last one year, how many loans has your household taken?
// 'for what purpose was the loan taken?
// 'From whom was the loan taken?'
// 'How long ago was the loan taken out. (in hours,days,months or year)?',
// 'Who in the household decided to take this loan?'
// 'Do you or anyone in your household have a bank account?',
// 'Do you have an ATM card?'
// 'What type of business have you?',
// 'Do you have an insurance policy?'
// 'How long has your business been in operation?',

    //  2loanPurpose:"Start a new business","Home improvement/repair"
    //  3 whereTaken:"Family member","Commercial bank"
    //  4 longAgoTaken:3 years
    //  5 whoTookLoan:Me
    // 6  bankAccount:true
    //  7 card:true
    //  8  insurance:true
    //  9 business:true
    //  10typeOfBusiness:IT
    // 11 businessDuration:3
    // 12 industry:"Agribusiness","Beauty","ICT and communications"
    // 13 businessTypeOfLoan:"Working capital","Overdraft"
    // 14 collateralType:Unknown
    {
      'id': 2,
      'alias': 'loanPurpose',
      'quiz_title': 'Previous loan experience',
      'question': 'for what purpose was the loan taken?',
      'answer_tile': '(Please fill multiple if necessary) ?',
      'type': 1,
      'input_type': 2,
      'answer_options': []
    },
    {
      'id': 3,
      'alias': 'whereTaken',
      'quiz_title': 'Previous loan experience',
      'question': 'From whom was the loan taken?',
      'answer_tile': '(Please fill multiple if necessary)',
      'type': 2,
      'input_type': 2,
      'answer_options': [
        'Family member',
        'Commercial bank',
        'Micro finance institutions',
        'Cooperative',
        'Self help group',
        'Finance company',
        'Friend',
        'Provident fund',
        'Others'
      ]
    },
    {
      'id': 4,
      'alias': 'longAgoTaken',
      'quiz_title': 'Previous loan experience',
      'question':
          'How long ago was the loan taken out. (in hours,days,months or year)?',
      'answer_tile': 'please add time period time period',
      'type': 1,
      'input_type': 2,
      'answer_options': []
    },
    {
      'id': 5,
      'alias': 'whoTookLoan',
      'quiz_title': 'Previous loan experience',
      'question': 'Who in the household decided to take this loan?',
      'answer_tile': 'Enter appropriately',
      'type': 1,
      'input_type': 2,
      'answer_options': []
    },

    {
      'id': 6,
      'alias': 'bankAccount',
      'quiz_title': 'Previous loan experience',
      'question': 'Do you or anyone in your household have a bank account?',
      'answer_tile': 'Select one',
      'type': 2,
      'input_type': 3,
      'answer_options': ['Yes', 'No']
    },
    {
      'id': 7,
      'alias': 'card',
      'quiz_title': 'Previous loan experience',
      'question': 'Do you have an ATM card?',
      'answer_tile': 'Select one',
      'type': 2,
      'input_type': 3,
      'answer_options': ['Yes', 'No']
    },
    {
      'id': 8,
      'alias': 'insurance',
      'quiz_title': 'Previous loan experience',
      'question': 'Do you have an insurance policy?',
      'answer_tile': 'Select one',
      'type': 2,
      'input_type': 3,
      'answer_options': ['Yes', 'No']
    },
    {
      'id': 9,
      'alias': 'business',
      'quiz_title': 'current business information',
      'question': 'Do you have a business?',
      'answer_tile': 'Select one',
      'type': 2,
      'input_type': 3,
      'answer_options': ['Yes', 'No']
    },
    {
      'id': 10,
      'alias': 'typeOfBusiness',
      'quiz_title': 'current business information',
      'question': 'What type of business have you?',
      'answer_tile': 'Select one or more',
      'type': 2,
      'input_type': 2,
      'answer_options': [
        'Start of a completely new enterprise',
        'Creation by an existing enterprise (affiliate)',
        'Restart of business after dormancy of over 2 years',
        'Take-over or purchase of another enterprise'
      ]
    },
    {
      'id': 11,
      'alias': 'businessDuration',
      'quiz_title': 'current business information',
      'question': 'How long has your business been in operation?',
      'answer_tile': 'Set time period',
      'type': 1,
      'input_type': 2,
      'answer_options': []
    },
    // {
    //   'id': 11,
    //   'alias': 'businessDuration',
    //   'quiz_title': 'current business information',
    //   'question': 'How long has your business been in operation?',
    //   'answer_tile': 'Set time period',
    //   'type': 1,
    //   'input_type':1,
    //   'answer_options': []
    // },
    {
      'id': 12,
      'alias': 'industry',
      'quiz_title': 'current business information',
      'question': 'What industry is your business in?',
      'answer_tile': 'Select one',
      'type': 2,
      'input_type': 2,
      'answer_options': [
        'Agribusiness',
        'Beauty',
        'ICT and communications',
        'Construction',
        'Energy',
        'Financial services',
        'Media and marketing',
        'Non-profit',
        'Property',
        'Retail',
        'Others'
      ]
    },

    {
      'id': 13,
      'alias': 'businessTypeOfLoan',
      'quiz_title': 'Previous loan experience',
      'question': 'What type of loans do you have for your business?',
      'answer_tile': 'Select one',
      'type': 2,
      'input_type': 2,
      'answer_options': [
        'Working capital',
        'Overdraft',
        'Equipment leasing',
        'Commercial mortgage',
        'Others'
      ]
    },
    // {
    //   'id': 14,
    //   'alias': 'collateralType',
    //   'quiz_title':
    //       'Referring to a recent loan or line of credit, what collateral type was required?',
    //   'question': 'What type of loans do you have for your business?',
    //   'answer_tile': 'Select one',
    //   'type': 2,
    //   'input_type': 2,
    //   'answer_options': [
    //     'Land  and buildings under ownership by the business',
    //     'Machinery and equipment',
    //     'Accounts receivables and inventories',
    //     'Personal assets',
    //     'Others'
    //   ]
    // }
  ];

  List<Map<String, dynamic>> sample_news = [
    {
      'image':
          'https://diviyablog.files.wordpress.com/2020/04/featured-image.jpg?w=604&amp;h=270&amp',
      'title':
          'Prepare women for how much the coronavirus crisis would deepen and fuel pre-existing inequalities.',
      'author': 'image',
      'date': 'image',
      'duration': 'image',
      'body':
          'There are a multitude of ways women have shouldered much of the burden of the pandemic. From women being more likely to lose jobs or be furloughed due to being over-represented in sectors worst ravaged by the pandemic, to being forced to give birth alone, to struggles to get contraception, to domestic abuse surging, and more.',
      'link': 'image',
    },
    {
      'image':
          'https://moneycoachescanada.ca/wp-content/uploads/2018/03/iStock-919119484-MCC-Colours-300x300.jpg',
      'title':
          'Prepare women for how much the coronavirus crisis would deepen and fuel pre-existing inequalities.',
      'author': 'image',
      'date': 'image',
      'duration': 'image',
      'body':
          'There are a multitude of ways women have shouldered much of the burden of the pandemic. From women being more likely to lose jobs or be furloughed due to being over-represented in sectors worst ravaged by the pandemic, to being forced to give birth alone, to struggles to get contraception, to domestic abuse surging, and more.',
      'link': 'image',
    },
    {
      'image':
          'http://media.pbseducation.org/craft.prod/assets/_1200x671_crop_center-center_75/Women-in-history-blue-blog-header.png',
      'title':
          'Prepare women for how much the coronavirus crisis would deepen and fuel pre-existing inequalities.',
      'author': 'image',
      'date': 'image',
      'duration': 'image',
      'body':
          'There are a multitude of ways women have shouldered much of the burden of the pandemic. From women being more likely to lose jobs or be furloughed due to being over-represented in sectors worst ravaged by the pandemic, to being forced to give birth alone, to struggles to get contraception, to domestic abuse surging, and more.',
      'link': 'image',
    }
  ];
}
