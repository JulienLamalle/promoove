console.log("Je suis dans dans comment_ansx=wer.js bitches !!!!!!!");
document.querySelectorAll(".display_answers").forEach(button => {
  button.addEventListener('click', event => {
    if(document.getElementById(`answers-${button.id}`).style.display == "none"){
      document.getElementById(`answers-${button.id}`).style.display = "block";
    }else if(document.getElementById(`answers-${button.id}`).style.display == "block"){
      document.getElementById(`answers-${button.id}`).style.display = "none";
    }
  });
});