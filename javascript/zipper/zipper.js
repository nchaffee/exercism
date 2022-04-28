export class Zipper {
  constructor(tree, breadcrumbs = []) {
    this.breadcrumbs = breadcrumbs;
    this.tree = JSON.parse(JSON.stringify(tree));;
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
    if(this.breadcrumbs.length === 0) {
      return null;
    }
    console.log(this.breadcrumbs);
    const newCrumbs = this.breadcrumbs;
    newCrumbs.pop();
    return new Zipper(this.tree, newCrumbs);
  }

  setValue(value) {
    let focus = this.getFocus();
    focus.value = value;
    return new Zipper(this.tree, this.breadcrumbs);
  }

  setLeft(leaf) {
    let focus = this.getFocus();
    focus.left = leaf;
    return new Zipper(this.tree, this.breadcrumbs);    
  }

  setRight(leaf) {
    let focus = this.getFocus();
    focus.right = leaf;
    return new Zipper(this.tree, this.breadcrumbs);    
  }
}
