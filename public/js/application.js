$(document).ready(function() {
  $('form').submit(function(event) {
    event.preventDefault();
    $.ajax({
      url: '/urls',
      method: 'post',
      data: $(this).serialize(),
      dataType: 'json',
      // callbacks
      beforeSend: function() {
        $('form input').val('Loading...');
      },

      complete: function() {
        $('form input').val('Snipped!');
      },

      success: function(data) {
        $('tr:first-child').after('<tr style="text-align:center"> <td>'
        + data.long_url + '</td> <td>'
        + data.short_url + '</td><td>'
        + data.click_count + '</td> </tr>')
      },

      error: function(data) {
        alert('error!');
        // $('#flash').html(data.responseText)
      }
    })
  })
});
