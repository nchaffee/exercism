export class QueenAttack {
    constructor(positioning = { white: [0,3], black: [7,3]}) {
        this.white = positioning.white;
        this.black = positioning.black;
        QueenAttack.validate(this);
    }

    canAttack() {
        if (
            this.white[0] == this.black[0] ||
            this.white[1] == this.black[1] ||
            (Math.abs(this.white[0] - this.white[1]) == Math.abs(this.black[0] - this.black[1])) ||
            (this.white[0] - this.black[0]) == (this.black[1] - this.white[1])
            )
            { return true }
        return false;
    }

    toString() {
        let outputString = ''
        for(let row = 0; row <= 7; row++){
            for(let column = 0; column <= 7; column++){
                let square = '';
                switch(true) {
                    case(this.white[0] == row && this.white[1] == column):
                        square = 'W';
                        break;
                    case(this.black[0] == row && this.black[1] == column):
                        square = 'B';
                        break;
                    default:
                        square = '_';
                        break;
                }
                if(column < 7){ square = square.concat(" ") }
                outputString = outputString.concat(square)
            }
            outputString = outputString.concat('\n')
        }
        return outputString;
    }

    static validate({ white: white, black: black} ) {
        if(white[0] == black[0] && white[1] == black[1]){ 
            throw new Error('Queens cannot share the same space')
        }
    }
}
