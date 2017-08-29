/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbarGroups = [
		{ name: 'forms', groups: [ 'forms' ] },
		{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
		{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
		{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker', 'editing' ] },
		'/',
		{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
		{ name: 'links', groups: [ 'links' ] },
		{ name: 'insert', groups: [ 'insert' ] },
		'/',
		{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
		{ name: 'styles', groups: [ 'styles' ] },
		{ name: 'colors', groups: [ 'colors' ] },
		{ name: 'tools', groups: [ 'tools' ] },
		{ name: 'others', groups: [ 'others' ] },
		{ name: 'about', groups: [ 'about' ] }
	];

	config.filebrowserBrowseUrl = '/asset/ck/browse.php?opener=ckeditor&type=files';
	config.filebrowserImageBrowseUrl = '/asset/ck/browse.php?opener=ckeditor&type=images';
	config.filebrowserFlashBrowseUrl = '/asset/ck/browse.php?opener=ckeditor&type=flash';
	config.filebrowserUploadUrl = '/asset/ck/upload.php?opener=ckeditor&type=files';
	config.filebrowserImageUploadUrl = '/asset/ck/upload.php?opener=ckeditor&type=images';
	config.filebrowserFlashUploadUrl = '/asset/ck/upload.php?opener=ckeditor&type=flash';

	config.removeButtons = 'About,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,Maximize,ShowBlocks';
};