class Meal {
  final String mealTime, name, kcal, imgPath, timeTaken, preparation;
  final List ingredients;

  Meal({this.mealTime, this.name, this.kcal, this.imgPath, this.timeTaken, this.preparation, this.ingredients});
}

final meals = [
  Meal(mealTime: 'BREAKFAST',
      name: 'Fruit Granola',
      kcal: '271',
      timeTaken: '10',
      imgPath: 'assets/images/Inlay_1.jpg',
      ingredients: [
        '1 cup of granola',
        '1 banana',
        '1/2 cup of raisins',
        '1 tbps of honey'
      ],
      preparation: 'What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing '
          'and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy t'
          'ext ever since the 1500s, when an unknown printer took a galley of type and scrambled'
          ' it to make a type specimen book. It has survived not only five centuries,'
          ' but also the leap into electronic typesetting, remaining essentially unchanged.'
          ' It was popularised in the 1960s with the release of Letraset sheets containing '
          'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus '
          'PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established '
          'fact that a reader will be distracted by the readable content of a page when looking '
          'at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal '
          'distribution of letters, as opposed to using making it look like readable English. '
          'Many desktop publishing packages and web page editors now use Lorem Ipsum as their'
          ' default model text, and a search for will uncover many web sites still in their '
          'infancy. Various versions have evolved over the years, sometimes by accident, sometimes'
          ' on purpose (injected humour and the like).Where does it come from?Contrary to '
          'popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of'
          ' classical Latin literature from 45 BC, making it over 2000 years old. Richard'
          ' McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.',

  ),
  Meal(mealTime: 'DINNER',
      name: 'Pesto Pasta',
      kcal: '612',
      timeTaken: '15',
      imgPath: 'assets/images/Inlay_2.jpg',
    ingredients: [
      '1 cup of granola',
      '1 banana',
      '1/2 cup of raisins',
      '1 tbps of honey'
    ],
    preparation: 'What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing '
        'and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy t'
        'ext ever since the 1500s, when an unknown printer took a galley of type and scrambled'
        ' it to make a type specimen book. It has survived not only five centuries,'
        ' but also the leap into electronic typesetting, remaining essentially unchanged.'
        ' It was popularised in the 1960s with the release of Letraset sheets containing '
        'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus '
        'PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established '
        'fact that a reader will be distracted by the readable content of a page when looking '
        'at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal '
        'distribution of letters, as opposed to using making it look like readable English. '
        'Many desktop publishing packages and web page editors now use Lorem Ipsum as their'
        ' default model text, and a search for will uncover many web sites still in their '
        'infancy. Various versions have evolved over the years, sometimes by accident, sometimes'
        ' on purpose (injected humour and the like).Where does it come from?Contrary to '
        'popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of'
        ' classical Latin literature from 45 BC, making it over 2000 years old. Richard'
        ' McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.',
  ),

  Meal(mealTime: 'SNACK',
      name: 'Keto Snack',
      kcal: '271',
      timeTaken: '20',
      imgPath: 'assets/images/Inlay_3.jpg',
    ingredients: [
      '1 cup of granola',
      '1 banana',
      '1/2 cup of raisins',
      '1 tbps of honey'
    ],
    preparation: 'What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing '
        'and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy t'
        'ext ever since the 1500s, when an unknown printer took a galley of type and scrambled'
        ' it to make a type specimen book. It has survived not only five centuries,'
        ' but also the leap into electronic typesetting, remaining essentially unchanged.'
        ' It was popularised in the 1960s with the release of Letraset sheets containing '
        'Lorem Ipsum passages, and more recently with desktop publishing software like Aldus '
        'PageMaker including versions of Lorem Ipsum.Why do we use it?It is a long established '
        'fact that a reader will be distracted by the readable content of a page when looking '
        'at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal '
        'distribution of letters, as opposed to using making it look like readable English. '
        'Many desktop publishing packages and web page editors now use Lorem Ipsum as their'
        ' default model text, and a search for will uncover many web sites still in their '
        'infancy. Various versions have evolved over the years, sometimes by accident, sometimes'
        ' on purpose (injected humour and the like).Where does it come from?Contrary to '
        'popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of'
        ' classical Latin literature from 45 BC, making it over 2000 years old. Richard'
        ' McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32.',
  ),
];