// app/javascript/controllers/reply_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    toggle(event) {
        event.preventDefault()
        const commentId = event.target.dataset.commentId
        const replyForm = document.getElementById(`reply-form-${commentId}`)

        if (replyForm) {
            replyForm.style.display = replyForm.style.display === "none" ? "block" : "none"
        }
    }
}
