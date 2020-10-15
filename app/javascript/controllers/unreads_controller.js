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
        this.user_id = document.querySelector("meta[name='user_id']").getAttribute("content")
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
        this.addUnreadCount(data)
    }

    addUnreadCount(data) {
        const msgLimit = 9
        const channel_div = $("#channel_" + data.channel_id + " a")[0]
        const badge = $("#channel_" + data.channel_id + " a span")[0]

        if (channel_div.classList.contains('active')) {
            badge.innerHTML = '0'
            badge.classList.add('d-none')
        } else {
            badge.classList.remove('d-none')
        }

        const number = badge.innerHTML

        if (number > msgLimit) {
            badge.innerHTML = msgLimit + "+"
        } else {
            badge.innerHTML = parseInt(number) + 1
        }
    }
}
