// var buttons = document.querySelectorAll('#music button');
// var audios = ["../audio/beautiful_things.mp3","../audio/ek_raat_vilen.mp3","../audio/you_cant_touch_this.mp3"];

// buttons.forEach(but => {
//     but.addEventListener('click',function(){
//         var text = but.innerText;
//         console.log(text);
        

//         switch(text){
//             case 'sound1' :
//                 var playMusic = new Audio(audios[0]);
//                 playMusic.pause();
//                 playMusic.play();
//                 playMusic.loop = true;
//                 playMusic.currentTime = 15;
//                 break;
//             case 'sound2' :
//                 var playMusic = new Audio(audios[1]);
//                 playMusic.pause();
//                 playMusic.play();
//                 playMusic.loop = true;
//                 playMusic.currentTime = 5;
//                 break;
//             case 'sound3' :
//                 var playMusic = new Audio(audios[2]);
//                 playMusic.pause();
//                 playMusic.play();
//                 break;
//         }
//     });
// });

// More Advance
const buttons = document.querySelectorAll('#music button');
const audioFiles = [
  "../audio/beautiful_things.mp3",
  "../audio/ek_raat_vilen.mp3",
  "../audio/you_cant_touch_this.mp3"
];

// Create audio objects in advance
const audioPlayers = audioFiles.map(file => {
  const audio = new Audio(file);
  audio.preload = 'auto'; // Preload audio files
  return audio;
});

let currentAudio = null;

buttons.forEach((button, index) => {
  button.addEventListener('click', function() {
    const buttonText = button.innerText;
    console.log(buttonText);
    
    // Pause currently playing audio if different from the clicked one
    if (currentAudio && currentAudio !== audioPlayers[index]) {
      currentAudio.pause();
      currentAudio.currentTime = 0;
    }
    
    // Get the audio for this button
    const audio = audioPlayers[index];
    
    // Toggle play/pause if clicking the same button
    if (currentAudio === audio) {
      if (audio.paused) {
        audio.play();
      } else {
        audio.pause();
      }
      return;
    }
    
    // Configure based on button
    switch(buttonText) {
      case 'sound1':
        audio.loop = true;
        audio.currentTime = 15;
        break;
      case 'sound2':
        audio.loop = true;
        audio.currentTime = 5;
        break;
      case 'sound3':
        audio.loop = true;
        audio.currentTime = 0;
        break;
    }
    
    // Play the audio
    audio.play();
    currentAudio = audio;
  });
});
