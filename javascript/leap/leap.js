function Year(input) {
    this.year = input;
};

Year.prototype.divisible_by = function(number) {
    return (this.year % number) == 0
};

Year.prototype.isLeap = function() {
    return (this.divisible_by(4) && !this.divisible_by(100)) || this.divisible_by(400);
};

module.exports = Year;
