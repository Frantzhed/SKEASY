import flatpickr from "flatpickr";

const initFlatPickr = () => {
  const timepickr = document.querySelector(".timepickr");

  const datepickr = document.querySelector(".datepickr");
  if (!datepickr) return;

  flatpickr(".datepickr", {enableTime: false})
  flatpickr(".timepickr", {
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
  })
}

export { initFlatPickr };
