
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

$(function() {
    // Setup the player to autoplay the next track
    var a = audiojs.createAll({
        trackEnded: function() {
            var next = $('ol li.playing').next();
            if (!next.length) next = $('ol li').first();
            next.addClass('playing').siblings().removeClass('playing');
            audio.load($('a', next).attr('data-src'));
            audio.play();
        }
    });

    // Load in the first track
    var audio = a[0];
    first = $('ol a').attr('data-src');
    $('ol li').first().addClass('playing');
    audio.load(first);

    // Load in a track on click
    $('ol li').click(function(e) {
        e.preventDefault();
        $(this).addClass('playing').siblings().removeClass('playing');
        audio.load($('a', this).attr('data-src'));
        audio.play();
    });
    // Keyboard shortcuts
    $(document).keydown(function(e) {
        var unicode = e.charCode ? e.charCode : e.keyCode;
        // right arrow
        if (unicode == 39) {
            var next = $('li.playing').next();
            if (!next.length) next = $('ol li').first();
            next.click();
            // back arrow
        } else if (unicode == 37) {
            var prev = $('li.playing').prev();
            if (!prev.length) prev = $('ol li').last();
            prev.click();
            // spacebar
        } else if (unicode == 32) {
            audio.playPause();
        }
    })
});

$(document).ready(function (){
    $('#audio_new_path').submit(function (){
        $.post($(this).attr('action'), $(this).serialize(), null, "script");
        return false;
    });
});

$(function () {
    $('.bubbleInfo').each(function () {
        var distance = 10;
        var time = 250;
        var hideDelay = 500;

        var hideDelayTimer = null;

        var beingShown = false;
        var shown = false;
        var trigger = $('.trigger', this);
        var info = $('.popup', this).css('opacity', 0);


        $([trigger.get(0), info.get(0)]).mouseover(function () {
            if (hideDelayTimer) clearTimeout(hideDelayTimer);
            if (beingShown || shown) {
                return;
            } else {
                beingShown = true;

                info.css({
                    top: -40,
                    left: -33,
                    display: 'block'
                }).animate({
                        top: '-=' + distance + 'px',
                        opacity: 1
                    }, time, 'swing', function() {
                        beingShown = false;
                        shown = true;
                    });
            }

            return false;
        }).mouseout(function () {
                if (hideDelayTimer) clearTimeout(hideDelayTimer);
                hideDelayTimer = setTimeout(function () {
                    hideDelayTimer = null;
                    info.animate({
                        top: '-=' + distance + 'px',
                        opacity: 0
                    }, time, 'swing', function () {
                        shown = false;
                        info.css('display', 'none');
                    });

                }, hideDelay);

                return false;
            });
    });
});