$(document).ready(function(){
  const dateFormat = 'MM/DD/YYYY';

  //Initialize the datePicker(I have taken format as mm/dd/yyyy, you can     //have your owh)
  $("#weeklyDatePicker").datetimepicker({
    format: dateFormat
  });

  // Set its value to the current week
  $('#weeklyDatePicker').val(
    weekFromDay(moment().format(dateFormat))
  );

  $('#weeklyDatePicker').on('dp.show', function() {
    $('td.active').parent().children().addClass('active');
  })

  // Get the value of Start and End of Week
  $('#weeklyDatePicker').on('dp.change', function (e) {
    var weekRange = weekFromDay($('#weeklyDatePicker').val());
    $("#weeklyDatePicker").val(weekRange);
  });

  $('.filter-toggle').click(function() {
    $('.filter-toggle').toggleClass('show').toggleClass('hide');
    $('.collection-filters').toggleClass('hide').toggleClass('show');
  })

  function weekFromDay(value) {
    var firstDate = moment(value, dateFormat).day(0).format(dateFormat);
    var lastDate =  moment(value, dateFormat).day(6).format(dateFormat);
    return firstDate + ' - ' + lastDate;
  }

  $('#location').change(filterReports);
  $('#weeklyDatePicker').on('dp.change', filterReports);

  function filterReports() {
    var url = '/driver_reports/table?'
      + '&location_id=' + $('#location').val() 
      + '&date_range=' + encodeURIComponent($('#weeklyDatePicker').val());

    $('.table-wrapper').load(url, function(html) {
      console.log(html);
    });
  }
});
