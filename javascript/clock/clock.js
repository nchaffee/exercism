export class Clock {
  constructor(hours, minutes) {
    this.hours = hours;
    this.minutes = minutes;

    while (minutes < 0) {
      minutes += 60;
      hours -= 1;
    }
    while (minutes >= 60) {
      minutes -= 60;
      hours += 1;
    }
    while (hours < 0) {
      hours += 24;
    }
    this.hours = hours % 24;
    this.minutes = minutes || 0;
  }

  toString() {
    const hours = `${this.hours}`.padStart(2, '0');
    const separator = ":";
    const minutes = `${this.minutes}`.padStart(2, '0');
    
    return [hours, separator, minutes].join('');
  }

  plus(minutes) {
    this.minutes += minutes;
    return new Clock(this.hours, this.minutes);
  }

  minus(minutes) {
    this.minutes -= minutes;
    return new Clock(this.hours, this.minutes);
  }

  equals(otherClock) {
    return (this.minutes == otherClock.minutes && this.hours == otherClock.hours);
  }
}
