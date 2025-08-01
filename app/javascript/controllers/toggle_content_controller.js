import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-content"
export default class extends Controller {
  static targets = ["content"]
  connect() {
    console.log("toggle-content controller connected")
  }
  toggleContent(){
    console.log(this.contentTarget)
    this.contentTarget.classList.toggle("d-none")
  }
}
