const initSharedBtn = () => {
  if (document.querySelector("#Shared")) {
    const btn = document.querySelector("#Shared");
    const element = document.querySelector(".mountain-index");
    btn.addEventListener("click", (e) => {
      element.scrollIntoView({ behavior: "smooth", block: "end" });
    });
  }
};

export { initSharedBtn };
