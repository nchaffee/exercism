const daysOfTheWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
// Sunday is 0, Saturday is 6
const firstDay = {
  '2013': {
    '5': 3
  }
};
export const meetup = (year, month, typeOfDay, dayOfWeek)  => {
  const yearStr = `${year}`
  const monthStr = `${month}`
  // group number days by day of the week
  const firstDayOfTheMonth = firstDay[yearStr][monthStr]
  console.log(firstDayOfTheMonth)
  let datesWeekdays = {};
  daysOfTheWeek.forEach(weekday => {
    datesWeekdays[weekday] = [];
  })
  for (var day = 1; day <= 31; day++) {
    let today = (day - 1 + firstDayOfTheMonth) % 7
    let weekday = daysOfTheWeek[today]
    datesWeekdays[weekday].push(day)
  }
  
  const meetupWeekday = datesWeekdays[dayOfWeek]
  let meetupDay;
  if (typeOfDay == 'teenth') {
    meetupDay = meetupWeekday.find(date => date > 12);
    console.log(meetupDay)
  };
  
  return new Date(`${year}-${month}-${meetupDay}`);
};

expect(meetup(2013, 5, 'teenth', 'Monday')).toEqual(new Date(2013, 4, 13));
