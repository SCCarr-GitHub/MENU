import { Application } from "@hotwired/stimulus"
import { openai } from ".controllers/openai_controller"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
