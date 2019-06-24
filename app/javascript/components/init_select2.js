import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2();
  console.log('I am here'); // (~ document.querySelectorAll)
};
export { initSelect2 };
