export const annotate = input => {
    let board = boardWithZeros(input);
    mineSweep(board);
    return boardWithStrings(board);
}

const boardWithZeros = board =>
    board.map(row =>
        Array.
        from(row).
        map(square => convertSpacesToZeros(square))
    )

const convertSpacesToZeros = char => char == ' ' ? 0 : char

const mineSweep = board =>
    board.forEach((row, rowIndex) =>
        row.forEach((square, columnIndex) => {
            if(mineFound(square)){
                incrementSquaresAdjacentToMine(board, row.length, rowIndex, columnIndex);
            }
        })
    )

const mineFound = square => square == '*'
const rowExists = (row, boardLength) => row >= 0 && row < boardLength
const columnExists = (column, rowLength) => column >= 0 && column < rowLength

const incrementSquaresAdjacentToMine = (board, rowLength, mineRow, mineCol) => {
    for(let adjRow = mineRow - 1; adjRow < mineRow + 2; adjRow++ ) {
        for(let adjCol = mineCol - 1; adjCol < mineCol + 2; adjCol++ ) {
            if(
                rowExists(adjRow, board.length) &&
                columnExists(adjCol, rowLength) &&
                !mineFound(board[adjRow][adjCol])
              ) {
                board[adjRow][adjCol] = board[adjRow][adjCol] + 1;
            }
        }
    }
    return board;
}

const boardWithStrings = board => board.map(row => toString(row))

const toString = row =>
    row.map(square =>
        square > 0 ? square.toString() : (square == 0 ? ' ' : '*')
    ).join("")
