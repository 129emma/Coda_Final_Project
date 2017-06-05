<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Article Edit</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="apple-touch-icon" href="//mindmup.s3.amazonaws.com/lib/img/apple-touch-icon.png" />
    <link href="${pageContext.request.contextPath}/Pages/ArticleEditPage/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/ArticleEditPage/jquery.hotkeys.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/Pages/ArticleEditPage/google-code-prettify/run_prettify.js"></script>
    <link href="${pageContext.request.contextPath}/Pages/ArticleEditPage/ArticleEdit.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/Pages/ArticleEditPage/bootstrap-wysiwyg.js"></script>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>

  </head>
  <body>



    <form action="/Article" method="post" onsubmit="prepareContent()">

        <div class="container">
          <div class="hero-unit">
            <h1>Your article</h1>
            <hr/>
            <div id="alerts"></div>
            <p>Title: <input required type="text" id="title" name="title" placeholder="Please Enter Your Title"
                             value="${articleInfo.title}" style="width: 300px;"/></P>

            <label for="image-input">
              <img class="image" title="add image" src="http://www.hugorc.es/static/images/galeria2.png" >
            </label>
            <input style=" display: none; " id="image-input" class="input" type="file" accept=".jpg, .gif,.png">

            <label for="audio-input">
              <img class="image" title="add video" src="http://www.iconsfind.com/wp-content/uploads/2016/04/20160405_57033268db0ea.png" />
            </label>
            <input id="audio-input" style=" display: none; " class="input" type="file" accept=".mp3,.wav">

            <label for="video-input">
              <img class="image" title="add video" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Circle-icons-videocameracompact.svg/1000px-Circle-icons-videocameracompact.svg.png"/>
            </label>
            <input id="video-input" style=" display: none; " class="input" type="file" accept=".ogg,.mp4">


            <img class="image" title="add youtube video" src="https://cdn3.iconfinder.com/data/icons/social-icons-5/606/YouTube.png"  onclick="readLink()"/>


            <div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
              <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font"><i class="icon-font"></i><b class="caret"></b></a>
                <ul class="dropdown-menu">
                </ul>
              </div>
              <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
                  <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
                  <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
                </ul>
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
                <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
                <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a>
                <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a>
                <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a>
                <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a>
                <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a>
              </div>
              <div class="btn-group">
                <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
                <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
                <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
                <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
              </div>
              <div class="btn-group">
                <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a>
                <div class="dropdown-menu input-append">
                  <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
                  <button class="btn" type="button">Add</button>
                </div>
                <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>

              </div>

              <div class="btn-group">
                <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
                <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
              </div>






              <div class="btn-group">
                <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
                <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
              </div>
              <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
            </div>

            <div id="editor">
              ${articleInfo.content}
            </div>

            Tag:<select class="selectpicker" data-width="150px" name="tag">
            <option data-icon="glyphicon-film" value="Movie">Movie</option>
            <option data-icon="glyphicon-cutlery" value="Food">Food</option>
            <option data-icon="glyphicon-globe" value="Science">Science</option>
            <option data-icon="glyphicon-phone" value="Technology">Technology</option>
            <option data-icon="glyphicon-piggy-bank" value="Business">Business</option>
            <option data-icon="glyphicon-heart" value="Heaish">Health</option>
            <option data-icon="glyphicon-music" value="Music">Music</option>
            <option data-icon="glyphicon-education" value="Education">Education</option>
            <option data-icon="glyphicon-option-horizontal" value="Other">Other</option>
          </select>
            ${hiddenElement}
            ${submitElement}
            ${deleteElement}
          </div>
        </div>
        <input type="hidden" name="content" id="articleContentSubmit">
    </form>
    <c:if test="${information != null}">
      <p style="color: red">${information}</p>
    </c:if>

<script>

    $('.input').each(function () {
        $(this).change(function () {
            var data = new FormData();
            data.append('file', $(this).prop('files')[0]);
            $.ajax({
                url: '/AlbumsChange',
                type: 'POST',
                data: data,
                processData: false,  // tell jQuery not to process the data
                contentType: false,  // tell jQuery not to set contentType
                success: function (data) {
                    $('#editor').append(data + '<div><br></div>');
                }
            });
            $(this).val('');
        });
    });

    function readLink() {
        var input = prompt("Please put your video link", "link here");
        if (input != null) {
            var data = {'action': 'createYoutube', 'youtubeAddress': input};
            $.ajax({
                url: '/AlbumsChange',
                type: 'POST',
                data: data,
                success: function (data) {
                    $('#editor').append(input + '<div><br></div>');
                }
            });
        }
    }

    function prepareContent() {
        document.getElementById("articleContentSubmit").value = document.getElementById("editor").innerHTML;
    }



  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier', 
            'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
            'Times New Roman', 'Verdana'],
            fontTarget = $('[title=Font]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      if ("onwebkitspeechchange"  in document.createElement("input")) {
        var editorOffset = $('#editor').offset();
        $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
      } else {
        $('#voiceBtn').hide();
      }
	};

	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	};
    initToolbarBootstrapBindings();  
	$('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
    window.prettyPrint && prettyPrint();
  });
</script>
  </body>
</html>
