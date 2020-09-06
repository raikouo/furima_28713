if (location.pathname.match("items/new")){
  window.addEventListener("load", (e) => {
  const inputElement = document.getElementById("tag-name");
    inputElement.addEventListener("keyup", (e) => {
      const input = encodeURIComponent( document.getElementById("tag-name").value);
      console.log (input)
      const xhr = new XMLHttpRequest();
      xhr.open("GET", `tag_search/?input=${input}`, true);
      xhr.responseType = "json";
      xhr.send();
      xhr.onload = () => {
        if (xhr.response !== null){
          const tagName = xhr.response.keyword;
          const searchResult = document.getElementById('search-result')
          searchResult.innerHTML = ''
          searchResult.style.display = 'initial'
          tagName.forEach(function(tag){

            const parentsElement = document.createElement('div')
            const childElement = document.createElement('div')

            parentsElement.setAttribute('id', 'parents')
            childElement.setAttribute('id', tag.id )
            childElement.setAttribute('class', 'child' )

            parentsElement.appendChild(childElement)
            childElement.innerHTML = tag.tag_name
            searchResult.appendChild(parentsElement)

            const clickElement = document.getElementById(tag.id)
            clickElement.addEventListener("click", () => {
              document.getElementById("tag-name").value = clickElement.textContent;
              //clickElement.remove();
              searchResult.style.display = 'none'
            })
          })
        }else{
          const searchResult = document.getElementById('search-result')
          searchResult.style.display = 'none'
        }
      }
    });
  })
};