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
var restartBtn = document.getElementById('restart');

// Create audio objects in advance
// const audioPlayers = audioFiles.map(file => {
//   const audioMusic = new Audio(file);
//   audioMusic.preload = 'auto'; // Preload audio files
//   return audioMusic;
// });

let currentAudio = null;

buttons.forEach((button,index) => {
  button.addEventListener('click',function(){
    var buttonText = button.innerText;
    console.log(buttonText);

    button.classList.add('active');

    setTimeout(function(){
      button.classList.remove('active');
    },1000)

    if(currentAudio && currentAudio != audioPlayers[index]){
      currentAudio.pause();
      currentAudio.currentTime = 0;
    }

    const audio = audioPlayers[index];

    console.log(audio);

    if(currentAudio === audio){
      if(audio.paused){
        audio.play();
      }else{
        audio.pause();
      }
      return
    }

    switch(buttonText){
      case 'sound1':
            audio.loop = true;
            break;
      case 'sound2':
            audio.loop = true;
            break;
      case 'sound2':
            audio.loop = true;
            break;
      }
      audio.play();
      currentAudio = audio;
  });
});


// restartBtn.addEventListener('click', function() {
//   if (currentAudio) {
//     currentAudio.currentTime = 0; // Reset to beginning
//     if (currentAudio.paused) {
//       currentAudio.play(); // Auto-play if paused
//     }
//   }
// });

// console.log(buttons.length);

// document.addEventListener('keypress',function(e){
//   var text = e.key;
//   console.log(text);
//   playaudio(text);
// });

// // var currentAudio = null;
// function playaudio(text){
//   switch(text){
//     case 'a':
//       var audio = new Audio('../audio/beautiful_things.mp3')
//       audio.play();
//       break;
//     case 'b':
//       var audio = new Audio('../audio/ek_raat_vilen.mp3')
//       audio.play();
//       break;
//     case 'c':
//       var audio = new Audio('../audio/you_cant_touch_this.mp3')
//       audio.play();
//       break;
//   }
// }

document.addEventListener('keypress',function(e){
  var text = e.key;
  console.log(text);
  var demo = document.getElementById('restart');
  demo.innerHTML = "You Have Press Key is : " + text;
});
