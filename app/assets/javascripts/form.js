$(document).on('turbolinks:load', function() {
  $('.file-upload').change(function() {
    var fileNames = []
    $.each(this.files, function(index, element){
      fileNames.push(element.name)
    })
    $('.input-name-files').val(joinSentence(fileNames))
  })
});

function addNameFilesInInputFile() {
  $('.file-upload').change(function() {
    var fileNames = []
    $.each(this.files, function(index, element){
      fileNames.push(element.name)
    })
    $('.input-name-files').val(joinSentence(fileNames))
  })
}

function joinSentence(array) {
  return array.join(", ").replace(/,\s([^,]+)$/, ' e $1')
}
