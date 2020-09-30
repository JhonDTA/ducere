// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import {Controller} from "stimulus"
import consumer from "./../channels/consumer"

export default class extends Controller {
    connect() {
        this.subscription = consumer.subscriptions.create({
                channel: "UnreadsChannel",
                id: this.data.get("id")
            },
            {
                connected: this._connected.bind(this),
                disconnected: this._disconnected.bind(this),
                received: this._received.bind(this)
            })
    }

    disconnect() {
        consumer.subscriptions.remove(this.subscription)
    }

    _connected() {
    }

    _disconnected() {

    }

    _received(data) {
        this.element.classList.add("font-weight-bold")
    }
}
