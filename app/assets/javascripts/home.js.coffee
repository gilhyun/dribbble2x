jQuery ->
  console.log "On"
  load_shot('popular','1')
  $(window).scroll ->
    load_shot('popular', page_state)  if $(window).scrollTop() is $(document).height() - $(window).height() && load_state

page_state = 1;
load_state = true;

load_shot = (category, page) ->    
  load_state = false
  callback = (listDetails) ->
    html = ""
    $.each listDetails.shots, (i, shot) ->
      html += "<li>"
      html += "  <div class='user'>"
      html += "    <a href='" + shot.player.url + "'>"
      html += "      <img src='" + shot.player.avatar_url + "' class='avatar' alt='" + shot.player.name + "'>"
      html += "      by " + shot.player.name
      html += "    </a>"
      html += "  </div>"
      html += "  <div class='shot size-" + shot.width + "'>"
      html += "    <h3>" + shot.title + "</h3>"
      html += "    <a href='" + shot.url + "'>"
      html += "      <img src='" + shot.image_url + "' alt='" + shot.title + "'>"
      html += "    </a>"
      html += "    <ul class='info'>"
      html += "      <li>Comments " + shot.comments_count + "</li>"
      html += "      <li>Like " + shot.likes_count + "</li>"
      html += "      <li>View " + shot.views_count + "</li>"
      html += "      <li class='rebounds'>Rebounds " + shot.rebounds_count + "</li>"
      html += "    </ul>"
      html += "  </div>"
      html += "</li>"
    
    $(".shot-list").append html
    
    pagecounter = $(".pagecounter");
    pagecounter.html(page).stop().show().animate
      opacity: 1
    , 200, ->
      pagecounter.animate
        opacity: 0
      , 800, ->
        pagecounter.hide()
        load_state = true
        
  $.jribbble.getShotsByList category, callback,
    page: page
    per_page: 12
  
  page_state++