jQuery ->
  $('.body').append('<div class="list-title"></div>')
  $('.body').append('<div class="shot-list"></div>')
  
  $.ajax(
    url: "http://api.dribbble.com/shots/popular"
    dataType: 'jsonp'
    cache: true
  ).done (data) ->
    html = ""
    $.each data.shots, (i, shot) ->
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

    $(".list-title").html "<h2>Popular</h2>"
    $(".shot-list").html html
    
    console.log data