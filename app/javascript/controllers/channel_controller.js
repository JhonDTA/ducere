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
    static targets = ["messages", "newMessage"]

    connect() {
        this.subscription = consumer.subscriptions.create({
                channel: "MessageChannel",
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
        this.scrollToBottom(0)
    }

    _disconnected() {

    }

    _received(data) {
        if (data.message) {
            this.appendLine(data)
        }

        if (!document.hidden) {
            this.subscription.perform("touch")
        }
    }

    appendLine(data) {
        this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
        this.scrollToBottom(500)
        this.styleMessage()
    }

    styleMessage() {
        const message = $('.direct-chat-msg:last')
        const message_user_name = $('.direct-chat-msg:last .direct-chat-name')
        const message_time = $('.direct-chat-msg:last .direct-chat-timestamp')
        const self_id = $('#chat-messages').attr('data-user-id')
        const message_user_id = message.attr('data-user-id')

        if (self_id === message_user_id) {
            message.addClass('right')
            message_user_name.addClass('float-left')
            message_user_name.removeClass('float-right')
            message_time.addClass('float-right')
            message_time.removeClass('float-left')
        } else {
            message.removeClass('right')
            message_user_name.addClass('float-right')
            message_user_name.removeClass('float-left')
            message_time.addClass('float-left')
            message_time.removeClass('float-right')
        }
    }

    scrollToBottom(time) {
        const div = document.getElementById('chat-messages');
        $('#chat-messages').animate({
            scrollTop: div.scrollHeight - div.clientHeight
        }, time);
    }

    clearMessage(event) {
        this.newMessageTarget.value = ''
    }
}
