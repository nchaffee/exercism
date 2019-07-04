const GIGASECOND = Math.pow(10, 9);
const toSeconds = date => Date.parse(date) / 1000
const toDate = seconds => new Date(1000 * seconds)

export const gigasecond = date =>
  [date].
    map(date => toSeconds(date)).
    map(seconds => seconds + GIGASECOND).
    map(seconds => toDate(seconds)).
    shift()
