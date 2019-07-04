const GIGA_MILLI_SECONDS = Math.pow(10, 9) * 1000;

export const gigasecond = date =>
  new Date(Date.parse(date) + GIGA_MILLI_SECONDS)
