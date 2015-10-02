$(function() {
   $(document).on('click', '#send-per-second', function() {
       timer1 = setInterval(function() {
           document.getElementById('execute-method').click();
       }, 1010);
   });
   $(document).on('click', '#stop-send', function() {
       clearInterval(timer1);
   })

});