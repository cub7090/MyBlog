CKEDITOR.editorConfig = function (config) {
  config.height = '30em';  
  config.filebrowserImageBrowseUrl = '/ckeditor/pictures';
  config.filebrowserImageUploadUrl = '/ckeditor/pictures';
  config.extraAllowedContent = 'iframe[*]'
  config.allowedContent = true;
}