export class QueenAttack {
    constructor(positioning = { white: [0,3], black: [7,3]}) {
        this.white = positioning.white;
        this.black = positioning.black;
        QueenAttack.validate(this);
    }

    static validate({ white: white, black: black} ) {
        if(white[0] == black[0] && white[1] == black[1]){ 
            throw new Error('Queens cannot share the same space')
        }
    }

    canAttack() { return this.sameColumn() || this.sameRow() || this.sameDiagonal() }
    sameRow() { return this.white[0] == this.black[0] }
    sameColumn() { return this.white[1] == this.black[1] }
    sameDiagonal() { return this.xDiagonal() || this.otherDiagonal() }
    xDiagonal() { return (Math.abs(this.white[0] - this.white[1]) == Math.abs(this.black[0] - this.black[1])) }
    otherDiagonal() { return (this.white[0] - this.black[0]) == (this.black[1] - this.white[1]) }

    toString() {
        return (
            new Array(8).
            fill(new Array(8).fill('_')).
            reduce((outputStr, row, rowIdx) =>
                outputStr.concat(
                    row.map((col, colIdx) => 
                        rowIdx == this.white[0] && colIdx == this.white[1] ? 'W' : 
                        rowIdx == this.black[0] && colIdx == this.black[1] ? 'B' : 
                        col
                    ).
                    join(" ").
                    concat("\n")
                )
            , "")
            )
    }
}
