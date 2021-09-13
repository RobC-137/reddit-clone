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

changeVote = (id, action, points ) => {
    upvote_id = `#upvote-${id}`
    downvote_id = `#downvote-${id}`
    points_id = `#points-${id}`
    upvote_element = document.querySelector(upvote_id)
    downvote_element = document.querySelector(downvote_id)
    points_element = document.querySelector(points_id)

    if(action === 'upvote'){
        downvote_element.classList.remove('vote-downvote');
        downvote_element.classList.add('vote-neutral');
        upvote_element.classList.remove('vote-downvote')
        upvote_element.classList.add('vote-upvote');
    }else if(action === 'downvote'){
        downvote_element.classList.remove('vote-neutral');
        downvote_element.classList.add('vote-downvote');
        upvote_element.classList.remove('vote-upvote')
        upvote_element.classList.add('vote-neutral');
    }else{
        downvote_element.classList.remove('vote-downvote');
        downvote_element.classList.add('vote-neutral');
        upvote_element.classList.remove('vote-upvote')
        upvote_element.classList.add('vote-neutral');
    }
    points_element.textContent = points
}
