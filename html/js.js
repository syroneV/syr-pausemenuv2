$('container').hide();

window.addEventListener('message', (event) => {
    if (event.data.type === "ui") {
        if (event.data.status) {
            $('body').fadeIn();
        } else {
            $('body').fadeOut();
        }
    }
});

document.onkeydown = e => {
    if (e.keyCode === 27)
        $.post('http://syr-pausemenuv2/close', JSON.stringify({}));
}

document.onclick = e => {
    switch (e.target.id) {
        case "four": 
            $.post('http://syr-pausemenuv2/close', JSON.stringify({}));
            break;
        case "one":
            $.post('http://syr-pausemenuv2/map', JSON.stringify({}));
            break;
			case "five":
            $.post('http://syr-pausemenuv2/opti', JSON.stringify({}));
            break;
        case "two":
            $.post('http://syr-pausemenuv2/settings', JSON.stringify({}));
            break;
        case "three":
            $.post('http://syr-pausemenuv2/quit', JSON.stringify({}));
            break;
	}
}
