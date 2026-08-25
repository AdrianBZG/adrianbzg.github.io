// Renders the homepage news feed from assets/data/news.json so items are easy to add/edit.
(function () {
  var el = document.getElementById("rx-news");
  if (!el) return;

  var escape = function (s) {
    var d = document.createElement("div");
    d.textContent = s == null ? "" : String(s);
    return d.innerHTML;
  };

  fetch("/assets/data/news.json", { cache: "no-cache" })
    .then(function (r) {
      if (!r.ok) throw new Error("news.json " + r.status);
      return r.json();
    })
    .then(function (items) {
      el.innerHTML = items
        .map(function (n) {
          // date is escaped; body is author-controlled trusted HTML (strong/em/a).
          return '<div class="rx-news-item"><div class="rx-news-date">' +
            escape(n.date) + '</div><div class="rx-news-body">' + (n.body || "") +
            "</div></div>";
        })
        .join("");
    })
    .catch(function () {
      el.innerHTML =
        '<div class="rx-news-item"><div class="rx-news-body">Latest updates are on my ' +
        '<a href="https://scholar.google.com/citations?user=lrOLKgQAAAAJ" target="_blank" rel="noopener noreferrer">Google Scholar</a>.</div></div>';
    });
})();
