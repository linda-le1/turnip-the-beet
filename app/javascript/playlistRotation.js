const iframeHTML = document.querySelector('.iframe_html')
console.log(iframeHTML)
cuisinePrevious.addEventListener('click', rotatePlaylist)

let cuisinePrevious =
document.querySelector('.cuisine-previous')
console.log(cuisinePrevious)

document.addEventListener('turbolinks:load', () => {
  cuisinePrevious.addEventListener('click', rotatePlaylist)
}

// let dummyData = ["37i9dQZF1DZ06evO3QaHvx", "37i9dQZF1DWVNQeZtY2TDM", "37i9dQZF1DWTMYo3OZGoxV", "37i9dQZF1DX60lVXkfYly8", "37i9dQZF1DX670mqw6YyS4"]

function rotatePlaylist() {
  let i = 0
    console.log(playlistId)
    const playlistHTML = `<iframe src="https://open.spotify.com/embed/playlist/<%= recommendations.cuisines[${i}].id %>}" width="400" height="380" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe>`
    iframeHTML.innerHTML(playlistHTML)
}
