
$(function() {
    try {
    TagCanvas.Start('myCanvas');
    } catch(e) {
    // something went wrong, hide the canvas container
    document.getElementById('myCanvasContainer').style.display = 'none';
    }
    TagCanvas.textColour = '#aa';
    TagCanvas.outlineColour = '#ff9999';
    TagCanvas.Start('myCanvas');
});
