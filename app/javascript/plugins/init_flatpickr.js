import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".datepicker", {})
flatpickr(".timepicker", {
  enableTime: true,
  noCalendar: true,
  dateFormat: "H:i",
  time_24hr: true,
  defaultDate: "20:00"
})
