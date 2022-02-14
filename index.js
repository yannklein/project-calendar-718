const today = new Date();
const cards = document.querySelectorAll(".card-product");

cards.forEach((card) => {
  const day = card.querySelector(".card-product-day").innerText;
  let date = card.querySelector(".card-product-date").innerText;
  // Add 0 if day is 1 digit
  if (date.split(" ")[1].length === 1) {
    date = `${date.split(" ")[0]} 0${date.split(" ")[1]}`;
  }
  console.log(today.toDateString(), `${day} ${date}`)
  if (today.toDateString().includes(`${day} ${date}`)) {
    card.classList.add("today");
  }
});
