window.addEventListener("load", function () {
  var container = document.getElementById("content");
  if (!container) return;

  var defs = Array.from(document.querySelectorAll("a.coderef"));
  var lines = new Map(); // anchor-id -> LinkerLine instance

  var throttleTimer = null;
  function throttledReposition() {
    if (throttleTimer) return;
    throttleTimer = setTimeout(function () {
      throttleTimer = null;
      LinkerLine.positionAll();
    }, 50);
  }

  window.addEventListener("scroll", throttledReposition, { passive: true });
  window.addEventListener("resize", throttledReposition, { passive: true });

  // Reposition on scroll inside any overflow pre containing an anchor
  document.querySelectorAll("pre").forEach(function (pre) {
    if (getComputedStyle(pre).overflow === "auto" || getComputedStyle(pre).overflowX === "auto") {
      pre.addEventListener("scroll", throttledReposition, { passive: true });
    }
  });

  defs.forEach(function (anchor) {
    var targetId = anchor.getAttribute("href").replace(/^#/, "");
    var target = document.getElementById(targetId);
    if (!target) return;

    var line = null;

    anchor.addEventListener("mouseenter", function () {
      if (!line) {
        line = new LinkerLine({
          parent: container,
          start: anchor,
          end: target,
          color: "rgba(80, 120, 220, 0.7)",
          size: 2,
          endPlug: "arrow1",
          hidden: true,
        });
        lines.set(targetId, line);
      }
      line.show();
    });

    anchor.addEventListener("mouseleave", function () {
      if (line) line.hide();
    });
  });
});
