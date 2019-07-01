import { isUndefined } from 'util';

const newId = () => '_' + Math.random().toString(36).substr(2, 9);

export class InputCell {
    constructor (value) {
        this.outsideCells = [];
        this.events = [];
        this.setValue(value);
    }

    register(outsideCell) {
        this.outsideCells.push(outsideCell);
    }

    setValue(value) {
        this.events.unshift(newId());
        this.value = value;
        this.outsideCells.forEach(oc => oc.setValue(this.events[0]));
        }
}

export class ComputeCell {
    constructor (inputCells, func) {
        this.events = [];
        this.callbackCells = [];
        this.inputCells = inputCells;
        inputCells.forEach(ic => ic.register(this));
        this.func = func;
        this.value = this.func(this.inputCells);
    }

    setValue(eventId) {
        if (this.events[0] != eventId) {
            this.events.unshift(eventId);
        }
        if (this.inputCells.every(ic => ic.events.length > 0 && ic.events[0] == eventId)) {
            let oldValue = this.value;
            let newValue = this.func(this.inputCells);
    
            this.value = newValue;
            if (oldValue != newValue) {
                this.callbackCells.forEach(cc => cc.addValue(this.value))
            }    
        }
        if (!isUndefined(this.outsideCell)) {
            this.outsideCell.setValue(eventId);
        }
    }

    register(outsideCell) {
        this.outsideCell = outsideCell;
    }

    addCallback(callbackCell) {
        this.callbackCells.push(callbackCell);
    }

    removeCallback(callbackCell) {
        this.callbackCells = this.callbackCells.filter(cbc => cbc.id != callbackCell.id)
    }
}

export class CallbackCell {
    constructor (func) {
        this.id = newId();
        this.func = func;
        this.values = [];
    }

    addValue(value) {
        this.values.push(value);
    }
}
