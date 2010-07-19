var DISQUSWIDGETS;
var disqus_domain;
var disqus_shortname;
if (typeof DISQUSWIDGETS == "undefined") {
	DISQUSWIDGETS = (function() {
		var d = {},
			a = (document.getElementsByTagName("HEAD")[0] || document.getElementsByTagName("BODY")[0]),
			c = 0,
			f = {},
			e = {
			identifier: 1,
			url: 2,
			slug: 3
		};

		function b(i) {
			var h, k;

			function j(l) {
				return i.hasAttribute ? i.hasAttribute(l) : i.getAttribute(l) !== null
			}
			if (j("data-disqus-identifier")) {
				h = e.identifier;
				k = i.getAttribute("data-disqus-identifier")
			} else {
				if (j("data-disqus-slug")) {
					h = e.slug;
					k = i.getAttribute("data-disqus-slug")
				} else {
					h = e.url;
					k = i.href.replace("#disqus_thread", "")
				}
			}
			f[c++] = {
				element: i,
				type: h,
				value: k
			}
		}

		function g(k) {
			var j = document.getElementsByTagName("A");
			for (var h = 0; h < j.length; h++) {
				if (j[h].href.indexOf("#disqus_thread") >= 0) {
					k(j[h])
				}
			}
		}
		d.domain = "disqus.com";
		d.forum = "";
		d.getCount = function() {
			var m, h, k, j;
			var l = [],
				o = 0,
				i = 10;

			function n(q, p) {
				return encodeURIComponent(q) + "=" + encodeURIComponent(p.type) + "," + encodeURIComponent(p.value)
			}
			g(b);
			for (m in f) {
				if (f.hasOwnProperty(m)) {
					l.push(n(m, f[m]))
				}
			}
			k = l.slice(o, i);
			while (k.length > 0) {
				j = document.createElement("script");
				j.type = "text/javascript";
				j.async = true;
				j.src = "http://" + d.domain + "/forums/" + d.forum + "/count.js?q=1&" + k.join("&");
				a.appendChild(j);
				o += 10;
				i += 10;
				k = l.slice(o, i)
			}
		};
		d.displayCount = function(j) {
			var m, h, n, l;
			for (var k = 0; k < j.counts.length; k++) {
				m = j.counts[k];
				h = f[m.uid];
				if (h) {
					if (m.comments === 0) {
						n = j.text.comments.zero
					} else {
						if (m.comments == 1) {
							n = j.text.comments.one
						} else {
							n = j.text.comments.multiple
						}
					}
					l = n.replace("{num}", m.comments);
					if (j.showReactions) {
						n = "";
						if (m.reactions === 0) {
							n = j.text.reactions.zero
						} else {
							if (m.reactions == 1) {
								n = j.text.reactions.one
							} else {
								n = j.text.reactions.multiple
							}
						}
						if (n !== "") {
							l += " " + j.text.and + " " + n.replace("{num}", m.reactions)
						}
					}
					h.element.innerHTML = l
				}
			}
		};
		return d
	} ())
} (function() {
	if (typeof disqus_domain != "undefined") {
		DISQUSWIDGETS.domain = disqus_domain
	}
	DISQUSWIDGETS.forum = disqus_shortname;
	DISQUSWIDGETS.getCount()
} ());
