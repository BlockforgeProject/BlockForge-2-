function show(element){  
    document.getElementById('intro').style.opacity='0';
    setTimeout(function() {
        document.getElementById('intro').style.display='none';
        document.getElementById(element).style.display='block';
        },200);
    setTimeout(function() {       
        document.getElementById(element).style.opacity='100';
        },500);
        
}
function hide(element){
    document.getElementById(element).style.opacity='0';
    setTimeout(function() {
        document.getElementById(element).style.display='none';
        document.getElementById('intro').style.display='block';
        },200);
    setTimeout(function() {
        document.getElementById('intro').style.opacity='100';
        },500);

}
function mclick(){
    document.getElementById('click').currentTime=0;
    document.getElementById('click').play();
}

function load(){
    document.getElementById('loading').style.opacity=0;
    setTimeout(function() {       
        document.getElementById('loading').style.display='none';
    },1500);
    document.getElementById('click').volume=0.4;
    document.getElementById('audio').volume=0.1;
    playmusic();
}

var musicstatus=false;

function playmusic(){
    if(!musicstatus){
        document.getElementById('audio').play();
        musicstatus=true;
    }
}

function pausemusic(){
    if(musicstatus){
        document.getElementById('audio').pause();
        musicstatus=false;
    }
}

function musicmanagerclick(){
    bodyunlock=false;
    setTimeout(function() {       
        bodyunlock=true;
    },200);
    pausemusic();
    document.getElementById('musicmanager').style.display='none';
}

function bodyclick(){
    if(bodyunlock){
        playmusic();
        document.getElementById('musicmanager').style.display='block';
    }
}
