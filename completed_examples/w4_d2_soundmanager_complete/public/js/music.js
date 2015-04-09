// **********************************************//
// Sanity check to play the sound when you load the page
// **********************************************//
// soundManager.setup({
//     url: '/swf/',
//     preferFlash: true,
//     onready: function() {
//       var mySound = soundManager.createSound({
//         id: 'aSound', // Could be anything!
//         url: '/drumloop.mp3'
//       });
//       mySound.play();
//     }
//   });

// **********************************************//
// Working modularised code 
// **********************************************//
/**
 * Creating a new object so that we can namespace our app
 * This is creating a module for our code.
 **/
var myPlayer = myPlayer || {};

myPlayer._currentSound = null;
myPlayer._playButton   = null;

/**
 * This is our own setup function
 * Which registers a jQuery click handler which fires when we
 * Click on the playbutton and calls a playClickHandler function
 **/
myPlayer.setup = function(){
  myPlayer._playButton = $('#playbutton');
  myPlayer._playButton.data('state', 'stopped');
  myPlayer._playButton.on('click', myPlayer.playClickHandler);
}

/** 
 * Function to play/pause the sound when a click is made 
 **/
myPlayer.playClickHandler = function(ev) {
  ev.preventDefault();
  if (myPlayer._playButton.data('state') == 'playing') {
    myPlayer.pause();
  } else {
    myPlayer.play();
  }
};

/** 
 * Function called after play finishes to clear current sound
 **/
myPlayer.clearSound = function(){
  myPlayer._playButton.data('state', 'stopped');
  myPlayer._playButton.html('&#9654;');
}

/** 
 * Define function to pause track
 **/
myPlayer.pause = function(){
  myPlayer._currentSound.pause();
  myPlayer._playButton.html('&#9654').data('state', 'paused');
};

/** 
 * Create a new function that plays a sound
 **/
myPlayer.play = function() {
  myPlayer.getSound();
  myPlayer._playButton.html('&#10074;&#10074;');
 
  if (myPlayer._playButton.data('state') == 'stopped') { 
    myPlayer._currentSound.play({onfinish: myPlayer.clearSound});
  } else if (myPlayer._playButton.data('state') == 'paused') {
    myPlayer._currentSound.resume({onfinish: myPlayer.clearSound});
  } else {
    console.warn("myPlayer is in an unexpected state: " + myPlayer._playButton.data('state'));
  }

  // Set state of button to be playing
  myPlayer._playButton.data('state', 'playing');
};

/** 
 * Creating a new function that returns a sound
 **/
myPlayer.getSound = function(){
  if(!myPlayer._currentSound) {
    myPlayer._currentSound = soundManager.createSound({
      id: 'trackId', // Could be anything!
      url: '/drumloop.mp3'
    });
  }
  return myPlayer._currentSound;
}

/** 
 * Soundmanager is already defined by requiring the soundmanager js file
 * We call our own setup function onready 
 * NB We don't HAVE to do this using document ready
 **/
$(function(){

  soundManager.setup({
    url: '/swf/',
    preferFlash: true
  });

  myPlayer.setup();
})






