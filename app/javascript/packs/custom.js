displayLink = (el) => {
    el.style.display = '';
}

remove = (el) => {
    const commentElement = el.parentNode.parentNode.parentNode;
    const link = commentElement.previousSibling;
    console.log(commentElement);
    displayLink(link);
    commentElement.remove();
}

hideLink = (el) => {
    el.style.display = 'none';
}