export class QueenAttack {
    constructor(positioning = { white: [0,3], black: [7,3]}) {
        this.positioning = positioning;
        this.validate(positioning);
    }

    get white() { return this.positioning.white }
    get black() { return this.positioning.black }

    validate({ white: white, black: black }) {
        if(white[0] == black[0] && white[1] == black[1]){ 
            throw new Error('Queens cannot share the same space')
        }
    }

    _canAttack({ white: white, black: black }) {
        let sameRow = white[0] == black[0]
        let sameColumn = white[1] == black[1]
        let xDiagonal = (Math.abs(white[0] - white[1]) == Math.abs(black[0] - black[1]))
        let otherDiagonal = (white[0] - black[0]) == (black[1] - white[1])
        let sameDiagonal = xDiagonal || otherDiagonal
        return sameColumn || sameRow || sameDiagonal
    }
    canAttack() { return this._canAttack(this.positioning) }

    _toString({ white: white, black: black }) {
        return new Array(8).fill(new Array(8).fill('_')).
            map((row, rowIdx) =>
                row.map((col, colIdx) =>
                    rowIdx == white[0] && colIdx == white[1] ? 'W' :
                    rowIdx == black[0] && colIdx == black[1] ? 'B' :
                    col
                ).join(" ").concat("\n")
            ).join("")
    }
    toString() { return this._toString(this.positioning) }
}
