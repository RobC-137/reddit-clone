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