const pointsFor = (r) => {
  if (r > 10) {
    return 0;
  } else if (r > 5) {
    return 1;
  } else if (r > 1) {
    return 5;
  } else {
    return 10;
  }
}

export const solve = (x, y) => {
  //  ( x−h ) 2 + ( y−k ) 2 = r 2 
  // [http://www.softschools.com/math/pre_calculus/circle_center_radius_equation/] 
  let radius = Math.sqrt(Math.pow((x - 0), 2) + Math.pow((0 - y),2));
  return pointsFor(radius)
};
