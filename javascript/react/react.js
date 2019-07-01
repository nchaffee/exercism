const newId = () => '_' + Math.random().toString(36).substr(2, 9);

export class InputCell {
    constructor (value) {
        this.outputs = new Set();
        this.events = new Set();
        this.setValue(value);
    }

    register(output) { this.outputs.add(output); }

    setValue(value) {
        let eventId = newId();
        this.events.add(eventId);
        this.value = value;
        this.outputs.forEach(o => o.update(eventId));
    }
}

export class ComputeCell {
    constructor (inputs, func) {
        this.events = new Set();
        this.callbacks = new Set();
        this.value = func(inputs);
        this.outputs = new Set();
        this.inputs = inputs;
        this.func = func;
        inputs.forEach(i => i.register(this));
    }

    update(eventId) {
        this.events.add(eventId);
        if (
            this.inputs.every(i => i.events.has(eventId)) &&
            this.value != (this.value = this.func(this.inputs))
            ) {
                for (let callback of this.callbacks){
                    callback.fire(this);
            }
        }
        this.outputs.forEach(o => o.update(eventId));
    }

    register(output) { this.outputs.add(output) }
    addCallback(callbackCell) { this.callbacks.add(callbackCell) }
    removeCallback(callbackCell) { this.callbacks.delete(callbackCell) }
}

export class CallbackCell {
    constructor (fn) {
        this.callback = fn;
        this.values = [];
    }

    fire(computeCell) { this.values.push(this.callback(computeCell)) }
}
