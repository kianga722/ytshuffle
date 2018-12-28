//YT iFrame API
var tag = document.createElement('script');

tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;
function onYouTubeIframeAPIReady() {
    player = new YT.Player('existing-iframe-example', {
        events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange,
            'onError': onPlayerError
        }
    });
}

function onPlayerReady(event) {
    event.target.playVideo();
}

function onPlayerStateChange(event) {
    if(event.data === 0) {
        let nextSong = document.getElementById('next');
        Rails.fire(nextSong, 'submit');
    }
}

function onPlayerError() {
    let nextSong = document.getElementById('next');
    Rails.fire(nextSong, 'submit');
}

//Loading Logic Module
const loadLogic = (() => {
  //Function to hide/unhide elements
  const showLoad = () => {
    const loading = document.querySelector('.loading-wrapper');
    const main = document.querySelector('.main');

    loading.classList.remove('hide');
    main.classList.add('hide');
  }

  return { showLoad };

})();

document.addEventListener('turbolinks:load', function() {
    document.body.addEventListener('submit', () => {
        loadLogic.showLoad();
    })
})

