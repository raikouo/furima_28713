import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
    ${data.user}: ${data.content.comment}
      <div class="comment_time">
      ${data.created_at}
      </div>
    `;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment-text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
    // Called when there's incoming data on the websocket for this channel
  }
});
