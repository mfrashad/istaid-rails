CKEDITOR.editorConfig = function (config) {
  // ... other configuration ...
  config.height = 600;
  config.enterMode = CKEDITOR.ENTER_P;
  // ... rest of the original config.js  ...
  config.filebrowserBrowseUrl           = "/ckeditor/attachment_files"
  config.filebrowserFlashBrowseUrl      = "/ckeditor/attachment_files"
  config.filebrowserFlashUploadUrl      = "/ckeditor/attachment_files"
  config.filebrowserImageBrowseLinkUrl  = "/ckeditor/pictures"
  config.filebrowserImageBrowseUrl      = "/ckeditor/pictures"
  config.filebrowserImageUploadUrl      = "/ckeditor/pictures"
  config.filebrowserUploadUrl           = "/ckeditor/attachment_files"
}