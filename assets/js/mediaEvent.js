
const video = document.querySelector('#video');
console.log(video);

// When the video is loaded enough to start playing
// video.addEventListener('click', function(){
//     if(video.paused){
//         console.log('video are playing');
//         video.play();
//     }
//     else{
//         console.log('video are paused');
//         video.pause();
//     }
// });
const statusDiv = document.getElementById('status');
// Event listeners
video.addEventListener('play', updateStatus);
video.addEventListener('pause', updateStatus);
video.addEventListener('ended', updateStatus);
video.addEventListener('timeupdate', updateStatus);
video.addEventListener('volumechange', updateStatus);

function updateStatus() {
  statusDiv.innerHTML = `
    Status: ${video.paused ? 'Paused' : 'Playing'} |
    Progress: ${Math.floor(video.currentTime)}s / ${Math.floor(video.duration)}s |
    Volume: ${Math.floor(video.volume * 100)}% |
    Muted: ${video.muted ? 'Yes' : 'No'}
  `;
}

// Custom controls
function togglePlay() {
  if (video.paused) {
    video.play();
  } else {
    video.pause();
    
  }
}

function setVolume(volume) {
  video.volume = volume;
}

function toggleMute() {
  video.muted = !video.muted;
}
  

