import Turbolinks from 'turbolinks';

const turbolinksFix = () => {
  for (let form of document.querySelectorAll('form[method=get][data-remote=true]')) {
    form.addEventListener('ajax:beforeSend', function (event) {
      const detail = event.detail,
            xhr = detail[0], options = detail[1];
  
      Turbolinks.visit(options.url);
      event.preventDefault();
    });
  }
}

export { turbolinksFix }