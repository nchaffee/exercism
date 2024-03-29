import { colorCode } from '../resistor-color/resistor-color'

export const value = color_words =>
  parseInt(
    color_words.map(word =>
      colorCode(word).toString()
    ).join("")
  )
