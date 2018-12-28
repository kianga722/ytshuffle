//Loading Logic Module
const loadLogic = (() => {
  //Function to hide/unhide elements
  const showLoad = (show) => {
    const loading = document.querySelector('.loading-wrapper');
    const main = document.querySelector('.main');

    if (show) {
        loading.classList.remove('hide');
        main.classList.add('hide');
    } else {
        loading.classList.add('hide');
        main.classList.remove('hide');
    }

  }

  return { showLoad };

})();

document.addEventListener('turbolinks:load', function() {
    const formArr = ['any', 'thrilling', 'proxmity', 'ultra', 'next'];

    document.body.addEventListener('click', e => {
        let target = e.target;
        if (formArr.includes(target.parentNode.id)) {
            loadLogic.showLoad(true);
        }
    })
})

