import flatpickr from "flatpickr";

const initFlatPickr = () => {
  const datepickr = document.querySelector(".datepickr");
  if (!datepickr) return;

  flatpickr(".datepickr", {enableTime: true})
}

export { initFlatPickr };