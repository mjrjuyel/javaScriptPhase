
var imagesArray = ["../images/id.jpg","../images/juyel.jpg"];
var images = document.querySelector('img');

var count = 0;

function next(){
    count++
    if( count >= imagesArray.length){
        count = 0;
        images.src = imagesArray[count];
    }
    else{
        images.src = imagesArray[count];
    }
}

function prev(){
    count--
    if( count < 0){
        count = imagesArray.length - 1;
        images.src = imagesArray[count];
    }
    else{
        images.src = imagesArray[count];
    }
}