$(document).on('click', '#send-per-second', function () {
    betweenTime = 1000 * parseFloat($("#between-time").val());

    if (!isNaN(betweenTime)) {
        timer1 = setInterval(function () {
            document.getElementById('execute-method').click();
            console.log(betweenTime);
        }, betweenTime);
    }
});

$(document).on('click', '#stop-send', function () {
    if (typeof timer1 !== 'undefined') {
        clearInterval(timer1);
    }
});

$(document).on('page:change', function () {
    if (typeof timer1 !== 'undefined') {
        clearInterval(timer1);
    }
});