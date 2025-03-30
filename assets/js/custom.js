

// let won = 0;
// let lost = 0;
// for(let i = 0 ; i < 5 ; i++){
//     var number = parseInt(prompt('Enter Number Between 1 t0 2'));
//     let ranNumber = Math.floor(Math.random()*3) + 1;

//     console.log(ranNumber);
//     console.log('You Have Enter : ' + number);
//     if(number === ranNumber){
//          won++;
//          console.log('You have Won');
//     }else{
//          lost++;
//          console.log('You havew lost');
//     }
// }

// console.log("you Won : " + won + " Times <br>" + "You have lost : "+  lost + " times" );

var data = {
     name : 'Juyel',
     age : 23
}
let conversion = JSON.stringify(data);

 console.log(conversion);

