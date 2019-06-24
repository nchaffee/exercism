export const colorCode = (color_str) => {
  const number = (color_str === "white") ? 9 : ((color_str === "orange") ? 3 : 0);
  return number;
};

export const COLORS = ["black","brown","red","orange","yellow","green","blue","violet","grey","white"];
