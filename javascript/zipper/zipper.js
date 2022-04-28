export class Zipper {
  constructor(tree, breadcrumbs = []) {
    this.breadcrumbs = breadcrumbs;
    this.tree = tree;
  }

  static fromTree(roseTree) {
    return new Zipper(roseTree);
  }

  getFocus() {
    let focus = this.tree;
    this.breadcrumbs.forEach(crumb => {
     focus = focus[crumb]
    });
    return focus;
  };

  toTree() {
    return this.tree;
  }

  value() {
    let focus = this.getFocus();
    return focus.value;
  }

  left() {
    let focus = this.getFocus();
    if(focus.left === null) {
      return null
    }
    const newCrumbs = this.breadcrumbs
    newCrumbs.push('left');
    return new Zipper(this.tree, newCrumbs);
  }

  right() {
    let focus = this.getFocus();
    if(focus.right === null) {
      return null
    }
    const newCrumbs = this.breadcrumbs
    newCrumbs.push('right');
    return new Zipper(this.tree, newCrumbs);
  }

  up() {
    throw new Error('Remove this statement and implement this function');
  }

  setValue() {
    throw new Error('Remove this statement and implement this function');
  }

  setLeft() {
    throw new Error('Remove this statement and implement this function');
  }

  setRight() {
    throw new Error('Remove this statement and implement this function');
  }
}
