// Sunday is 0, Saturday is 6
const daysOfTheWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
const daysInMonth = {
    '1': 31,
    '2': 28,
    '3': 31,
    '4': 30,
    '5': 31,
    '6': 30,
    '7': 31,
    '8': 31,
    '9': 30,
    '10': 31,
    '11': 30,
    '12': 31,
};
const firstDay = {
  '2012': {
    '2': 3,
  },
  '2013': {
    '1': 2,
    '2': 5,
    '3': 5,
    '4': 1,
    '5': 3,
    '6': 6,
    '7': 1,
    '8': 4,
    '9': 0,
    '10': 2,
    '11': 5,
    '12': 0
  },
  '2014': {
    '12': 1
  },
  '2015': {
    '2': 0,
  },
};

export const meetup = (year, month, typeOfDay, dayOfWeek)  => {
  const yearStr = `${year}`
  const monthStr = `${month}`
  // group number days by day of the week
  const firstDayOfTheMonth = firstDay[yearStr][monthStr]
  let datesWeekdays = {};
  daysOfTheWeek.forEach(weekday => {
    datesWeekdays[weekday] = [];
  })
  let totalDays = daysInMonth[monthStr]
  if(year == 2012 && month == 2) {totalDays = 29}
  for (var day = 1; day <= totalDays; day++) {
    let today = (day - 1 + firstDayOfTheMonth) % 7
    let weekday = daysOfTheWeek[today]
    datesWeekdays[weekday].push(day)
  }
  
  const meetupWeekdayDates = datesWeekdays[dayOfWeek]
  let meetupDay;
  if(typeOfDay == 'teenth') {
    meetupDay = meetupWeekdayDates.find(date => date > 12);
  } else {
    const ordinals = {'first': 0, 'second': 1, 'third': 2, 'fourth': 3, 'last': (meetupWeekdayDates.length - 1)}
    meetupDay = meetupWeekdayDates[ordinals[typeOfDay]];
  };
  
  return new Date(year, month - 1, meetupDay);
};
