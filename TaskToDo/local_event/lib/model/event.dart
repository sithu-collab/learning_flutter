class Event {
  final String imgPath, title, description, location, duration, punchLine1, punchLine2;
  final List categoryIds, galleryImages;

  Event(
      {this.imgPath,
      this.title,
      this.description,
      this.location,
      this.duration,
      this.punchLine1,
      this.punchLine2,
      this.categoryIds,
      this.galleryImages});
}

final fiveKmRunEvent = Event(
  imgPath: 'assets/images/event_images/Inlay5.jpg',
  title: '5 Kilometers Downtown Run',
  description: '',
  duration: '3h',
  location: 'Pleasant Park',
  punchLine1: 'Marathon!',
  punchLine2: 'The latest fad in foodology, get the inside scoup',
  galleryImages: [],
  categoryIds: [0,2]
);


final cookingEvent = Event(
    imgPath: 'assets/images/event_images/Inlay2.jpg',
    title: 'Granite Cooking Class',
    description: 'Guest list fill up fast so be sure to apply before hand to secure a spot.',
    duration: '3h',
    location: 'Food Court Avenue',
    punchLine1: 'Granite Cooking!',
    punchLine2: 'The latest fad in foodology, get the inside scoup',
    categoryIds: [0,1],
    galleryImages: ['assets/images/event_images/Inlay5.jpg', 'assets/images/event_images/Inlay2.jpg', 'assets/images/event_images/Inlay1.jpg',]
);

final musicConcept= Event(
    imgPath: 'assets/images/event_images/Inlay4.jpg',
    title: 'SAI SAI Music Concept',
    description: 'Listen to SAI SAI\'s latest compositions, come and join to know what is the happiness',
    duration: '5h',
    location: 'Mandalar Thiri Stadium, Mandalay',
    punchLine1: 'Music Lovers!',
    punchLine2: 'The latest fad in foodology, get the inside scoup',
    categoryIds: [0,4],
    galleryImages: []
);


final golfCompetition = Event(
    imgPath: 'assets/images/event_images/Inlay3.jpg',
    title: 'Season 2 Golf Estate',
    description: '',
    duration: '1d',
    location: 'Golf City, Yangon',
    punchLine1: 'Golf!',
    punchLine2: 'The latest fad in foodology, get the inside scoup',
    categoryIds: [0,3],
    galleryImages: []
);

final events = [
  fiveKmRunEvent,
  cookingEvent,
  musicConcept,
  golfCompetition,
];