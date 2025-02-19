// Get the media element and buttons
const media = document.getElementById('mediaPlayer');
const playPauseButton = document.getElementById('playPauseButton');
const loopButton = document.getElementById('loopButton');
// Play/Pause the media
function togglePlayPause() {
    if (media.paused || media.ended) {
        media.play();
    } else {
        media.pause();
    }
}
// Toggle loop playback
function toggleLoop() {
    media.loop = !media.loop;
    loopButton.classList.toggle('loop-enabled', media.loop);
}
