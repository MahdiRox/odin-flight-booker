import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    console.log("passenger controller connected")
    console.log(this.containerTargets.length)
  }

  add(event) {
    event.preventDefault()
    const template = document.querySelector("#passenger-template")
    const clone = document.importNode(template.content, true)
    const newIndex = this.containerTargets.length
    // console.log(newIndex)
    clone.querySelectorAll("input").forEach(input => {
      input.name = input.name.replace("new", newIndex)
      input.id = input.id.replace("new", newIndex)
    })
    this.element.querySelector("#passengers").appendChild(clone)
    console.log(this.containerTargets.length)
  }
  delete(event) {
    if (this.containerTargets.length != 1) {
      event.preventDefault()
      const lastContainer = this.containerTargets[this.containerTargets.length - 1]
      if (lastContainer) {
          lastContainer.remove()
      }
    } 
  }
}