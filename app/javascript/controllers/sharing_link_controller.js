import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sharing-link"
export default class extends Controller {
  static values = {
    url: String,
    title: String
  }
  connect() {
    console.log(this.urlValue, this.titleValue)
  }

  async sharing(){
    const shareData = {
      title: this.titleValue,
      text: "Rejoindre l'évenement ",
      url: this.urlValue,
    };
    try {
      await navigator.share(shareData);
      console.log("Partage réussi");
      return
    } catch (err) {
      console.error(`Erreur de partage: ${err}`);
      // Fallback : copier le lien dans le presse-papier
    }
    this.copyToClipboard();
  }
  copyToClipboard() {
    navigator.clipboard.writeText(this.urlValue).then(() => {
      console.log("Lien copié dans le presse-papier");
    }).catch(err => {
      console.error("Erreur lors de la copie:", err);
    });
  }
}
