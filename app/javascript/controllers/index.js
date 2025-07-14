import { Application } from "@hotwired/stimulus"
import HelloController from "./hello_controller"

// Stimulus app instance তৈরি
const application = Application.start()

// ম্যানুয়ালি controller register করা
application.register("hello", HelloController)

import ReplyController from "./reply_controller"
application.register("reply", ReplyController)