const openImage = () => {
  let modal = document.getElementById("myModal");
  let modalImg = document.getElementById("modal-img");
  document.querySelectorAll(".myImg").forEach(img => {
    img.addEventListener('click', event => {
      modal.style.display = "block";
      modalImg.src = event.target.src;
    })
  })
  let span = document.querySelector(".close");
  span.onclick = function() {
    modal.style.display = "none";
  }
}

openImage()