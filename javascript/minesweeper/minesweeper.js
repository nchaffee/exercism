export const annotate = (board) => {
    let prepBoard = board.map(row => {
        return Array.from(row).map(sq => {
            return sq == '*' ? sq : (sq == ' ' ? 0 : 'error')
        })
    })

    prepBoard.forEach((row, ridx) => {
        row.forEach((sq, cidx) => {
            if(sq == '*'){
                for(let rridx = ridx - 1; rridx < ridx + 2; rridx++ ) {
                    for(let ccidx = cidx - 1; ccidx < cidx + 2; ccidx++ ) {
                        if(rridx >= 0 && rridx < prepBoard.length && ccidx >= 0 && ccidx < row.length && prepBoard[rridx][ccidx] != '*') {
                            prepBoard[rridx][ccidx] = prepBoard[rridx][ccidx] + 1;
                        }
                    }
                }
            }
        })
    })

    return prepBoard.map((row) =>
        row.map((sq) => {
            return (sq > 0 ? sq.toString() : (sq == 0 ? ' ' : '*'))
        }).join("")
    )
}
