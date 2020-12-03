const initSharedBtn = () => {
  if (document.querySelector("#Shared")) {
    const btn = document.querySelector("#Shared");
    const element = document.querySelector("#myTabContent");
    btn.addEventListener("click", (e) => {
      element.scrollIntoView({ behavior: "smooth", block: "end" });
    });
  }
};

export { initSharedBtn };
