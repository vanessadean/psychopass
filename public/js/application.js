var comment_stream;

SC.initialize({
  client_id: '3f73e8bd9c4e62a632fc640226c5d92e'
});

var keyword = '<%= @tag %>';
// console.log(keyword);

SC.get('/tracks', { q: keyword }, function(tracks) {
  // console.log(tracks);
  var number;
  var track_id;   
  number = Math.floor((Math.random() * 50) + 1);
  // console.log(number);
  console.log(tracks[number]);
  track_id = tracks[number].id;
  artist = tracks[number].id;
  // console.log(track_id);
  SC.stream("/tracks/"+track_id, {
    autoPlay: true,
    ontimedcomments: function(comments){
      comment_stream = comments[0].body;
      console.log(comments[0].body);
      $("#comments").prepend("<p>"+comments[0].body+"</p>");
    }
  });
});
