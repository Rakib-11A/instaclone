import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect(){
        console.log("reply controller is connected.........")
    }
    static targets = ["form"]

    show(event) {
        event.preventDefault()
        const commentId = event.currentTarget.dataset.commentId
        const form = document.getElementById(`reply-form-${commentId}`)
        form.style.display = form.style.display === 'none' ? 'block' : 'none'
    }
}