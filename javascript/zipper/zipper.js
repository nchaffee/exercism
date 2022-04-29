export class Zipper {
  constructor(tree, breadcrumbs) {
    this.breadcrumbs = breadcrumbs;
    this.tree = tree;
  }

  static fromTree(roseTree, breadcrumbs = []) {
    return new Zipper(JSON.parse(JSON.stringify(roseTree)), breadcrumbs);
  }

  getFocus() {
    return this.breadcrumbs.reduce((tree, crumb) => {
       return tree[crumb]
    }, this.tree);
  };

  toTree() { return this.tree; }

  value() { return this.getFocus().value; }

  left() {
    if(this.getFocus().left === null) { return null }
    return Zipper.fromTree(this.tree, [...this.breadcrumbs, 'left']);
  }

  right() {
    if(this.getFocus().right === null) { return null }
    return Zipper.fromTree(this.tree, [...this.breadcrumbs, 'right']);
  }

  up() {
    if(this.breadcrumbs.length === 0) { return null; }
    const newCrumbs = [...this.breadcrumbs];
    newCrumbs.pop();
    return Zipper.fromTree(this.tree, newCrumbs);
  }

  setValue(value) {
    this.getFocus().value = value;
    return Zipper.fromTree(this.tree, this.breadcrumbs);
  }

  setLeft(leaf) {
    this.getFocus().left = leaf;
    return Zipper.fromTree(this.tree, this.breadcrumbs);    
  }

  setRight(leaf) {
    this.getFocus().right = leaf;
    return Zipper.fromTree(this.tree, this.breadcrumbs);    
  }
}
