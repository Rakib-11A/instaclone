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
    likeToggle(event) {
        event.preventDefault()
        // const button = event.target
        //
        // button.classList.toggle("bg-blue-500")
        // button.classList.toggle("text-blue")
        // button.classList.toggle("btn-outline-primary")
        // button.classList.toggle("btn-primary")
        //
        // if(button.textContent === "Like"){
        //     button.textContent = "Liked"
        // }else{
        //     button.textContent = "Like"
        // }

    }
}
