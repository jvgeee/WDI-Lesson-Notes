//******************************************//
// Solution 1. With a daftPlayer
//******************************************//

var daftPlayer = daftPlayer || {};

daftPlayer.setup = function(){
  this._currentSound = null;
  $('#player a').on('click', daftPlayer.playSound);
}

daftPlayer.playSound = function(){
  event.preventDefault();
  var filename = $(this).find('p').attr('id') + ".wav";
  var sound = daftPlayer.getSound(filename);
  sound.play();
  daftPlayer._currentSound = null;
}

daftPlayer.getSound = function(filename){
  if (!daftPlayer._currentSound) {
    daftPlayer._currentSound = soundManager.createSound({ 
      id: filename, 
      url: '/sounds/'+filename, 
      autoPlay: true 
    });
  }
  return daftPlayer._currentSound;
}

$(function(){
  daftPlayer.setup();
});


//******************************************//
// Solution 2. Without a daftPlayer
//******************************************//

// soundManager.setup({
//   url: '/swf',
//   preferFlash: true,
//   onready: function() {
//     $('#player a').on('click', function(e){
//       e.preventDefault();
//       var filename = $(ev.currentTarget).context.lastChild.id+".wav"
//       var sound = soundManager.createSound({ 
//         id: 'sound_'+filename, 
//         url: '/sounds/'+filename, 
//         volume: 50, 
//         autoPlay: true 
//       }).play();
//     });
//   }
// });