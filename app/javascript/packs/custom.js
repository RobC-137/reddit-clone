displayLink = (el) => {
    el.style.pointerEvents = '';
}

remove = (el) => {
    const commentElement = el.parentNode.parentNode.parentNode;
    const link = commentElement.previousSibling;
    console.log(commentElement);
    displayLink(link);
    commentElement.remove();
}

disableLink = (el) => {
    el.style.pointerEvents = 'none';
}

changeVoteColor = (id, action) => {
    upvote_id = `#upvote-${id}`
    downvote_id = `#downvote-${id}`
    upvote = document.querySelector(upvote_id)
    downvote = document.querySelector(downvote_id)

    if(action === 'upvote'){
        downvote.classList.remove('vote-downvote');
        downvote.classList.add('vote-neutral');
        upvote.classList.remove('vote-downvote')
        upvote.classList.add('vote-upvote');
    }else if(action === 'downvote'){
        downvote.classList.remove('vote-neutral');
        downvote.classList.add('vote-downvote');
        upvote.classList.remove('vote-upvote')
        upvote.classList.add('vote-neutral');
    }else{
        downvote.classList.remove('vote-downvote');
        downvote.classList.add('vote-neutral');
        upvote.classList.remove('vote-upvote')
        upvote.classList.add('vote-neutral');
    }

}
